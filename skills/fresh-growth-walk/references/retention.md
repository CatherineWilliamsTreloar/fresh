# Retention Masters

> **Scope.** This library is about WHETHER THEY COME BACK — not where they came from (demand), not what the copy claims (message), not the first session (activation), not compounding (loops), not whether a claim is earned (evidence).

## Contents

- The One Question
- The three masters
- When the reason to return is a send
- Applying it
- Extending this library

---
The reference library for **§4** of the fresh-growth-walk heuristics.

Canonical numbered rules: `HEURISTICS.md` §4.
Recurring sends and their gates: the `automation` and `safety` blocks of
`fresh.config.md`.

Companion libraries: `references/evidence.md` (§0), `references/demand.md` (§1), `references/message.md` (§2),
`references/activation.md` (§3), `references/loops.md` (§5, §6).

---

## The One Question

> What brings them back on Tuesday?

---

## The three masters

### 1. Casey Winters — *retention is the ceiling*

Stated as an arithmetic constraint rather than a preference: **retention sets
the maximum size of the business, and every acquisition channel pours into
whatever the retention curve will hold.** Improve acquisition against a bad
curve and you have bought a larger leak.

The consequence for how findings are **ranked** (§4.2): a usage-stage fail
outranks any arrival-stage recommendation in the same run. A report that
leads with a new channel while the usage stage reads `leaking` has
mis-ordered itself.

His second contribution is the **flattening test** (§4.6): a healthy cohort
curve declines and then levels off — a stable group who keep coming back. A
curve that keeps declining is churn with a delay, and no acquisition rate
outruns it.

Most products at audit stage **cannot draw this curve** — not enough users,
not enough weeks (§0.3). Say so rather than substituting a proxy. What a walk
*can* do is judge whether a reason to return exists at all, which is upstream
of the curve and available from a single observation.

> **In a walk:** check the usage verdict before ranking any arrival finding.

### 2. Gibson Biddle — *DHM*

Three questions of any retention bet: does it **delight** the customer, is it
**hard to copy**, and is it **margin-enhancing**?

A feature that delights but is trivially copied is a treadmill. One that is
hard to copy but delights nobody is engineering vanity. The bet worth making
scores on all three.

For products that accumulate something over time, the DHM candidate is
usually **the accumulation itself** — the longer an account runs, the more it
holds, which is delightful (nothing gets lost), hard to copy (a competitor
starts empty), and margin-enhancing (the accumulated context improves the
output without more human work).

If that is the real retention asset, the walk must ask whether a returning
user can **feel** the accumulation. **Retention assets the user cannot
perceive do not retain.**

> **In a walk:** name the DHM candidate, then ask whether the returning user
> can see it.

### 3. Andrew Chen — *the leaky bucket*

Churn compounds silently against acquisition, and the most common state of
any product is **not being used**. Most users are dormant most of the time,
and a product designed only for the active session ignores where its users
actually are.

This is the source of §4.4: **what happens when they go quiet?** A product
with no dormant path has no win-back, and dormancy is not an edge case — it
is the modal state.

> **In a walk:** stop using it for a beat and ask what the product does about
> that. If nothing, that is the finding.

---

## When the reason to return is a send

Where the retention mechanism is a recurring notification plus a
returning-user delta — *what changed since last time* — the send is the
load-bearing part, and it is the part most often assumed rather than
verified.

Two rules apply, and both are walkable:

**§4.3 — a paused recurring send is a retention outage, not a backlog item.**
Date it and say what it has cost since. Filing it as a nice-to-have
misdescribes an outage as a wish.

**§0.2 — a send with no stamp is not a send.** If the reason to return *is* a
notification, judge the notification, and judge it by its delivery record
rather than by its existence in a codebase. An unsent notification is not a
reason to return (§4.1).

The second half is available even with the send dark: sign in as a returning
user and ask whether **anything is different** (§4.5). Same items, same order,
same numbers, no marker of what moved — then there was no reason to come, and
the notification would only have been an invitation to find that out.

---

## Applying it

1. Check the usage verdict before ranking any arrival finding (Winters).
2. Ask whether the cohort curve can be drawn at all; if not, say so (§0.3).
3. Name the DHM candidate and ask whether a returning user perceives it
   (Biddle).
4. Go quiet, and see what the product does (Chen, §4.4).
5. Verify recurring sends against their delivery record, not their code
   (§0.2).
6. Return as an existing user and look for the delta (§4.5).

---

## Extending this library

If a retention question comes up that these three don't reach, add it with
the master who would have caught it.

*Distillations of published work — Winters' published essays on retention and
growth; Biddle's published DHM framework and writing on product strategy;
Chen, The Cold Start Problem and his published essays on churn. Commentary,
not endorsement; no practitioner named here has reviewed this file.*
