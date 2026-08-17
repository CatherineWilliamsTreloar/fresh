#!/usr/bin/env bash
# Refuses to let product internals reach the publishable tree.
#
# Run before every publish, and in CI on any change under fresh/.
# Exit 0 = clean. Exit 1 = something in here names the product it came from.
# Exit 2 = the check did not finish. Treat as failure, never as success.
#
# This exists because a first pass grepped for the product NAME, passed, and
# still shipped two real backend file:line references and a real env var in a
# worked example. Names are the easy half.
#
# It exists in *this* shape because of a second, worse failure: the guard
# held the real product terms inline and excluded `scripts/` from its own
# scan, so it would have published the product name, a former product name,
# the staging hostname and the whole stack — inside the file whose only job
# was keeping them out. A guard that cannot see itself is not a guard.
#
# Run `check-clean.sh --self-test` to prove every rule still fires.

set -uo pipefail

# An abort must never look like a pass. Same sentinel as verify.sh, same
# reason: a guard that exits 0 because it crashed is worse than no guard.
completed=0
on_exit() {
  status=$?
  if [ "$completed" -eq 0 ]; then
    printf '\n✗ check-clean.sh did not run to completion (status %s).\n' "$status" >&2
    printf '  An unfinished check is not a passing check — reporting failure.\n' >&2
    exit 2
  fi
  exit "$status"
}
trap on_exit EXIT

fail=0
degraded=0
hit() { printf '\n✗ %s\n' "$1"; shift; printf '%s\n' "$@"; fail=1; }

# --- Where the identifying terms come from ------------------------------------
#
# Not from this file. See scripts/check-clean.patterns.example for why, and
# for the format. The defaults below are placeholders: they keep every rule
# executable in a fresh clone without teaching this script anybody's name.

PATTERNS='.check-clean.patterns'

PRODUCT_TERMS='yourproduct|yourformername|yourcompany|yourstagingname'
VENDOR_TERMS='examplehost|exampledb|examplequeue'
AUTHOR=''
AUTHOR_HANDLE=''
IDENTIFIER_TERMS=''

load_patterns() {
  if [ -f "$PATTERNS" ]; then
    # shellcheck disable=SC1090
    . "./$PATTERNS"
  else
    degraded=1
  fi
}

# The scans skip two directories and one file, each for a stated reason:
#
#   scripts/  — the self-test below has to *contain* the shapes the rules
#               detect (a file:line, an env var, a live host) in order to
#               plant them. Those are placeholders, not leaks. Rule 7 scans
#               this directory for the things that would be: the product's
#               names, and real identifiers from its codebase.
#   .git/     — not ours.
#   $PATTERNS — by definition holds every term rule 1 looks for.
scan() { grep -rniE "$1" . --exclude-dir=scripts --exclude-dir=.git --exclude="$PATTERNS" 2>/dev/null; }

# --- The authorship exception -------------------------------------------------
#
# Rule 1 scans for the author's name, and it earns that: the corpus these
# libraries were extracted from contained a sentence deferring an unresolved
# internal positioning decision to a named person — inside a file queued for
# extraction.
#
# But publishing under your own name requires writing it down. The same
# letters are a leak in a library and the license in a LICENSE. A grep reads
# strings, not intent.
#
# So the exception is scoped to an exact form in an exact file, never to the
# string. Anything else — the author's name anywhere else, or a different
# wording in these same files — still fails. Dropping the name from the
# pattern would have been the obvious fix and would have let that
# corpus sentence through untouched.

drop_permitted_authorship() {
  if [ -z "$AUTHOR" ] && [ -z "$AUTHOR_HANDLE" ]; then
    cat
    return
  fi
  grep -vE \
    -e "^\./LICENSE:[0-9]+:Copyright \(c\) [0-9]{4} ${AUTHOR}\$" \
    -e "^\./LICENSE:[0-9]+:MIT License\$" \
    -e "^\./README\.md:[0-9]+:git clone https://github\.com/${AUTHOR_HANDLE}/[a-z0-9.-]+\$"
}

