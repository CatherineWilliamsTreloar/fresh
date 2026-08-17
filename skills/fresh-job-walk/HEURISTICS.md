# Fresh Feet — Heuristics

Fifty-five numbered rules for judging whether a job is any good to walk. Cite as
`§group.rule`. **A finding without a citation isn't ready** (§M.3).

## Contents

- §0 The classic ten (plus two) — the floor · §1 Jobs · §2 Flow ·
  §3 Answers · §4 Surfaces · §5 Autonomy
- Citing across systems · Verdicts · Severity · Traps

Every rule is *walkable* — you get a yes or a no by doing the job, not by
reading the code.

The reasoning behind each group lives in its master library:
`references/jobs.md` (§1) · `references/flow.md` (§2) · `references/answers.md` (§3) · `references/surfaces.md` (§4) ·
`references/autonomy.md` (§5). `fresh-design-review` is borrowed for anything visual.

**§0 is the floor, and it belongs to no library** — deliberately. Heuristic
evaluation is Nielsen and Molich's method and this is their list, already at
the length its authors gave it. A distillation of a list that is itself a
distillation would add a layer and no judgment. Where the classics need
elaborating for an autonomous, multi-surface product, that elaboration lives
in §1–§5 and in the libraries behind them.

§1–§5 are what the floor doesn't reach: a product where
many things run without being asked, one job answers on several surfaces
with different postures, and the answer is probabilistic rather than
deterministic. None of that existed in 1994.

## Citing across systems

A bare `§N.M` is a claim about *this* file. Rules belonging to a sibling
skill carry a prefix and no space (§M.12):

| Form | Means |
|---|---|
| `§3.4` | Fresh Feet, this file |
| `§M.4` | The Fresh Method, `METHOD.md` |
| `FE§2.1` | Fresh Eyes, `fresh-design-review`, sibling folder |
| `FG§0.3` | Fresh Growth, `fresh-growth-walk`, sibling folder |

---

## §0 — The classic ten (plus two)

Nielsen & Molich 1990, refined 1994 from a factor analysis of 249 real
usability problems; unchanged since. NN/g calls them *"broad rules of thumb
and not specific usability guidelines"* — which is why each carries the test
that makes it specific to a product with autonomous work and several
surfaces.

