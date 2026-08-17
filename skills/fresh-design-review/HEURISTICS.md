# Fresh Eyes — Heuristics

Numbered rules for judging whether an interface is considered or merely
finished. Cite as `§group.rule`. **A finding without a citation isn't
ready** (§M.3).

## Contents

- §0 The floor — the Earning Test · §1 Hierarchy & density · §2 Type ·
  §3 Color · §4 Surface & depth · §5 Motion · §6 Polish details ·
  §7 Layout & IA on the page · §8 Method
- Citing across systems · The verdict scale

Every rule is *observable* — you get a yes or a no by looking at the
rendered thing, not by reading the design system that claims to govern it.

The reasoning behind each group lives in its master library:
`references/design.md` (§0, §1, §2, §4) · `references/color.md` (§3) · `references/motion.md` (§5) · `references/polish.md` (§6) ·
`references/layout.md` (§7). §8 is method and belongs to no single library.

**§0 is the floor**, and it is unusual: it is one question, asked of
everything. The other groups exist because *"does this earn its place"*
needs a vocabulary before it can be answered the same way twice.

## Citing across systems

| Form | Means |
|---|---|
| `§3.4` | Fresh Eyes, this file |
| `§M.6` | The Fresh Method, `METHOD.md` |
| `FF§2.1` | Fresh Feet, `fresh-job-walk`, sibling folder |
| `FG§2.4` | Fresh Growth, `fresh-growth-walk`, sibling folder |

---

## §0 — The floor

| # | Rule | Master |
|---|---|---|
| **0.1** | **The Earning Test. Does this element earn its place, or is it just there?** Asked of every element you flag, without exception. Most clunky interfaces are not badly designed; they are under-deleted | **Rams** |
| **0.2** | **Judge the render, never the rulebook.** A design token's name is not evidence. A design-system doc saying an element is correct is a record of what a team decided, not proof they were right. Resolve tokens to values and judge the values | — |
| 0.3 | Name the master or the observation isn't ready. "Feels heavy" is a reaction; "fails Andersson's weight-contrast rule" is a finding someone can argue with | — |
| 0.4 | Most things are `competent`. A scale where everything scores well is a scale that has stopped measuring (§M.8) | — |

---

## §1 — Hierarchy & density

*Is the eye told where to go, and is the page working or resting?*

| # | Rule | Master |
|---|---|---|
| 1.1 | The eye lands somewhere whether you designed it or not. Name where it lands and whether it should. On a list page the list *is* the page; the title is chrome | Saarinen |
| **1.2** | **Density is a decision, not a default.** Verdict `too tight` / `right` / `too sparse`. Most clunky software lives at *too sparse* — content floating in dead space, mistaking air for calm | **Saarinen, Vercel** |
| 1.3 | Rows in a working list belong at ~28–36px. A 52px row renders a table as a reference document rather than a working surface | Saarinen, Spotify |
| 1.4 | Three tools make hierarchy: size, weight, color. Reach for weight and color before size — size is the blunt one and it costs space | Refactoring UI |
| 1.5 | Every visible element competes for the same attention budget. Adding emphasis everywhere removes it everywhere | Tufte |
| 1.6 | Secondary content should recede by *contrast*, not by shrinking to unreadability | Refactoring UI |

---

## §2 — Type

| # | Rule | Master |
|---|---|---|
| 2.1 | Weight contrast carries hierarchy: primary semibold, secondary normal. **Medium as a primary is the most common failure** — it reads as neither | Andersson |
| 2.2 | Type at screen scale is not type at print scale. Optical size, not nominal size | Andersson |
| 2.3 | Line-height tightens as size grows. A heading at body line-height looks unfinished | Andersson |
| 2.4 | Hierarchy can be driven by type alone, with no rules, boxes or color. If it can't, the type isn't doing its job | Spotify |
| 2.5 | On dark surfaces, inflate weight one step. The same weight reads lighter against dark | Andersson |

---

## §3 — Color

| # | Rule | Master |
|---|---|---|
| **3.1** | **Color is relative.** A value is only ever seen against its neighbours; judge every color in situ, never as a swatch | **Albers** |
| 3.2 | Simultaneous contrast — adjacent colors change each other. A neutral beside a warm accent is not neutral any more | Chevreul |
| **3.3** | **Restrict ruthlessly. Count the distinct accent uses on the screen.** Three to seven is a working ceiling; above seven is failure. And if four things claim accent status, none of them is the accent | **Vignelli, Sagmeister** |
| 3.4 | A page of only warm tones has no warmth — warmth is a contrast, not a property. Look for the cool counterpoint; its absence is the most underused lever in interface color | Itten |
| 3.5 | Color is felt before it is read. Name the feeling the palette produces before you evaluate whether it is the intended one | Goethe |
| 3.6 | Color does commercial work — legibility, wayfinding, recall — before it does aesthetic work | Birren |
| 3.7 | Color can be identity on its own, with no logo present. If the palette could belong to anyone, it is decoration | Scher |
| 3.8 | A loud move is earned once, then spent. Two loud moves on one screen cancel | Sagmeister |
| 3.9 | Committed maximalism is a valid answer, but it must be committed. Half-loud is the worst outcome | Walsh |
| 3.10 | Dark mode is designed, not inverted. Warm the dark; a pure-gray dark reads as unfinished | — |

---

## §4 — Surface & depth

