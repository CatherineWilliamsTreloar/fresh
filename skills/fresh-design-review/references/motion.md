# Motion Masters

> **Scope.** This library is about MOTION ONLY — not color (`color.md`), not hierarchy or type (`design.md`), not the static detail layer (`polish.md`).

## Contents

- The One Question
- The three masters
- The frequency rule
- Duration tiers
- Easing, by what the element is doing
- The scale rule
- Non-negotiables
- The scorecard
- Extending this library

---
The reference library for **§5** of the fresh-design-review heuristics.

Canonical numbered rules: `HEURISTICS.md` §5.
Companion libraries: `references/design.md`, `references/color.md`, `references/polish.md`, `references/layout.md`.

---

## The One Question

> Does this motion help someone understand what just happened, or is it
> here to be noticed?

Animations earn their place by serving comprehension. Existing is not a
reason.

---

## The three masters

### 1. Emil Kowalski — *restraint and purpose*

The reference for tools people use all day. His core rule is blunt: **if a
user performs an action hundreds of times a day, do not animate it.**

Two of his principles are load-bearing enough to have their own sections
below — the frequency rule and the scale rule.

His wider principle belongs to craft generally: the best interfaces feel
right because of a thousand barely audible voices singing in tune. Nothing
individually noticeable; everything collectively felt.

### 2. Jakub Krehel — *asymmetric transitions*

**Enter and exit are different gestures. Never mirror them.**

Opening a door and closing it are not the same motion, and an interface that
reverses its entrance exactly reads as robotic. Exits are faster and quieter
than entrances — roughly 0.6–0.7× the enter duration — because **the user has
already decided** (§5.3). The entrance is informing them; the exit is getting
out of the way.

Exit *direction* matters too: something returns the way it came, rather than
sliding off somewhere it never was.

### 3. Jhey Tompkins — *playful experimentation*

The least applicable master in a working tool, and included deliberately as a
boundary. Playful motion belongs at **marketing edges** — launch moments,
one-time delight, empty-state illustration. Not in the working surface
(§5.5).

A precise product is not a playful one. Where playfulness appears in a daily
surface, the finding is usually that a marketing-edge pattern leaked inward.

---

## The frequency rule

**The more often a motion plays, the shorter it must be** (§5.1). Before
adding any animation, ask how many times a day someone will see it.

| Frequency | Permitted |
|---|---|
| < 1 per session | Full animation. Onboarding, empty states, first-time reveals |
| 1–5 per session | Standard or fast. Modals, panels, confirmations |
| 5–20 per session | Fast only. Dropdowns, toasts, status changes |
| > 20 per session | Micro, or none. Keyboard actions, list interactions, hover |

**Delight at high frequency becomes friction.** The animation someone
enjoyed on day one is the one they are waiting through on day thirty.

Keyboard-triggered actions get no animation at all. A keyboard flow that
animates has misunderstood why the user reached for the keyboard.

## Duration tiers

Four tiers, and never an arbitrary value between them:

| Tier | Range | For |
|---|---|---|
| **micro** | 50–100ms | Hover, focus rings, color transitions |
| **fast** | 100–150ms | Tooltips, badges, small state changes |
| **standard** | 150–250ms | Modals, panels, dropdowns, toasts |
| **deliberate** | 300–400ms | Page transitions, onboarding, major reveals |

A raw duration in a stylesheet is itself a finding: tiers exist so that
frequency and duration stay coupled, and a hand-written value has escaped
that coupling.

## Easing, by what the element is doing

| Doing | Easing | Why |
|---|---|---|
| Entering | ease-out | Starts fast, decelerates to rest — responsive and intentional |
| Exiting | ease-in | Accelerates away, leaving with purpose |
| Responding to a press | ease-in-out | Balanced, symmetrical, reactive |
| Organic / drawer motion | spring, no bounce | Bounce only where delight is the intent |

Stagger, where a list reveals: 30–50ms per item, capped at five or six. Items
should feel like they **arrive together**, not parade in one at a time. Past
the cap the remainder appear instantly.

---

## The scale rule

**Never animate from `scale(0)`** (§5.2).

Real objects do not disappear — a deflated balloon still has a shape. An
element that appears from nothing reads as artificial, because nothing in the
physical world does that.

The starting scale communicates **distance travelled**: 0.95 reads as close
and intimate, 0.85 as coming from further away. Interface elements are
usually close.

The rule's other half: **the larger the moving object, the longer it may
take.** A sheet may take what a button may not.

---

## Non-negotiables

**Motion specifies its properties.** `transition: all` is a defect — it
animates things nobody intended and costs frames (§5.4).

**Animate transform and opacity.** Properties that trigger layout — width,
height, margin, padding, inset, border-width, font-size — are not animation
targets. Properties that trigger paint, including shadow, are avoided; cross-
fade two shadow layers by opacity instead of animating the shadow itself.

**Respect the reduced-motion preference.** Always on, never optional. The
usual reduction is to opacity only, at a shortened duration.

**Respect hover capability.** Hover states are gated on hover being real.
Touch triggers hover on tap, producing false positives — **a hover state on
touch is a guess**, and shipping it is a bug (§5.6).

Hover exists to confirm interactivity, not to entertain. It belongs in the
micro tier; anything slower is perceived as lag on a mouse event.

---

## The scorecard

| # | Test | Fails when |
|---|---|---|
| 5.1 | Frequency sets duration | Something seen twenty times a session animating at standard tier |
| 5.2 | Scale suits the object | Animating from `scale(0)`; a button taking a sheet's duration |
| 5.3 | Enter and exit differ | Symmetric durations both ways |
| 5.4 | Properties specified | `transition: all` |
| 5.5 | Playfulness stays at the edges | Delight motion inside the working surface |
| 5.6 | Preferences respected | Reduced motion ignored, or hover assumed on touch |

---

## Extending this library

Add motion cases these three don't cover, with the master who would have
caught it. Note which tier and which frequency band the case sits in — most
motion disagreements are really disagreements about frequency.

*Distillations of published work — Kowalski's writing and talks on interface
motion; Krehel's published work on production interface polish; Tompkins'
published experiments in web animation. Commentary, not endorsement; no
practitioner named here has reviewed this file.*
