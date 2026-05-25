# Prompts

Test prompts for each of the five close agents. Use these to invoke agents in Claude Code or Claude Projects, validate output quality, and onboard a client's team.

## How to use

**In Claude Code** — `cd` into the repo root, run `claude`, then paste the prompt directly.

**In Claude Projects** — open the relevant agent's Project on claude.ai and paste the prompt into the chat.

## Files

| File | Agent | Invoke from |
|---|---|---|
| `reconciliation.md` | Reconciliation Agent | Claude Code or Claude Project |
| `je-reviewer.md` | JE Reviewer | Claude Code or Claude Project |
| `flux-variance.md` | Flux & Variance Agent | Claude Code or Claude Project |
| `close-reporting.md` | Close Reporting Agent | Claude Code or Claude Project |
| `orchestrator.md` | Close Orchestrator | Claude Code or Claude Project |

## Testing against the synthetic dataset

All prompts reference the Lumina Streaming Co. synthetic dataset at `/data/synthetic/lumina_close_dataset.xlsx`. The dataset contains six intentionally seeded findings — use the expected findings below each prompt to verify the agent is working correctly.

## Prompt categories

Each file organizes prompts into three levels:

- **Basic** — single task, clean path, used for first-run validation
- **Targeted** — drill into a specific finding or account
- **Edge case** — tests where the agent should escalate or flag rather than proceed