main() {
  load_patterns

  # 1. Product, company, person and environment names.
  if out=$(scan "$PRODUCT_TERMS" | drop_permitted_authorship); then
    hit "Product / person / environment name" "$out"
  fi

  # 2. Vendor and infrastructure names that identify the stack.
  #
  #    A vendor that doubles as a design reference does not belong in
  #    VENDOR_TERMS — the deploy-context rule below catches the leaking
  #    sense of it without losing the citation.
  if out=$(scan "$VENDOR_TERMS"); then
    hit "Infrastructure vendor name" "$out"
  fi

  # 2b. Any vendor named in a deployment sense, including the ones allowed
  #     above as design references.
  #
  #     The 40- and 20-character windows are one clause: long enough to
  #     span "deploys the frontend to Vercel", short enough that a
  #     sentence about deployment followed later by an unrelated design
  #     citation does not read as one phrase. `[^.]` stops either window
  #     crossing a sentence boundary, which is what actually bounds them.
  if out=$(scan '(deploy|deployed|deploys|hosting|auto-deploy|preview build)[^.]{0,40}(vercel|netlify|fly\.io)|(vercel|netlify)[^.]{0,20}(deploy|preview)'); then
    hit "Vendor named as infrastructure rather than as a design reference" "$out"
  fi

  # 3. Real source references — path:line is always someone's real codebase.
  #    Placeholders are angle-bracketed (<sender>:<line>) and pass.
  if out=$(scan '\b[a-z_][a-z0-9_]*\.(py|ts|tsx|sql):[0-9]+'); then
    hit "Real source file:line reference (use <placeholder>:<line>)" "$out"
  fi

  # 4. Env var names. Anything SCREAMING_SNAKE that is not a generic example.
  #
  #    The allowlist holds only entries the pattern can actually match and
  #    that actually appear. It previously carried six, of which four —
  #    ENVIRONMENT, N, TODO, MIT — have no underscore and so could never
  #    match, and a fifth named a key that no longer appears anywhere. Dead
  #    entries in a guard read as an allowlist nobody ever exercised, which
  #    is exactly the impression the self-test exists to refute.
  allow='LAUNCH_CUTOFF_AT'
  if out=$(grep -rnoE '\b[A-Z][A-Z0-9]*(_[A-Z0-9]+){1,}\b' . \
             --exclude-dir=scripts --exclude-dir=.git --exclude="$PATTERNS" 2>/dev/null \
           | grep -vE ":($allow)$"); then
    hit "Env var / constant that may be real (allowlist in this script)" "$out"
  fi

  # 5. Live hosts and addresses. example.com / example.org are RFC 2606
  #    reserved-for-documentation and are the correct thing to use here.
  #
  #    Three real hosts are permitted, and only these: github.com for the
  #    clone line, and agentskills.io / platform.claude.com for the public
  #    specifications this tree is written against. Citing a standard is not
  #    the leak this rule is for. Anything else — including a docs host that
  #    happens to belong to you — still fails.
  if out=$(scan 'https?://[a-z0-9.-]+\.(ai|com|io)|[a-z]+\+[a-z0-9]+@[a-z0-9.-]+' \
           | grep -viE 'example\.(com|org)|github\.com|agentskills\.io|platform\.claude\.com'); then
    hit "Live host or real email address (use example.com — RFC 2606)" "$out"
  fi

  # 6. Counts and job ids that describe one specific product. Declaring them
  #    in fresh.config.md is the point; hardcoding them in a skill is the bug.
  if out=$(grep -rniE '\b[0-9]{2,} (autonomous )?(workflows|jobs|touchpoints)\b|\bJ[0-9]{1,2}\b' \
           . --exclude-dir=scripts --exclude-dir=.git --exclude=fresh.config.md 2>/dev/null); then
    hit "Product-specific count or job id outside fresh.config.md" "$out"
  fi

  # 6b. Bare lowercase identifiers lifted from a real codebase.
  #
  #     Rule 3 catches `foo.py:123`. Rule 4 catches SCREAMING_SNAKE. A bare
  #     `your_column` or `your_module` — a real column, table or module
  #     name, in prose — passes every other rule in this file, and is
  #     exactly what a worked example de-identified by hand tends to leave
  #     behind. There is no generic pattern for "looks like someone's
  #     schema", so this one is a list you maintain in $PATTERNS.
  if [ -n "${IDENTIFIER_TERMS:-}" ]; then
    if out=$(scan "\\b(${IDENTIFIER_TERMS})\\b"); then
      hit "Real identifier from the source codebase (rename it in the example)" "$out"
    fi
  fi

  # 7. The scripts themselves. Every other rule skips this directory because
  #    the self-test has to hold the shapes it plants. None of that requires
  #    a real name, and a real name here is the leak that ships with the
  #    guard — so scripts/ is scanned for identity, and for identity only.
  #
  #    Two exclusions, both scoped to a definition rather than to a string:
  #    the example patterns file is nothing but definitions, and the
  #    assignment lines in this script are the placeholder defaults. A term
  #    appearing anywhere else in scripts/ still fails.
  identity="$PRODUCT_TERMS"
  [ -n "${IDENTIFIER_TERMS:-}" ] && identity="$identity|$IDENTIFIER_TERMS"
  [ -n "$AUTHOR" ] && identity="$identity|$AUTHOR"
  [ -n "$AUTHOR_HANDLE" ] && identity="$identity|$AUTHOR_HANDLE"
  if out=$(grep -rniE "$identity" scripts/ \
             --exclude="$(basename "$PATTERNS").example" \
             --exclude=check-clean.patterns.example 2>/dev/null \
           | grep -vE ':(PRODUCT_TERMS|VENDOR_TERMS|AUTHOR|AUTHOR_HANDLE)='); then
    hit "The guard's own source names the thing it protects" "$out"
  fi

  if [ "$degraded" -eq 1 ]; then
    printf '\n⚠  No %s — scanning with placeholder terms only.\n' "$PATTERNS"
    printf '   Every generic rule ran, but rule 1 and rule 7 cannot recognize\n'
    printf '   your names. Copy scripts/check-clean.patterns.example and fill it\n'
    printf '   in before treating a pass as evidence.\n'
  fi

  if [ "$fail" -eq 0 ]; then
    if [ "$degraded" -eq 1 ]; then
      echo "✓ clean against the generic rules — see the warning above"
    else
      echo "✓ clean — nothing in fresh/ names the product it was extracted from"
    fi
  else
    printf '\nRefusing to publish. Genericize the hits above, then re-run.\n'
  fi
}

