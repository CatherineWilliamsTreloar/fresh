# The output contract

Shared by all three Fresh skills, replicated beside each of them exactly as
`METHOD.md` is. Cite as `§O.n`. One copy, one contract — three copies of a
contract drift, and the drift is invisible until two reports disagree.

## Contents

- §O.1 Two artifacts · §O.2 The queue · §O.3 The run report · §O.4 A finding
- §O.5 Evidence · §O.6 Themes · §O.7 Superseding · §O.8 Where it goes

---

## §O.1 — Two artifacts, two jobs

**`QUEUE.md` is current state.** Mutable, compact, the only thing to act on.
One row per priority — **never a full specification.** It is a index, and an
index that contains the thing it indexes is not one.

**Run reports are immutable.** One walk, one date, one environment: scope,
evidence, the done-when checks. Never edited after the fact.

An agent must never have to reconcile them. Where they differ the queue is
right, and the report is the record of what was true then (§O.7).

## §O.2 — The queue

Scannable in about a minute, however many findings there are, because the
evidence lives in the reports. There is no line limit — *"nothing in here is
present for completeness"* is the test, and a numeric ceiling would be a
target to hit rather than a constraint that helps.

```
# Fresh queue · <date>

## Do these three
**1 · sev <n> · <skill> · <owner>**
<one or two sentences, the defect not the fix>  `<ID>`
… two more, each saying why it beats the one below

## Everything, by skill
### <skill>
`<unit>` · **<verdict>** — <one line: why this unit>
| ID | sev | finding | status |
```

**Every row carries an ID, a severity and a finding.** Owner and status are
carried too, but a value that is the same on every row belongs in a header
line — *"all open, all agent-owned unless marked"* — not repeated down a
column. State it once or state it per row; do not omit it.

**Owner is `AGENT` or `HUMAN`**, the two words the config defines. Not
"yours" or "mine".

**Every ID links to its run report**, by filename. An ID a reader cannot
follow is a reference to nothing.

**Group the rest by skill.** The heading carries the skill, the unit and the
verdict together, so provenance, scope and coverage need no sections of
their own — and a reader can tell whether a finding came from looking at
pixels or from asking an agent a question. Those need different people and
different confidence.

**The top three mix skills**, because severity ranks and skills do not. Mark
them in the per-skill list so nothing is listed twice unconnected.

## §O.3 — The run report

One shape, whichever skill wrote it.

```
# <skill> · <unit> · `<verdict>`

**Walked** <what, where, environment, date, n=>
**Not exercised** <one line, or omit>

<ID> · <one line, the defect not the fix> · sev <n>
  What · Why · Evidence · Done when

## Three commitments (§M.11)
Strongest · Weakest · One change
```

Nothing else gets a heading. A method step that produced no finding is one
line under **Walked** — *"Loop not drawn: this run reached S1"* — because a
heading promises the reader something worth stopping for and a satisfied
compliance check is not that.

**§M.11 is satisfied explicitly, not by implication.** Strongest, weakest
and one change, named. The weakest moment is usually the top-severity
finding and the one change is usually its *What* — say so in a line rather
than leaving the reader to infer the equivalence.

Where you got something wrong mid-run, one line at the end under
**Corrected**. A walk that catches its own error is worth more than one that
records having made none.

## §O.4 — A finding

```
<ID> · <one line, the defect not the fix> · sev <0–4>
What       the change
Why        the rule by number (§M.3) and what it costs
Evidence   see §O.5
Done when  the check that proves it landed
```

**IDs are stable and never encode rank.** `FE-004` is that finding forever;
rank is a position in a list that moves. Rank-as-identity means the next
run's top finding renumbers everything and every earlier reference silently
points elsewhere.

**Done when must prove the change actually happened**, not that something
was written about it. A check a reader can satisfy by adding a comment is
not a check. And it must match the *What* — if the change is "extend the hit
area without altering the painted size", a check that only measures the
painted box proves the wrong thing.

## §O.5 — Evidence

The measured value, and the comparison the rule implies:

- **the number the master states**, where the library states one — 44×44,
  28–36px, the 50–100ms tier, three-to-seven accents;
- **the floor the rule sets**, where it is a floor rather than a figure;
- **the literal string, count or response body**, where the rule is not
  numeric at all (§M.5).

Then the gap between them, stated. *"Too sparse"* is a reaction; *"85px for
content 40px tall, against 56–64"* is a finding.

**Measured means computed, not declared** (§0.2). Resolve from the render —
`getComputedStyle`, the response body, the actual count. A value still
written as a token reference has not been resolved, and printing one as
evidence is the failure the rule exists to prevent.

**Never generalise past the sample.** Seven buttons on one page is seven
buttons on one page, not *every button*. Say what you counted and where.
A classification you did not measure — how often something is used, who
uses it — is an inference, and §M.4 applies to it exactly as it does to a
number.

## §O.6 — Themes

Two or more priorities sharing a cause. One is a finding; calling it a theme
inflates it.

Themes are read off the accumulated queue rather than written per run, which
is why one-unit runs do not prevent them — a pattern across pages is
invisible from one page. **A theme is a column in the full list**, never a
second table: listing a priority and its theme as separate rows counts it
twice. It may be the *item* in the top three, where you are naming what to
do — say how many priorities it contains so the reader sees the size of the
job.

## §O.7 — Superseding, without editing

A later run may contradict an earlier one. The earlier report is still
correct about what was seen then, so it is **not rewritten**.

- The **queue** carries the new severity, status or verdict. It is the only
  severity source.
- The earlier report gains **one appended line**: *"Superseded <date>: see
  QUEUE.md."* Appending a pointer is not editing a finding; changing the
  finding would be.
- Where a run re-verifies an earlier finding, the queue says which run last
  saw it. A finding not re-walked keeps its original date, and re-dating it
  without re-walking is §M.4 with a timestamp on it.

## §O.8 — Where it goes

The `output` block of `fresh.config.md`, and **outside any git repository** —
a walk report is a working artifact, and a repo is the one place where a
single `git add -A` turns it into a commit nobody meant to make.

Reports are named `run-<skill>-<unit>.md`, the queue is `QUEUE.md`, and both
sit in a dated directory. Write the report once the self-check passes, never
over a previous run.
