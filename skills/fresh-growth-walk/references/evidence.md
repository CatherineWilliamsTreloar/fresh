# Evidence Masters

> **Scope.** This library is about WHETHER A CLAIM IS EARNED — not how strangers arrive (demand), not what they understand (message), not the first ten minutes (activation), not coming back (retention), not whether it compounds (loops).

## Contents

- The One Question
- Why this library exists at all
- The four masters
- The three sentences
- Applying it
- Extending this library

---
The reference library for **§0** of the fresh-growth-walk heuristics — the floor
every other group stands on.

Canonical numbered rules: `HEURISTICS.md` §0.
Door inventory: the `doors` block of `fresh.config.md`.

Companion libraries: `references/demand.md` (§1), `references/message.md` (§2), `references/activation.md` (§3),
`references/retention.md` (§4), `references/loops.md` (§5, §6).

Cross-reference rather than restate: **Gigerenzer** (natural frequencies) and
**Tetlock** (calibration) live in the answers library of `fresh-job-walk`. They belong to how an answer is
*phrased*; this library is about whether it is *earned*.

---

## The One Question

> Could this walk have produced a different answer by chance — and if so,
> does the finding say so?

---

## Why this library exists at all

The other five groups are about growth. This one is about not lying.

Most products worth auditing this way have little traffic. That is a fact
about a stage, not a criticism, and it has a precise consequence: **almost no
growth question can be answered statistically at that stage.** A system that
walks the funnel and reports "17% of visitors convert" from a handful of
sessions has not measured anything. It has laundered noise into a number, and
the number will then be defended in a roadmap conversation.

So the floor's job is to make **"the sample cannot answer this"** a
legitimate, respectable result (§0.3). It is the same move `fresh-job-walk` makes
with *not exercised*, and the same one §M.9 makes for the whole method:
naming the gap is honest work, and a gap named is worth more than a number
invented.

This does not make the walk useless. A walk of one produces **observations** —
what the page said, how long it took, whether the email arrived, where the
stranger stopped. Those are facts, and facts do not need a sample size. What
they cannot become is a **rate**.

---

## The four masters

### 1. Ronny Kohavi — *trustworthy experiments*

His central finding is deflationary: **most ideas do not work, and most
reported wins are not real.** Roughly a third of well-designed experiments at
mature companies produce a positive result; the rest are flat or negative.
The teams that improve fastest are the ones that find this out cheaply.

Two things he gives a walk:

**Twyman's law** — *any figure that looks interesting or different is usually
wrong.* A surprising number is far more often an instrumentation error than a
discovery (§0.7). If a walk turns up implausibly good numbers, check the
tracking before writing the finding. A score sitting outside its own
documented range is the canonical shape: the surprise *was* the bug.

**Sample size is not negotiable.** Detecting a small effect takes thousands
of observations per arm, and significance cannot be bought with enthusiasm or
with a longer stare at the dashboard. This is why §0.8 treats external
benchmarks as a **stopwatch** — something to compare an observed walk
against — and never as a **dashboard** rate to compute.

> **In a walk:** state the n before stating the finding (§0.1). If the n is
> one, the finding is an observation and must be phrased as one.

### 2. Avinash Kaushik — *segment or the average lies*

Aggregate numbers hide the thing you needed to know. A single conversion
figure across several entry doors describes none of them: the door that works
and the door that doesn't average into a number that misdescribes both
(§0.5).

His second contribution is **vanity versus actionable**. A metric is
actionable if a plausible change to it would change what you do next.
Impressions, followers and pageviews rarely pass. Time-to-first-value and
"did the email arrive" always do.

This bites hardest where doors deliver strangers in genuinely different
states of belief — someone arriving from a search for the category is not
someone arriving from a friend's recommendation. Reporting them together is
not simplification, it is erasure.

> **In a walk:** every observation carries its door. An observation with no
> door attached cannot be compared to the next run.

### 3. Charles Goodhart — *the measure becomes the target*

Goodhart's own 1975 formulation was narrower than the version everyone
quotes: *any observed statistical regularity will tend to collapse once
pressure is placed upon it for control purposes.* The familiar sentence —
*when a measure becomes a target, it ceases to be a good measure* — is
Marilyn Strathern's 1997 paraphrase, and attributing it to Goodhart is the
most common citation error in growth writing. Both say the same thing: once
a number is the goal, effort flows to the number rather than to the thing
the number stood for.

This is why fresh-growth-walk **refuses to score** (§0.6, §M.6). Off-the-shelf
marketing audits grade a site out of a hundred across weighted dimensions,
and the moment such a grade exists the work becomes lifting the grade. Both
sibling skills hold the same line — `fresh-design-review` scores no design,
`fresh-job-walk` scores no product.

Severity 0–4 sits on a **finding**, where it means *how much does this one
thing cost*, and never on the system, where it would mean *how are we doing*.

> **In a walk:** if a recommendation would be satisfied by moving a number
> without moving the experience, the recommendation is wrong.

### 4. Douglas Hubbard — *measurement reduces uncertainty*

His definition is the useful one: **a measurement is anything that reduces
uncertainty, not something that removes it.** This is the counterweight to
the other three, and without it §0 becomes an excuse to measure nothing.

A single walk is not worthless. It reliably tells you **direction** — this
was slow, that link was dead, nothing arrived — and **existence** — this path
is possible, that one is not. What it cannot tell you is **size**: how many
people, what percentage, how much revenue (§0.4).

His other useful move is asking what a decision is worth before measuring: if
the answer would not change what you do, do not spend the walk on it.

> **In a walk:** report direction and existence freely. Refuse size.

---

## The three sentences

Most §0 failures are one of these three, and each has a correct form:

| Tempting | Correct |
|---|---|
| "About 20% of visitors sign up." | "One walk reached signup. That is existence, not a rate (§0.4)." |
| "The welcome emails are working." | "Zero send stamps for this account. A send with no stamp is not a send (§0.2)." |
| "Traffic is up, so the copy change worked." | "Two things changed and the sample cannot separate them (§0.3)." |

---

## Applying it

1. Before writing any finding, state the n (§0.1).
2. Ask what would have to be true for this to be an instrumentation error
   (§0.7).
3. Attach the door to every observation (§0.5).
4. Report direction and existence; refuse size (§0.4).
5. If the claim is about something arriving, find the stamp (§0.2).
6. If the finding could be satisfied by moving a number alone, rewrite it
   (§0.6).
7. If the sample cannot answer the question, say so and name what would
   (§0.3).

---

## Extending this library

If a claim slips through that this list would not have caught, add the case
with the master who would have caught it.

*Distillations of published work — Kohavi, Tang and Xu, Trustworthy Online
Controlled Experiments; Kaushik, Web Analytics 2.0; Goodhart's 1975 monetary-policy
papers, with the familiar restatement credited to Strathern, Improving
Ratings: Audit in the British University System (1997); Hubbard, How to
Measure Anything.
Commentary, not endorsement; no author named here has reviewed this file.*
