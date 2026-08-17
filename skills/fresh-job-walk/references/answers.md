# Answers Masters

> **Scope.** This library is about ANSWER QUALITY — not what the job is (`jobs.md`), not step count (`flow.md`), not which surface it lands on (`surfaces.md`).

## Contents

- The One Question
- Why this library exists at all
- The six masters
- The refusal rule
- The uncomfortable answers
- Formatting — the answer's shape is part of the answer
- The scorecard
- Extending this library

---
The reference library for **§3** of the fresh-job-walk heuristics. Six
practitioners on the difference between an answer and material to form one.

Canonical numbered rules: `HEURISTICS.md` §3.

---

## The One Question

> Did they get an answer, or did they get material to form one?

---

## Why this library exists at all

Where several surfaces share **one answering path** behind several
renderers, every defect found here is one of two kinds, and naming which is
mandatory:

- **Brain defect** — wrong in the shared path. Fix once, every surface heals.
- **Renderer defect** — wrong in one surface's presentation. Fix per
  surface, and it will reappear on the next surface added.

A finding that does not name the layer cannot be acted on.

---

## The six masters

### 1. Barbara Minto — *the pyramid principle*

Start with the answer. Group and summarize supporting arguments beneath it.
Order them logically. The reader should be able to stop after the first
sentence and still have what they came for.

Minto's SCQA (situation, complication, question, answer) is the framing
device; the operative rule is simply **the verdict goes first and the
support follows**. If a response opens with method, context or caveats, it
has failed regardless of how good the rest is — because the user reads the
first line and acts on it.

Corollary worth enforcing: **do not restate the question.** It is the single
most common wasted opening.

### 2. Edward Tufte — *evidence*

Tufte's principles — maximise the data-ink ratio, show comparisons, document
your sources, integrate evidence with the claim — translate almost directly.

The operative one: **every number is one move from its evidence.** If the
user cannot get from a claim to the material behind it in a single step, the
claim is decoration. For any product whose promise is traceability, a number
without a path to its source is the product failing at the only thing it
uniquely does.

Tufte's *"above all else, show the data"* is why returning verbatim source
quotes inline scores as a strong pass.

### 3. Richard Saul Wurman — *information anxiety*

Wurman's distinction: **data is not information.** Information is data that
changes what someone does. A sorted table of open tickets is data. *"Answer
the Reyes thread first — it is the only one with a contractual deadline
today"* is information.

The gap between those two sentences is the entire product.

Wurman's LATCH belongs to the layout library of `fresh-design-review`;
what belongs here is the anxiety itself
— the feeling of being surrounded by data and no closer to a decision. That
feeling is the failure state of every answering surface.

### 4. Gerd Gigerenzer — *natural frequencies*

People — including experts, including doctors reading test results — reason
correctly with **counts** and badly with **rates**. "3 of 12 customers"
lands; "25%" does not. This is not a preference; it is a repeatedly measured
effect.

**The rule: natural frequencies over percentages, always.** The specific
failure mode to watch for is *converting good counts into bad percentages* —
an answer that has "4 of the 11 open tickets have waited over a day" and
then reports "36% breaching" has gone backwards. Say "4 of 11".

### 5. Philip Tetlock — *calibration*

From *Superforecasting*: good judgment is calibrated judgment, and
calibration must be **stated** to be checkable. Confidence that is never
expressed can never be scored, and a forecaster who never says how sure they
are can never be wrong.

So: say how sure, in words the user already uses. And the locked constraint
— **engine vocabulary never renders on a human surface.** No score names, no
field names, no thresholds. `match_confidence: 0.95` is a fact about the
system; *"four of the five reports describe the same failure"* is a fact
about the world. Say the second.

Watch specifically for **fusing two engine concepts into one phrase** —
rendering a confidence number onto an unrelated status label produces things
like "stale (0.94)", which means nothing and misattributes one number to a
different idea.

Posture note: on a daemon surface, raw scores are *appropriate* — an agent
can use them. The same payload rendered to a human is a violation. See
`references/surfaces.md`.

### 6. William Zinsser — *on writing well*

"Clutter is the disease of American writing." Cut every word that is not
carrying. Prefer the short word, the active voice, the concrete noun.

Zinsser's other relevant rule is **warmth without decoration** — the voice
should sound like a person who knows the subject, not like a brochure or a
machine hedging.

---

## The refusal rule

An honest *"I don't have that"* **outranks** a plausible answer.

Grade refusals as first-class answers. Grade fabrication as the worst
possible outcome — worse than silence — because a confident wrong answer
does not just fail one question, it retroactively devalues every correct
answer the product has ever given. On a product whose entire promise is that
its claims are grounded, this is the one failure with compounding cost.

