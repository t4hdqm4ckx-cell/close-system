---
name: je-review
description: "Use this skill when reviewing journal entries for accuracy, completeness, SOX-relevant attributes, or pattern detection during a month-end close. Triggers include phrases like 'review these journal entries', 'check this JE', 'flag suspicious entries', 'SOX JE review', 'missing support doc', or any request to evaluate whether journal entries are properly supported, correctly coded, or consistent with expected patterns. Use when a JE log is provided and the task is to identify entries that should block posting, require additional support, or be escalated."
---

# Journal entry review

## Purpose

Every journal entry posted to the GL must be accurate, complete, properly authorized, and supported by documentation. The JE review is the control that catches entries that don't meet those standards before the TB is locked.

The review has two layers: mechanical checks (does the entry balance, is it coded correctly, is there a reference) and judgment checks (is the amount plausible, does the pattern make sense, does the timing suggest error or override).

## Review criteria

Assess every entry against all four criteria. A failure on any one triggers an exception.

### Completeness

Every JE must have:
- A substantive description (not "misc", "adjustment", "true-up" alone, or blank)
- A supporting documentation reference that follows the naming convention in `finance-conventions`
- An identified preparer
- A post date within the close period

Missing any of these is an automatic exception. The severity depends on the amount — see triage below.

### Accuracy

- Debits equal credits (mechanical; flag immediately if not)
- Account combination is valid per the chart of accounts (no revenue account paired with a liability without explanation)
- Directional consistency: a debit to an expense account should increase the expense balance; a credit to revenue should increase revenue. Read `finance-conventions` for sign conventions before checking.
- Amount is plausible given the account, entity, and period (a $500M entry to a petty cash account is not plausible)

### Authorization

- Entries above the JE review threshold ($250K per `materiality-thresholds`) require a reviewer other than the preparer
- Entries above performance materiality ($9M) require Controller sign-off
- Entries posted by users outside the standard close team require explanation

### Supporting documentation

- Reference field is populated and follows naming conventions
- No duplicate reference numbers across different JEs (possible copy-paste error)
- Reference format matches the entry type (amortization entries reference an amortization schedule; accruals reference the accrual schedule or vendor estimate)

## Pattern detection rules

Apply these checks across the full JE log, not entry by entry. Patterns that are benign individually become exceptions when combined.

**Round numbers:** Any entry at or above $100K with an amount that is exactly divisible by $100,000 (e.g., $500,000, $1,500,000, $2,000,000). Flag for explanation. Round numbers at month-end are sometimes legitimate (standard amortization, fixed fee invoices) but are also the most common signature of estimated or plugged entries.

**Weekend and holiday posting:** Any entry with a post date on a Saturday, Sunday, or public holiday. Not automatically an error — some closes run through weekends — but warrants confirmation from the preparer that it was intentional and authorized.

**Recurring identical amounts:** The same dollar amount posted by the same preparer in two or more consecutive periods to the same account combination. Legitimate if it is a standing recurring entry (e.g., fixed rent). Flag if the entry is not explicitly tagged as recurring and the support doc reference changes each period (suggesting a new justification for a repeated amount).

**Late posting:** Entries posted after the close calendar's BD2 JE cutoff that are not explicitly tagged as late-close adjusting entries. Late entries that shift amounts between periods are high risk.

**Unusual account combinations:** Debits to revenue accounts, credits to expense accounts, entries that net across the income statement and balance sheet without a clear business reason. These are not automatic errors but require explanation.

**Concentration:** More than 30% of total JE dollar volume from a single preparer, or more than 50% in the last two business days of the close. Not an exception on its own but worth noting in the review memo.

## Triage by severity

Apply `materiality-thresholds` to classify each exception:

**High — close-blocking**
- Missing support on any entry above $250K
- Debits not equal to credits (any amount)
- Entry posted by an unauthorized user above $100K
- Round number above $500K with no explanation
- Weekend posting above $250K with no confirmation
- Duplicate reference number on entries totaling above the trivial threshold

**Medium — requires resolution before sign-off**
- Missing support on entries below $250K
- Round number between $100K and $500K without explanation
- Weekend posting below $250K
- Recurring identical amount not tagged as recurring
- Missing preparer identification

**Low — note in memo**
- Description quality issues (vague but not blank)
- Minor formatting deviations in reference numbers
- Concentration patterns worth monitoring

High exceptions block TB lock. Medium exceptions must be resolved or accepted by the Controller with documented rationale. Low exceptions appear in the workpaper but not in the executive summary.

## Output format

### Review memo (md)

Filename: `YYYY-MM_<entity>_JEReview_v<n>_memo.md`

Sections:
1. Summary — total entries reviewed, entries flagged, close-blocking exceptions, overall status
2. Flagged entries — per-entry detail for every exception (JE ref, preparer, date, amount, flag reason, proposed disposition)
3. Pattern findings — any cross-entry patterns detected
4. Posting recommendation — "clear to post", "post with noted exceptions", or "hold pending resolution"
5. Metadata — agent version, sources, timestamp, reviewer fields

### Output envelope

Every review returns this shape:

```json
{
  "result": {
    "total_entries_reviewed": 12,
    "entries_flagged": 1,
    "close_blocking_exceptions": 1,
    "posting_recommendation": "hold | post_with_exceptions | clear"
  },
  "exceptions": [
    {
      "severity": "high | medium | low",
      "category": "missing_support | round_number | weekend_posting | unauthorized_user | ...",
      "je_ref": "JE-2026-11-0042",
      "preparer": "...",
      "post_date": "YYYY-MM-DD",
      "amount": 1500000,
      "description": "...",
      "proposed_action": "..."
    }
  ]
}
```

## Common pitfalls

- **Don't conflate error with fraud.** Weekend posting and round numbers are red flags, not proof of misconduct. Note the pattern; let the Controller investigate.
- **Don't skip small entries.** A $45K entry with no support doc is still an exception. Materiality affects the severity, not whether you flag it.
- **Prior period comparison matters.** An entry that looks unusual in isolation may be a standard recurring item. Check the prior period JE log before flagging.
- **Don't generate new JEs.** JE review is a control function. If you find an error, flag it and propose a correction — don't silently post the fix.
