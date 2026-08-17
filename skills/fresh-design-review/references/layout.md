# Layout Masters

> **Scope.** This library is about WHERE things live and what they are called — not visual craft (`design.md`), not color (`color.md`), not the detail layer (`polish.md`), not step count (FF `flow.md`).

## Contents

- The One Question
- The ten masters
- The honeycomb as an audit frame
- LATCH — the schema test
- The four navigation types
- Cheapest diagnostics first
- The scorecard
- Extending this library

---
The reference library for **§7** of the fresh-design-review heuristics.

Canonical numbered rules: `HEURISTICS.md` §7.
Surface inventory: the `surfaces` block of `fresh.config.md`.

Companion libraries: `references/design.md` (visual craft), `references/color.md`, `references/motion.md`, `references/polish.md`
(the detail layer). For steps and job completion, hand to `fresh-job-walk`
(FF§2); for arriving and understanding, to `fresh-growth-walk` (FG§2).

---

## The One Question

> Does this structure match how the user thinks, or how the system is built?

If the structure reflects the engineering — separate services, separate
tables, separate features — the IA is wrong. If it reflects the user's model
of their own job, the IA is right.

This is the Cooper test, and it is the most reliable single diagnostic for
whether an IA will hold as the product grows or collapse the first time a
capability is added.

---

## The ten masters

### 1. Alan Cooper — *goal-directed design*

The IA follows user goals, not the feature inventory. Every nav item should
answer *what goal does the user have when they click here?* The biggest
failure mode is organizing by what was built rather than by what the user is
trying to accomplish. A nav item whose honest answer is a feature name is a
feature that found a route.

### 2. Don Norman — *mental models and discoverability*

Users predict what sits behind a label using their model of similar
products. Where the system model and the user model diverge, the difference
is paid back somewhere — in hesitation, in support load, in abandonment. The
system should reveal its possibilities rather than hide them.

### 3. Peter Morville — *the honeycomb*

Useful, usable, desirable, findable, accessible, credible, valuable.
Morville's contribution is that **findability is a precondition for
usefulness**: a feature that cannot be found does not exist. Findability is
also the facet most often traded away for novelty.

### 4. Richard Saul Wurman — *LATCH*

Five ways, and only five, to organize information: Location, Alphabet, Time,
Category, Hierarchy. Most products default to Category without testing the
other four. Some surfaces are better served by Time (what changed today) or
Hierarchy (what matters most now). Test the schema before locking it.

### 5. James Kalbach — *the four navigation types*

Utility, primary, local and contextual navigation each have a job, and none
should do another's. When utility creeps into primary nav, the IA is already
failing.

### 6. Abby Covert — *language is the material of IA*

IA is not boxes and arrows; it is the words used to describe what people will
find. A sitemap is a labelling document, not a structural one. Most IA
problems are language problems in disguise — if the labels do not land, no
restructuring will save it.

### 7. Luke Wroblewski — *progressive disclosure*

The narrow viewport is a discipline, not a constraint. If it does not work
there, the IA is bloated. Reveal complexity progressively: show what is
needed now, with a clear path to what is needed next. Every nav decision has
a narrow-surface version that is stricter and usually better.

### 8. Jakob Nielsen — *recognition over recall*

The ten heuristics remain the cheapest audit available. Two are load-bearing
for IA: **#2**, match between system and the real world — speak the user's
language; and **#6**, recognition rather than recall — make options visible
instead of asking the user to remember where something lives.

### 9. Larry Tesler — *conservation of complexity*

Every application has inherent complexity that can be moved but not removed.
If the interface got simpler, either the user is doing more work or the
system is. Most nav "simplifications" push complexity onto search, onto
memory, or onto support. Decide *where* complexity lives rather than
pretending it is gone — this is §M.7 in its original form.

### 10. Edward Tufte — *information density*

Not traditionally IA, but load-bearing. Every nav item, label and section
header should carry information or be removed. The common failure is not too
few options but too many low-value ones crowding out the high-value ones.

---

## The honeycomb as an audit frame

| Facet | The question |
|---|---|
| **Useful** | Does this structure help the user accomplish a real goal? |
| **Usable** | Can the user navigate it without instruction? |
| **Desirable** | Does the structure feel considered rather than bureaucratic? |
| **Findable** | Can the user locate any feature in three moves or fewer? |
| **Accessible** | Does it work for keyboard, screen reader, low vision, narrow viewport? |
| **Credible** | Does the structure suggest the team thinks clearly? |
| **Valuable** | Does it still hold as the product grows? |

