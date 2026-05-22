# Finance conventions skill

Shared financial conventions loaded by all five close agents — chart of accounts, entity codes, sign conventions, period naming, file naming, currency handling, and intercompany rules.

## What this skill covers

- Company context (Lumina Streaming Co., fiscal year, reporting currency, accounting standard)
- Entity codes (LuminaUS, LuminaEMEA, LuminaAPAC) and their functional currencies
- Chart of accounts structure (six-digit GL, first-digit category mapping, key account list)
- Sign conventions (debit/credit normal balances, favorable/unfavorable for variance reporting)
- Period naming conventions (YYYY-MM for files, Mon-YY for narrative, BD1–BD5 for close calendar)
- File naming conventions (`YYYY-MM_<entity>_<artifact>_v<n>.<ext>`)
- Folder structure per close cycle
- Supporting documentation naming prefixes
- Intercompany conventions
- Agent output envelope conventions (timestamp format, amount fields, severity values)

## Used by

All five agents — load alongside any primary skill. This is the shared foundation that keeps conventions consistent across the system.

## Trigger phrases

Any task involving GL account coding, entity identification, period references, file naming, or currency handling. When in doubt about a convention, read this skill first.

## Contents

See `SKILL.md` for the full skill — all conventions in one place.
