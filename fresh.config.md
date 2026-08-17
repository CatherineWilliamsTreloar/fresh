# fresh.config.md

The Fresh skills read this file at the start of every run. Fill it in
once; correct it whenever it goes stale.

## Contents

- Product · Surfaces · Design · Environments · Jobs · Doors · Automation
- **Safety — read before the first run** · Values you cannot read from a
  checkout · Output

Everything here is something an outside evaluator would have to be told.
If a field is wrong, findings will be misattributed — a walk that
compares two environments produces parity defects that are noise, and a
walk that doesn't know your destructive verbs will eventually fire one.

**A missing field is not a blocker, and it is not free either.** Leave one
empty and the skill will try to derive it from what it is about to look at,
then ask you once — showing what it derived, so you correct rather than
compose — and write your answer back here. The run after that does not ask.
A *guessed* field is the real problem, because the walk proceeds
confidently on it and nothing ever flags that it was invented (§M.9).

---

## Product

```yaml
name: Your Product
one_line: What it does, in the words a stranger would use.
category: The category you're claiming, or "unclaimed".
```

## Surfaces

Every place a person can get a job done. `fresh-job-walk` walks each one
separately and never averages them (§M.8).

```yaml
surfaces:
  - id: ui
    name: Web app
    posture: sovereign          # sovereign | transient | daemon
    base_url: https://app.example.com
  - id: api
    name: Public API
    posture: daemon
    base_url: https://api.example.com
# add: agent/MCP surfaces, chat surfaces, CLI, mobile, email
```

## Design

What `fresh-design-review` needs to look at. It judges the rendered thing,
never the design system that claims to govern it (`FE§0.2`), so what it
wants is components, resolved token *values*, and screenshots.

```yaml
design:
  component_dir: src/components/
  token_file: src/styles/tokens.css
  components:
    # the base set to tear down; omit to let the skill pick from component_dir
    [button, input, toggle group, page header, card, sheet, dropdown, toast]
  screenshots:
    # desktop by default — phone and tablet are responsiveness, a different
    # rubric. Without these, Mode 2 correctly refuses to review any page.
    - { page: Home,     desktop: docs/shots/home-desktop.png }
    - { page: Settings, desktop: docs/shots/settings-desktop.png }
```

## Who this is for

**The block that decides whether a walk is useful or academic.** Without it
an agent can be rigorous about your product and irrelevant about your
business: it will judge your homepage against a stranger it had to invent,
and rank a channel you never bet on. Everything here is something you would
tell a new hire in their first hour.

```yaml
who:
  user: Who actually uses it, in a sentence. Role, team size, what their day
        looks like.
  buyer: Who pays, if that is a different person (FG§1.7). "Same" is a valid
         answer and a meaningful one.
  instead_of: >
    What they do today if they do not use you (FG§2.2). Not a competitor
    list — the actual behavior. A spreadsheet, a recurring meeting, asking
    the loudest customer, guessing. Positioning without this is decoration.
  the_bet: >
    Which door you are actually spending on, and why. A walk that finds you
    absent from a channel you deliberately ignore has found a strategy, not
    a leak — and should say so instead of ranking it.
  pricing:
    free: What the free tier includes, and the limit that ends it.
    paid: The tiers and what each unlocks. Without this, FG§5.1 and §5.2 —
          is the limit a wall or a gate, does the ask land where value was
          felt — cannot be judged at all.
  locked:
    # Decisions already made, so no walk re-litigates them. Each one costs
    # nothing here and saves an argument every run.
    - The category word in the hero. Settled; do not re-pitch.
```


## The goal — read at ranking time, never at finding time

```yaml
goal:
  # A state you are trying to reach, not a metric. "Twenty teams using it
  # weekly" — not "increase activation 30%". A number here is a number the
  # walk will start serving, and §0.6 (Goodhart) is in the evidence library
  # for exactly that reason.
  state:
  # When you expect to be there. Keeps the goal honest and dated.
  by:
```

**This field is deliberately quarantined.** It is read when ranking the
queue and never while walking. A walk that knows the goal stops judging the
product and starts grading the plan, which is the internal review §M.1
exists to escape, arriving through the config instead of through the
reviewer.

Its only job is the tiebreak. Two findings at severity 3, one in onboarding
and one in retention — without a goal, the order is the walker's taste. With
one, it is a sentence anybody can argue with: *this one first, because the
goal is teams reaching week two and that is where they stop.*

## Access

**How a walk gets a working account.** The single most common reason a
growth walk stops early is that nobody wrote this down.

```yaml
access:
  free_account: >
    The exact path to a usable account: which environment, whether signup is
    self-serve, and anything that must be clicked to make it useful.
  credentials: >
    Where the walker gets them. Never the secrets themselves — a path, a
    vault reference, or "ask the owner".
  seeded_data: >
    Does a new account arrive empty, or with demo data? This changes what
    every finding means. An empty account tests onboarding; a seeded one
    tests the product and tells you nothing about the cold start (FG§3.3).
```

## Environments

`fresh-job-walk` and `fresh-growth-walk` must pin every leg to a named environment
and say so in the report (§M.4). Comparing surfaces across two
environments compares two datasets, and every "parity defect" it produces
is noise.

```yaml
environments:
  production:
    url: https://app.example.com
    writes_allowed: false       # near-always false
  staging:
    url: https://staging.example.com
    writes_allowed: true
    restore_required: true      # record, restore, verify the restore by query
default_environment: production
exceptions:
  # legs that deliberately run elsewhere, and why
  - leg: payment
    environment: staging
    reason: test mode only, never a real charge
  - leg: signup
    environment: staging
    reason: production forbids writes, and a signup is a write
```

