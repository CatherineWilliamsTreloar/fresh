# Jobs Masters

> **Scope.** This library is about WHAT the user is trying to accomplish and WHY — not steps (`flow.md`), not answer quality (`answers.md`), not surfaces (`surfaces.md`), not automation (`autonomy.md`).

## Contents

- The One Question
- The six masters
- What this library is *not* for
- Applying it
- Extending this library

---
The reference library for **§1** of the fresh-job-walk heuristics. Six
practitioners who defined how to tell a real job from a feature.

Companion libraries: `references/flow.md` (steps), `references/answers.md` (answer quality), `references/surfaces.md`
(where it lands), `references/autonomy.md` (what runs without you). For where things
live on a page, hand to the layout library of `fresh-design-review`.

Canonical numbered rules: `HEURISTICS.md` §1.
Job inventory: the `jobs` block of `fresh.config.md`.

---

## The One Question

> What progress is this person trying to make — and would they hire this to
> make it?

Every job in the inventory survives this question or it is not a job.

---

## The six masters

### 1. Clayton Christensen — *hire and fire*

People do not buy products; they hire them to make progress in a
circumstance. The unit of analysis is the **circumstance**, not the customer
demographic.

The discipline this imposes: **name the incumbent.** Every job a product
performs replaces something — a spreadsheet, a scroll through a chat history
before a call, a recurring meeting, or a person's memory of what someone
asked for eighteen months ago. If you cannot name what gets fired, you have
probably described a capability rather than a job.

Christensen's warning applies directly: the competition is rarely the
obvious competitor. For most decision-support products the real incumbent is
*a confident person with an opinion* — free, fast, and already trusted.

### 2. Bob Moesta — *forces of progress*

Four forces act on any switch: **push** (the pain of today), **pull** (the
appeal of the new), **anxiety** (fear of the new), and **habit** (the
comfort of the old). Most product thinking overweights pull and ignores the
other three.

Where a product's output is a judgment rather than a document, anxiety is
usually the dominant force, and it is almost always about **trust in the
evidence**. A ranked list a person does not believe is worse than no list,
because it costs them the time to check it and then they rank by instinct
anyway.

Moesta's second contribution is the **timeline**: a switch has a first
thought, a passive look, an active look, a decision and a first use. Applied
to a walk, a job has a **moment**, and the moment sets the time budget.
"Prioritize" is not a moment. "Ten minutes before the review" is. The same
three steps are cheap in one and expensive in the other.

**In a walk:** wherever the user slows down to double-check something, mark
it. That hesitation is anxiety, and it is data.

### 3. Tony Ulwick — *outcome-driven innovation*

Customers do not want your product; they want the **outcome**. Ulwick's
method is to express desired outcomes as measurable statements — *minimise
the time it takes to*, *increase the likelihood that* — and then find the
ones that are both important and poorly served.

This is the correction to feature-shaped thinking:

| Feature framing | Outcome framing |
|---|---|
| "View the dashboard" | "Leave the meeting without anyone asking a question I can't answer" |
| "Run the reconciliation report" | "Close the month without a surprise in it" |
| "Use the applicant tracker" | "Reach a hiring decision the panel will still stand behind in a week" |

**Grade the job on the outcome, not on whether the screen rendered.**

### 4. Alan Klement — *job stories*

Personas are often fiction; **situations** are not. Klement's job story
format replaces "As a [persona] I want [feature]" with:

> **When** \_\_\_, **I want to** \_\_\_, **so I can** \_\_\_.

The `when` is the circumstance, the `I want to` is the motivation, the `so I
can` is the expected outcome. No implementation appears anywhere.

**The test this gives a walk:** if a job title contains a product noun —
"view the dashboard", "use the assistant", "open the detail sheet" — it is a
feature. Rewrite until it is something a person would say out loud to a
colleague. *"Find out why this invoice hasn't been paid"*, not *"invoice
detail page."*

### 5. Indi Young — *problem space, and listening*

Young's distinction is between **problem space** (what people think, feel
and do, independent of any solution) and **solution space** (anything you
might build). Mental model diagrams map the former. The discipline is to
stay in the problem space long enough to be surprised.

Her second contribution is **listening over asking**. What people say they
want is solution-space; what they were actually trying to do when they said
it is problem-space. Any product that ingests what its users report — bug
reports, support tickets, survey answers — carries this twice over: once for
its own users, and once for the reports it is interpreting on their behalf.

**In a walk:** when a job feels thin, you are probably describing the
solution. Go back and describe what the person was in the middle of.

### 6. Kathy Sierra — *make the user badass*

Sierra's argument in *Badass: Making Users Awesome* is that people do not
want to be good at your tool; they want to be good at the thing your tool is
for. Nobody aspires to be excellent at a piece of software. They aspire to
be the person whose meetings are short because the evidence is already
there.

**The test:** after the job, did the user look more competent *to other
people*? That is the only version of "impressive" that survives contact with
a room full of colleagues who did not use the tool.

A strong signal that this principle is implemented: the product hands the
user the sentence they are about to say to someone else, not just the data
behind it.

---

## What this library is *not* for

- **How many steps** — `references/flow.md`
- **Whether the answer is any good** — `references/answers.md`
- **Whether it works on a narrow surface** — `references/surfaces.md`
- **Whether the machine should do it** — `references/autonomy.md`
- **Where the page should live** — the layout library of `fresh-design-review`

---

## Applying it

1. State the job in the user's words (Klement). No product nouns.
2. Name what it fires (Christensen). If nothing, question the job.
3. Name the moment and its time budget (Moesta).
4. State the outcome, measurable if possible (Ulwick).
5. Ask whether the user looks better afterwards (Sierra).
6. Assign owning personas. No owner means a feature looking for a user;
   every persona owning it means infrastructure, held to a higher bar.

---

## Extending this library

If you hit a case these six don't cover, add it with the master who would
have caught it.

*Distillations of published work — Christensen, Competing Against Luck;
Moesta, Demand-Side Sales; Ulwick, What Customers Want; Klement, When Coffee
and Kale Compete; Young, Mental Models; Sierra, Badass. Commentary, not
endorsement; no practitioner named here has reviewed this file.*
