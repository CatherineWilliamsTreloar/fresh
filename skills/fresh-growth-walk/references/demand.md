# Demand Masters

> **Scope.** This library is about HOW STRANGERS ARRIVE — not what they understand (message), not the first ten minutes (activation), not returning (retention), not compounding (loops), not whether a claim is earned (evidence).

## Contents

- The One Question
- The five masters
- The agent door
- Applying it
- Extending this library

---
The reference library for **§1** of the fresh-growth-walk heuristics.

Canonical numbered rules: `HEURISTICS.md` §1.
Door inventory: the `doors` block of `fresh.config.md`.

Companion libraries: `references/evidence.md` (§0), `references/message.md` (§2), `references/activation.md` (§3),
`references/retention.md` (§4), `references/loops.md` (§5, §6). For where a page should live, hand to
`fresh-design-review` (FE§7.3).

---

## The One Question

> Where is this person standing at the moment they realize they have the
> problem — and is anything of ours standing there?

---

## The five masters

### 1. Sean Ellis — *product-market fit is the precondition*

Ellis coined "growth hacking" and then spent years arguing that most
companies reach for it too early. His survey question — *how would you feel
if you could no longer use this product?* — is a threshold test: below
roughly 40% "very disappointed", growth spend leaks out of a product people
would not miss.

The discipline this imposes: **do not recommend more distribution for a stage
that leaks.** If onboarding is `broken`, a finding that says "try another
channel" is malpractice. Ellis's ordering is retention → activation →
acquisition, and severity ranking should respect it.

Most products at audit stage cannot run the survey — too few users (§0.3).
That is worth saying plainly rather than substituting a proxy.

> **In a walk:** before writing any arrival-stage recommendation, check the
> onboarding and usage verdicts. Distribution into a leak is the most
> expensive mistake available here.

### 2. Brian Balfour — *the four fits*

Four things must fit each other, not just two: **market ↔ product ↔ channel
↔ model.** Most channel failures are actually model failures. A product
monetised at a low monthly price cannot afford a channel with a high
acquisition cost, and no amount of creative fixes that — **the arithmetic is
upstream of the copy** (§1.2).

The four fits also explain why copying a competitor's channel usually fails:
you inherited their channel without their model.

> **In a walk:** for each door, state the model it implies. If two doors
> imply contradictory models, that contradiction is the finding.

### 3. Andrew Chen — *cold start, and decay*

Two contributions, both deflationary.

**The law of shitty clickthroughs**: every channel's performance decays
toward zero as it saturates and audiences habituate. The first banner ad had
a click rate in the tens of percent. Nothing stays good. A channel working
today is not a channel; it is a channel *for now* (§1.3).

**The cold start problem**: products whose value depends on accumulated data
or network have a hard floor before they are worth anything. Where that is
true, acquisition and activation are **not separable** — getting a stranger
in is worthless if the thing they meet is empty.

> **In a walk:** ask what this channel looks like at ten times the volume,
> and what the product looks like at hour one of an empty account.

### 4. Rand Fishkin — *demand vs supply, and zero-click*

His key separation: search **supply** (pages that exist answering a term)
versus search **demand** (people actually looking). A term with no supply
looks like an opportunity and is usually just a term nobody searches (§1.4).
Owning an unindexed phrase costs real work and returns nothing.

His second contribution is **zero-click**: a growing majority of searches end
without a click, answered on the results page. The same logic now extends to
AI answers — the question is answered by the model, and the citation is the
only distribution on offer.

This is why §1.5 exists: **ask the category question of a real agent and
record the literal answer.** Not "check our search presence" — put the
question a buyer would actually ask to an actual assistant, and write down
what comes back. Absence is the finding, and it is a more honest measurement
than an impressions count.

> **In a walk:** never call a zero-volume term an opportunity without
> separating supply from demand first.

### 5. Elena Verna — *buyer, user, and the motion*

Her discipline is refusing to let *user* and *buyer* blur. In product-led
motions the user arrives first and the buyer appears later; in sales-led
motions the reverse. A door that reaches the user does not necessarily reach
the buyer, and a page written for one will fail the other (§1.7).

Her second point: **the motion is a choice, not a discovery.** Product-led
and sales-led need different doors, different pages and different first
sessions. A company running both without saying so gets a muddle of each.

> **In a walk:** name, per door, whether the person arriving is the buyer,
> the user, or both.

---

## The agent door

One entry has no master, because it is genuinely new: **an AI agent asked the
category question**, answering on the stranger's behalf before any page is
seen.

This is original ground and the library will not pretend otherwise. The
discipline is therefore evidentiary rather than theoretical:

1. Ask the question a buyer would actually ask, in their words.
2. Record the **literal answer**, never a summary of it (§M.5).
3. Note whether the product appears — in what position, described how, and
   cited from where.
4. If it appears, check whether the description matches the positioning the
   site intends. That is §2 territory; hand it across (§M.12).

**Absence is a legitimate and reportable result.** So is a citation pointing
at a page the product does not control — which is worse than absence, because
it is distribution someone else owns.

---

## Applying it

1. Check the onboarding and usage verdicts before recommending distribution
   (Ellis).
2. State the model each door implies; flag contradictions (Balfour).
3. Ask what the channel looks like saturated (Chen).
4. Separate search supply from search demand (Fishkin).
5. Name buyer versus user per door (Verna).
6. Ask the category question of a real agent; record the literal answer
   (§1.5).
7. Name what gets fired. No incumbent, no demand (§1.6) — and see the jobs library of `fresh-job-walk` for the full form of that test.

---

## Extending this library

If a demand question comes up that these five don't reach, add it with the
master who would have caught it. The agent door is the live example of a
question arriving before its theory does; expect more of those, and keep them
evidentiary until a theory earns its place.

*Distillations of published work — Ellis and Brown, Hacking Growth; Balfour's
published essays on the four fits; Chen, The Cold Start Problem; Fishkin,
Lost and Founder and his published research on zero-click search; Verna's
published writing on product-led growth. Commentary, not endorsement; no
practitioner named here has reviewed this file.*
