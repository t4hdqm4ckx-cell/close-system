# Close System — Multi-Agent Month-End Close

**A multi-agent AI system that runs the month-end close as a managed process, not a fire drill.**

Built on Anthropic's Claude as a consulting portfolio piece demonstrating AI-assisted Finance and FP&A workflows for Controllers, CFOs, and FP&A leaders.

---

## The problem

Most Controllers spend BD1–BD2 on process setup and BD3–BD5 firefighting — chasing reconciling items, tracking down JE backup, and writing variance commentary that took four hours and nobody reads. The close is reactive by default.

This system makes it proactive. Five specialized agents handle the analytical work — reconciliations, JE review, variance commentary, and close package assembly — while the Controller focuses on decisions, not data gathering.

---

## Architecture

Five agents on a shared layer of Skills, MCP connectors, and data sources. Specialists do not invoke each other — the Close Orchestrator owns sequencing and routes structured outputs to the right human owners.

```
┌─────────────────────────────────────────┐
│           Close Orchestrator            │
│   Calendar · Status · Comms · Approvals │
└────────────────┬────────────────────────┘
                 │
     ┌───────────┼───────────┬──────────────┐
     ▼           ▼           ▼              ▼
┌─────────┐ ┌─────────┐ ┌─────────┐ ┌──────────────┐
│  Recon  │ │   JE    │ │  Flux   │ │    Close     │
│  Agent  │ │Reviewer │ │Variance │ │  Reporting   │
└─────────┘ └─────────┘ └─────────┘ └──────────────┘
                 │
     ┌───────────┴────────────────────────────┐
     │     Skills · MCP Connectors · Data     │
     └────────────────────────────────────────┘
```

| Agent | Role | Primary outputs |
|---|---|---|
| **Close Orchestrator** | Owns the close calendar, sequences specialists, manages communications and human approvals | Daily status memo, blocker escalations, final close attestation |
| **Reconciliation** | Bank, IC, prepaids, accruals, AR/AP tie-out | Workpapers, unreconciled item lists, proposed JEs |
| **JE Reviewer** | Accuracy, completeness, SOX-relevant attributes, pattern detection | JE review memo, exception list, posting recommendations |
| **Flux & Variance** | MoM and BvA flux at the GL level with first-pass commentary | Flux file, variance commentary, anomaly flags |
| **Close Reporting** | Assembles the final close package from upstream outputs | Executive memo (Word), KPI dashboard (Excel), board slides (PowerPoint) |

**Human-in-the-loop:** no JE is posted, no email is sent externally, and no close is declared complete without explicit human approval. Agents propose; humans dispose.

---

## Demo walkthrough

A recommended five-step sequence for showing this to a prospective client:

**1. Open with the pain**
> "Most Controllers spend BD3–BD5 firefighting reconciling items, chasing JE backup, and writing flux commentary that nobody reads. The close is a fire drill instead of a managed process."

**2. Show the Orchestrator**
Open the daily status memo. Show the close calendar, task owners, and blocker list. Frame it as "the close as a project with a status report, not a series of emails."

**3. Show the Reconciliation Agent**
Feed it the trial balance and bank statement. Watch it produce a workpaper that flags the 67-day outstanding check, proposes three adjusting JEs, and generates an audit-traceable memo — in seconds, not hours.

**4. Show the Flux Agent**
Point it at the November trial balance. It identifies the $3M performance marketing overage, attributes it to the Q4 campaign pull-forward, and drafts first-pass commentary ready for FP&A Manager review.

**5. Close on the audit trail**
Open `/close-cycles/2026-11/06-audit-trail/`. Show that every output is traceable to its source files, timestamped, and has a human reviewer sign-off field. Most off-the-shelf finance AI tools cannot produce a defensible audit trail.

The prospect's question will be: *"How does this connect to our ERP?"* — that is the buying signal. See the section below.

---

## Sample outputs

The `/close-cycles/2026-11/02-reconciliations/` folder contains reference outputs from a complete Reconciliation Agent run against the synthetic dataset:

- **`2026-11_LuminaUS_BankRec_v1.xlsx`** — six-tab bank rec workpaper with live formulas, outstanding item aging, exception list, proposed JEs, and audit trail
- **`2026-11_LuminaUS_Recon_v1_memo.md`** — Controller-facing summary covering bank, intercompany, and accrual findings with proposed adjusting entries

These are the artifacts a prospect downloads and compares to what their team produces today.

---

## Tech stack

| Layer | Technology |
|---|---|
| AI model | Claude Sonnet (Anthropic) |
| Agent development | Claude Code (CLI) |
| Agent deployment | Claude Projects (claude.ai) |
| Skills | Custom SKILL.md files |
| Project config | CLAUDE.md |
| MCP connectors | Google Drive, Gmail, Google Calendar |
| Workpaper generation | Python, openpyxl |
| Configuration | YAML |
| Version control | Git / GitHub |

