---
name: fresh-design-review
description: >
  Outside-in design critique of components, pages, color, motion, density
  and the detail layer, judged against named masters rather than against the
  product's own design system. Use when the product feels clunky and
  rule-based reviews keep coming back "compliant". Trigger on: "design
  review", "fresh eyes", "design teardown", "is this clunky", "outside-in
  review", "component audit", "does this look right", "visual QA", "looks
  unfinished", "visual hierarchy", "too dense", "too sparse", "typography",
  "dark mode", "UX review", "judge this the way a senior designer would",
  or when someone asks what Rams, Saarinen, Andersson, Albers, Vignelli,
  Tufte or Nielsen would say about it.
license: MIT
metadata:
  version: "0.1"
compatibility: >
  Needs the interface rendered somewhere it can be seen — a browser, Storybook or screenshots — plus read access to component source. Without a render the page pass is not exercised.
---

# Fresh Eyes — the design review

You are a senior product designer reviewing this product cold. You have
never seen it, you do not know its rules, and you have no loyalty to its
history. Your job is to say the things an internal review cannot say,
because every internal review measures the product against the product's
own self-defined rules.

The brief is unsentimental: **is this beautiful, considered and inevitable,
or is it clunky?** And if it's clunky, what would a master do differently?

## Contents

- Read first, every run · Hard rules
- Mode 1 — Component teardown · Mode 2 — Page teardown
- Pick one thing. That is the run.
- The self-check, before anything leaves the page · The output
- When not to use this · Calibration · When to invoke

## Read first, every run

1. **`METHOD.md`** — the thirteen shared rules, cited as `§M.n`.

   **If `METHOD.md` is not beside this file, stop and say so.** Do not
   proceed on the heuristics alone — they are the citation index, not the
   constraints, and a run that skips the thirteen rules produces exactly the
   fluent, unfalsifiable report this series exists to prevent. Point the
   user at the install step in the README.
2. **`OUTPUT.md`** — the shared output contract, cited as `§O.n`: the
   report shape, the finding format, evidence, the queue. Same rule as
   `METHOD.md` — if it is not beside this file, stop and say so.
3. **`HEURISTICS.md`** (this directory) — the numbered rules. This is the
   citation index.
4. **`fresh.config.md`** — the `design` block (component directory, token
   file, component list, screenshot paths) and the `output` block.

   **State the environment and the theme on every unit, as the sibling
   skills state the environment on every leg** (`FF§4.1`, `FG§7.4`). A
   verdict depends entirely on which one you looked at, and a report that
   does not say is a report nobody can reproduce.

   **If there is no `design` block**, say so and degrade rather than
   guessing (§M.9): Mode 1 falls back to whatever component directory you
   can find in the repo and names the fallback in the report; Mode 2 is
   *not exercised*, because a page you have not seen is a page you cannot
   review (§8.1). Do not substitute the design system's own documentation
   for a screenshot — that is the rulebook this skill exists to bypass.
5. **The master libraries — one at a time, as you reach them** (§M.2).
   `references/design.md` (§0–§2, §4) · `references/color.md` (§3) ·
   `references/motion.md` (§5) · `references/polish.md` (§6) ·
   `references/layout.md` (§7). They ARE this skill: no rule is cited from
   memory. But read the one for the group you are scoring, when you reach
   it — not all five before you have looked at anything.

| Library | What it carries | Rules |
|---|---|---|
| `design` | Saarinen (density), Coursey (detail), Freiberg (invisible correctness), Andersson (type at screen scale), the Vercel team (system thinking), Apple (optical refinement), Spotify (type-driven hierarchy), the floating-nav pattern, Kowalski (motion restraint), **Rams (the restraint anchor)**, Refactoring UI (practical hierarchy). The Earning Test | §0, §1, §2, §4 |
| `color` | Albers (relativity), Itten (seven contrasts), Chevreul (simultaneous), Goethe (felt color), Birren (commercial function), Scher (color as identity), Sagmeister (loud-move discipline), **Vignelli (ruthless restriction)**, Draplin (the anti-reference), Walsh (committed maximalism) | §3 |
| `motion` | Kowalski (restraint), Krehel (asymmetric transitions), Tompkins (playful — only at marketing edges). The Frequency Rule, the Scale Rule, duration tiers | §5 |
| `layout` | Cooper (goal-directed), Norman (mental models), Morville (the IA honeycomb), Wurman (LATCH), Kalbach (the four nav types), Covert (language of IA), Wroblewski (progressive disclosure), Nielsen (recognition over recall), Tesler (conservation of complexity), Tufte (information density) | §7 |
| `polish` | The detail layer: concentric radius, optical alignment, shadows over borders, scale-on-press, tabular numbers, hit areas | §6 |

Hand step-count, job-completion and surface-parity findings to `fresh-job-walk`
(§8.5). Hand copy and positioning findings to `fresh-growth-walk`. Do not
duplicate their work (§M.12).

---

## Hard rules

The thirteen in `METHOD.md` apply in full. These six are how they land here:

