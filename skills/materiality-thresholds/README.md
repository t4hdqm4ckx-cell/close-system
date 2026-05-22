# Materiality thresholds skill

Shared triage logic for determining whether a financial item is material, trivial, or requires investigation. Used by all five close agents.

## What this skill covers

- P&L flux trigger tests (MoM and BvA)
- Balance sheet rec exception thresholds
- Journal entry review triggers
- Classification taxonomy: Escalate / Investigate / Note / Trivial
- Lumina default thresholds (calibrated to ~$1.8B annual revenue)

## Used by

All five agents — Reconciliation, JE Reviewer, Flux & Variance, Close Reporting, and Close Orchestrator. Load this skill alongside any primary skill to apply consistent triage across the close.

## Trigger phrases

"Is this material", "should I investigate this variance", "what's the materiality threshold", "triage these exceptions", "is this worth flagging"

## Contents

See `SKILL.md` for the full skill — threshold values, how to apply them, classification taxonomy, and what this skill is not.