A question the product cannot answer should still teach the user what it
*can* answer, and the unmatched question should be logged as demand.

---

## The uncomfortable answers

The questions with the most value and the most personality are the ones a
cautious voice sands into nothing. Whatever the product does, it has a
version of each of these:

- *"What can I safely ignore?"* — permission-to-ignore is half of
  prioritization and almost nothing answers it
- *"What fell through the cracks?"*
- *"What am I missing?"*
- *"Did the change we made actually work?"*
- *"Where is this going wrong most often?"*

**These get the most care, not the least.** Delivering them well is a voice
problem, not a reason to soften them. Volunteering an absence — *"neither of
those has anything behind it"* — is the behavior that makes everything else
believable.

---

## Formatting — the answer's shape is part of the answer

Formatting is not decoration. A table that collides is worse than the plain
sentences it replaced, because the reader now has to *parse* before they can
read. Tufte's data-ink argument applies to layout, not just to charts.

**Formatting is posture-dependent** (see `references/surfaces.md` §4.1). The same content
wants a different shape on each surface:

| Posture | Tables | Lists | Emphasis |
|---|---|---|---|
| **Sovereign** | Yes — density is a virtue | Yes | Sparingly |
| **Sovereign-conversational** | Yes, *if the renderer can display one* | Yes, with visible markers | Verdict only |
| **Daemon** | No — return structured fields, not rendered markdown. The agent parses | No | None |
| **Transient** | **Never.** Verdict + link | Short, ≤3 items | Verdict only |

### The rules

1. **Never emit a shape the surface cannot render.** Know what the renderer
   supports before reaching for it. A markdown table sent to a renderer with
   no cell padding produces colliding text, and the model has no way to see
   that it happened. When in doubt, prose.
2. **A table needs at least three columns to earn its place.** Two columns
   is a sentence: *"Six failures this week, up from four."* Reaching for a table to
   say two things is the most common over-formatting error.
3. **Test the table with its longest label.** Collisions only appear when a
   cell's content fills its column — so short labels hide the bug and one
   long label exposes it. If a label and its value touch, the table is
   broken for everyone, not just that row.
4. **Numbers in a column get tabular figures and right alignment**, so
   digits line up and magnitudes are comparable at a glance. Left-ragged
   numerals in a column are unreadable as a set.
5. **Bold marks the verdict, not every label.** When a table bolds its whole
   first column *and* the prose bolds every key phrase, nothing is
   emphasised. Minto: one answer per level.
6. **Lists need visible markers.** An indented run of lines with no bullets
   reads as a wrapped paragraph, and the reader loses the count.
7. **A table is a comparison.** If the rows aren't comparable — different
   units, different scales, one row a status and another a score — it should
   have been prose.
8. **Never format your way out of a weak answer.** A well-laid-out table of
   engine scores is still §3.5 failing; it just fails more confidently.

### Record your renderer's defects

Renderer capability is not a constant. Before a walk, check what each
surface's markdown renderer actually does with a table and a list — cell
padding and list markers are the two that break most often, and both fail
*silently* from the model's side.

Where you find one, record it with its layer (§4.4) and note that the
formatting rules above become load-bearing for that surface until it is
fixed. Do not carry a renderer defect forward from a previous run as
though it were still true.

---

## The scorecard

| # | Test | Fails when |
|---|---|---|
| 3.1 | Verdict in the first sentence | Opens with method, caveats or a restatement |
| 3.2 | Information, not data | Returns a list where a decision was asked for |
| 3.3 | Natural frequencies | Percentages where counts were available |
| 3.4 | Evidence one move away | A number with no path to its source |
| 3.5 | Calibrated, in human words | Engine vocabulary renders; concepts fused |
| 3.6 | Honest refusal | Plausible fabrication; hedging instead of "I don't have that" |
| 3.7 | Uncomfortable answers land | Softened into uselessness |
| 3.8 | Nothing spare | Restates the question; happy talk |
| 3.9 | Teaches what is askable | Dead end on an unmatched question |
| 3.10 | Shape the surface can render | Emits a table/list the renderer mangles |
| 3.11 | Formatting earns its place | 2-column tables; bold on everything; rows that aren't comparable |
| 3.12 | Numbers align | A column of figures without tabular numerals / right alignment |

---

## Extending this library

Add cases these six don't cover, with the master who would have caught it.

*Distillations of published work — Minto, The Pyramid Principle; Tufte, The
Visual Display of Quantitative Information; Wurman, Information Anxiety;
Gigerenzer, Reckoning with Risk; Tetlock, Superforecasting; Zinsser, On
Writing Well. Commentary, not endorsement; no author named here has reviewed
this file.*
