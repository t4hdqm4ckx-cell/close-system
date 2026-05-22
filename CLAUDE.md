# Month-End Close Agent System

> Multi-agent system for month-end close automation. Built as a consulting portfolio piece demonstrating AI-assisted Finance / FP&A workflows for Controllers, CFOs, and FP&A leaders.

## 1. Architecture overview

Five agents on a shared layer of Skills, MCP connectors, and data sources:

| Agent | Role | Primary outputs |
|---|---|---|
| **Close Orchestrator** | Owns the close calendar, sequences specialists, manages communications and human approvals | Daily status memo, blocker escalations, final close attestation |
| **Reconciliation** | Balance sheet recs: bank, IC, prepaids, accruals, AR/AP tie-out | Workpapers per account, unreconciled item lists, proposed JEs |
| **JE Reviewer** | Reviews journal entries for accuracy, completeness, SOX-relevant attributes | JE review memo, exception list, posting recommendations |
| **Flux & Variance** | MoM and budget-vs-actual flux at the GL level, with first-pass commentary | Flux file, variance commentary, anomaly flags |
| **Close Reporting** | Assembles the final close package from upstream outputs | Executive memo (Word), KPI dashboard (Excel), board snippets (PowerPoint) |

**Sequencing principle:** specialist agents do not invoke each other. The Orchestrator owns sequencing and routes their structured outputs (each agent returns a JSON envelope with `result`, `exceptions[]`, and `_metadata`).

**Human-in-the-loop:** no JE is posted, no email is sent externally, and no close is declared complete without explicit human approval. Agents propose, humans dispose.

## 2. Domain conventions

### Demo company

`Lumina Streaming Co.` — synthetic streaming/media company used throughout the demo.

- FY2026, fiscal year end December
- Annual revenue ~$1.8B, monthly run-rate ~$150M
- Three entities: LuminaUS, LuminaEMEA, LuminaAPAC
- ~600 employees
- Revenue mix: ~70% subscription, ~28% advertising, ~2% other

### Materiality thresholds

Defaults for Lumina (calibrate per client in `config/materiality.yaml`):

- Performance materiality: $9M (≈50bps of annual revenue)
- Trivial threshold: $450K (5% of performance materiality)
- P&L flux trigger: > $250K AND > 5% MoM (both must be true)
- BvA flux trigger: > $500K AND > 5% vs budget
- Balance sheet rec exception: any unreconciled item > $100K OR > 30 days old

### Close calendar

Standard 5-business-day close. BD1 = first business day after period end.

- BD1: Cutoff, sub-ledger feeds, calendar kickoff
- BD2: Bank recs, intercompany matching, accruals
- BD3: Prepaid amortization, content amortization, JE review pass 1
- BD4: Flux analysis, TB review, adjusting entries
- BD5: Final TB, close package, reporting submission

### Chart of accounts

US GAAP. Six-digit GL accounts. First digit denotes statement category:

- `1xxxxx` Assets
- `2xxxxx` Liabilities
- `3xxxxx` Equity
- `4xxxxx` Revenue
- `5xxxxx` COGS
- `6xxxxx` Operating expenses
- `7xxxxx` Non-operating items
- `8xxxxx` Tax

## 3. Build surfaces

| Surface | Used for |
|---|---|
| **Claude Code** (this repo) | Agent development, Skill iteration, dataset generation, version control |
| **Claude Projects** (claude.ai) | Productized demo. One Project per agent. System prompt + Skills + project knowledge files |
| **Cowork** | Reserved for client engagements where a non-technical user wants desktop-resident workflows. Not used for the portfolio demo |
| **MCP connectors** | Phase 2 — wire to real source systems. Initial priority: Google Drive, Claude in Excel, Gmail. Later: ERP MCPs (NetSuite, Sage Intacct, QuickBooks) |

## 4. Skills (in `/skills`)

Each skill follows the standard SKILL.md format. Skills are reusable across agents and Projects.

