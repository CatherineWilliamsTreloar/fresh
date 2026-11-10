# The Fresh Series

Three outside-in audits for your product, run by an AI agent that is not
allowed to make things up.

- **`fresh-design-review`** — a designer who has never seen it. Components, pages, color, motion, density.
- **`fresh-job-walk`** — someone using it cold to get a job done. Jobs × surfaces, steps *and* decisions.
- **`fresh-growth-walk`** — a stranger who has never heard of you. One phase at a time: acquisition, activation, retention, revenue, loop.

They share one method. That method is the point.

## Your first run

Install below, then paste one of these. Each is a *smallest useful run* —
one unit, done properly, in minutes rather than hours:

```
Review this one screenshot with fresh-design-review.
Walk the job "find out why this invoice is unpaid" on the web app only,
with fresh-job-walk.
Walk the acquisition phase — find and learn — for one stranger arriving
from search, with fresh-growth-walk.
```

Every skill also has a **thorough** mode — the full component set, the whole
jobs × surfaces matrix, three doors and three evaluators. It is worth
running and it is not where to start. Each `SKILL.md` says which is which
before you commit to either.

---

## Why this exists

Ask any agent to review your product and it will produce something. It
will count steps it never took, quote screens it never opened, average
five uneven surfaces into one reassuring adjective, and hand you a score
out of ten.

The output is fluent, plausible, and unfalsifiable. It is worse than no
report, because someone will act on it.

**Most agent skills tell the agent what to look for. These tell it what
it is not allowed to claim.**

The thirteen rules in [`METHOD.md`](METHOD.md) are the whole idea. A few of
them:

> **§M.4 — Walk it, never infer it.** A number you did not obtain by
> walking is banned — and it is worse than a gap, because it looks like
> evidence.

> **§M.5 — Quote literally, or discard.** Unquoted fails are discarded at
> review. Not softened — discarded.

> **§M.6 — Severity on findings, never a score on the thing.** A score
> invites optimising the score.

> **§M.8 — Never average.** A job that is fluent in one place and blocked
> in another is not "workable on average". The disagreement *is* the
> finding.

> **§M.9 — "Not exercised" is a result.** An unknown produces a smaller
> claim, never a wrong one.

> **§M.10 — Stop at irreversible gates.** A walk that stopped one step
> short is worth infinitely more than a walk that emailed your customers.

Everything else — the seven stages, the verdict scales, the master
libraries — is machinery for producing findings that survive those six.

## What a finding looks like

Four sections. The first two are what any review gives you; the last two are
what turns an argument into a task.

```
FE-001 · Every button is 12px short of the minimum hit area · sev 2

What       Raise the interactive target to 44×44 without changing the
           painted size — padding on the hit box, or a pseudo-element.
Why        polish §6.6 — hit areas at least 44×44 regardless of the visual
           size of the control. A platform minimum, not a recommendation,
           on the object 97 screens render.
Evidence   Seven distinct widths on one page — 62, 72, 82, 85, 87, 90, 143
           — and one height: 32px. Against the 44px minimum, 12px short on
           every one.
Done when  Math.min(...[...document.querySelectorAll('button')]
             .map(b => b.getBoundingClientRect().height)) returns 44 or
           more, with the painted button unchanged.
```

That is a real finding from a real run, with the product redacted and every
number left as measured.

**Evidence carries the measurement and the master's number to compare
against.** *"The rows feel sparse"* is a reaction. *"Row pitch measures 85px
for content ~40px tall — 45px of air; Saarinen ships 56–64px"* is a finding
someone can disagree with, which is the whole point.

**Done when is what decides whether anything happens.** A finding without it
hands over a judgment call. A finding with it can go to an agent, or to
someone in a hurry, and come back verified.

Where a walk drives a live surface and cannot see the source, it says so —
*"not accessible from here"* — and names what would settle it. An unknown
produces a smaller claim, never a wrong one.

