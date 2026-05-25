# Architecture decisions

Key design choices behind the close system and the reasoning for each. Useful context when onboarding a client's engineering team or explaining the system to a technical evaluator.

---

## Why five agents, not one

A single general-purpose agent for the entire close would work for simple demos but fails in production for three reasons.

**Context window.** A month-end close involves a trial balance, multiple sub-ledgers, bank statements, JE logs, prior period comparisons, and budget data. Loading all of it into one agent's context simultaneously is expensive and increases the chance of the agent confusing data across accounts or periods.

**Quality.** Specialist agents produce better work within a narrow domain. The JE Reviewer doesn't need to know how to write variance commentary. The Reconciliation Agent doesn't need the board slide templates. Keeping each agent's scope tight keeps its skill set tight.

**Auditability.** With separate agents, every output is attributed to a specific agent with a specific remit. When a finding is wrong, you know which agent to fix. With a single agent, every output is a black box.

The five-agent split maps directly to the five phases of the close: recs (BD2), JE review (BD3), flux (BD4), reporting (BD5), and orchestration (BD1–BD5). This is not an arbitrary architecture — it mirrors how close teams are actually organized.

---

## Why specialist agents don't invoke each other

Specialist agents return structured output envelopes to the Orchestrator. The Orchestrator routes. Specialists do not call each other directly.

This prevents cascading failures. If the Reconciliation Agent encounters an unexpected input format and errors, the Orchestrator surfaces the failure cleanly. If agents called each other, a single failure could propagate silently through the chain before anyone noticed.

It also makes the system testable in isolation. You can run the Reconciliation Agent against the synthetic dataset without standing up the Flux Agent or the Reporting Agent. Each agent has a defined input and output contract; everything else is the Orchestrator's problem.

---

## Why the Orchestrator is built last

The Orchestrator coordinates specialists whose output contracts must be stable before coordination logic can be written. Building the Orchestrator first — before the specialists exist — produces an orchestrator that coordinates nothing real and has to be rewritten as specialists come online.

The correct build order is Reconciliation → Flux & Variance → JE Reviewer → Close Reporting → Orchestrator. The Orchestrator is the integrating layer, not the foundation.

---

## Why Claude Projects over Cowork for the demo

Cowork is a desktop-resident tool suited for non-technical users who want drag-and-drop workflows. It is the right surface for a deployed client engagement where a Controller wants to open an app, drop in a trial balance, and get back a reconciliation workpaper without knowing what a system prompt is.

Claude Projects is better for the portfolio demo because:
- Prospects can interact with it directly via browser, with no installation
- Each Project is a self-contained demo unit (one Project per agent)
- The chat interface makes the agent's reasoning visible, which is what prospects need to see to evaluate it
- It's easier to iterate the system prompt and skills without a deployment cycle

Cowork becomes the right choice at client engagement time, particularly for Finance teams that want a desktop-native experience.

---

## Why one Project per agent, not one Project for all five

A single Project with all five agents' instructions in the system prompt creates ambiguity. When you ask it to "run the close," which agent is responding? How does it know when to switch modes?

One Project per agent keeps the system prompt focused, keeps the knowledge base relevant, and makes demos cleaner — you open the Reconciliation Agent Project and it does reconciliations. The separation also mirrors how the close actually works: different team members own different close tasks.

The Orchestrator Project, when built, is the one Project that knows about all the others — it sequences them, not runs them simultaneously.

---

## Why YAML config over hardcoded thresholds

Materiality thresholds, entity codes, and close calendar parameters change per client and per year. Hardcoding them in SKILL.md files or agent prompts means updating multiple files when a client recalibrates their thresholds. YAML config centralizes the values so a single file change propagates everywhere.

It also creates a natural audit trail. The close system references the git SHA of `materiality.yaml` at the time each close ran. If thresholds change between periods, the audit trail shows exactly when and what changed.

---

## Why synthetic data for Phase 1

Two reasons. First, no client data is needed to build and demonstrate the system — the synthetic dataset is purpose-built to surface the findings the demo requires. Second, it removes the sales obstacle of "can I share my financials with you before we've signed anything?" The demo runs on fictional data; the prospect evaluates output quality without a data sharing conversation.

The synthetic data is replaced with live MCP connectors in Phase 2 of a client engagement. The agents don't change — only the data access layer.

---

## Why markdown for memos

The Reconciliation Agent and JE Reviewer produce memos in markdown, not Word. Three reasons:

**Version control.** Markdown is plain text. Git diffs show exactly what changed between v1 and v2 of a memo. Word documents are binary — git shows them as changed but can't show what changed.

**Audit trail.** Plain text files with timestamps and agent metadata are more defensible audit artifacts than binary documents that can be edited without a trace.

**Speed.** Generating a markdown memo is one tool call. Generating a Word document requires the docx skill, which is appropriate for the close package and executive memo — deliverables the CFO signs off on — but is overkill for internal workpapers.

The Close Reporting Agent uses Word and PowerPoint for the final close package because those are the formats a CFO and board expect to receive.