- `reconciliation/` — Procedures for bank, IC, prepaid, accrual recs. JE proposal format. Workpaper templates.
- `je-review/` — SOX-relevant review criteria. Supporting documentation checklist. Pattern detection rules (round numbers, weekend posting, unusual amounts).
- `flux-analysis/` — MoM and BvA methodology. Commentary templates by account category. Driver attribution logic.
- `close-reporting/` — Executive memo structure. KPI dashboard layout. Board snippet templates.
- `materiality-thresholds/` — Shared logic for material-vs-trivial classification. Used by all specialists.
- `finance-conventions/` — Shared GAAP conventions, account hierarchy, date formats, entity codes.

## 5. Repository layout

```
/close-system/
├── CLAUDE.md                       # this file
├── README.md                       # public-facing overview
├── /agents/
│   ├── orchestrator/
│   ├── reconciliation/
│   ├── je-reviewer/
│   ├── flux-variance/
│   └── close-reporting/
├── /skills/                        # see section 4
├── /config/
│   ├── materiality.yaml
│   ├── entity-map.yaml
│   └── close-calendar.yaml
├── /data/
│   ├── synthetic/                  # demo dataset (lumina_close_dataset.xlsx)
│   └── client/                     # gitignored; real client data
├── /close-cycles/
│   └── 2026-11/                    # one folder per close period
│       ├── 01-inputs/
│       ├── 02-reconciliations/
│       ├── 03-journal-entries/
│       ├── 04-flux-analysis/
│       ├── 05-close-package/
│       └── 06-audit-trail/
└── /scripts/                       # utilities (recalc, validators, exporters)
```

## 6. Output conventions

**File naming:** `YYYY-MM_<entity>_<artifact>_v<n>.<ext>`
Example: `2026-11_LuminaUS_BankRec_v1.xlsx`

**Agent output envelope** — every agent returns:

```json
{
  "result": { ... },
  "exceptions": [
    { "severity": "high|medium|low", "category": "...", "description": "...", "proposed_action": "..." }
  ],
  "_metadata": {
    "agent": "reconciliation",
    "version": "0.1.0",
    "run_timestamp": "2026-12-02T14:32:18Z",
    "sources": [
      { "path": "/data/synthetic/lumina_close_dataset.xlsx", "sheet": "TrialBalance", "sha256": "..." }
    ],
    "human_reviewer": null
  }
}
```

**Audit trail:** every artifact placed in `06-audit-trail/` includes the agent transcript, source file hashes, and reviewer sign-off field. This is the demo's most differentiated feature — most off-the-shelf finance AI tools cannot produce a defensible audit trail.

## 7. Data access

**Current phase (synthetic):** source of truth is `/data/synthetic/lumina_close_dataset.xlsx`. All agents read from this workbook.

**Client phase:** swap synthetic dataset for MCP-backed connectors. Each agent's data-access layer is isolated in `/agents/<name>/data.py` so the swap is local to that module.

## 8. Demo flow (for prospects)

Recommended walkthrough script when showing this to a prospective client:

1. **Open with the pain.** "Most Controllers spend BD3–BD5 firefighting reconciling items, chasing JE backup, and writing flux commentary that nobody reads."
2. **Show the Orchestrator** — daily status memo, blocker list. Frame this as "the close as a managed process, not a fire drill."
3. **Show the Reconciliation Agent** producing a bank rec from a TB + bank statement, with the long-outstanding item flagged.
4. **Show the Flux Agent** writing first-pass commentary on the marketing overspend, attributing it to the driver.
5. **Close on the audit trail.** Open the `06-audit-trail/` folder and show that every output is traceable, sourced, and human-reviewable.

The prospect's question will be "how does this connect to our ERP?" — that is the buying signal. Answer: "Phase 1 we use file drops via Drive or SharePoint; Phase 2 we wire in your NetSuite/Sage/Workday via MCP. Most engagements run 4–6 weeks to a working pilot."

## 9. What this project is NOT

- Not a replacement for the close team — it is a force multiplier for the existing team.
- Not posting JEs automatically. Every entry routes through human approval.
- Not a generic chatbot. Each agent has a narrow remit and a structured output contract.
- Not connected to live financial systems in the demo. Phase 2 work.
