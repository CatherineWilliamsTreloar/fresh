# Loops Masters

> **Scope.** This library is about PAYING AND COMPOUNDING — not where they came from (demand), not what the copy claims (message), not the first session (activation), not returning (retention), not whether a claim is earned (evidence).

## Contents

- The One Question
- The three masters
- Monetisation: the moment, not the mechanism
- Applying it
- Extending this library

---
The reference library for **§5** and **§6** of the fresh-growth-walk heuristics.

Canonical numbered rules: `HEURISTICS.md` §5, §6.
Environments and irreversible gates: the `environments` and `safety` blocks
of `fresh.config.md`.

Companion libraries: `references/evidence.md` (§0), `references/demand.md` (§1), `references/message.md` (§2),
`references/activation.md` (§3), `references/retention.md` (§4).

---

## The One Question

> Does one person using this produce another person using this?

---

## The three masters

### 1. Brian Balfour — *loops are the new funnels*

The argument that gives this whole system its shape: **the fastest-growing
products are better described as a system of loops than as a funnel. Loops
compound; funnels leak.**

A funnel is one-directional — pour acquisition in the top, revenue trickles
out the bottom, and when you stop pouring it stops. A loop's *output* is its
own next *input*: a user's use of the product produces the thing that brings
the next user.

His structural criticism of the funnel is also organizational: it silos teams
and rewards local optimisation, so everyone improves their own stage and
nothing compounds.

**How this walk resolves the tension:** the walk is a funnel because that is
how you *diagnose* — stage by stage, finding where people stop. The verdict
on the final stage is a loop because that is how you *design*.

Two rules carry it:

- **§6.2 — draw the loop before judging it.** An undrawable loop does not
  exist, and the act of drawing usually reveals which arrow is missing.
- **§6.5 — a funnel improvement that does not feed a loop is a one-off**, and
  must be labelled one. One-offs are legitimate work. Calling them growth is
  what produces a year of effort against a flat curve.

> **In a walk:** draw it. Boxes and arrows, output back to input. If the arrow
> home cannot be drawn, `compounding` is unavailable (§6.1).

### 2. Andrew Chen — *viral factor, and where loops live*

The arithmetic: a loop compounds only when each user produces more than one
new user through it, and almost nothing does. Most "viral" features are
one-off shares — they help, but they do not compound. **A loop with a factor
below one is a decay curve with good manners.**

His more useful contribution here is locating where loops can exist at all:
**only at an outward-facing surface** — somewhere the product reaches a
person who is not the user (§6.3). Everything else is retention wearing a
loop's clothes.

His cold-start work applies again: a loop requiring accumulated data to be
worth propagating cannot fire in an empty account, which ties the final stage
back to onboarding.

> **In a walk:** list every surface that touches a non-user. That list is the
> complete set of loop candidates. If it is empty, the stage is `broken` and
> the finding writes itself.

### 3. Elena Verna — *expansion is a different loop*

Separate **acquisition** (new accounts) from **expansion** (more from
existing ones). They have different mechanics, different owners and different
arithmetic, and averaging them produces a number describing neither (§6.4,
and §0.5 on the evidence side).

Her second contribution is about the free tier, which §5.5 encodes: **name
what the free tier is for.** There are only three honest answers —

1. It is a **demo**: reach the aha, then pay.
2. It is a **loop**: free users produce paying ones.
3. It is **the product**, and revenue comes from somewhere else.

A free tier that cannot reach the aha is a broken demo. One that never needs
to be left is a business model nobody chose.

> **In a walk:** state which of the three the free tier is, then check whether
> the limits agree with that answer.

---

## Monetisation: the moment, not the mechanism

The mechanics of checkout are the easy half. The half that decides conversion
is **when the ask arrives**.

- **§5.1** — the ask lands at the moment value was felt, not the moment a
  limit was hit. These are rarely the same moment, and only the first
  converts. Asking at the limit is asking a frustrated person.
- **§5.2** — a limit met *before* the aha is a **wall**, not a gate. Walls
  charge for access; gates charge for more. A wall in front of the aha means
  the free tier failed at being a demo (§5.5).
- **§5.3** — published price and in-app price agree field for field. Dull,
  and the single most checkable rule in the group, so there is no excuse for
  a mismatch surviving a run.

### Splitting the environment

Payment walks run in a **non-production environment in the payment
provider's test mode**, walked to completion — a complete billing walk rather
than a stop at the boundary. §M.10 is satisfied because no real card is
charged.

But a fresh test account subscribing cold **is not** a stranger who hit a
limit after real use, so §5.1 is not answerable there. Split it: mechanics in
the test environment, the *moment* observed on the production onboarding and
usage legs. State the environment for each observation (§7.4).

This is the clearest case in the method of §M.9 doing useful work — one
question answered in one environment, a different question in another, and
neither pretending to have answered the other's.

---

## Applying it

1. Name what the free tier is for; check the limits agree (Verna, §5.5).
2. Walk checkout in the test environment, to completion (§5.4).
3. Observe *when* the ask arrives on the production legs (§5.1).
4. Classify each limit as gate or wall (§5.2).
5. Compare published price to in-app price, field by field (§5.3).
6. List every outward-facing surface — that is the loop candidate set
   (Chen, §6.3).
7. Draw the loop. No arrow home, no `compounding` (Balfour, §6.1, §6.2).
8. Label anything that does not feed a loop as a one-off (§6.5).

---

## Extending this library

If a monetisation or loop question comes up that these three don't reach, add
it with the master who would have caught it. Be especially wary of adding a
"loop" that turns out to be retention — the outward-surface test in §6.3 is
the discriminator.

*Distillations of published work — Balfour's published essays on growth loops
and the four fits; Chen, The Cold Start Problem and his published essays on
viral growth; Verna's published writing on product-led growth and expansion
revenue. Commentary, not endorsement; no practitioner named here has reviewed
this file.*