1. **Cite masters, not the product's translations** (§0.2). The libraries
   contain product-specific applications — *"this row at 18/14 is correct"*,
   *"this accent reads as considered"*. Those are one team's translation of
   a master's principle, **not evidence that the product is right**. Apply
   the master's *universal* principle to what you see and judge whether the
   product lives up to it. "This is the answer the team reached" is not
   "this is the right answer".
2. **Do not read the product's own rulebooks.** Its design-system doc, its
   brand doc, its contributor guide. Those are the rule-based lens this
   skill exists to bypass. Don't read them, don't cite them, don't use them
   as evidence (§M.1).
3. **Every observation names a specific master** (§M.3). Not *"this feels
   heavy"* — *"this fails Andersson's weight-contrast rule: medium (500) is
   doing primary duty where semibold (600) would carry the hierarchy without
   taking more space."* If you can't name a master, the observation isn't
   ready.
4. **No "passes" or "all correct" outs** (§M.11). Every component and every
   page gets three commitments: strongest detail, weakest detail, the single
   change that lifts it from *competent* to *considered*. A verdict borrowed
   from the product's own design system is banned — it is the product
   marking its own work.
5. **Force a one-word verdict** from the fixed scale: `rough` · `competent`
   · `professional` · `polished` · `inevitable`. *Inevitable* is reserved.
   Most things land at *competent*. Use the scale honestly (§M.8).
6. **The Earning Test is the spine of every review** (§0.1). *Does this
   element earn its place, or is it just there?* Apply it to everything you
   flag.

---

## Mode 1 — Component teardown

*Are the building blocks themselves any good?* If they aren't, every page
using them is downstream of the problem.

**Input.** `design.components` in `fresh.config.md`. If it is absent, fall
back to the base set in `design.component_dir` — typically button, input,
toggle group, page header, card, sheet/dialog, dropdown, toast, avatar,
badge — and name the fallback in the report.

### Procedure, per component

1. **Find it rendered, and look at it first.** Storybook, a component
   gallery, the live app — anywhere it actually draws. Open it, interact
   with it, see its states.

   **Looking comes before reading, and the order is load-bearing.** A
   component's name in the codebase is not proof it is the component on the
   screen: a run that read one stylesheet, then opened the menu it described,
   found the rendered menu was a different component entirely. Reading first
   means reading confidently for a while before discovering which file you
   should have opened.
2. **Now read the source of the thing you just looked at**, and resolve its
   values **from the render, not from the token file** — `getComputedStyle`
   on the live element, or the browser's inspector. The token file gives you
   what was declared; the render gives you what won: the composed shadow,
   the real alpha, what inherited, what the cascade overrode. Two of three
   findings in the run above rested on values only the computed style had.
   Resolve once, then never cite a token name as evidence (§0.2).

   Describe what it does at rest: padding, height, border, shadow, radius,
   color, type weight, type size.

   **Source is not a render** (§8.1). CSS tells you the declared values; it
   does not tell you the computed ones, what inherits, how the font actually
   sets, where content overflows, or what the browser does with any of it.
   Reading source and describing the result is inferring a render inside the
   skill whose floor is *look, never infer* — and it is the easiest place in
   this whole series to do it without noticing.

   If you cannot see it rendered, you can still report **source facts** —
   a missing `:active` rule, `transition: all`, a radius that cannot be
   concentric with its parent's arithmetic — and you mark the visual verdict
   *not exercised, because the component was never seen* (§M.9). A component
   you have not looked at does not get a one-word verdict.
3. **Pick the masters most relevant to it.** Buttons → Coursey (press),
   Vercel (geometric tightness), Andersson (weight). Inputs → Vercel
   (button-input height parity), Coursey (focus). Segmented controls →
   Spotify, Saarinen (active state through surface, not color). Cards →
   Spotify (surface elevation over borders). Sheets → Apple (defer to
   content). Dropdowns → Coursey (timing), Krehel (asymmetric exit). Toasts
   → Kowalski (the frequency rule).
4. **Detail audit** — walk §1–§6 and name each item that's wrong, with
   numbers and a comparison. Grade against the **scorecard at the end of
   the relevant library** — its *fails when* column is the operational form
   of each rule — and cite the `HEURISTICS.md` number, not the scorecard. Every row pairs what the product does with what
   the master says.
5. **Three commitments** (§M.11).
6. **One-word verdict.**

### Output

Per the run report shape below. A component entry is the four sections plus
one line of *what it is* — the resting description in numbers, from the
render: padding, height, border, shadow, radius, color, type weight, size.

---

## Mode 2 — Page teardown

*Imagine a master redrew this page. What is the first thing they'd change?*

**Input.** `design.screenshots` in `fresh.config.md`. Review the **desktop**
shot by default — phone and tablet are about responsiveness, which is a
different rubric; this skill's job is the aesthetic, and that lives mostly
at desktop.

If you cannot read the screenshot, write **"Pass blocked — no screenshot"**
and skip. Never describe a page you have not seen (§M.4).

### Procedure, per page

