# Autonomy Masters

> **Scope.** This library is about AUTONOMY — not step count (`flow.md`), not answer quality (`answers.md`).

## Contents

- The One Question
- The situation this library exists for
- The five masters
- The autonomy scorecard
- The silent-failure shape
- What this library is *not* for
- Extending this library

---
The reference library for **§5** of the fresh-job-walk heuristics. This is the
group `fresh-design-review` has no equivalent of, and the one a heavily automated
product needs most.

Canonical numbered rules: `HEURISTICS.md` §5.
Workflow inventory: the `automation` block of `fresh.config.md`.

---

## The One Question

> Zero steps is not a pass. Can the user see it happened, trust it, and undo
> it?

---

## The situation this library exists for

Count, before you walk, and record the counts in `fresh.config.md`:

- how many workflows run without being asked, and how many are live
- how many human touchpoints exist in the whole loop
- how many of those are **deliberate judgment gates** rather than
  mechanical steps
- which job is thinnest on human involvement, and which has none at all

Then notice the trap: **a step-counting review scores every zero-step job
perfect by construction.** Where autonomy is highest, a flow review is
blindest — and that is usually also where the irreversible decisions live.
This library closes that gap.

---

## The five masters

### 1. Lisanne Bainbridge — *Ironies of Automation* (1983)

**The governing principle.**

Bainbridge's argument, made about process-control plants and true of every
automated system since: the designer automates the parts that are easy to
automate — the routine ones — and leaves the human with the parts that are
hard. So the human's remaining job is **harder than the job they had
before**.

Worse, the routine work was what kept their skill sharp. Remove it and the
operator loses the practice the hard parts depend on. Bainbridge calls this
the central irony: *the more advanced the system, the more crucial the human
contribution, and the less prepared that human is to make it.*

**Applied.** A handful of human touchpoints across a whole loop. Each one
high-stakes and rarely rehearsed: an approval that goes out to someone
outside the company, a decision that commits a quarter's work, a review of
something the machine produced and cannot check. Weeks pass between each.
There is no muscle memory. So:

> **Design every human touchpoint for someone doing it for the first time in
> three weeks, under time pressure, with no warm-up.**

That is not a nicety; it is the direct consequence of the automation being
good. And it interacts with the frequency budget in `references/flow.md`: frequency is
computed on **human** steps, not system activity. A product that runs
seventy things an hour still has a user who touches it rarely.

### 2. Don Norman — *feedback, and the gulf of evaluation*

Norman's critique of automation is that its failure is almost always
**inappropriate feedback and interaction**, not too much or too little
automation as such. A system that acts silently gives the user no way to
build or repair a mental model of it.

**The rule:** every autonomous step must be **findable after the fact**. Not
narrated while it runs — discoverable afterwards. If a user cannot find out
that it happened, then as far as their trust is concerned it did not happen,
and the first time it does something they disagree with they will have no
framework for interpreting it.

### 3. Mica Endsley — *situation awareness*

Endsley's three levels: **perception** of the elements, **comprehension** of
what they mean, **projection** of what happens next. Her key finding for
automated systems is **out-of-the-loop unfamiliarity** — the supervising
human loses awareness precisely because the system is handling things, and
is therefore worst-placed to intervene at the moment intervention is needed.

**The rule:** situation awareness must survive the handoff. When the machine
reaches a gate and hands back, the human needs enough context to *decide*,
not just the ask. **"Approve this send" without who, why and what they said
is a rubber stamp — and a rubber stamp is not a gate.**

This is the test that separates real judgment gates from theatre.

### 4. David Woods & Erik Hollnagel — *automation surprise*

From *Joint Cognitive Systems*: the human and the machine are one system,
and the characteristic failure of clumsy automation is the **automation
surprise** — "what is it doing now? why did it do that? what will it do
next?" These cluster at exactly the moments of highest workload.

**The rule:** the user should never be surprised by state they did not
cause. A record that moved, a document that regenerated, an item
auto-resolved, a label renamed — if it changed while they were away, say so
on their return. Surprise is how trust in autonomy dies, and it dies all at
once rather than gradually.

Woods' related finding on **brittleness**: automation performs well inside
its envelope and degrades sharply at the edge, usually without signalling
that it has reached one.

### 5. Thomas Sheridan — *levels of automation, and supervisory control*

Sheridan's ten levels run from "the human does everything" to "the computer
acts autonomously and ignores the human". The important point is that **the
level is a design choice per decision**, not a property of the system — and
it should be chosen on consequence, not on capability.

**The rule this produces, and it is absolute:**

> **Irreversible and autonomous is the one combination that is not allowed.**
> Pick one. Either the step is reversible, or a human gates it.

The pattern to hunt for: a compaction, pruning or summarization job that
**discards detail permanently, with no human step anywhere near it**. Total
autonomy sitting exactly on top of an irreversible decision, in the
least-supervised corner of the system, is the highest-consequence gap most
maps contain — and it is rarely anyone's assigned area.

Corollary, worth restating because every new autonomous step re-opens it:
**gate by reversibility and source-trust, never by the model's confidence.**
A confident model and a safe action are unrelated properties.

---

## The autonomy scorecard

For any job with machine steps — which is all of them:

| # | Test | How to check |
|---|---|---|
| 5.1 | Remaining human steps designed for the rusty | Walk the gate cold, with no warm-up |
| 5.2 | Findable after the fact | Can you discover it ran, without knowing it exists? |
| 5.3 | Not both irreversible and autonomous | List the irreversibles; confirm each is gated |
| 5.4 | No surprise on return | Change something in the background, come back, look |
| 5.5 | Enough context at the gate | Is the ask decidable without leaving the screen? |
| 5.6 | Gated on reversibility, not confidence | Read the gate condition |
| 5.7 | Fails loud | Break it and see whether anything says so |
| 5.8 | Judgment gates preserved | Is a deliberate gate being called friction? |

---

## The silent-failure shape

What §5.7 is for, described as a shape rather than an anecdote, because it
recurs with the details swapped:

**A recurring outbound job reports success on every run and delivers
nothing.** The usual anatomy is two independent breaks that each fail
quietly — a query filtered on a column that no longer holds what it used to,
and a second path reading a key that was never set in that environment.
Neither raises. Every run returns success. The gap is only found when
somebody thinks to check the far end.

Three properties make this the worst class of autonomy defect, and all three
are walkable:

- **It reports the wrong thing.** Success is measured at dispatch, not at
  delivery — so the metric that would catch it is the one that is broken.
- **It is invisible from the inside.** Nothing in the product's own surfaces
  disagrees; you have to look at the delivery record (`FG§0.2`).
- **It runs for as long as nobody looks.** In an automated product that is
  months, not days.

**An autonomous workflow that stops doing its job must announce itself.**
Test it by breaking it deliberately and seeing whether anything says so
(§5.7). If nothing does, you have not found a bug — you have found that you
would never find the bug.

---

## What this library is *not* for

- **How many steps** — `references/flow.md`
- **Whether the answer is good** — `references/answers.md`
- **Whether it exists on a given surface** — `references/surfaces.md`

Note the boundary with §5.8: deliberate judgment gates are the **product**,
not friction. A step-counting review will read them as waste. They are not,
and defending them is part of this library's job.

---

## Extending this library

Add autonomy cases these five don't cover, with the master who'd catch it.

*Distillations of published work — Bainbridge, Ironies of Automation (1983);
Norman, The Design of Everyday Things; Endsley on situation awareness; Woods
and Hollnagel, Joint Cognitive Systems; Sheridan on supervisory control.
Commentary, not endorsement; no researcher named here has reviewed this
file.*
