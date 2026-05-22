# Reconciliation skill

Procedures and output contracts for balance sheet account reconciliations during the month-end close.

## What this skill covers

- Bank reconciliation (GL cash vs. bank statement)
- Intercompany matching (receivable/payable mirror across entities)
- Prepaid amortization verification
- Accrual schedule review and stale accrual detection
- AR/AP tie-out to sub-ledger

## Used by

Reconciliation Agent (primary). Referenced by the Close Orchestrator when triaging specialist output envelopes.

## Trigger phrases

"Reconcile this account", "do a bank rec", "tie out the prepaid schedule", "check intercompany balances", "review accruals", "recon workpaper"

## Contents

See `SKILL.md` for the full skill — reconciliation patterns, materiality application, JE proposal format, output file structure, and common pitfalls.