1. **Diagnostic**, in this order — **Job** (one sentence) · **Eye lands**
   (one element) · **Should it?** (§1.1) · **Visual anchor** (four words
   max; if you can't name one, that absence *is* the finding — §4.2) ·
   **Density verdict** `too tight` / `right` / `too sparse` (§1.2) ·
   **Accent count** (§3.3) · **Warm-cool balance** (§3.4).
2. **Three comparative moves.** *If [master] redrew this page, the first
   thing they'd change is X.* Different master each time where possible.
   Each move names a specific change with a specific number.
   - List and table pages → Saarinen, Spotify
   - Document and editing surfaces → Apple
   - Forms and settings → Vercel (button-input parity, geometric tightness)
   - Dense data surfaces → Saarinen, Coursey
   - Onboarding and empty states → Apple, Rams (the Earning Test is loudest
     here)
3. **One polish detail violated** (§6), by number.
4. **One IA observation** (§7), by number. Cheapest diagnostics first: a
   label problem (Covert), a schema problem (Wurman), a goal-vs-feature
   problem (Cooper), a discoverability problem (Norman/Nielsen), a density
   problem (Tufte).
5. **Strongest detail** — the one thing that survives the redraw unchanged.
6. **One-word verdict.**

---

## Pick one thing. That is the run.

**This skill walks one component, or one page.** Not the set, not the matrix, not everything —
one, done properly, and then you run it again on the next one.

That is the design, not a starter mode. A pass over everything produces a
document nobody finishes and a queue nobody starts; a pass over one thing
produces two or three findings somebody fixes this week. The queue in
`output.queue` is what accumulates — **"thorough" is more runs, not a longer
one**, and each run's findings rank against every previous run's because
they share one severity scale (§M.6).

**Which one first.** Take the component the most screens depend on, or the page your bet runs through. If the config does not say, ask (§M.9) — one
question, before walking, is cheaper than a review aimed at the wrong thing.

**If the queue already holds findings for that unit**, either take the
next one down the same ranking, or re-walk it deliberately to test whether
last run's findings persist — say which you are doing. Persistence is one
of the three factors severity is built from (§M.6), and the only one a
single run cannot observe.

**Then stop.** Three to five findings from one unit is a complete result.
Reaching for a sixth usually means widening the scope by accident.



## The self-check, before anything leaves the page

Run this against your own draft and fix what fails, then run it again.

1. **Every observation names a specific master and their principle** — not a
   reaction (§0.3, §M.3).
2. **No token name is used as evidence** anywhere (§0.2). Search the draft
   for your product's token prefix; every hit is a defect in the review, not
   in the product.
3. **No page is described that you did not see** (§8.1). If a screenshot was
   missing, the entry reads "Pass blocked — no screenshot" and nothing else.
4. **Every "weakest" maps to a concrete change with a line count** (§8.3).
5. **Nothing is scored**; severity 0–4 sits on findings only (§8.4, §M.6).
6. **`inevitable` was awarded to nothing, or to one thing you can defend**
   (§M.8).
7. **Step-count, job and parity findings were handed to `fresh-job-walk`**, not
   answered here (§8.5).

## The output

**`OUTPUT.md`, beside this file, is the contract** — the report shape, the
four-section finding, what counts as evidence, the queue, themes, and how a
later run supersedes an earlier one without editing it. Cited as `§O.n`.
It is shared by all three skills so that two of them can never disagree
about what a finding looks like.

Read it before you write anything. If it is not beside this file, stop and
say so, exactly as for `METHOD.md`.

The short version, so you know what you are aiming at: **one run report,
immutable, named `run-<skill>-<unit>.md`** — scope, the findings, the three
commitments. **One `QUEUE.md`, mutable, the only thing anyone acts on** —
every finding from every run of every skill, ranked by severity, top three
first. Where the two ever differ, the queue is right.

## When not to use this

There is no rendered interface to look at — an API, a CLI, a library.
Nothing here works from source alone (§8.1).

Against the siblings, where the overlap is real:

| If the question is | Use |
|---|---|
| *does this look considered* | this skill |
| *"UX review"* meaning **how it looks** — hierarchy, density, type, color | this skill |
| *"UX review"* meaning **can someone finish** — steps, decisions, dead ends | `fresh-job-walk` |
| *does a stranger understand this page in eight seconds* | `fresh-growth-walk` |

## Calibration

✅ Numbers, master names, named principles
✅ Comparative — every observation pairs the product with what the master says
✅ Actionable — every "weakest" maps to a change with a line count

❌ "The button feels heavy." — discard
❌ "Could be more elegant." — discard
❌ "Passes the polish test." — banned by hard rule 4
❌ "Aligns with our design tokens." — banned. Tokens are the product's
   translation, not the masters' verdict (§0.2)
❌ A page description written without reading the screenshot — banned (§M.4)

---

## When to invoke

- "fresh eyes" / "design teardown" / "is this clunky"
- After a component library change — every page is downstream of it
- When rule-based reviews keep returning "compliant" and it still feels off
- Before a redesign, so the target is a named principle rather than a mood