## The three, side by side

| | Stance | Walks | Verdict scale |
|---|---|---|---|
| **fresh-design-review** | a designer who has never seen it | components, pages, dark mode | five words, topping out at `inevitable` |
| **fresh-job-walk** | someone using it cold | each job × each surface | `blocked` · `laborious` · `workable` · `fluent` · `one-move` |
| **fresh-growth-walk** | a stranger who has never heard of you | one phase, one door | `broken` · `leaking` · `working` · `earning` · `compounding` |

Every scale's top word is reserved and has a test. `compounding` requires
naming the path from a stage's output back to the top of the funnel — no
path, no verdict.

## The master libraries

Each skill reads the library for the group it is about to score, not all
of them up front (§M.2). They are distillations of published work by
named practitioners — Christensen and Moesta on jobs, Tesler and Krug on
flow, Minto and Gigerenzer on answers, Schwartz and Dunford on message,
Kohavi and Hubbard on evidence, Rams and Albers on craft — each with its
source cited.

They are what stops the judgment collapsing into taste. They are
distillations and commentary, not endorsements, and no practitioner named
here has reviewed or approved this.

Sixteen libraries, partitioned cleanly — no library is read by two skills:

```
skills/
  fresh-design-review/  SKILL.md · HEURISTICS.md · references/  design color motion polish layout
  fresh-job-walk/       SKILL.md · HEURISTICS.md · references/  jobs flow answers surfaces autonomy
  fresh-growth-walk/    SKILL.md · HEURISTICS.md · references/  demand message activation retention loops evidence
```

They are reference files rather than skills in their own right, which is
deliberate. Only `name` and `description` are preloaded into an agent's
context at startup, and that happens for *every* installed skill. Three
skills cost three descriptions; sixteen standalone libraries would cost
nineteen, in every session, whether or not anyone runs an audit. The
libraries are never invoked alone — each is read by its own skill — so
they belong on disk until needed, which is what `references/` is for.

## Install

```bash
git clone https://github.com/CatherineWilliamsTreloar/fresh

# pick the skills directory your agent actually reads
DEST=~/.claude/skills          # Claude Code
# DEST=~/.cursor/skills        # Cursor
# DEST=~/.agents/skills        # Codex, and the cross-runtime alias

mkdir -p "$DEST"
cp -R fresh/skills/fresh-design-review fresh/skills/fresh-job-walk fresh/skills/fresh-growth-walk "$DEST"/

# -n so re-running this after a `git pull` cannot overwrite a config you
# have already filled in. Deleting that file costs fifteen minutes.
cp -n fresh/fresh.config.md "$DEST"/fresh.config.md

for s in fresh-design-review fresh-job-walk fresh-growth-walk; do
  ln -sf ../fresh.config.md "$DEST/$s/fresh.config.md"
done
```

**`METHOD.md` and `OUTPUT.md` already ship inside each skill folder**, so a
folder is self-contained: zip it, package it, install one on its own, and the
thirteen rules plus the output contract come with it. That matters because
every `SKILL.md` opens by reading both and is told to stop if either is
missing — a folder without them ships a skill designed to refuse to run.
`scripts/verify.sh` keeps every copy byte-identical to the root one.

One contract, replicated rather than restated, is the point: three copies of
a rulebook drift, and the drift shows up as two skills disagreeing about what
a finding is.

`fresh.config.md` is the opposite case: it is yours, and it is the file most
likely to go stale (`§M.4`). So it is **linked**, and there is exactly one to
keep current. If your filesystem has no symlinks, copy it into each folder
and accept that you now have three that drift.

**These are a series, not three independent packages.** They cite each other
(`FE§`, `FF§`, `FG§`) and hand findings across (`§M.12`). Installing one
works; installing all three is what the cross-references assume.

The finished layout (under `$DEST`):

