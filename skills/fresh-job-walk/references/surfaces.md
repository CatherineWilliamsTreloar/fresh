# Surfaces Masters

> **Scope.** This library is about WHERE a job lands and what shape it should take there — not step count (`flow.md`), not answer quality (`answers.md`), not page hierarchy within one surface (the layout library of `fresh-design-review`).

## Contents

- The One Question
- Count your surfaces honestly
- The four masters
- The brain-vs-renderer rule
- Record your surface facts before walking
- The scorecard
- Extending this library

---
The reference library for **§4** of the fresh-job-walk heuristics.

Canonical numbered rules: `HEURISTICS.md` §4.
Surface inventory and postures: the `surfaces` block of `fresh.config.md`.

---

## The One Question

> Is this job available where its persona actually is, and shaped for where
> it lands?

---

## Count your surfaces honestly

It is tempting to collapse surfaces — "the app, the chat integration, and
the API". That undercount hides the most likely place for a silent
divergence.

**An app and an in-app conversational surface are two different experiences
inside one product.** The same question is answered by a ranked table in one
and by a synthesised paragraph in the other. They read the same data through
different paths and they *can disagree*. When they do, the user has no way
to tell which is right, and the product has quietly undermined itself in the
one place it should be strongest.

So: **every surface is walked separately**, and each is declared with its
posture in `fresh.config.md`.

| Posture | What it is | Right shape |
|---|---|---|
| **Sovereign** | Screens the user lives in for long stretches | Density is a virtue; chrome earns its place slowly; the list *is* the page |
| **Sovereign-conversational** | In-app dialogue over the same data | Verdict first, evidence attached, drill-down one move away |
| **Daemon** | An agent is reading, not a person | Structure over prose; completeness over brevity; raw scores are *appropriate* |
| **Transient** | Passing through, mid-conversation | Verdict plus a link. Never a full rendered document |

---

## The four masters

### 1. Alan Cooper — *posture*

Cooper's *About Face* classifies applications by **posture** — how much of
the user's attention they may claim.

- **Sovereign**: used for long stretches, full attention, expert over time.
  Earns density, a muted palette and a rich control set.
- **Transient**: used briefly, then dismissed. Must be instantly
  comprehensible, generous in its controls, and must not assume the user
  remembers anything.
- **Daemon**: runs without a human watching. Its "interface" is its
  contract; its consumer is another program.

**This is the single most load-bearing idea in the library**, because
judging a transient surface against sovereign completeness demands exactly
the wrong thing. A transient surface that renders a full document has failed
*by being more complete*. The correct answer there is a verdict and a link.

Posture often already exists in the code under a different name: a
per-surface permission set, a trust level, a flag that lets one surface only
propose an action where another may perform it. Where you find one, the
theory is describing something the team already built without naming; cite
it rather than arguing for it from scratch.

### 2. Karen McGrane — *parity is not sameness*

From *Content Strategy for Mobile*: **COPE** — create once, publish
everywhere. Structured content, separated from presentation, so each surface
can render what suits it.

Her essential distinction:

> **Content parity** means people can accomplish the same things everywhere.
> **Content sameness** means it looks identical everywhere. Users demand the
> first. Designers often ship the second, or ship neither.

Applied: every job should be **reachable** on every surface where its
persona lives. It should **not** look the same on each. And the failure that
matters most is the third option — a job simply absent from the surface its
owner lives in.

McGrane's other warning is against the "mobile users want less" fallacy. The
general form: *users on a narrow surface do not want less information, they
want less of your interface.*

### 3. Ethan Marcotte — *same content, different presentation*

Responsive design's core commitment: one source of content, many
presentations. The corollary is the rule worth enforcing — **never different
content.**

If one surface omits a fact another shows, that is a **content fork**, and
forks rot at different rates.

The subtle case worth watching for: two verbs on the *same* surface
returning different values in a field of the same name — one carrying a
title, the other a grouping. **A fork does not need two surfaces to start.**

### 4. Jakob Nielsen — *consistency and standards* (#4)

*"Users should not have to wonder whether different words, situations or
actions mean the same thing."* Same job, same words, every surface. A label
that differs across surfaces reads as two different features.

And #6 — *recognition rather than recall* — stretches usefully here.
Nielsen's wording is "should not have to remember information from one part
of the interface to another." Read *interface* as *the whole product across
its surfaces* and it becomes the sharpest parity test available: **what the
user knew in the app must not have to be carried in their head into a chat
surface or into an agent.**

---

## The brain-vs-renderer rule

Every surface converges on one answering path behind several renderers.
Every cross-surface finding must name its layer:

- **Brain** — wrong in the shared path. Fix once, every surface heals.
- **Renderer** — wrong in one surface's presentation. Fix per surface, and
  it will reappear on the next surface added.

A finding that does not say which is unactionable. This is §4.4 and it is
not optional.

---

## Record your surface facts before walking

Surface capability drifts faster than anything else in a product, and the
intuitive answer is often wrong — an agent surface is frequently the
*narrowest*, not the widest, because verbs ship behind an allowlist while
the app gets every feature by default.

Before a walk, write down and verify:

- Which verbs / endpoints each surface actually exposes today
- Which are built but **not** launched, and on which surfaces
- Which capabilities have a full API but no verb, making their jobs
  single-surface by construction
- Which verbs are annotated destructive or outward-facing

Do not carry these in prose from a previous run. They drift, and a stale
capability list produces confident parity findings that are simply wrong.

---

## The scorecard

| # | Test | Fails when |
|---|---|---|
| 4.1 | Shape matches posture | A transient surface renders a full document; a daemon surface returns prose an agent can't parse |
| 4.2 | Parity of availability | A job unreachable on a surface its persona lives in |
| 4.3 | No content forks | One surface omits a fact another shows |
| 4.4 | Layer named | The finding doesn't say brain or renderer |
| 4.5 | Owner's home surface | **severity 4** when a job is missing where its owner lives |
| 4.6 | Handoff survives | Voice, reasoning or confidence dropped at the boundary |
| 4.7 | Same words everywhere | Labels differ across surfaces |

---

## Extending this library

Add surface cases these four don't cover, with the master who'd catch it.

*Distillations of published work — Cooper, About Face; McGrane, Content
Strategy for Mobile; Marcotte, Responsive Web Design; Nielsen's ten
heuristics. Commentary, not endorsement; no practitioner named here has
reviewed this file.*