| # | Rule | The test that makes it specific |
|---|---|---|
| 0.1 | **Visibility of system status** — *"within a reasonable amount of time"* | A long import running, a file being processed, a background job rewriting two dozen records. Where is any of that shown? Status arriving after the user decided is not status. Autonomous-era version: §5.2 |
| 0.2 | **Match with the real world** | Engine vocabulary never reaches a human screen. No score names, field names, thresholds |
| 0.3 | **User control and freedom** — the emergency exit | Undo an import, revert a version, unlink a mis-clustered record. Is the exit where a person would look? |
| 0.4 | **Consistency and standards** | Same job, same words, every surface → §4.7 |
| 0.5 | **Error prevention** beats a good message | Make the destructive thing unreachable by accident. A queue of outbound sends to invalid addresses is a prevention failure, not a messaging one |
| 0.6 | **Recognition rather than recall** — *"from one part of the interface to another"* | Read *interface* as the whole product across surfaces: what you knew in the app must not be carried in your head into a chat surface → §2.4, §4.6 |
| 0.7 | **Flexibility and efficiency** — shortcuts *"hidden from novice users"* | A command palette for humans, verbs for agents. Hidden is fine; only-path is not |
| 0.8 | **Aesthetic and minimalist design** | `fresh-design-review` owns this. Hand density/hierarchy/restraint findings over rather than duplicating |
| 0.9 | **Recognize, diagnose, recover from errors** | Plain language, what happened, the way out. No codes, no "something went wrong". A silent failure never even reaches this rule → §5.7 |
| 0.10 | **Help and documentation** | Findable at the moment of need, inside the step where they got stuck — not a help center they must leave the job to visit |
| 0.11 | **Design dialogues to yield closure** *(Shneiderman #4)* | Every sequence needs a definite end. An import that just stops is not closed. Neither is a chat flow that goes quiet |
| 0.12 | **Internal locus of control** *(Shneiderman #7)* | The user causes things; things don't happen to them. The hardest classic to hold once most of the work is autonomous → §5.4 |

---

## §1 — Jobs

*Is this the real job, or a feature wearing a job's clothes?*

| # | Rule | Master |
|---|---|---|
| 1.1 | State the job in the user's words or you don't have it yet. A product noun in the title means it's a feature | Klement |
| 1.2 | Name what the job fires — the spreadsheet, the meeting, the memory. If nothing, question the job | Christensen |
| 1.3 | A job has a moment, not just a task. The moment sets the time budget | Moesta |
| 1.4 | Measure the outcome they want, not the step they take | Ulwick |
| 1.5 | Hesitation is data, and it's usually about trust | Moesta |
| 1.6 | The test is whether the *user* looked good, not the tool | Sierra |
| 1.7 | No owning persona = a feature looking for a user. Every persona owning it = infrastructure, and a higher bar | — |

---

## §2 — Flow

*Is this step doing work, or is it the system's homework?*

| # | Rule | Master |
|---|---|---|
| **2.1** | **Conservation of complexity — every removal must name who absorbed it.** A removal that can't is a deferral | **Tesler** |
| 2.2 | Count decisions, not clicks. Three obvious clicks beat one hidden one. Report both numbers | Tognazzini |
| 2.3 | Every field, confirm and choice justifies itself or goes. A confirm on a reversible action trains dismissal | Krug, Wroblewski |
| 2.4 | No step should require recall | Nielsen #6 |
| 2.5 | Check both gulfs at every step — can they tell what to do, and that it worked? | Norman |
| 2.6 | Modes are a bug | Raskin |
| 2.7 | Polish in proportion to frequency — computed on *human* steps, not system activity | — |
| 2.8 | Time the walk, don't only count it. Record what fills the wait | Spool |
| 2.9 | At every step: back, undo, or leave without losing work? | — |

---

## §3 — Answers

*Did they get an answer, or material to form one?*

| # | Rule | Master |
|---|---|---|
| 3.1 | Verdict in the first sentence, support after. Never restate the question | Minto |
| 3.2 | Data is not information. A ranked list is data; a decision is information | Wurman |
| 3.3 | Natural frequencies beat percentages, always. Never convert good counts into rates | Gigerenzer |
| 3.4 | Every number is one move from its evidence | Tufte |
| 3.5 | Say how sure, in words the user uses. Engine vocabulary never renders; never fuse two engine concepts into one phrase | Tetlock |
| **3.6** | **An honest "I don't have that" outranks a plausible answer.** Fabrication is the worst outcome — it devalues every correct answer retroactively | — |
| 3.7 | The uncomfortable answers get the most care, not the least | — |
| 3.8 | Cut every word that isn't carrying | Zinsser |
| 3.9 | A question it can't answer should teach what it can, and be logged as demand | — |
| 3.10 | **Never emit a shape the surface cannot render.** A table that collides is worse than the prose it replaced — and the model cannot see that it happened | Tufte |
| 3.11 | Formatting earns its place. Three columns minimum for a table; two columns is a sentence. Bold marks the verdict, not every label. Rows in a table must be comparable | Minto, Tufte |
| 3.12 | Test the table with its **longest** label — collisions only appear when a cell fills its column. Numbers in a column get tabular figures and right alignment | — |

**Formatting is posture-dependent** (§4.1). Sovereign surfaces can carry a
table; daemon surfaces should return structured fields rather than rendered
markdown; **transient surfaces never get a table** — verdict and a link. And
never format your way out of a weak answer: a well-laid-out table of engine
scores is still §3.5 failing, just more confidently.

---

## §4 — Surfaces

*Available where its persona is, shaped for where it lands?*

**Every surface is walked separately.** An app and a conversational surface
are one product and two experiences; when they disagree the user can't tell
which is right.

| # | Rule | Master |
|---|---|---|
| **4.1** | **Posture decides shape.** Sovereign (density is a virtue) · sovereign-conversational · daemon (structure over prose; raw scores appropriate) · transient (verdict + link, never a rendered document). Declare each surface's posture in `fresh.config.md` | **Cooper** |
| 4.2 | Parity is availability, not sameness | McGrane |
| 4.3 | Same content, different presentation — never different content. A fork doesn't need two surfaces to start | Marcotte |
| **4.4** | **Name the layer of every defect: brain or renderer.** Brain heals everywhere at once; renderer must be fixed per surface and returns on the next one added | — |
| 4.5 | A job missing from its owner's home surface is **severity 4** — imperative before shipping | — |
| 4.6 | The handoff must survive the crossing — voice, reasoning, confidence | Nielsen #6 |
| 4.7 | Same job, same words, every surface | Nielsen #4 |

---

## §5 — Autonomy

*Zero steps is not a pass.*

| # | Rule | Master |
|---|---|---|
| **5.1** | **The irony of automation: the fewer steps left, the more each weighs — and the less practised it is.** Design every human touchpoint for someone doing it for the first time in three weeks, under pressure, with no warm-up | **Bainbridge 1983** |
| 5.2 | Every autonomous step must be findable *after the fact* | Norman |
| **5.3** | **Irreversible + autonomous is the one combination not allowed.** Pick one | **Sheridan** |
| 5.4 | No automation surprises. State that changed while they were away gets announced on return | Woods & Hollnagel |
| 5.5 | Situation awareness survives the handoff. An ask without who/why/what-they-said is a rubber stamp, and a rubber stamp is not a gate | Endsley |
| 5.6 | Gate by reversibility and source-trust, never by the model's confidence | — |
| 5.7 | A silent failure is worse than a loud one. The shape to hunt: a recurring job that measures success at dispatch and never at delivery, so the metric that would catch it is the broken one | — |
| 5.8 | Don't automate away the judgment the user is paying to keep. The remaining human gates are the product, not friction | — |

---

## Verdicts

One word per job **per surface**. No "passes", no "compliant".

| Verdict | Meaning |
|---|---|
| `blocked` | Cannot be completed on this surface, by this persona |
| `laborious` | Completes, but the user pays in steps, thinking or waiting they shouldn't |
| `workable` | Gets there. Nothing egregious, nothing considered. The honest default |
| `fluent` | Path is obvious, context carries, nothing asked twice |
| `one-move` | A single deliberate act; the rest was already done. **Reserved** |

---

## Severity — rate the finding, not the design

The verdict describes a job. **Severity describes a single problem, and it
is where the number belongs** (§M.6). Nielsen's 0–4 scale, combining
**frequency** (common or rare), **impact** (how easily overcome),
**persistence** (one-off or every time).

| | |
|---|---|
| **0** | Not a usability problem at all |
| **1** | Cosmetic — fix only if there's spare time |
| **2** | Minor — low priority |
| **3** | Major — important, high priority |
| **4** | Catastrophe — imperative to fix before shipping |

A score on the *design* invites optimising the score. A score on a *problem*
just ranks the queue.

**Three evaluators, not one — and the count is reported, never assumed.**
Nielsen is explicit that severity from a single evaluator is too unreliable
to use, and the mean of three is satisfactory. Three evaluators means three
real ones: separate sessions, no shared findings before rating.

One walker is still a legitimate run. What is not legitimate is one walker
reporting as though three had walked. **State the n on every severity.** One
walker producing one confident number and not saying it was one is the
likeliest way this instrument quietly lies.

---

## Traps — things that sound like good practice

| Sounds like | Actually | Rule |
|---|---|---|
| "Reduce the number of clicks" | Optimising a proxy | §2.2 |
| "Add a confirmation to be safe" | Training dismissal | §2.3 |
| "Put it behind a setting" | Handing back the decision | §2.3 |
| "The power user knows where it is" | Recall dressed as expertise | §2.4 |
| "It's discoverable through search" | Search is a fallback, not an IA | §2.4 |
| "It's autonomous, nothing to review" | Jobs with no human step still get graded | §5.2, §5.3 |
| "It works in the app" | Says nothing about the owner's surface | §4.5 |
| "The model is confident, let it run" | Confidence and safety are unrelated | §5.6 |
| "One pass found nothing, it's fine" | A single evaluator is unreliable by measurement | severity |
| "We simplified it" *(no absorber named)* | Deferral | **§2.1** |

---

*Sources: nngroup.com (ten heuristics; severity ratings) read directly, not
from memory · Shneiderman, Eight Golden Rules · Bainbridge, Ironies of
Automation 1983 · Cooper, About Face · McGrane, Content Strategy for Mobile.
Commentary, not endorsement; no practitioner named here has reviewed this
file.*