---

## Repository structure

```
close-system/
├── CLAUDE.md                        # Project conventions, architecture, operating rules
├── README.md                        # This file
├── agents/
│   ├── orchestrator/AGENT.md        # Close Orchestrator definition
│   ├── reconciliation/AGENT.md      # Reconciliation Agent — v0.1.0 (built)
│   ├── je-reviewer/AGENT.md         # JE Reviewer definition
│   ├── flux-variance/AGENT.md       # Flux & Variance definition
│   └── close-reporting/AGENT.md     # Close Reporting definition
├── skills/
│   ├── reconciliation/SKILL.md      # v0.1.0 (built)
│   ├── materiality-thresholds/      # v0.1.0 (built)
│   ├── je-review/SKILL.md           # v0.1.0 (built)
│   ├── flux-analysis/SKILL.md       # v0.1.0 (built)
│   ├── close-reporting/SKILL.md     # v0.1.0 (built)
│   └── finance-conventions/SKILL.md # v0.1.0 (built)
├── config/
│   ├── materiality.yaml             # Binding thresholds for all agents
│   ├── entity-map.yaml              # Entity codes, currencies, IC pairs
│   └── close-calendar.yaml          # BD sequence and agent invocation order
├── data/
│   └── synthetic/
│       └── lumina_close_dataset.xlsx # 10-sheet demo dataset, 6 embedded findings
├── close-cycles/
│   └── 2026-11/                     # November 2026 reference close
│       ├── 02-reconciliations/      # Bank rec workpaper + memo (reference outputs)
│       └── 06-audit-trail/          # Agent transcripts and sign-off fields
└── scripts/
    └── build_dataset.py             # Regenerates the synthetic dataset
```

---

## Quick start

```bash
# Clone and open in Claude Code
git clone https://github.com/[your-username]/close-system.git
cd close-system
claude
```

Claude Code reads `CLAUDE.md` on startup. First prompt to try:

```
Read CLAUDE.md and summarize the project, then reconcile cash for LuminaUS,
period Nov-26, using the synthetic dataset. Produce a workpaper and memo.
```

Compare the output to the reference files in `/close-cycles/2026-11/02-reconciliations/`.

---

## Connecting to your ERP

**This is the question every prospect asks.** Here is the honest answer:

**Phase 1 — File drops (weeks 1–2 of an engagement)**
Agents read from Excel or CSV files dropped into a shared Google Drive or SharePoint folder. No ERP integration required. The Controller exports the TB and sub-ledgers as they normally would; the agents consume those files. This is how the demo runs.

**Phase 2 — MCP connectors (weeks 3–6)**
Wire the agents directly to source systems via Model Context Protocol connectors. Priority integrations:

| System | Connector | What it unlocks |
|---|---|---|
| NetSuite | NetSuite MCP | Live TB pull, JE posting approval workflow |
| Sage Intacct | Intacct MCP | GL detail, sub-ledger feeds |
| Workday Financials | Workday MCP | Journal entries, close tasks |
| QuickBooks | QBO MCP | SMB deployments |
| Google Drive | Native connector | File drop workflow, close package storage |
| Gmail | Native connector | Close communications, approval routing |

Most client engagements reach a working pilot in **4–6 weeks**. Phase 1 runs on file drops; Phase 2 replaces the file layer with live connectors. The agent logic does not change between phases — only the data access layer.

---

## Build status

| Component | Status | Version |
|---|---|---|
| Reconciliation Agent | ✅ Built | v0.1.0 |
| JE Reviewer Agent | 📋 Defined | — |
| Flux & Variance Agent | 📋 Defined | — |
| Close Reporting Agent | 📋 Defined | — |
| Close Orchestrator | 📋 Defined | — |
| Reconciliation skill | ✅ Built | v0.1.0 |
| Materiality thresholds skill | ✅ Built | v0.1.0 |
| JE Review skill | ✅ Built | v0.1.0 |
| Flux Analysis skill | ✅ Built | v0.1.0 |
| Close Reporting skill | ✅ Built | v0.1.0 |
| Finance Conventions skill | ✅ Built | v0.1.0 |
| Synthetic dataset | ✅ Built | — |
| Reference outputs (Nov-26) | ✅ Built | — |

---

## About

Built by **Kamil Kolacek** as a consulting portfolio piece demonstrating AI-assisted Finance and FP&A workflows.

This is not a replacement for the close team. It is a force multiplier — handling the analytical groundwork so Controllers and FP&A leaders can focus on decisions, client relationships, and the judgment calls that actually require human expertise.

For inquiries about deploying this for your organization, connect on [LinkedIn](https://linkedin.com/in/[your-handle]).
