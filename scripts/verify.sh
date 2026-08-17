#!/usr/bin/env bash
# Structural integrity check for the Fresh Series.
#
# The method demands that every finding cite a rule by number (§M.3). That
# only works if the citations resolve. This checks that they do:
#
#   1. every SKILL.md has parseable frontmatter with a name and description
#   2. every master library a skill claims to read actually exists
#   3. every §N.M a skill cites exists in its own HEURISTICS.md
#   4. every cross-system citation (FF§ / FE§ / FG§ / §M.) resolves
#   5. no HEURISTICS.md declares a rule number twice
#   6. paths and citations inside the reference libraries resolve too
#   7. every fresh.config.md block a skill claims to read actually exists
#   8. every Contents list matches the headings beneath it
#   9. the tree is US English throughout
#
# Exit 0 = the series holds together.
# Exit 1 = something cites into a void, or reaches somewhere it should not.
# Exit 2 = the verifier did not finish. Treat as failure, never as success.
#
# Run `verify.sh --self-test` to prove the checks can actually fail.

set -uo pipefail

# --- A verifier that aborts must never look like a verifier that passed. ----
#
# The first version of this script used `declare -A`, which needs bash 4;
# macOS ships bash 3.2. It aborted at stage 4 on an unbound variable, never
# reached stage 5, and still exited 0 — while eleven citations dangled. Since
# PUBLISHING.md gates on `verify.sh || exit 1`, that open gate was invisible.
#
# The sentinel closes it: only the deliberate end of main() sets `completed`,
# so every other way out of this script reports failure.
completed=0
on_exit() {
  status=$?
  if [ "$completed" -eq 0 ]; then
    printf '\n✗ verify.sh did not run to completion (status %s).\n' "$status" >&2
    printf '  An unfinished check is not a passing check — reporting failure.\n' >&2
    exit 2
  fi
  exit "$status"
}
trap on_exit EXIT

fail=0
note() { printf '  %s\n' "$1"; }
bad()  { printf '\n✗ %s\n' "$1"; fail=1; }

# Rule ids declared by a heuristics file: leading "| 1.2 |" or "| **1.2** |"
rules_in() {
  grep -oE '^\| \*{0,2}[0-9]+\.[0-9]+\*{0,2} \|' "$1" 2>/dev/null \
    | grep -oE '[0-9]+\.[0-9]+' | sort -u
}

# §-citations used anywhere in a file, without a cross-system prefix.
local_cites_in() {
  grep -oE '(^|[^A-Z])§[0-9]+\.[0-9]+' "$1" 2>/dev/null \
    | grep -oE '[0-9]+\.[0-9]+' | sort -u
}

# bash 3.2 has no associative arrays. A case statement is portable, needs no
# `declare -A`, and fails loudly on an unknown prefix instead of silently.
system_for() {
  case "$1" in
    FF) printf 'fresh-job-walk'   ;;
    FE) printf 'fresh-design-review'   ;;
    FG) printf 'fresh-growth-walk' ;;
    *)  return 1              ;;
  esac
}