Most reviews test only *usable* and *findable*. **Credible** and **valuable**
are the two that predict rework: a confused IA tells the user the team is
confused, and an IA that does not scale costs months.

Per §7.5, name the single facet a page is weakest on. One facet, not a sweep.

---

## LATCH — the schema test

| | Schema | Right when |
|---|---|---|
| **L** | Location | Where the thing sits in space. Rare in software |
| **A** | Alphabet | Unfamiliar collections. Useless for familiar ones |
| **T** | Time | Activity, history, changelog, audit |
| **C** | Category | Browsing without a specific intent — and the unexamined default |
| **H** | Hierarchy | Any list whose point is importance or rank |

**The rule:** before defaulting to Category, test the other four. A list
sorted by Category where Time or Hierarchy would serve is a structural error
wearing a sorting UI (§7.2).

For every list, ranking or grouping, write down the schema it uses and
whether the alternatives were considered.

---

## The four navigation types

| Type | Lives | Job | Blur test |
|---|---|---|---|
| **Primary** | Persistent sidebar or top nav | The main sections; stable product-wide | Settings in primary nav is utility creeping into primary |
| **Local** | Top of the section content area | Within one section; changes as the user moves | Five tabs on a section with one job is local nav doing primary's work |
| **Utility** | The edges — top-right, sidebar foot | Account, settings, search, help | Never competes with the main sections |
| **Contextual** | Beside the object | Edit, share, delete, export, approve | Object actions in the sidebar is contextual creeping into primary |

Primary nav should stay a small memorisable set — Miller's 7±2 is the usual
ceiling, and a product at the ceiling should be asked why.

A time-based section sitting in primary nav is worth its own look: it is
usually a global surface (search, a command bar) competing with task-based
navigation rather than a section in its own right.

---

## Cheapest diagnostics first

Run these in order. The early ones cost nothing and catch the most.

1. **The label test (Covert).** Does the page header match the nav label that
   brought you here? A mismatch is the cheapest IA defect to find and the
   most disorienting to experience (§7.1).
2. **The goal test (Cooper).** For each primary nav item, write the user goal
   it serves in the user's own voice. A feature name is a fail (§7.3).
3. **The schema test (Wurman).** LATCH, per list (§7.2).
4. **The type test (Kalbach).** Every nav element belongs to exactly one of
   the four. Name it.
5. **The density test (Tufte).** Does each item carry information? Density is
   a virtue when every element earns its place and clutter when it does not
   — the difference is §0.1, never a count (§7.8).
6. **The discoverability test (Norman + Nielsen #6).** Is the key action
   reachable by recognition, or only by recall (§7.4)?
7. **The complexity-move test (Tesler).** Anything removed from the page went
   somewhere. Name where (§7.7, §M.7).

---

## The scorecard

| # | Test | Fails when |
|---|---|---|
| 7.1 | Header matches the nav label | The page header and the label that led here disagree |
| 7.2 | Right LATCH schema | Sorted by Category where Time or Hierarchy would serve |
| 7.3 | Serves a goal, in the user's voice | The honest answer is a feature name |
| 7.4 | Recognition, not recall | The key action requires remembering where it lives |
| 7.5 | Weakest honeycomb facet named | The review sweeps instead of naming one |
| 7.6 | Present because needed now | Everything shown because it exists |
| 7.7 | Removed complexity has an absorber | A simplification with nowhere named |
| 7.8 | Every element earns its place | Low-value items crowding out high-value ones |

---

## Extending this library

Add IA cases these ten don't cover, with the master who would have caught it
— and if none would have, that is worth noticing before you add a rule.

*Distillations of published work — Cooper, About Face; Norman, The Design of
Everyday Things; Morville and Rosenfeld, Information Architecture; Wurman,
Information Anxiety; Kalbach, Designing Web Navigation; Covert, How to Make
Sense of Any Mess; Wroblewski, Mobile First; Nielsen's ten heuristics;
Tesler's law; Tufte, The Visual Display of Quantitative Information.
Commentary, not endorsement; no practitioner named here has reviewed this
file.*
