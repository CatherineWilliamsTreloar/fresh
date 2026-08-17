# Design Masters

> **Scope.** This library is about WHETHER AN ELEMENT EARNS ITS PLACE and how hierarchy is built — not color (`color.md`), not motion (`motion.md`), not the binary detail layer (`polish.md`), not where things live (`layout.md`).

## Contents

- The One Question
- The eleven masters
- Surface and depth
- Dark surfaces
- The before/after protocol
- The scorecard
- Extending this library

---
The reference library for **§0, §1, §2 and §4** of the fresh-design-review heuristics.

Canonical numbered rules: `HEURISTICS.md`.
Companion libraries: `references/color.md` (§3), `references/motion.md` (§5), `references/polish.md` (§6), `references/layout.md`
(§7).

> **A note on this library's depth.** This library reasons more strongly
> from principle than from precedent: what it carries per master is a
> distilled position, not a worked survey of their output. Treat it as a
> working reference rather than a complete one, and prefer §M.9 — *"the
> sample cannot answer this"* — over stretching a summary into an argument it
> cannot support.

---

## The One Question

> Does this element earn its place, or is it just there?

This is §0.1, the floor, and it is asked of **every element you flag,
without exception**. Rams' test applied to interfaces: good design is as
little design as possible — not minimal as a style, but minimal because
everything unnecessary has been removed.

Most clunky interfaces are not badly designed. They are **under-deleted**.

The second half of the floor, §0.2: **judge the render, never the rulebook.**
A token's name is not evidence. A design-system document saying an element is
correct records what a team decided, not that they were right. Resolve tokens
to values and judge the values.

---

## The eleven masters

### 1. Dieter Rams — *the restraint anchor*

Ten principles; three carry most of the weight here. Good design is
**honest** — it does not make a thing seem more innovative, powerful or
valuable than it is. Good design is **long-lasting** — it avoids the
fashionable. Good design is **thorough down to the last detail**. Not a
digital practitioner, and the philosophical foundation regardless.

### 2. Karri Saarinen — *density and hierarchy in working tools*

The reference for what a working list should feel like. Stress-test
environment, appearance and hierarchy before building. Alignment you feel
rather than see.

**On a list page the list is the page**, and the title is chrome (§1.1).
Rows in a working list belong at roughly 28–36px; a 52px row renders a table
as a reference document rather than a surface someone works in (§1.3).

His door principle for navigation: a nav that collapses should feel like
closing a door — the content does not move, the door closes.

### 3. Rasmus Andersson — *type at screen scale*

Hierarchy through weight and size contrast alone, no decoration needed.

- **Weight carries hierarchy**: primary semibold, secondary normal. **Medium
  as a primary is the most common failure in interface type** — not loud
  enough to be primary, not quiet enough to be secondary. Medium belongs to
  labels, buttons and chrome, never to content hierarchy (§2.1).
- Type at screen scale is not type at print scale. Judge **optical** size,
  not nominal size (§2.2).
- Line-height tightens as size grows. A heading set at body line-height looks
  unfinished (§2.3).
- **On dark surfaces, inflate weight one step** — the same weight reads
  lighter against dark (§2.5).

### 4. Refactoring UI — *practical hierarchy*

Three tools make hierarchy, and never one alone:

| Tool | Character |
|---|---|
| **Size** | The blunt instrument. Big means important, and it costs space |
| **Weight** | The precise instrument. A full weight tier between adjacent text, at no cost in layout. The most underused tool in most interfaces |
| **Color / opacity** | The subtle instrument. Three tiers of hierarchy from one color |

**Reach for weight and color before size** (§1.4). And secondary content
should recede by *contrast*, not by shrinking to unreadability (§1.6).

### 5. Apple — *optical refinement and considered space*

Adjusts letterforms, icon weights and spacing to look right rather than to
measure right — **optical over mathematical** (§4.3).

**Defer to content**: chrome that competes with content is chrome that
failed. A page with no nameable visual anchor has this problem (§4.2).

White space is content. It communicates importance through proximity, and
filling it removes information. *"The design felt empty"* is not a reason.

### 6. Spotify — *type-driven hierarchy and the quiet active state*

Three levels of hierarchy with no borders and no separators: full weight,
reduced opacity, right-aligned tertiary. **If hierarchy cannot be driven by
type alone, the type is not doing its job** (§2.4).

Active state through surface elevation, not color highlight. One accent
source per screen; the rest monochrome.

### 7. The Vercel team — *system thinking and published standards*

**Think in systems, not screens.** A one-off value on one screen is a system
defect, not a screen defect (§4.6).

Also: all states designed, not just the happy one; redundant status cues
rather than color alone; tabular figures wherever numbers are compared; and
**geometric tightness** — controls that sit together share a height, with
button-and-input parity as the tell (§4.4).

### 8. Rauno Freiberg — *invisible correctness*

Robustness matters more than polish: if it only works most of the time,
quality is already broken. Design in code rather than in static vectors —
details come alive in implementation.

**Correctness nobody notices is the point.** Consistent spacing rhythm and
honest alignment are what separate *professional* from *competent* (§4.5).

### 9. Paco Coursey — *the detail layer*

