# Polish Masters

> **Scope.** This library is about THE DETAIL LAYER, and every check is pass or fail — not hierarchy or type (`design.md`), not color (`color.md`), not motion (`motion.md`), not structure (`layout.md`).

## Contents

- The One Question
- The eight checks
- How to run this group
- The scorecard
- Extending this library

---
The reference library for **§6** of the fresh-design-review heuristics.

Canonical numbered rules: `HEURISTICS.md` §6.
Companion libraries: `references/design.md` (§0–§2, §4), `references/color.md` (§3), `references/motion.md` (§5),
`references/layout.md` (§7).

> **This library is shaped differently from its siblings, on purpose.** The
> others distil named practitioners who argued a position. The detail layer
> has no equivalent canon — it is accumulated convention, most of it settled
> by platform guidelines and interface-engineering practice rather than by
> anyone's published theory. Three checks do have identifiable sources and
> they are named below. The rest are conventions that hold because breaking
> them is visible. Manufacturing a citation list to match the other libraries
> would misrepresent where this knowledge comes from.

---

## The One Question

> Is this correct, or is it *right*?

The detail layer is what separates *professional* — the invisible work done,
rhythm and alignment honest — from *polished*. It is the difference between
an interface nobody complains about and one that feels considered.

**Every check here is binary.** There is no "mostly concentric". This is why
§6 has no verdict scale of its own: each item passes or it does not, and the
finding is the list of the ones that did not.

Most polish lives in 4–12px — an 8px translation on enter, a shadow slightly
larger on hover, an icon shifting 2px on press. Small enough that nobody
names it; consistent enough that everybody feels it.

---

## The eight checks

### 6.1 — Concentric border radius

An inner radius equals the outer radius minus the padding between them. A
card at 12px containing a control at 12px, inset by 8px, is wrong: the inner
should be 4px.

Mismatched nesting **reads as wrong before anyone can say why**, which is
what makes it worth checking mechanically rather than by eye. It is the most
commonly missed item on this list.

### 6.2 — Optical alignment, not bounding-box alignment

Icons and glyphs align to how they *look*, not to the box they ship in. A
triangular play glyph centered by its bounding box reads as sitting left,
because its visual mass is not where its box is.

Source: this is Apple's optical-refinement principle applied to the icon
layer — align to what looks aligned, not to what measures aligned (see
`references/design.md` §4.3).

### 6.3 — Shadows over borders for separation

Where either would work, a shadow separates and a border draws attention to
the edge of a thing rather than to the thing. Borders that must exist belong
at low opacity (see `references/design.md` §4.1).

### 6.4 — Scale-on-press at about 0.96

Anything pressable acknowledges the press. **Never below 0.96** — deeper
reads as a toy, and on the most-pressed object in a product that cost is
paid many times a day.

The corollary: the absence of a press state on a primary action is a finding
in its own right, not a missing nicety.

### 6.5 — Tabular figures in any column of numbers

Numbers compared vertically use tabular figures and align right. Proportional
digits in a column make the column ragged, and a ragged column reads as
unresolved even to someone who cannot say why.

Applies wherever numbers are compared: ranks, counts, dates, durations,
metrics.

Source: published interface guidelines from teams shipping data-dense
products converge on this; it is the least contested item here.

### 6.6 — Hit areas of at least 44×44

Regardless of the control's visual size. A 16px icon button is a 16px icon
inside a 44px target, not a 16px target.

Source: platform accessibility guidance, where this figure originates as a
minimum rather than a recommendation.

### 6.7 — Images carry a hairline outline

Without one, a light-edged image bleeds into a light surface and the
composition loses its edge. The outline is barely visible by design — it
exists to stop the bleed, not to frame.

### 6.8 — Disabled states change more than opacity

Opacity alone reads as **loading**, not as unavailable, and the two states
mean opposite things to someone waiting. A disabled control changes at least
one other property — fill, border, or cursor — so the state is unambiguous.

---

## How to run this group

Walk the eight in order against a rendered surface, not against the code that
claims to produce it (§0.2, §8.1). Six of the eight are visible in a
screenshot; press state and hit area need the live surface.

Report only the ones that fail, each cited by number. A §6 finding needs no
argument attached — the rule is the argument — but it does need the literal
observation: which element, on which surface, and what it did (§M.5).

---

## The scorecard

| # | Check | Fails when |
|---|---|---|
| 6.1 | Concentric radius | Inner radius doesn't equal outer minus padding |
| 6.2 | Optical alignment | Icons centered by bounding box |
| 6.3 | Shadows over borders | A full-strength border where a shadow would serve |
| 6.4 | Scale-on-press | No press state, or one below 0.96 |
| 6.5 | Tabular figures | Proportional digits in a compared column |
| 6.6 | Hit areas | A target smaller than 44×44 |
| 6.7 | Image outline | A light-edged image bleeding into a light surface |
| 6.8 | Disabled states | Opacity alone, so disabled reads as loading |

---

## Extending this library

Add a check when you find a detail whose absence is visible but unnameable —
that is the signature of this layer. A new check must be **binary** and
**observable in a render**; anything requiring an argument belongs in
`references/design.md` instead.

*This layer is craft convention rather than distilled published work, and is
presented as such. Where a check has an identifiable source it is named
inline: Apple's human interface guidance for optical refinement and for the
44×44 minimum, and published interface guidelines from data-dense product
teams for tabular figures. Commentary, not endorsement; no company or
practitioner named here has reviewed this file.*