main() {
  printf '=== 1. frontmatter, against the Agent Skills spec ===\n'
  # agentskills.io/specification: name max 64, lowercase alphanumeric and
  # single hyphens, must match the parent directory; description max 1024.
  # Reference files carry no frontmatter — only SKILL.md is a skill.
  for f in skills/*/SKILL.md; do
    [ -e "$f" ] || continue
    dir=$(basename "$(dirname "$f")")
    if [ "$(head -1 "$f")" != "---" ]; then
      bad "$f does not open with frontmatter"; continue
    fi
    name=$(awk '/^---$/{n++; next} n==1 && /^name:/{sub(/^name:[ \t]*/,""); print; exit}' "$f")
    [ -n "$name" ] || bad "$f frontmatter has no name:"
    grep -q '^description:' "$f" || bad "$f frontmatter has no description:"

    [ "$name" = "$dir" ] || bad "$f declares name: $name but its directory is $dir — the spec requires they match"
    [ "${#name}" -le 64 ] || bad "$f name is ${#name} characters — the spec allows 64"
    printf '%s' "$name" | grep -qE '^[a-z0-9]+(-[a-z0-9]+)*$' \
      || bad "$f name '$name' is not lowercase alphanumeric with single hyphens"
    case "$name" in *claude*|*anthropic*) bad "$f name '$name' contains a reserved word" ;; esac

    # description: the inline remainder plus everything indented under the key.
    # Counting only the indented continuation lines misses a single-line
    # `description: ...` entirely — the self-test caught exactly that.
    dlen=$(awk '/^---$/{n++; next}
                n==1 && /^description:/{
                  f=1; s=$0; sub(/^description:[ \t]*>?-?[ \t]*/,"",s)
                  if (s != "") printf "%s ", s
                  next }
                n==1 && f && /^[A-Za-z_-]+:/{f=0}
                n==1 && f {gsub(/^[ \t]+|[ \t]+$/,""); printf "%s ", $0}' "$f" | wc -c | tr -d ' ')
    if [ "$dlen" -gt 1024 ]; then
      bad "$f description is $dlen characters — the spec allows 1024"
    else
      note "$name  ($dlen char description)  ←  $f"
    fi
  done

  printf '\n=== 2. reference libraries each skill reads ===\n'
  for f in skills/*/SKILL.md; do
    [ -e "$f" ] || continue
    d=$(dirname "$f"); skill=$(basename "$d")
    for lib in $(grep -oE '`references/[a-z]+\.md`' "$f" | tr -d '`' | sort -u); do
      if [ -e "$d/$lib" ]; then
        note "$skill → $lib  ✓"
      else
        bad "$skill cites $lib — which does not exist"
      fi
    done
    # every reference file present must actually be read by its skill (§M.2)
    for r in "$d"/references/*.md; do
      [ -e "$r" ] || continue
      grep -q "references/$(basename "$r")" "$f" \
        || bad "$skill ships $(basename "$r") but never names it — an unread library is dead weight"
    done
  done

  printf '\n=== 3. local §N.M citations resolve ===\n'
  for h in skills/*/HEURISTICS.md; do
    [ -e "$h" ] || continue
    d=$(dirname "$h"); skill=$(basename "$d")
    declared=$(rules_in "$h")
    [ -n "$declared" ] || { bad "$skill HEURISTICS.md declares no rules"; continue; }
    note "$skill declares $(printf '%s\n' "$declared" | wc -l | tr -d ' ') rules"

    # rules_in sorts -u, so re-derive without it for the duplicate check
    dupe=$(grep -oE '^\| \*{0,2}[0-9]+\.[0-9]+\*{0,2} \|' "$h" \
           | grep -oE '[0-9]+\.[0-9]+' | sort | uniq -d)
    [ -z "$dupe" ] || bad "$skill declares duplicate rule ids: $(echo $dupe)"

    for f in "$d"/SKILL.md "$h"; do
      [ -e "$f" ] || continue
      for c in $(local_cites_in "$f"); do
        printf '%s\n' "$declared" | grep -qx "$c" \
          || bad "$(basename "$f") in $skill cites §$c — not declared in $skill HEURISTICS.md"
      done
    done
  done

  printf '\n=== 4. cross-system citations resolve ===\n'
  for f in skills/*/*.md skills/*/references/*.md; do
    [ -e "$f" ] || continue
    for cite in $(grep -oE '\b(FF|FE|FG)§[0-9]+\.[0-9]+' "$f" | sort -u); do
      px=${cite%%§*}; num=${cite##*§}
      if ! sys=$(system_for "$px"); then
        bad "$f cites $cite — unknown system prefix $px"; continue
      fi
      target="skills/$sys/HEURISTICS.md"
      if [ ! -e "$target" ]; then
        bad "$f cites $cite but $target is missing"
      elif ! rules_in "$target" | grep -qx "$num"; then
        bad "$f cites $cite — $sys does not declare §$num"
      else
        note "$f → $cite  ✓"
      fi
    done
    # §M.n against METHOD.md
    for num in $(grep -oE '§M\.[0-9]+' "$f" | grep -oE '[0-9]+$' | sort -nu); do
      grep -qE "^## §M\.$num " METHOD.md \
        || bad "$f cites §M.$num — METHOD.md has no such rule"
    done
    # §O.n against OUTPUT.md
    for num in $(grep -oE '§O\.[0-9]+' "$f" | grep -oE '[0-9]+$' | sort -nu); do
      grep -qE "^## §O\.$num " OUTPUT.md \
        || bad "$f cites §O.$num — OUTPUT.md has no such rule"
    done
  done

  printf '\n=== 5. every skill has both halves, and every group a library ===\n'
  for d in skills/*/; do
    [ -d "$d" ] || continue
    s=$(basename "$d")
    [ -e "$d/SKILL.md" ]      || bad "$s has no SKILL.md"
    [ -e "$d/HEURISTICS.md" ] || bad "$s has no HEURISTICS.md"
    [ -e "$d/SKILL.md" ] && [ -e "$d/HEURISTICS.md" ] && note "$s complete"

    # §M.2 says the library IS the skill. A heuristic group with neither a
    # library nor an explicit statement that it needs none is the gap this
    # catches — it is how fresh-job-walk §0 went unnoticed.
    [ -e "$d/HEURISTICS.md" ] || continue
    for g in $(grep -oE '^## §[0-9]+' "$d/HEURISTICS.md" | grep -oE '[0-9]+' | sort -nu); do
      if grep -qE "\(§?[0-9, §]*\b$g\b[0-9, §]*\)" "$d/SKILL.md" "$d/HEURISTICS.md" 2>/dev/null; then
        continue                                   # a library claims this group
      fi
      if grep -qiE "§$g is (method|.*belongs to no|self-contained)|§$g[^0-9].{0,60}no (single )?library" \
           "$d/HEURISTICS.md"; then
        note "$s §$g — declared as needing no library  ✓"
      else
        bad "$s §$g has no library and no statement that it needs none (§M.2)"
      fi
    done
  done

  printf '\n=== 6. paths and citations inside the libraries themselves ===\n'
  #
  # Checks 2 and 3 read SKILL.md and HEURISTICS.md. The libraries were the
  # blind spot, and it cost five dead paths: a restructure rewrote bare
  # library names into `references/<name>.md` everywhere, including where
  # the name belonged to a *sibling skill's* library and where it was
  # actually naming a block of fresh.config.md. Every one of those resolved
  # to nothing, and the whole series still verified clean.
  #
  # 6a and 6b answer two different questions and their messages have to
  # agree: 6a asks whether a named library exists here, 6b asks whether this
  # file reaches out of its own skill at all. 6a once told you to fix a miss
  # by writing a full relative path, which is precisely what 6b rejects —
  # two checks sending an editor in a circle. The remedy for both is prose.
  #
  # What this cannot catch, and no version of it will: a citation that
  # resolves to a rule that exists and means something else. `§0.2` in a
  # fresh-growth-walk library is a valid citation whether it meant "a send with no
  # stamp is not a send" or `FE§0.2`, "judge the render, never the rulebook".
  # One of those was written and the other was meant. That class is a reading
  # job (§M.3), and pretending a grep covers it would be exactly the false
  # assurance §M.9 exists to prevent.
  for d in skills/*/; do
    [ -d "$d" ] || continue
    s=$(basename "$d")
    declared=$(rules_in "$d/HEURISTICS.md")
    for r in "$d"references/*.md; do
      [ -e "$r" ] || continue

      # a. every references/<name>.md path resolves from this file's skill
      for lib in $(grep -oE '`references/[a-z]+\.md`' "$r" | tr -d '`' | sort -u); do
        [ -e "$d/$lib" ] || bad "$r names $lib — no such library in $s. If it belongs to a sibling skill, name it in prose (\"the $(basename "$lib" .md) library of <skill>\") — a cross-skill path fails 6b"
      done

      # b. no library links into another skill's library at all.
      #
      #    This used to check that such paths resolved. Resolving was the
      #    wrong bar: the authoring guidance is "keep references one level
      #    deep from SKILL.md", because a file reached by following a link
      #    out of another file may be previewed with head -100 rather than
      #    read, "resulting in incomplete information".
      #
      #    Same-skill companions are fine — every one of them also has a
      #    direct path from its own SKILL.md, so nothing is reachable only
      #    by nesting. A path into a *sibling skill* is different: that
      #    library has no direct path from this skill at all, so following
      #    the link is the only way there, and a partial read of it means
      #    §M.2 fails silently — the run believes it read the library and
      #    produces opinion anyway. Name the sibling in prose instead; the
      #    handoff still lands and there is no link to half-follow.
      if grep -q '\.\./\.\./' "$r"; then
        bad "$r links into another skill's library. Name it in prose — references stay one level deep from SKILL.md"
      fi

      # c. a library is never a block of fresh.config.md. The same
      #    restructure that broke the paths above also rewrote three config
      #    block names — `the surfaces block` became `the references/
      #    surfaces.md block` — and those resolve, because a library of that
      #    name does exist. Only the sentence gives it away.
      if grep -qE '`references/[a-z]+\.md` block of' "$r"; then
        bad "$r calls a library a block of fresh.config.md — it means the bare block name"
      fi

      # d. every bare §N.M in a library is a claim about its own skill
      for c in $(local_cites_in "$r"); do
        printf '%s\n' "$declared" | grep -qx "$c" \
          || bad "$(basename "$r") in $s cites §$c — not declared in $s HEURISTICS.md"
      done
    done
    note "$s libraries — paths and local citations resolve"
  done

  printf '\n=== 6c. every skill folder is self-contained ===\n'
  #
  # The README promises a skill folder survives being zipped, packaged or
  # installed on its own. That was true of an *installed* folder, where the
  # install script copies METHOD.md in, and false of the folder in this repo
  # — which is the one a marketplace or `npx skills add` would actually take.
  # Every SKILL.md opens by reading METHOD.md and is told to stop if it is
  # absent, so the published folder shipped a skill designed to refuse to run.
  #
  # Now it ships with its own copy, and this check keeps the three in step:
  # three divergent copies of the twelve rules would be worse than one
  # missing one.
  for d in skills/*/; do
    [ -d "$d" ] || continue
    s=$(basename "$d")
    for shared in METHOD.md OUTPUT.md; do
      if [ ! -e "$d/$shared" ]; then
        bad "$s has no $shared — its SKILL.md opens by reading one, and will stop"
      elif ! cmp -s "$shared" "$d/$shared"; then
        bad "$s/$shared has drifted from the root copy — they must be identical"
      else
        note "$s carries $shared, identical to root  ✓"
      fi
    done
  done

  printf '\n=== 7. config keys the skills claim to read ===\n'
  #
  # Checks 1-6 verify that citations resolve. Nothing verified that the
  # *config* a skill says it reads actually has the block it names, and one
  # skill named three that had never existed — a component directory, a token
  # file and screenshot paths. Following it as written blocked every page in
  # the run, and the whole series still verified clean.
  #
  # A key counts as present if fresh.config.md declares it in YAML or carries
  # a matching `## Heading`; prose says "the `product` block" where the file
  # uses a heading rather than a `product:` key, and both are legitimate.
  for f in skills/*/SKILL.md skills/*/HEURISTICS.md skills/*/references/*.md; do
    [ -e "$f" ] || continue
    # Two forms, and only these two. A bare `motion.md` is a library
    # filename, not a config key — reading it as one was this check's first
    # bug, and it produced twenty-three confident false positives.
    keys=$( { grep -oE '`[a-z_]+` (and `[a-z_]+` )?blocks?' "$f" | grep -oE '`[a-z_]+`'
              grep -oE '`[a-z_]+\.[a-z_]+`' "$f" | grep -v '\.md`' | grep -oE '^`[a-z_]+'
            } 2>/dev/null | tr -d '`' | sort -u )
    for k in $keys; do
      grep -qE "^ *${k}:" fresh.config.md && continue
      grep -qiE "^## ${k}" fresh.config.md && continue
      bad "$f names the \`$k\` block of fresh.config.md — no such key or heading"
    done
  done
  note "every named config block exists"

  printf '\n=== 8. contents lists match the headings ===\n'
  #
  # A stale table of contents is worse than none: the guidance requires one
  # over 100 lines precisely so a partial read sees the whole scope, and one
  # listing half the sections misreports that scope with authority. Three of
  # these drifted in a single day of edits and nothing noticed.
  #
  # Headings inside fenced blocks are examples, not sections — the first
  # version of this check listed an output-format sample as a real section.
  for f in skills/*/SKILL.md; do
    [ -e "$f" ] || continue
    s=$(basename "$(dirname "$f")")
    heads=$(awk '/^```/{fence=!fence; next} !fence && /^## /{sub(/^## /,""); if ($0 != "Contents") print}' "$f")
    # the list is line-wrapped, so flatten it before comparing or every
    # heading that spans a line break reads as missing
    toc=$(awk '/^## Contents/{f=1;next} /^---/{f=0} f' "$f" | tr '\n' ' ' | tr -s ' ')
    missing=""
    while IFS= read -r h; do
      [ -n "$h" ] || continue
      hn=$(printf '%s' "$h" | tr -s ' ')
      printf '%s' "$toc" | grep -qF "$hn" || missing="$missing\n    $h"
    done <<EOF2
$heads
EOF2
    if [ -n "$missing" ]; then
      bad "$s Contents omits sections that exist:$(printf "$missing")"
    else
      note "$s Contents lists all $(printf '%s\n' "$heads" | grep -c .) sections  ✓"
    fi
  done

  printf '\n=== 9. US spelling ===\n'
  #
  # The tree is US English. This is not pedantry: the same word spelled two
  # ways is two search terms, and a reader who types "color" should find the
  # library about it. One exception, and it is named rather than pattern-
  # matched — Goethe's translation is published as Theory of Colours, and a
  # citation keeps the title it was printed under.
  brit='colour|behaviour|organis(e|ed|ing|ation)|recognis(e|ed|able)|summaris|prioritis|genericis|licence|judgement|centre|analyse|realis|grey'
  # scripts/ is excluded for the reason it always is: a detector has to
  # contain the strings it detects, and this one caught its own pattern
  # definition and its own test fixture on the first run. Scanning published
  # prose is the job; the tooling is not published prose.
  if out=$(grep -rniE "\b($brit)" --include='*.md' . --exclude-dir=scripts 2>/dev/null \
           | grep -v 'Theory of$' | grep -viE 'Colours \(the published translation|the British spelling'); then
    bad "British spelling — the tree is US English:"; printf '%s\n' "$out"
  else
    note "no British spellings outside the one named citation  ✓"
  fi

  if [ "$fail" -eq 0 ]; then
    printf '\n✓ the series holds together — every citation resolves\n'
  else
    printf '\nSomething cites into a void. A skill whose citations do not resolve\n'
    printf 'cannot satisfy §M.3, and will produce findings nobody can check.\n'
  fi
}