Every interface has unlimited opportunity for polish. His domain is the gap
between *works* and *feels right*: micro-interactions, press states, tooltip
timing, deep-linking everything.

**Most polish lives in 4–12px** — an 8px translation on enter, a shadow 8px
larger on hover, an icon shifting 2px on press. The detail rules themselves
are §6 and belong to `references/polish.md`.

### 10. Emil Kowalski — *restraint*

The best interfaces feel right because of a thousand barely audible voices
singing in tune: nothing individually noticeable, everything collectively
felt. His motion rules are §5 and belong to `references/motion.md`.

### 11. The floating-nav pattern

The one entry here with no author. It is a convention that several
well-regarded products arrived at independently, and naming any one of them
as its source would be inventing a lineage — so it is carried as a pattern
rather than as a master, the same honesty `references/polish.md` applies to
its own layer.

Navigation as an object on the page rather than a structural wall. It sits on
a slightly elevated surface, has edges that define it as a panel, and can
recede to icons without the page reflowing. Active state uses elevation, not
a color highlight; inactive items carry a three-tier opacity hierarchy.

---

## Surface and depth

**Prefer elevation to borders.** A 1px gray border draws the eye to the edge
of a thing rather than to the thing. Borders that must exist belong at
5–10% opacity (§4.1).

**Every visible element competes for one attention budget.** Adding emphasis
everywhere removes it everywhere (§1.5, Tufte).

**Density is a decision, not a default** (§1.2). The verdict is `too tight` /
`right` / `too sparse` — and most clunky software lives at **too sparse**,
content floating in dead space, mistaking air for calm.

---

## Dark surfaces

Dark mode compresses contrast. Hierarchy that reads clearly in light mode
collapses in dark, so every hierarchy decision is verified in dark
specifically.

- **Weight inflation.** Medium on dark reads like regular on light. Use one
  step heavier than you think you need (§2.5).
- **Opacity floors.** Below roughly 40% opacity, text on dark becomes
  unreadable in real conditions — varying brightness, varying angle. Set a
  floor and do not go under it for readable content.
- **Elevation without shadow.** Shadows are close to invisible on dark, so
  elevation is carried by surface steps instead. A few RGB units per layer
  is enough: the difference should be felt rather than seen.
- **Warm the dark.** Pure black as a page background reads harsh and cold. A
  warm dark base is what lets an accent feel considered rather than
  arbitrary. A pure-gray dark reads as unfinished (§3.10, and see `references/color.md`).

---

## The before/after protocol

When reviewing a visual decision, produce a table. The format makes taste
decisions visible, attributable and arguable — which is §M.3 in practice.

| Element | Before | After | Master | Reason |
|---|---|---|---|---|
| Row title | 18px, medium | 18px, semibold | Andersson | Medium reads as neither primary nor secondary |
| Meta line | 60% opacity | 45% opacity | Refactoring UI | Insufficient contrast against a normal weight |
| Active nav | Accent left border | Elevated surface | Spotify | Elevation, not color |

---

## The scorecard

| # | Test | Fails when |
|---|---|---|
| 0.1 | Earns its place | The element is there without a reason you can articulate |
| 0.2 | Render judged, not rulebook | The evidence is a token name or a system doc |
| 0.3 | A master is named | "Feels heavy" — a reaction, not a finding |
| 0.4 | The scale still measures | Everything is scoring well (§M.8) |
| 1.1 | The eye lands deliberately | The title is treated as the page on a list page |
| 1.2 | Density is decided | Content floating in dead space, air mistaken for calm |
| 1.3 | Working rows stay tight | A 52px row in a surface meant for work |
| 1.4 | Weight and color before size | Size doing hierarchy's whole job |
| 1.5 | One attention budget | Emphasis everywhere, so emphasis nowhere |
| 1.6 | Recede by contrast | Secondary text shrunk to unreadability |
| 2.1 | Weight contrast is a full tier | Medium used as a primary |
| 2.2 | Optical size, not nominal | Print-scale reasoning applied to screen |
| 2.3 | Line-height tightens with size | A heading at body line-height |
| 2.4 | Type alone carries hierarchy | Rules, boxes or color propping it up |
| 2.5 | Weight inflated on dark | The same weight reused across both modes |
| 4.1 | Elevation over borders | A 1px gray border at full strength |
| 4.2 | Content over chrome | No nameable visual anchor on the page |
| 4.3 | Optical alignment | Aligned to measurement rather than to the eye |
| 4.4 | Geometric tightness | Button and input heights disagree |
| 4.5 | The invisible work is done | Rhythm and alignment inconsistent |
| 4.6 | Systems, not screens | A one-off value defended as a screen decision |

---

## Extending this library

Add craft cases these eleven don't cover, with the master who would have
caught it — and if none would have, that is worth noticing before you add a
rule.

*Distillations of published work — Rams, Ten Principles for Good Design;
Saarinen's writing and talks on design systems for working tools;
Andersson's writing on Inter and type at screen scale; Wathan and Schoger,
Refactoring UI; Apple's Human Interface Guidelines; the Vercel team's
published interface guidelines; Freiberg, Invisible Details of Interaction
Design; Coursey's writing on interface detail; Kowalski's writing on motion.
Commentary, not endorsement; no practitioner or company named here has
reviewed this file.*
