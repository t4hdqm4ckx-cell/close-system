# Close System — Multi-Agent Month-End Close

Consulting portfolio demo for deploying Claude across the close cycle. See `CLAUDE.md` for full project conventions, architecture, and demo flow.

## Quick start

```bash
cd close-system
claude
```

Claude Code reads `CLAUDE.md` automatically on startup and picks up skills in `/skills/`.

## What's here

- **Reconciliation Agent (v0.1.0)** — bank, IC, accrual, prepaid, AR/AP reconciliations. See `/agents/reconciliation/AGENT.md`.
- **Synthetic dataset** — Lumina Streaming Co., Nov-26 close, with six embedded findings designed to surface during agent runs. See `/data/synthetic/`.
- **Sample output** — a complete bank rec workpaper and reconciliation memo demonstrating the agent's expected output quality. See `/close-cycles/2026-11/02-reconciliations/`.

## Build status

| Agent | Status |
|---|---|
| Reconciliation | v0.1.0 |
| JE Reviewer | Pending |
| Flux & Variance | Pending |
| Close Reporting | Pending |
| Close Orchestrator | Pending |

## Try the Reconciliation Agent

Prompt to Claude Code:

> Reconcile cash for LuminaUS, period Nov-26. Use the synthetic dataset in `/data/synthetic/`. Produce a workpaper and memo, write outputs to `/close-cycles/2026-11/02-reconciliations/`, and return the structured envelope.

Compare the agent's output to the reference outputs already in `/close-cycles/2026-11/02-reconciliations/`. Iterate `/skills/reconciliation/SKILL.md` until the gap closes.

## Regenerating the synthetic dataset

```bash
python scripts/build_dataset.py
```

Modify the script to adjust embedded findings, materiality, or company size.