# --- self-test ----------------------------------------------------------------
#
# A guard that has never been shown to fail is not evidence. Each case plants
# one defect in a throwaway copy of the real tree and requires exit 1.
#
# The product-specific fixtures are *derived* from the loaded patterns rather
# than written out, so this file never has to contain a real name in order to
# prove it can catch one. Everything else uses obvious placeholders.

self_test() {
  load_patterns
  first_of() { printf '%s' "${1%%|*}"; }
  product=$(first_of "$PRODUCT_TERMS")
  vendor=$(first_of "$VENDOR_TERMS")

  root=$(mktemp -d "${TMPDIR:-/tmp}/fresh-cleantest.XXXXXX")
  st_fail=0
  src=$(cd "$(dirname "$0")/.." && pwd)

  expect() { # expect <wanted> <label> <shell-snippet-run-in-the-copy>
    want=$1; label=$2; snippet=$3
    d="$root/case$RANDOM$$"
    mkdir -p "$d"
    ( cd "$src" && tar cf - --exclude .git . ) | ( cd "$d" && tar xf - )
    ( cd "$d" && sh -c "$snippet" >/dev/null 2>&1 )
    ( cd "$d" && ./scripts/check-clean.sh >/dev/null 2>&1 ); got=$?
    if [ "$got" -eq "$want" ]; then
      printf '  ✓ %-52s exit %s\n' "$label" "$got"
    else
      printf '  ✗ %-52s exit %s, wanted %s\n' "$label" "$got" "$want"
      st_fail=1
    fi
  }

  printf '=== check-clean.sh self-test ===\n'
  if [ "$degraded" -eq 1 ]; then
    printf '  (no %s — the identity cases run against placeholder terms)\n' "$PATTERNS"
  fi

  expect 0 "control — the real tree is clean" "true"

  # The seven rules.
  expect 1 "rule 1 · product / person name" \
    "printf 'Built on the %s platform.\n' '$product' >> METHOD.md"
  expect 1 "rule 2 · infrastructure vendor" \
    "printf 'Data lives in %s.\n' '$vendor' >> METHOD.md"
  expect 1 "rule 2b · vendor named as infrastructure" \
    "printf 'The site auto-deploys to Vercel on every preview build.\n' >> METHOD.md"
  expect 1 "rule 3 · real source file:line" \
    "printf 'See services/sender.py:412 for the gate.\n' >> METHOD.md"
  expect 1 "rule 4 · possibly-real env var" \
    "printf 'Gated on WELCOME_SEQUENCE_CUTOFF being unset.\n' >> METHOD.md"
  expect 1 "rule 5 · live host or address" \
    "printf 'Walked https://staging.acme-corp.ai and mailed walk+d1@acme-corp.ai.\n' >> METHOD.md"
  expect 1 "rule 6 · product-specific count or job id" \
    "printf 'The product runs 82 autonomous workflows, including J7.\n' >> METHOD.md"
  expect 1 "rule 6b · bare identifier from the real codebase" \
    "printf 'The gate reads %s on the account row.\\n' \"${IDENTIFIER_TERMS%%|*}\" >> METHOD.md"
  expect 1 "rule 7 · the guard's own source names the product" \
    "printf '# tuned for %s\n' '$product' >> scripts/verify.sh"

  # The real sentence rule 1 exists to catch, in the shape it had in the
  # source corpus: an internal decision deferred to a named person, buried
  # in a library file.
  expect 1 "the corpus leak, in its original shape" \
    "printf 'That tension is a judgment call for %s, not a change to make.\n' '$product' \
       >> skills/fresh-design-review/references/design.md"

  # The authorship exception: exactly two lines, in exactly two files.
  if [ -n "$AUTHOR" ]; then
    expect 1 "author named in a library, not the license" \
      "printf 'Copyright (c) 2026 %s\n' '$AUTHOR' >> skills/fresh-design-review/references/design.md"
    expect 1 "author named elsewhere in LICENSE" \
      "printf 'Questions? Ask %s.\n' '$AUTHOR' >> LICENSE"
    expect 1 "handle outside the README clone line" \
      "printf 'See github.com/%s for more.\n' '$AUTHOR_HANDLE' >> METHOD.md"
    expect 1 "copyright line with the wrong shape" \
      "sed -i.bak 's|^Copyright (c) 2026 |Copyright 2026 by |' LICENSE && rm -f LICENSE.bak"
  else
    printf '  – authorship cases skipped (no AUTHOR configured)\n'
  fi

  # The patterns file must never be publishable. A dotfile is not matched by
  # the `cp -R ./*` in PUBLISHING.md, and this proves the assumption holds.
  if [ -f "$src/$PATTERNS" ]; then
    d="$root/publishcopy$$"
    mkdir -p "$d"
    ( cd "$src" && cp -R ./* "$d"/ 2>/dev/null )
    if [ -e "$d/$PATTERNS" ]; then
      printf '  ✗ %-52s the publish glob copied it\n' "patterns file stays out of the publish copy"
      st_fail=1
    else
      printf '  ✓ %-52s not copied\n' "patterns file stays out of the publish copy"
    fi
  fi

  rm -rf "$root"
  if [ "$st_fail" -eq 0 ]; then
    printf '\n✓ every rule was shown to fail on a planted defect\n'
  else
    printf '\n✗ a rule did not fire. Its clean results are not evidence.\n'
  fi
  return "$st_fail"
}

# -----------------------------------------------------------------------------

case "${1:-}" in
  --self-test)
    cd "$(dirname "$0")/.." || exit 2
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
    printf 'usage: check-clean.sh [--self-test]\n' >&2
    completed=1
    exit 2
    ;;
esac