| # | Rule | Master |
|---|---|---|
| 4.1 | Prefer surface elevation to borders. A 1px gray border draws the eye to the edge of a thing rather than the thing; borders that must exist belong at 5–10% opacity | Refactoring UI, Spotify |
| 4.2 | Defer to content. Chrome that competes with content is chrome that failed. A page with no nameable visual anchor has this problem | Apple |
| 4.3 | Optical refinement over mathematical correctness — align to what looks aligned, not to what measures aligned | Apple |
| 4.4 | Geometric tightness: controls that sit together share a height. Button and input parity is the tell | Vercel |
| 4.5 | Correctness that nobody notices is the point. The invisible work — consistent spacing rhythm, honest alignment — is what separates *professional* from *competent* | Freiberg |
| 4.6 | Think in systems, not screens. A one-off value on one screen is a system defect, not a screen defect | Vercel |

---

## §5 — Motion

| # | Rule | Master |
|---|---|---|
| **5.1** | **The frequency rule: the more often a motion plays, the shorter it must be.** Something seen twenty times a session belongs in the micro tier. Delight at high frequency becomes friction | **Kowalski** |
| 5.2 | The scale rule, both halves: **never animate from `scale(0)`** — nothing in the physical world vanishes, so a starting scale of 0.95–0.85 reads as distance travelled; and the larger the moving object, the longer it may take. A sheet may take what a button may not | Kowalski |
| 5.3 | Entrances and exits are not symmetrical. Exits are faster — the user has already decided | Krehel |
| 5.4 | Motion specifies its properties. `transition: all` is a defect: it animates things you did not intend and costs frames | — |
| 5.5 | Playful motion belongs at marketing edges, not in the working surface | Tompkins |
| 5.6 | Respect the reduced-motion preference, and respect hover capability — hover states on touch are a guess | — |

---

## §6 — Polish details

*The layer that separates* professional *from* polished. *Each is binary.*

| # | Rule |
|---|---|
| 6.1 | Concentric border radius — an inner radius equals the outer minus the padding. Mismatched nesting reads as wrong before anyone can say why |
| 6.2 | Optical alignment for icons and glyphs, not bounding-box alignment |
| 6.3 | Shadows over borders for separation, where both would work |
| 6.4 | Scale-on-press at ~0.96 on anything pressable. Never below |
| 6.5 | Tabular figures for any number in a column, right-aligned |
| 6.6 | Hit areas at least 44×44 regardless of the visual size of the control |
| 6.7 | Images get a hairline outline — otherwise a white-edged image bleeds into a light surface |
| 6.8 | Disabled states change more than opacity. Opacity alone reads as *loading* |

---

## §7 — Layout & IA on the page

*One IA observation per page. Cheapest diagnostics first.*

| # | Rule | Master |
|---|---|---|
| 7.1 | Does the page header land, and does it match the nav label that brought you here? A mismatch is the cheapest IA defect to find and the most disorienting to experience | Covert |
| 7.2 | LATCH — is this list organized by the right schema? A list sorted by Category where Time or Hierarchy would serve is a structural error wearing a sorting UI | Wurman |
| 7.3 | What user goal does this page serve, in the user's own voice? A page that answers with a feature name is a feature that found a route | Cooper |
| 7.4 | Is the key action reachable through recognition, or only recall? | Norman, Nielsen |
| 7.5 | The honeycomb: useful, usable, findable, credible, desirable, accessible, valuable. Name which one this page is weakest on | Morville |
| 7.6 | Progressive disclosure — is everything present because it is needed now, or because it exists? | Wroblewski |
| 7.7 | Complexity removed from the page went somewhere. Name where (§M.7) | Tesler |
| 7.8 | Information density is a virtue when every element earns its place, and clutter when it doesn't. The difference is §0.1, not a number | Tufte |

---

## §8 — Method

*Cross-cutting: cited alongside a domain rule, not instead of one.*

| # | Rule | Source |
|---|---|---|
| 8.1 | **Look, never infer.** A page you have not seen is a page you cannot review. "Pass blocked — no screenshot" is a result; a described-from-source page is a fabrication | §M.4 |
| 8.2 | Resolve tokens to values before judging, once per run | §0.2 |
| 8.3 | Every "weakest" maps to a concrete change with a line count | §M.11 |
| 8.4 | Severity 0–4 on findings; never a score on the design | §M.6 |
| 8.5 | Hand step-count, job-completion and parity findings to `fresh-job-walk`; hand copy and positioning to `fresh-growth-walk`. Do not duplicate their work | §M.12 |

---

## The verdict scale

One word per component and per page, from this fixed scale:

`rough` · `competent` · `professional` · `polished` · `inevitable`

| Verdict | Meaning |
|---|---|
| `rough` | Unfinished. Values look arbitrary; the system is not being followed even where it exists |
| `competent` | Correct and unremarkable. Nothing egregious, nothing considered. **The honest default** |
| `professional` | The invisible work is done — rhythm, alignment, consistent states (§4.5) |
| `polished` | The detail layer is complete (§6) and the hierarchy is deliberate |
| `inevitable` | Could not reasonably be another way. **Reserved** — award it rarely enough that it still means something |

**Nothing is scored** (§M.6). Severity 0–4 lives on findings, never on the
design.

---

*Sources: the named practitioners' published work, talks and writing, read
directly. These are distillations and commentary; no practitioner named here
has reviewed or endorsed this file.*
