# Activation Masters

> **Scope.** This library is about THE FIRST SESSION — not where they came from (demand), not what the page said (message), not returning weeks later (retention), not compounding (loops), not whether a claim is earned (evidence).

## Contents

- The One Question
- The four masters
- The benchmark stopwatch
- When the empty state is the whole problem
- Applying it
- Extending this library

---
The reference library for **§3** of the fresh-growth-walk heuristics.

Canonical numbered rules: `HEURISTICS.md` §3.
Signup path and walk account: the `doors` and `safety` blocks of
`fresh.config.md`.

Companion libraries: `references/evidence.md` (§0), `references/demand.md` (§1), `references/message.md` (§2),
`references/retention.md` (§4), `references/loops.md` (§5, §6).

---

## The One Question

> How long until they hold something worth having — and does the onboarding
> aim at it?

---

## The four masters

### 1. Wes Bush — *the straight line to value*

The job of onboarding is to reach value in as straight a line as possible,
and **every step not on that line is a tax**. Time-to-value is the primary
activation measure. His bowling-alley image is the design pattern: bumpers
that prevent the gutter, rather than instructions explaining bowling.

He is also the source of the discipline in §3.9: **name the aha before
judging the onboarding.** Without a named target, an onboarding review can
only describe what the screens do, never whether they work. His own
observation is that most companies spend the first months of a product-led
motion simply defining it.

> **In a walk:** write the aha down first, in one sentence, then ask of every
> step whether it moves toward it.

### 2. Samuel Hulick — *the user's story, not the product's tour*

His teardowns established the method this whole walk borrows: go through the
real signup as a real person, screen by screen, narrating what you understood
and what you expected.

His central correction: onboarding is a **story about the user becoming more
capable**, not a tour of the product's features. A checklist of *connect a
source / import data / view the results* is the product's table of contents
wearing onboarding's clothes (§3.5). The user's version of the same sequence
sounds like *"see my own data in here, and believe what it says."*

His second point: **the empty state is not an error state.** For a new
account it *is* the product (§3.3) — and it is usually designed last, by
whoever had the least time.

> **In a walk:** narrate. Screen by screen, what you expected and what
> happened. That narration is the evidence.

### 3. Nir Eyal — *the hook, and the warning*

*Hooked* describes a four-part loop: **trigger → action → variable reward →
investment.** External triggers become internal ones, and each pass loads the
next.

Two honest uses:

**As a diagnostic.** Ask which part is missing. The **variable reward** is
usually the interesting one — what a user gets should differ between visits
because the underlying world changed. If it doesn't vary, the loop has no
pull, and no amount of triggering fixes that.

**As a warning.** Eyal's own later position, in *Indistractable*, is that the
model is ethically neutral machinery and applying it without a matching user
benefit is manipulation. This library uses the hook to find a **missing**
loop, never to recommend adding compulsion. A recommendation that increases
engagement without increasing the user's capability is out of scope — and
`references/message.md` §2.7 catches the same failure on the copy side.

> **In a walk:** name which of the four parts is absent. That is the finding,
> not "add notifications".

### 4. Ramli John — *onboarding is not a checklist*

The sequencing discipline: onboarding runs from signup through to habit, and
the in-product flow is only one piece. The email sequence, the docs, the
first support touch and the first *you did it* are all onboarding.

This is the source of §3.7: **every lifecycle email is a step in the flow**,
walked in sequence with the screens rather than reviewed as an asset in a
folder. An email that reads well in isolation and arrives at the wrong moment
is a worse step than no email.

> **In a walk:** interleave. Screen, screen, email, screen — in the order a
> real person meets them.

---

## The benchmark stopwatch

Per §0.8 these are compared against an **observed** walk. They are never used
to compute a rate the product cannot measure (§0.4).

**These bands have no single authoritative source, and the honest thing is to
say so** (§0.1). They are the ranges that recur across published vendor
benchmark reports and product-led-growth writing, which is a weaker
provenance than anything else in these libraries. Treat them as a rough
stopwatch: *"17 minutes against a band whose top tier is under five"* is a
usable sentence, and *"we are below the industry average"* is not. What would
upgrade them is your own observed walks, dated and kept — after a dozen runs
your own distribution beats a borrowed band.

| Measure | Band |
|---|---|
| **Time to value**, self-serve business software | **under 5 min** excellent — where the best-known design and productivity tools sit · **5–20 min** typical and acceptable · **20–60 min** loses a meaningful share of signups before value · **over 60 min** the product needs assisted onboarding to hold conversion |
| Reaching the aha at all | Roughly **two-thirds** of users never do |
| Activation target | **30–40%** reach the aha within seven days |

The honest use: *"17 minutes to first value, against a 5-minute
best-in-class"* is a finding. *"Our activation rate is 30%"* is not available
(§0.3).

---

## When the empty state is the whole problem

Any product whose value depends on accumulated data **has nothing to say when
it holds none.** That makes the cold start unusually sharp and puts more
weight on onboarding than on any other stage.

Three rules do the work:

- **§3.3** — the empty state is the product for a new account. Judge every
  first-run surface as a designed screen, not as a placeholder.
- **§3.4** — sample data that cannot become real data is a dead end. A demo
  that impresses and then strands is worse than no demo, because the drop is
  felt.
- **Chen's cold start** (via `references/demand.md`) — acquisition and activation are not
  separable here. A stranger delivered into an empty account was not
  activated, they were spent.

One caution before reporting an empty-state element as a defect: **confirm it
was not intended.** Deliberate empty-state craft — a quiet mark, a considered
line of text — is regularly mistaken for placeholder content or fake data by
a reviewer seeing it cold. Check intent against the running render
(`FE§0.2` — judge the render, never the rulebook — and §M.5) before writing
the finding.

---

## Applying it

1. Write the aha in one sentence before looking at any screen (Bush).
2. Walk the real signup and narrate it, screen by screen (Hulick).
3. Judge every first-run surface as a designed screen (§3.3).
4. Check whether sample data can become real data (§3.4).
5. Interleave the lifecycle emails in the order they arrive (John).
6. Name which part of the hook is missing, if any (Eyal).
7. Time it, and compare against the bands as a stopwatch (§0.8).

---

## Extending this library

If an activation question comes up that these four don't reach, add it with
the master who would have caught it.

*Distillations of published work — Bush, Product-Led Growth; Hulick's
published onboarding teardowns and Driving User Growth; Eyal, Hooked and
Indistractable; John, Product-Led Onboarding. Commentary, not endorsement; no
author named here has reviewed this file.*
