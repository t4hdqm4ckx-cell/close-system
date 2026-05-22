---
name: materiality-thresholds
description: "Use this skill to determine whether a financial item is material, trivial, or requires investigation during month-end close work. Triggers include phrases like 'is this material', 'should I investigate this variance', 'what's the materiality threshold', or any task involving variance analysis, reconciliation exception triage, or close exception prioritization. Use whenever the question is 'is this big enough to act on'. Shared across the Reconciliation, JE Review, and Flux & Variance agents."
---

# Materiality and trigger thresholds

## Why this matters

Close work is fundamentally about deciding what is worth investigating versus what to let go. Material items must be investigated and resolved before close. Trivial items can be noted but do not require action. Items in between are judgment calls.

Without thresholds every penny gets the same treatment — that is how a 5-day close becomes a 12-day close.

## Lumina default thresholds (FY2026)

These are calibrated to Lumina's annual revenue of approximately $1.8B. For other clients, recompute as a function of their financials. Overrides live in `/config/materiality.yaml`.

### Income statement (P&L) flux

A P&L variance qualifies for commentary when BOTH conditions are true:

- **Month-over-month**: change exceeds $250,000 in absolute terms AND exceeds 5% versus prior month
- **Budget vs actual**: variance exceeds $500,000 in absolute terms AND exceeds 5% versus budget

Either condition alone is not sufficient. A $1M variance that is 0.2% of an account is not interesting. A 30% swing on a $100K account is not interesting.

### Balance sheet rec exceptions

An item on a balance sheet reconciliation is an exception when ANY of:

- Unreconciled amount exceeds $100,000
- Item is older than 30 days without resolution
- Amount exceeds $250,000, regardless of age (auto-investigate)

### Journal entry review triggers

A journal entry is flagged for enhanced review when ANY of:

- Amount exceeds $250,000
- Posted on a weekend or holiday
- Round-number amount at or above $100,000 (e.g., exactly $500,000)
- Missing supporting documentation reference
- Posted by a user outside the standard close team
- Account combination unusual for the entity (statistical pattern check)

### Trivial threshold

$450,000 (5% of performance materiality). Items below this can be noted but do not require commentary, investigation, or proposed action.

### Performance materiality

$9,000,000. The threshold above which any single misstatement is presumed material to the financial statements. Used for audit-level work and SOX testing scope, not typically invoked during routine close.

## Classification taxonomy

Every variance and reconciliation item should be tagged with one of:

- **Escalate** — exceeds performance materiality or has audit / SOX implications; surface to Controller or CFO
- **Investigate** — exceeds the trigger and is below performance materiality; requires commentary and proposed action this close
- **Note** — below trigger but worth flagging; appears in workpaper, not in executive summary
- **Trivial** — below trivial threshold; excluded from reporting

## How to apply

When triaging a list of items, sort by absolute amount descending. For each item:

1. Apply the relevant trigger test (P&L flux, BS rec, JE review)
2. Assign classification
3. For Investigate and Escalate, draft proposed action

Include the threshold test result and classification in your output so a reviewer can verify the triage. Example:

> Marketing - Performance variance of $3,000,000 (20.0% vs budget) — INVESTIGATE — exceeds both BvA triggers (> $500K and > 5%)

## What this skill is NOT

- Not a replacement for professional judgment. Thresholds are starting points; some items below threshold still warrant investigation if they are trending oddly or relate to known issues.
- Not for audit-level or external reporting materiality. Those use different (typically higher) thresholds.
- Not a substitute for the audit committee's pre-established materiality. If the client has audited materiality on file, use that instead.
