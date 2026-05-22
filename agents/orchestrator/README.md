# Orchestrator Agent

**Status:** Pending. Not yet built.

See `/CLAUDE.md` section 1 for this agent's intended role, primary outputs, and place in the close sequence.

## Build order

Per the architecture-first plan, the build sequence is:

1. Reconciliation (built — v0.1.0)
2. Flux & Variance
3. JE Reviewer
4. Close Reporting
5. Close Orchestrator (last, once all specialist contracts are stable)

When this agent is built, it will follow the same structure as `/agents/reconciliation/`:

- `AGENT.md` — role, skills loaded, inputs, outputs, sequencing, output envelope
- supporting code in this folder