# --- self-test ---------------------------------------------------------------
#
# §M.4 applied to this script: a clean result is only evidence if the check
# was shown to fail on a defect. Each case below plants exactly one fault in
# a synthetic tree and requires exit 1. The control proves the fixture itself
# is sound, so a failure here means the verifier, not the fixture.

build_fixture() {
  fix=$1
  mkdir -p "$fix/scripts" "$fix/skills/demo/references"
  cp "$SELF" "$fix/scripts/verify.sh"
  chmod +x "$fix/scripts/verify.sh"

  cat > "$fix/METHOD.md" <<'EOF'
# The Fresh Method

## §M.1 — Stand outside

You have never seen this product.

## §M.2 — Read the library first

Every Fresh skill names a reference library.
EOF

  # check 6c requires every skill folder to carry METHOD.md, identical to
  # the root copy. The fixture has to satisfy that or the control fails —
  # which is exactly how this was found, one commit too late.
  cat > "$fix/OUTPUT.md" <<'EOF'
# The output contract

## §O.1 — Two artifacts, two jobs
The queue is current state. Run reports are immutable.
EOF
  cp "$fix/METHOD.md" "$fix/skills/demo/METHOD.md"
  cp "$fix/OUTPUT.md" "$fix/skills/demo/OUTPUT.md"

  cat > "$fix/skills/demo/SKILL.md" <<'EOF'
---
name: demo
description: A synthetic skill used only by verify.sh --self-test.
---

# Demo

Reads `references/demo.md` (§1). Applies §1.1 and §1.2, under §M.1.
EOF

  cat > "$fix/skills/demo/HEURISTICS.md" <<'EOF'
# Demo heuristics

The reasoning behind each group lives in its library: `demo` (§1).

## §1 — The only group

| # | Rule |
|---|---|
| 1.1 | The first rule |
| 1.2 | The second rule |
EOF

  cat > "$fix/skills/demo/references/demo.md" <<'EOF'
# Demo Masters

## Contents

- The only section

---

## The only section

A synthetic reference library used only by verify.sh --self-test.
EOF
}

