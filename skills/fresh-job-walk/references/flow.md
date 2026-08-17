# Flow Masters

> **Scope.** This library is about the COST of getting through a job — not what the job is (`jobs.md`), not answer quality (`answers.md`), not surfaces (`surfaces.md`).

## Contents

- The One Question
- The governing law, before anything else
- The six others
- The eight diagnostics, cheapest first
- Frequency budget
- Anti-patterns
- Extending this library

---
The reference library for **§2** of the fresh-job-walk heuristics. Seven
practitioners on what a step costs, and on when removing one is a mistake.

Canonical numbered rules: `HEURISTICS.md` §2.

---

## The One Question

> Is this step doing work, or is it the system's homework?

---

## The governing law, before anything else

### Larry Tesler — *conservation of complexity*

Every application has an irreducible amount of complexity. The only
question is **who deals with it** — the user, the developer, or the
system. You cannot destroy it. You can only move it.

This is the most important idea in this library because it is the one that
stops a step-counting review from doing damage. A step taken off the user
lands somewhere: on the system (good, usually expensive), on a colleague
(often invisible, often bad), or on a later moment (worst — it reappears
when the user has less context and less time).

**The rule it produces:** *every recommendation to remove a step must name
who absorbed it.* A recommendation that cannot name the absorber is a
deferral wearing a simplification's clothes.

Tesler's own corollary is that the fight is worth having on the engineering
side: one hour of developer effort is worth many hours of collective user
effort, so complexity should be pushed toward the system until it genuinely
cannot go further.

---

## The six others

### Bruce Tognazzini — *the click-count fallacy*

Tog's first principles include the observation that efficiency is not click
count. **Three obvious clicks beat one hidden one.** Time-on-task and error
rate are what matter; clicks are a proxy, and optimising a proxy directly
produces dense, modal, hidden interfaces that score well and feel awful.

**The rule:** count steps *and* decisions. Report both. A flow that got
shorter and harder got worse. This is the second guard rail — with Tesler —
against a review that recommends cramming.

### Steve Krug — *don't make me think*

Krug's central test is that every screen should be self-evident. His most
usable contribution to a walk is the war on **needless questions** — any
field, confirm or choice that the system could have answered itself, or
that does not change the outcome, is friction charged to the user for the
designer's convenience.

The case worth holding on to: **a confirm on a reversible action trains
people to dismiss confirms**, which is precisely how the irreversible one
gets dismissed. Confirms are a scarce resource; spend them on the actions
that cannot be undone.

Krug's other rule worth carrying: *omit needless words* applies to
interfaces as much as to prose. "Happy talk" — the welcoming paragraph
nobody reads — is pure cost.

### Luke Wroblewski — *every field costs*

From *Web Form Design*: each additional field measurably reduces
completion. The discipline is to interrogate every input — can it be
**defaulted, derived, deferred, or deleted?**

The pattern to aim for is derivation rather than interrogation: anything
inferable from what the user has already given you should be inferred, and
shown for correction rather than asked for blank.

Wroblewski's second contribution is **progressive disclosure**: show what is
needed now, reveal the rest on demand. His mobile-first argument is really a
prioritization argument — a constrained surface forces you to decide what
actually matters, which is why it transfers cleanly to any narrow surface.

### Jef Raskin — *modes are a bug*

A mode exists when the same user action produces different results depending
on system state the user cannot see. Raskin's position is that modes are the
source of a large share of user error, and that the user blames themselves
for every one.

Related: **habituation**. Once an action becomes automatic, changing what it
does is a betrayal of a reflex the product itself trained. Be careful moving
high-frequency controls.

### Jared Spool — *task completion over satisfaction*

Spool's work established that users routinely report satisfaction with
interfaces that measurably failed them, and that **time-on-task and
completion rate** are the honest measures. He also named the **seductive
detail** — engaging content that reduces comprehension of the thing it
decorates.

**The rule for a walk:** time it, don't only count it. A three-step flow
with a forty-second generation in the middle is not a three-step flow.
Record wall-clock alongside step count, and record what the user is looking
at while they wait — a wait filled with something relevant is a different
experience from a wait filled with a spinner.

### Don Norman — *the two gulfs*

The **gulf of execution** is the gap between what the user wants and what
the system lets them do — *can they tell what to do next?* The **gulf of
evaluation** is the gap between what the system did and what the user can
perceive — *can they tell it worked?*

Most steps that "feel clunky" fail the second one silently. Check both at
every step.

Norman's affordances and signifiers matter here too: what *looks*
interactive must be interactive, and what is interactive must look it.

---

## The eight diagnostics, cheapest first

Run in this order. Stop when one fires — it is usually the answer.

1. **Recall check.** Does any step need a remembered name, id or location?
   (Nielsen #6 · §0.6)
2. **Needless-question check.** Can any field be defaulted, derived,
   deferred, deleted? (Krug, Wroblewski)
3. **Decision count.** How many steps require thought, not just action?
   (Tognazzini)
4. **Both gulfs.** Can they tell what to do, and that it worked? (Norman)
5. **Dead-end check.** At every step: back, undo, or leave without losing
   work?
6. **Mode check.** Same action, different result, invisible state? (Raskin)
7. **Clock.** Wall-time, and what fills the wait. (Spool)
8. **Absorber check.** For every removal proposed: who now carries it?
   (Tesler — never skip this one)

---

## Frequency budget

Polish in proportion to frequency. Asking a question happens many times a
day; setting up an account happens once. A saved second in the first is
worth more than a saved minute in the second — and the inverse error,
polishing onboarding while the daily loop stays rough, is the common one.

Note the interaction with `references/autonomy.md` §5.1: on a heavily automated
product even the *expert* is out of practice, because the machine does the
routine parts. **Frequency budgets are computed on human steps, not on total
system activity.**

---

## Anti-patterns

| Sounds like | Actually | Master |
|---|---|---|
| "Let's reduce the number of clicks" | Optimising a proxy | Tognazzini |
| "Add a confirm to be safe" | Training dismissal | Krug |
| "Put it behind a setting" | Handing back the decision | Krug |
| "The power user knows where it is" | Recall dressed as expertise | Nielsen #6 |
| "It's discoverable via search" | Search is a fallback, not an IA | — |
| "We simplified it" *(no absorber named)* | Deferral | **Tesler** |

---

## Extending this library

If a flow problem doesn't fit these seven, add it with the master who would
have caught it — and if no master would have, that is worth noticing before
you add a rule.

*Distillations of published work — Tesler's law; Tognazzini's first
principles; Krug, Don't Make Me Think; Wroblewski, Web Form Design; Raskin,
The Humane Interface; Spool's usability research; Norman, The Design of
Everyday Things. Commentary, not endorsement; no practitioner named here has
reviewed this file.*
