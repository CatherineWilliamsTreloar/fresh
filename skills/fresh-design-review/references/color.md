# Color Masters

> **Scope.** This library is about COLOR ONLY — not hierarchy or type (`design.md`), not motion (`motion.md`), not the detail layer (`polish.md`).

## Contents

- The One Question
- Judge in situ, never as a swatch
- The scientists — how color behaves
- The practitioners — how color performs
- Working rules
- The scorecard
- Extending this library

---
The reference library for **§3** of the fresh-design-review heuristics.

Canonical numbered rules: `HEURISTICS.md` §3.
Companion libraries: `references/design.md` (hierarchy, type, surface), `references/motion.md`,
`references/polish.md`, `references/layout.md`.

---

## The One Question

> Is this color doing work, or is it decoration?

---

## Judge in situ, never as a swatch

The single most important operating rule, and the reason the scientists come
first: **a swatch is a lie; a composition is the truth.**

Never approve a color in isolation. See it against its actual background, at
actual size, inside the actual surrounding typography. A palette approved as
a row of chips will be wrong on the screen it was approved for.

---

## The scientists — how color behaves

### 1. Josef Albers — *color is relative, always*

No color exists alone. A value on a warm ground is a different color from
the same value on a cool one. When you decide on a color you are really
deciding on the **relationship** between it and its background.

This is §3.1, and it governs every other rule in the group.

### 2. Johannes Itten — *the seven contrasts*

Hue, light-dark, warm-cool, complementary, simultaneous, saturation,
extension.

Most interface work uses light-dark and saturation. **Warm-cool is the
underused lever** — and its corollary is the sharpest diagnostic in the
group: *a page of only warm tones has no warmth.* Warmth is a contrast, not
a property. Look for the cool counterpoint; its absence is usually the
finding (§3.4).

Complementary contrast is almost always wrong for a restrained interface.

### 3. Michel Eugène Chevreul — *simultaneous contrast*

Adjacent colors push each other. A neutral beside a warm accent is not
neutral any more — it pulls toward the accent's complement.

This explains the common confusion where the "same" color looks wrong in a
marketing asset and right in the product, or the reverse. The color did not
change; its neighbour did (§3.2).

### 4. Johann Wolfgang von Goethe — *color is felt before it is read*

Warm advances, cool recedes. Some hues are active, others passive.

The operating instruction: **name the feeling the palette produces before
evaluating whether it is the intended one** (§3.5). Doing it in that order
stops the evaluation from being a search for confirmation.

### 5. Faber Birren — *color has commercial function*

Color sells, signals, calms and alarms. It does legibility, wayfinding and
recall **before** it does aesthetic work (§3.6). The question is never "is it
pretty" but "is it doing the right job here".

---

## The practitioners — how color performs

### 6. Paula Scher — *color as identity*

When color is the idea, it carries the brand alone — no logo present. The
test is unforgiving: **if the palette could belong to anyone, it is
decoration** (§3.7).

### 7. Stefan Sagmeister — *the loud move*

Used sparingly, a jarring color move earns attention precisely because it
breaks the system. A quiet system makes a single saturated move hit harder
than the same move would in a loud one.

**A loud move is earned once, then spent. Two loud moves on one screen
cancel** (§3.8). Reserve the lever; do not spend it on something small.

### 8. Massimo Vignelli — *ruthless restriction*

A lifetime of work in three colors. The rule that follows: if it can be done
within the existing palette, do it within the existing palette. A fourth
color is a decision that must be justified out loud.

Operationally, **count the distinct accent uses on the screen**. Three to
seven is a working ceiling; above seven is failure. And **if four things
claim accent status, none of them is the accent** (§3.3).

### 9. Aaron Draplin — *the anti-reference*

Thick, saturated, confident palettes. He is here as the counter-case: for a
restrained system, *this is what we are not*. When a muted system starts
feeling Draplin-confident, it has drifted.

An anti-reference is a legitimate library entry. Knowing what a system is not
is often faster than knowing what it is.

### 10. Jessica Walsh — *committed maximalism*

When color goes big it must go with conviction. **A half-committed loud
palette looks worse than a restrained one** — half-loud is the worst
available outcome (§3.9).

Maximalism is a valid answer. Hedged maximalism is not.

---

## Working rules

**Context before value.** Albers. A color is approved in composition or not
at all.

**Saturation before hue.** When a screen feels flat, the first move is almost
never a new color — it is adjusting the saturation or value of what is
already there.

**Warm-cool before adding brightness.** The elegant contrast is usually a
cool neutral introduced to make the warm read warmer, not a brighter color
added.

**Marketing color is not product color.** A move that works on a launch
asset does not earn automatic entry to the product. Campaign extensions carry
an expiry; palette changes are a slower, separate decision.

**The dark-mode tax.** The same color needs a different value in each mode,
and anything running in both is proofed in both. This is Chevreul again: the
background changed the color.

**Dark mode is designed, not inverted.** Warm the dark — a pure-gray dark
reads as unfinished (§3.10).

**Accessibility is the floor, not the target.** Contrast minimums are where
acceptable begins. Restraint does not excuse poor contrast; it demands
excellent contrast *within* the restraint. A muted accent that fails
body-text contrast is not a body-text color, however well it reads as an
accent.

---

## The scorecard

| # | Test | Fails when |
|---|---|---|
| 3.1 | Judged in situ | A color approved as a swatch |
| 3.2 | Simultaneous contrast accounted for | A neutral beside an accent still called neutral |
| 3.3 | Accent uses counted | More than seven, or four things claiming accent status |
| 3.4 | Cool counterpoint present | All-warm, and called warm |
| 3.5 | The feeling named first | Evaluation before description |
| 3.6 | Commercial work before aesthetic | Pretty, but not doing a job |
| 3.7 | Could only be this product | A palette that could belong to anyone |
| 3.8 | One loud move | Two, so neither lands |
| 3.9 | Maximalism committed | Half-loud |
| 3.10 | Dark mode designed | An inverted, pure-gray dark |

---

## Extending this library

Add color cases these ten don't cover, with the master who would have caught
it. An anti-reference counts — knowing what the system is not is a finding.

*Distillations of published work — Albers, Interaction of Color; Itten, The
Art of Color; Chevreul, The Law of Simultaneous Contrast; Goethe, Theory of
Colours (the published translation keeps the British spelling); Birren,
Color Psychology and Color Therapy; and the published work
and talks of Scher, Sagmeister, Vignelli, Draplin and Walsh. Commentary, not
endorsement; no practitioner named here has reviewed this file.*
