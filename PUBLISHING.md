# Publishing

This directory is a **staging copy**. It lives inside a private product
repo, and it must never be published by any method that carries that repo's
history with it.

## Why history is the risk, not just content

The files here were extracted from skills that named a specific product
throughout — real backend file paths, real environment variable names, real
staging hostnames, a real signup address, real counts of internal jobs.
`scripts/check-clean.sh` keeps that out of the **current** tree.

The guard itself was once the largest hole in this procedure. It held the
real product terms inline and excluded `scripts/` from its own scan, so the
file whose only job was keeping the product name out of the tree was the file
carrying it — along with a former product name, the staging hostname and the
stack. Nothing on the checklist below could catch that, because every item on
it runs *through* the guard. The terms now live in `.check-clean.patterns`, a
dotfile the publish glob does not match, and rule 7 scans `scripts/` for them
on every run.

History is a separate problem. Anything that carries commits carries the
pre-extraction versions too, and a public repo's history is as readable as
its HEAD:

- `git clone` then `git remote set-url` — carries everything. Never.
- `git subtree split` — carries this directory's commits, including any
  commit where a leak was present before it was fixed. **One such commit
  already exists in this repo's history.** Never.
- `git filter-repo` — can produce a clean result, but it is a rewrite of
  real history and one missed path re-exposes everything. Not worth it for
  a tree this small.

## The procedure

Copy the **contents**, not the repository. One commit, no ancestry.

```bash
./scripts/check-clean.sh --self-test || exit 1   # prove the guard can still fail
./scripts/verify.sh      --self-test || exit 1   # prove the verifier can still fail

./scripts/check-clean.sh || exit 1      # refuses to proceed if anything leaks
./scripts/verify.sh      || exit 1      # refuses if any citation dangles

PUB=$(mktemp -d /tmp/fresh-publish.XXXXXX)
cp -R ./* "$PUB"/                       # contents only — no .git, no history
cd "$PUB"

./scripts/check-clean.sh                # again, on the isolated copy
git init -q && git add -A
git commit -q -m "The Fresh Series — three outside-in audits for AI agents"
```

`cp -R ./*` is deliberate: the glob does not match dotfiles, so neither
`.git` nor `.check-clean.patterns` can ride along. That is load-bearing for
both — the patterns file exists as a dotfile precisely so this line excludes
it, and `check-clean.sh --self-test` asserts the exclusion rather than
trusting it. `mktemp -d` rather than a fixed path and an `rm -rf` — a fresh
directory each time cannot collide with a previous run, and nothing here
should ever need a recursive delete.

Then create the empty remote and push. The result has exactly one commit
and no ancestor that ever named the product.

## Before the first push

- [ ] `scripts/check-clean.sh` passes on the isolated copy, not just here
- [ ] **The isolated copy contains no `.check-clean.patterns`** — `ls -a` it.
      Its absence is why the copy's own run prints the degraded-mode warning;
      that warning appearing there is correct, and it appearing *here* means
      the local file has gone missing
- [ ] `grep -rniE '<your product terms>' "$PUB"` returns nothing but the two
      permitted authorship lines. The guard should already have caught it —
      this is the independent second look that the guard's own blind spot
      once needed
- [ ] `scripts/verify.sh` passes — no skill cites a library that isn't there
- [ ] `git log --oneline` in the copy shows **one** commit
- [ ] `git log --all --format=%an` shows no unintended author identity
- [ ] No `.git` directory was copied — `ls -a` in the copy before `git init`
- [ ] `scripts/verify.sh` passes **on the isolated copy too**, not only here
- [ ] LICENSE present, and the README clone URL names the account you are
      actually publishing to. Both name the
      author, and `check-clean.sh` permits that in exactly those two lines
      and nowhere else — if either is reworded, the guard will refuse, which
      is the design working rather than a false positive
- [ ] The reference libraries carry their source citations and the
      no-endorsement line
- [ ] `scripts/verify.sh --self-test` passes — every check shown to fail on a
      planted defect, so a clean run is evidence rather than an assumption

## Keeping the two in step

The staging copy here stays the working tree; the published repo is a
publish target, not a fork. Changes are made here, checked, and re-copied.
If the published repo ever accumulates its own commits (issues, PRs,
community fixes), that is the point at which it stops being a copy and
becomes the source — decide deliberately when that happens, and record the
decision at the top of this file.
