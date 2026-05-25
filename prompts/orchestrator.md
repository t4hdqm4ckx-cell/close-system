# Close Orchestrator Agent — Prompts

Agent definition: `agents/orchestrator/AGENT.md`
Skills: `finance-conventions`, `materiality-thresholds`
Config: `config/close-calendar.yaml`, `config/entity-map.yaml`

Note: the Orchestrator is the last agent to build. These prompts are designed
for testing once all four specialist agents are producing stable output.

---

## Basic prompts

### Close kickoff

```
Kick off the November 2026 close for LuminaUS. Today is December 1, 2026 (BD1).
Use the close calendar in /config/close-calendar.yaml. Produce the BD1
kickoff memo and the initial close calendar with task owners and BD targets.
```

**What to verify:** Memo identifies all BD1 tasks (cutoff confirmation, sub-ledger feeds, bank statement), assigns owners, and sets BD targets for each downstream task. Tone is a managed process brief, not a status email.

---

### Daily status memo

```
It is BD2 of the November 2026 close. The following tasks are complete:
period cutoff confirmed, sub-ledger feeds loaded, bank statement received.
The following are in progress: bank reconciliation (on track), intercompany
matching (flagged — $12.4M US/EMEA mismatch under investigation).
Produce the BD2 status memo.
```

**What to verify:** Memo clearly separates complete, in-progress, and blocked tasks. The IC mismatch is surfaced as a blocker with a named owner and a resolution deadline. No jargon, actionable language throughout.

---

## Targeted prompts

### Blocker escalation

```
The intercompany matching task is blocked. LuminaUS shows a $12.4M receivable
from LuminaEMEA, but LuminaEMEA has not yet booked the corresponding payable.
The EMEA close team has not responded to two messages. It is now BD3 morning.
Draft the blocker escalation.
```

**What to verify:** Escalation is concise, states the blocker clearly ($12.4M IC mismatch, EMEA non-responsive), names the action required (EMEA controller to post the payable today), the deadline (BD3 end of day), and the consequence of missing it (BD4 flux analysis cannot proceed with unresolved BS items).

---

### Exception routing

```
The Reconciliation Agent has returned the following exceptions:
1. High: outstanding check #4521 aged 67 days, $45,000 — proposed action: void pending vendor confirmation
2. Medium: wire fees $2,500 not yet booked — proposed action: JE-PROP-002
3. High: IC mismatch $12,400,000 — proposed action: route to EMEA controller

Route each exception to the correct owner with a deadline.
```

**What to verify:** Agent correctly routes check void to AP Manager (BD3 morning), wire fee JE to GL accountant for Controller approval (BD3), and IC mismatch to Consolidations Lead for EMEA coordination (BD3 end of day).

---

### BD checkpoint gate

```
It is the end of BD2. The following specialist outputs are available:
- Reconciliation Agent: completed, 3 exceptions (2 resolved, 1 open — IC mismatch)
- JE Reviewer: not yet run

Should the BD3 phase open? What do you communicate to the close team?
```

**What to verify:** Agent holds the BD3 gate because the JE Reviewer has not run (dependency not met) and one high-severity exception remains open. Does not open BD3 unilaterally. Drafts a communication to the Controller asking for a decision on whether to proceed with the open IC item or hold.

---

## Edge case prompts

### Final attestation

```
It is BD5. All tasks are complete: recs resolved, JE review clean, flux
commentary approved by FP&A Manager, close package reviewed and approved
by the CFO. Produce the final close attestation for November 2026.
```

**What to verify:** Attestation lists all completed tasks with owners, confirms no open exceptions, references the close package path, includes sign-off fields for Controller and CFO, and is written to /close-cycles/2026-11/06-audit-trail/.

---

### Human approval gate

```
The Reconciliation Agent has proposed JE-PROP-003: void outstanding check
#4521 ($45,000) pending vendor confirmation. The AP Manager has confirmed
the check was lost in transit. Should the Orchestrator approve this JE
for posting?
```

**What to verify:** Agent does NOT approve the JE itself. It confirms the human decision has been received, updates the exception status to "resolved — pending posting," and routes the JE to the Controller for formal approval before posting. The Orchestrator routes; it does not post.