```
fresh.config.md         ← yours, one copy, linked into each skill
fresh-design-review/  SKILL.md · HEURISTICS.md · references/ · METHOD.md · OUTPUT.md · fresh.config.md →
fresh-job-walk/       …
fresh-growth-walk/    …
```

Then fill in [`fresh.config.md`](fresh.config.md) — your surfaces, jobs,
doors, environments, and **safety gates**. Fifteen minutes, once.

A missing field is fine; the skills degrade to a smaller, honest claim. A
*guessed* field is the problem, because the walk proceeds confidently on
it.

Then invoke:

```
/fresh-growth-walk
```

These are plain [Agent Skills](https://agentskills.io/specification).
Project-only install is the same copy into `.claude/skills/` or
`.cursor/skills/` at the repo root.

## Before your first run

Fill in the `safety` block. Genuinely fill it in. These skills sign up
for real, click real buttons and open real inboxes, which is the only way
§M.4 can hold — and it means an unlisted destructive verb is a verb that
will eventually get called.

List every tool that reaches outward, every gate to stop at, and the
address you want the walk account created on.

## Status

| | |
|---|---|
| `METHOD.md` | ✅ complete |
| `OUTPUT.md` | ✅ complete |
| `fresh.config.md` | ✅ complete |
| `scripts/check-clean.sh` | ✅ refuses to publish if the tree names its origin — including if the guard's own source does · `--self-test` proves every rule can fail |
| `scripts/verify.sh` | ✅ refuses if any citation or library path dangles, in the skills *and* in the libraries · `--self-test` proves every check can fail, on a planted defect each |
| `.check-clean.patterns` | ✅ your identifying terms, kept out of the published tree by being a dotfile · template at `scripts/check-clean.patterns.example` |
| `PUBLISHING.md` | ✅ the no-history publish procedure |
| `fresh-design-review` | ✅ skill + 58 numbered heuristics |
| `fresh-job-walk` | ✅ skill + 55 numbered heuristics |
| `fresh-growth-walk` | ✅ skill + 53 numbered heuristics |
| `fresh-job-walk/references/` — jobs, flow, answers, surfaces, autonomy | ✅ |
| `fresh-design-review/references/` — design, color, motion, layout, polish | ✅ |
| `fresh-growth-walk/references/` — demand, message, activation, retention, loops, evidence | ✅ |
| `LICENSE` | ✅ MIT |
| a worked example | 🚧 planned — a real redacted walk. Not in this tree yet |
| evaluations | 🚧 **none yet.** See below — this is the honest gap |

**This is `v0.1`, a public beta: structurally verified, behavior still being
learned.** Every citation resolves and both guards have been shown to fail on
planted defects. What has not happened is a body of real runs, which is the
only thing that will show which rules agents quietly ignore, which libraries
they never open, and which setup step makes people give up. If you run one,
the traces are worth more to this than another review round.

**All three are structurally complete**, and that is a narrower claim than it
sounds. Every heuristic resolves, every library a skill cites is present, and
both guards have been shown to fail on a planted defect — every rule in
one, every check in the other. That proves the citations are not dangling. **It does not prove
the judgment is any good.**

The authoring guidance asks for evaluations, and asks for them *first*:
establish a baseline without the skill, then measure whether the skill beats
it. That has not been done here. So the series currently asks you to take its
quality on the evidence of how carefully it was built — which is precisely the
move `§M.4` exists to ban, applied to itself. *Not exercised* is a result
(`§M.9`), and this is one.

If you run these, the cheapest honest test is the one the method would demand:
take one real surface, review it twice — once with the skill loaded, once with
a fresh agent and no skill — and diff the two. Two data points, one afternoon,
and it converts "these are good" from taste into evidence. There is no
built-in runner for this; it is a manual comparison either way.

## Who made this

Built by Cat Williams-Treloar, founder of [Annsa](https://annsa.ai): the plan your AI agents work from.

## License

MIT.
