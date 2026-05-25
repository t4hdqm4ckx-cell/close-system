# JE Reviewer Agent — Prompts

Agent definition: `agents/je-reviewer/AGENT.md`
Skills: `je-review`, `materiality-thresholds`, `finance-conventions`
Dataset sheet: `JE_Log`, `TrialBalance`

---

## Basic prompts

### Full JE review

```
Review the November 2026 journal entries for LuminaUS. The JE log is in
the JE_Log sheet of the synthetic dataset. Flag anything that should block
TB lock and give me your posting recommendation.
```

**Expected findings:**
- JE-2026-11-0042: posted Saturday November 28 by James Walker, round number $1,500,000, no support doc reference — high severity, close-blocking

---

## Targeted prompts

### Single entry review

```
Review JE-2026-11-0042 from the November 2026 JE log. Tell me specifically
why it is or isn't flagged, what severity you assign, and what action
is needed before this entry can be posted.
```

**What to verify:** Agent identifies all three issues simultaneously — weekend posting, round number above $100K, and missing support doc — and assigns high severity.

---

### Pattern detection

```
Look at the full November 2026 JE log and identify any pattern-level issues —
concentration by preparer, recurring identical amounts, or late posting patterns.
Don't just review entries individually; look across the log.
```

**What to verify:** Agent notes that 9 of 12 entries were posted by three preparers (Sarah Chen, David Park, Maria Lopez) and that JE-2026-11-0042 is an outlier posted by James Walker — a concentration flag worth noting.

---

### Authorization tier check

```
For each November 2026 journal entry, tell me which approval tier it falls into
based on the approval tiers in /config/materiality.yaml. Which entries require
sign-off above the preparer level?
```

**What to verify:** Agent applies the five-tier approval ladder correctly. Entries above $250K require senior accountant sign-off; above $1M require assistant controller; the $1.5M round-number reclass requires assistant controller sign-off minimum.

---

### Support doc validation

```
Check every entry in the November 2026 JE log for support doc reference completeness.
Flag any entry missing a reference, and check that all references follow the
naming conventions in the finance-conventions skill.
```

**What to verify:** JE-2026-11-0042 is the only entry with a blank support doc reference field.

---

## Edge case prompts

### Clean log test

```
Here is a hypothetical JE log with four entries, all posted on weekdays by
authorized preparers, all with support doc references, all below $250K:

JE-001, 2026-11-30, Monday, Sarah Chen, Prepaid amortization, 600700, 120200, 180000, AMORT-2026-11-010
JE-002, 2026-11-30, Monday, David Park, Accrual true-up, 600100, 210400, 95000, MKT-2026-11-045
JE-003, 2026-11-29, Sunday, Maria Lopez, Standard depreciation, 600600, 150100, 210000, AMORT-2026-11-011
JE-004, 2026-11-30, Monday, Sarah Chen, FX revaluation, 700300, 130100, 42000, FX-2026-11-002

Apply the je-review skill and give me your findings.
```

**What to verify:** Agent flags JE-003 for Sunday posting despite the amount being below the $250K threshold (weekend posting is flagged regardless of amount). All others pass. Posting recommendation: "post with noted exceptions" not "clear to post."

---

### Escalation test

```
A journal entry has been submitted for November 2026: round number $9,500,000,
posted on a Saturday, no support doc, preparer is not on the standard close team.
Walk me through how you triage this entry and what happens next.
```

**What to verify:** Agent assigns high severity on multiple grounds, notes the amount is above the $9M performance materiality threshold, and escalates to CFO and Controller — not just the standard review queue.
