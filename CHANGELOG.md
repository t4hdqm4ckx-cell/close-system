# Changelog

All notable changes to the close system are documented here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versioning follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

---

## [0.3.0] — 2026-05-25

### Added
- `docs/` folder with architecture decisions, prospect demo script, and MCP integration guide
- `prompts/` folder with test prompts for all five agents — basic, targeted, and edge case levels
- `.github/workflows/validate.yml` — GitHub Actions CI workflow that validates the dataset, YAML configs, and all agent/skill definitions on every push to main
- `scripts/validate.py` — standalone validation script (also runs in CI)
- `scripts/push.sh` — reusable script to stage, commit, and push in one command
- `config/materiality.yaml` — expanded with calibration guide, account-specific overrides, JE approval tiers, entity-specific overrides, and SOX/audit thresholds
- `README.md` — full project-level README with architecture diagram, demo walkthrough, sample output references, tech stack, ERP integration section, and build status table
- `skills/*/README.md` — README files for all six skill folders
- `skills/je-review/SKILL.md` — JE review procedures, SOX attributes, pattern detection rules
- `skills/flux-analysis/SKILL.md` — MoM and BvA methodology, commentary templates by account category, driver attribution logic
- `skills/close-reporting/SKILL.md` — executive memo structure, KPI dashboard layout, board snippet templates, writing standards
- `skills/finance-conventions/SKILL.md` — shared conventions loaded by all five agents: chart of accounts, entity codes, sign conventions, file naming, period naming

### Changed
- `config/materiality.yaml` — replaced stub with full calibration guide, account overrides, approval tiers, entity overrides, and audit thresholds

---

## [0.2.0] — 2026-05-22

### Added
- `agents/orchestrator/AGENT.md` — Close Orchestrator definition: role, sequencing logic, BD-by-BD actions, structured output envelope, invocation patterns
- `agents/je-reviewer/AGENT.md` — JE Reviewer definition: review criteria, SOX attributes, pattern detection, severity triage, output contract
- `agents/flux-variance/AGENT.md` — Flux & Variance Agent definition: MoM and BvA methodology, driver attribution, anomaly detection, output contract
- `agents/close-reporting/AGENT.md` — Close Reporting Agent definition: assembly checklist, deliverable specs, synthesis principles, output contract
- `skills/reconciliation/SKILL.md` — bank, IC, prepaid, accrual, and AR/AP rec procedures; JE proposal format; output envelope
- `skills/materiality-thresholds/SKILL.md` — shared triage logic: P&L flux triggers, BS rec exception thresholds, JE review triggers, classification taxonomy

---

## [0.1.0] — 2026-05-21

### Added
- `CLAUDE.md` — project conventions, five-agent architecture, materiality thresholds, close calendar, chart of accounts, build surfaces, output conventions, audit trail spec, demo flow script
- `agents/reconciliation/AGENT.md` — Reconciliation Agent v0.1.0: role, skills, inputs, outputs, sequencing (BD2), structured output envelope, invocation patterns
- `agents/reconciliation/build_bank_rec_workpaper.py` — workpaper builder script encoding the agent's bank rec logic against the synthetic dataset
- `data/synthetic/lumina_close_dataset.xlsx` — 10-sheet synthetic dataset for Lumina Streaming Co., November 2026 close, with six intentionally seeded findings:
  - Bank rec: outstanding check #4521 aged 67 days ($45,000)
  - IC: $12.4M LuminaUS/LuminaEMEA mismatch
  - Accruals: $850K Oct-26 marketing accrual not reversed
  - AR aging: Vertex Media $2.3M in 90+ day bucket
  - JE log: JE-2026-11-0042 — Saturday posting, round $1.5M, no support doc
  - P&L: Performance Marketing $3.0M unfavorable to budget (-20%)
- `close-cycles/2026-11/02-reconciliations/2026-11_LuminaUS_BankRec_v1.xlsx` — reference bank rec workpaper: six tabs, 9 formulas, zero formula errors, adjusted balances reconcile to $142,505,700
- `close-cycles/2026-11/02-reconciliations/2026-11_LuminaUS_Recon_v1_memo.md` — reference reconciliation memo: bank, IC, and accrual findings, five exceptions, proposed adjusting JEs
- `config/materiality.yaml` — initial materiality threshold config (stub; expanded in v0.3.0)
- `config/entity-map.yaml` — entity codes, functional currencies, IC account pairs for LuminaUS, LuminaEMEA, LuminaAPAC
- `config/close-calendar.yaml` — BD sequence, phase definitions, agent invocation order
- `scripts/build_dataset.py` — synthetic dataset builder; regenerates `lumina_close_dataset.xlsx`
- `.gitignore` — excludes `/data/client/`, build artifacts, editor noise, sensitive files

---

## Roadmap

| Version | Target | Scope |
|---|---|---|
| 0.4.0 | TBD | Flux & Variance Agent v0.1.0 — skill iteration and sample outputs |
| 0.5.0 | TBD | JE Reviewer Agent v0.1.0 — skill iteration and sample outputs |
| 0.6.0 | TBD | Close Reporting Agent v0.1.0 — executive memo, KPI dashboard, board slides |
| 0.7.0 | TBD | Close Orchestrator v0.1.0 — sequencing, status memos, close attestation |
| 1.0.0 | TBD | Full end-to-end close cycle — all five agents, MCP connectors, client pilot ready |