run_fixture() { ( cd "$1" && bash scripts/verify.sh >/dev/null 2>&1 ); }

self_test() {
  root=$(mktemp -d "${TMPDIR:-/tmp}/fresh-selftest.XXXXXX")
  st_fail=0

  expect() { # expect <wanted-code> <label> <mutation…>
    want=$1; label=$2; shift 2
    d="$root/case$RANDOM$$"
    build_fixture "$d"
    ( cd "$d" && "$@" )
    run_fixture "$d"; got=$?
    if [ "$got" -eq "$want" ]; then
      printf '  ✓ %-46s exit %s\n' "$label" "$got"
    else
      printf '  ✗ %-46s exit %s, wanted %s\n' "$label" "$got" "$want"
      st_fail=1
    fi
  }

  printf '=== verify.sh self-test ===\n'

  expect 0 "control — an intact tree passes" true

  expect 1 "dangling reference library" \
    sh -c "sed -i.bak 's|\`references/demo.md\`|\`references/ghost.md\`|' skills/demo/SKILL.md && rm -f skills/demo/SKILL.md.bak"

  expect 1 "reference library shipped but never read" \
    sh -c "cp skills/demo/references/demo.md skills/demo/references/orphan.md"

  expect 1 "name that does not match its directory" \
    sh -c "sed -i.bak 's|^name: demo$|name: demo-masters|' skills/demo/SKILL.md && rm -f skills/demo/SKILL.md.bak"

  expect 1 "description longer than the spec allows" \
    sh -c "python3 -c \"
import re
p='skills/demo/SKILL.md'; t=open(p).read()
t=t.replace('description: A synthetic skill used only by verify.sh --self-test.','description: '+('x'*1100))
open(p,'w').write(t)\""

  expect 1 "heuristic group with no library and no waiver" \
    sh -c "printf '\n## §7 — An orphan group\n\n| # | Rule |\n|---|---|\n| 7.1 | Unbacked |\n' >> skills/demo/HEURISTICS.md"

  expect 1 "citation to an undeclared local rule" \
    sh -c "printf 'Also applies §9.9.\n' >> skills/demo/SKILL.md"

  expect 1 "duplicate rule id" \
    sh -c "printf '| 1.1 | A second first rule |\n' >> skills/demo/HEURISTICS.md"

  expect 1 "cross-system citation into a void" \
    sh -c "printf 'See FF§9.9 for the sibling rule.\n' >> skills/demo/SKILL.md"

  expect 1 "citation to a nonexistent method rule" \
    sh -c "printf 'Governed by §M.99.\n' >> skills/demo/SKILL.md"

  expect 1 "skill missing its HEURISTICS.md" \
    rm -f skills/demo/HEURISTICS.md

  expect 1 "SKILL.md with no frontmatter" \
    sh -c "printf '# No frontmatter here\n' > skills/demo/SKILL.md"

  # The three check-6 cases — the class checks 2 and 3 could not see, because
  # they never read the libraries.
  expect 1 "library naming a library that isn't in its skill" \
    sh -c "printf 'See \`references/layout.md\` for where things live.\n' >> skills/demo/references/demo.md"

  expect 1 "library linking into another skill's library" \
    sh -c "printf 'Hand to \`../../other-skill/references/demo.md\`.\n' >> skills/demo/references/demo.md"

  expect 1 "library described as a block of fresh.config.md" \
    sh -c "printf 'Job inventory: the \`references/demo.md\` block of \`fresh.config.md\`.\n' >> skills/demo/references/demo.md"

  expect 1 "skill folder missing its METHOD.md" \
    rm -f skills/demo/METHOD.md

  expect 1 "skill folder's METHOD.md drifted from root" \
    sh -c "printf '\\n## §M.99 — invented locally\\n' >> skills/demo/METHOD.md"

  expect 1 "skill folder missing its OUTPUT.md" \
    rm -f skills/demo/OUTPUT.md

  expect 1 "skill folder's OUTPUT.md drifted from root" \
    sh -c "printf '\\n## §O.99 — invented locally\\n' >> skills/demo/OUTPUT.md"

  expect 1 "SKILL.md cites a §O rule OUTPUT.md does not declare" \
    sh -c "printf '\\nSee §O.42 for the shape.\\n' >> skills/demo/SKILL.md"

  expect 1 "skill naming a config block that does not exist" \
    sh -c "printf 'Reads the \`ghostblock\` block of \`fresh.config.md\`.\\n' >> skills/demo/SKILL.md"

  expect 1 "Contents omits a section that exists" \
    sh -c "printf '\\n## An unlisted section\\n\\nBody.\\n' >> skills/demo/SKILL.md"

  expect 1 "British spelling creeping back in" \
    sh -c "printf 'Judge the colour and the behaviour.\\n' >> skills/demo/references/demo.md"

  expect 1 "library citing a rule its skill never declared" \
    sh -c "printf 'This is governed by §4.7.\n' >> skills/demo/references/demo.md"

  # Planted *inside* main, not appended: the script exits before its own last
  # line, so an appended fault would never execute and the case would pass
  # vacuously. This is the exact bug the sentinel exists to catch.
  expect 2 "verifier that cannot finish reports failure" \
    perl -0pi -e 's/^main\(\) \{$/main() {\n  boom=\$\{NOPE_NOT_SET\}/m' scripts/verify.sh

  rm -rf "$root"
  if [ "$st_fail" -eq 0 ]; then
    printf '\n✓ every check was shown to fail on a planted defect\n'
  else
    printf '\n✗ a check did not fire. Its clean results are not evidence.\n'
  fi
  return "$st_fail"
}

# -----------------------------------------------------------------------------

SELF=$(cd "$(dirname "$0")" && pwd)/$(basename "$0")

case "${1:-}" in
  --self-test)
    self_test; rc=$?
    completed=1
    exit "$rc"
    ;;
  "")
    cd "$(dirname "$0")/.." || exit 2
    main
    completed=1
    exit "$fail"
    ;;
  *)
    printf 'usage: verify.sh [--self-test]\n' >&2
    completed=1
    exit 2
    ;;
esac