**Check the signup leg before your first growth walk.** If your marketing
site's buttons point at production and production forbids writes, the
default door cannot be walked past the landing page — the config expects an
account and forbids creating one in the only place the door reaches. A real
walk hit exactly this and stopped at S3 with five of seven stages
unmeasured. Resolve it here, in advance: either name the environment the
signup runs in, or decide that a signup on an address you own is authorised
in production. Deciding it mid-walk is how a walk quietly becomes an
inference.

## Jobs

What people hire this product to do, in their words — not feature names
(`fresh-job-walk` §1.1). One line each. If you cannot write the line without
naming a feature, that is itself a finding.

**Leave this empty if you are not sure.** `fresh-job-walk` will derive
candidates from your navigation, docs and empty states, put each through
§1 — strip the product nouns, name the moment, name the outcome, name what
it displaces — and propose five to eight for you to correct. That is a
better first draft than most teams write unprompted, and correcting a list
is faster than composing one. What it cannot do is know which jobs your
users actually have; a derived list is your product's view of itself, so
confirm it with someone who has talked to them before it hardens.

```yaml
jobs:
  - id: J1
    statement: "Tell me which of these need me today."
    persona: Support lead
    moment: The first twenty minutes of the morning
    surfaces: [ui, api]
  - id: J2
    statement: "Find out why this invoice hasn't been paid."
    persona: Finance
    moment: The customer has just queried it on a call
    surfaces: [ui]
```

## Doors

How a stranger arrives. `fresh-growth-walk` walks one door per run.

```yaml
doors:
  - id: D1
    name: Organic search
    default: true
  - id: D2
    name: An AI agent asked the category question
  - id: D3
    name: Direct / word of mouth
```

## Automation

`fresh-job-walk` grades autonomous work on visibility, reversibility and
surprise. **Zero steps is not a pass.**

```yaml
automation:
  autonomous_workflows: 0       # roughly how many things run unasked
  human_touchpoints: 0          # how many places a person acts
  ledger_url:                   # where a user sees what ran, if anywhere
```

## Safety — read before the first run

Everything here is enforced by §M.10. Be exhaustive; the cost of an extra
entry is nothing and the cost of a missing one is a real email to a real
customer.

```yaml
safety:
  never_call:
    # tools/verbs that are destructive or reach outward
    - name: example.act
      why: one of its actions emails people outside the account
  outward_gates:
    # walked TO the gate and stopped, never through
    - name: Send reply to customer
      why: final step mails a real person
    - name: Invite teammate
      why: final step mails a real person
  walk_account:
    # a real signup, on an address you own; increment per run
    email_pattern: you+fresh<N>@example.com
  read_only:
    - production database
  live_key_check:
    # if a test environment is ever found holding a live key: stop,
    # report at severity 4, walk nothing further through it
    enabled: true
```

## Values you cannot read from a checkout

Config, secrets and feature flags that change what a finding *means*.
Not knowing them is normal. Guessing is not — each one degrades to a
smaller claim (§M.9).

```yaml
unreadable:
  - key: LAUNCH_CUTOFF_AT            # example: a permanent launch cutoff
    changes: whether the walk account is inside the email sequence at all
    degrade_to: >
      query the delivery rows for this account before concluding anything.
      An eligible-but-unsent account and an excluded account look identical
      from the inbox and are opposite findings.
```

## Output

Point this **outside any git repo**. A walk report is a working artifact,
and a repo is the one place where a single `git add -A` on whatever branch
happens to be checked out turns it into a commit nobody meant to make. It
happened on the first real run of these skills.

All three skills append to **one queue**, and each also writes its own
report. The queue is the thing that compounds: findings from a design
review, a job walk and a growth walk score on the same severity scale
(§M.6), so they rank against each other in one list. Reports explain;
the queue is what gets worked.

```yaml
output:
  dir: ~/fresh-runs/<date>/     # not inside a repo
  # QUEUE.md is current state and the only thing to act on: a compact index,
  # one row per priority, mutable. Run reports are immutable records of one
  # walk — never edited. Where a later run contradicts one, the queue carries
  # the new severity and the old report gains one appended pointer line
  # (§O.7). An agent that has to reconcile the two will obey the wrong one.
  queue: QUEUE.md
  # Stable ids, so rank can move without renaming anything. Prefix per skill;
  # the number never changes once issued, and never doubles as the rank.
  id_prefix: { fresh-design-review: FE, fresh-job-walk: FF, fresh-growth-walk: FG }
  # Every queue row carries one of these. Without them the queue accretes
  # stale work and a carried-forward finding reads as current.
  statuses: [open, resolved, superseded, needs-recheck]
  # One file per run, named for the skill and the unit it walked, so the
  # directory reads as a list of what was actually looked at. Never
  # overwritten: a second run of the same unit gets its own dated directory.
  report: run-<skill>-<unit>.md

# Optional. Post findings to a tracker or product that accepts them, so the
# queue is not the only place they live. Off by default and deliberately so:
# posting is a WRITE to something outside the walk, and it needs the same
# authorization as any other (§M.10) — named here, and agreed immediately
# before the first one fires.
ingest:
  enabled: false
  endpoint:                     # e.g. https://api.example.com/feedback
  auth: >                       # where the key comes from — never the key
  source: fresh-walk            # tags every posted finding as ours
  external_id: fresh-<skill>-<date>-<n>
  # external_id is what makes re-running safe: the same finding posted twice
  # is one row, and a finding that survives three weekly runs shows up as
  # persistent in whatever you posted it to. That is severity's persistence
  # factor measured instead of estimated.
owners:
  # every recommendation carries one
  - AGENT
  - HUMAN
```
