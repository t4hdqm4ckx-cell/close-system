# Demo script

A step-by-step walkthrough for showing the close system to a prospective client. Total runtime: 20–30 minutes. Adjust depth based on the audience — CFO/Controller audiences want to see output quality; CTO/engineering audiences want to see the architecture.

---

## Before the call

- Open the GitHub repo in a browser tab
- Open the Reconciliation Agent Claude Project in a second tab
- Have the synthetic dataset open in Excel
- Have the bank rec workpaper (`2026-11_LuminaUS_BankRec_v1.xlsx`) open and ready to show
- Have the reconciliation memo (`2026-11_LuminaUS_Recon_v1_memo.md`) open in a text editor

---

## Step 1 — Open with the pain (3 minutes)

Start with the problem, not the solution.

> "Walk me through your current close. How many business days does it take, and where does BD3 through BD5 actually go?"

Let them answer. Most Controllers will describe a version of the same story: the first two days are process setup, and the last three are firefighting — chasing reconciling items, getting JE backup from preparers who've moved on to other things, and writing variance commentary that takes four hours and the CFO reads in four seconds.

Then frame the opportunity:

> "What if BD2 was the hardest day, not BD4? What if by the time you got to BD3, the recs were done, the exceptions were surfaced, and your team was reviewing rather than producing?"

Don't pitch the system yet. Let the pain land first.

---

## Step 2 — Show the architecture (3 minutes)

Open the GitHub README. Walk through the architecture diagram.

> "We built five specialized agents — one for each phase of the close. They don't replace your team; they handle the analytical groundwork so your team can focus on decisions."

Key points to land:
- Each agent has a narrow remit. The Reconciliation Agent doesn't write commentary. The Flux Agent doesn't review JEs. Specialization is what makes the output quality high.
- Human-in-the-loop is not optional. Every proposed JE routes through human approval. No entry posts automatically. Agents propose; your team disposes.
- The audit trail is built in. Every output is traceable to its source, timestamped, and has a reviewer sign-off field.

---

## Step 3 — Show the Reconciliation Agent (8 minutes)

This is the demo's centerpiece. Open the Reconciliation Agent Claude Project.

**First, show the input.** Open the synthetic dataset. Navigate to the BankRec sheet.

> "This is what the agent reads — a trial balance, a bank statement, and some sub-ledger detail. The same files your team exports from the ERP every close."

**Then, run it live.** Type the prompt:

> "Reconcile cash for LuminaUS, period November 2026. Use the dataset in project knowledge. Produce a summary of the bank rec, flag any exceptions, and tell me what journal entries you'd propose."

Let the agent run. Don't narrate while it's working — let the output speak.

**Then, show the workpaper.** Open `2026-11_LuminaUS_BankRec_v1.xlsx`.

> "This is what the agent produces. Six tabs — the rec mechanics, outstanding item aging, exceptions, proposed JEs, and an audit trail. Everything your team would produce, in the format they'd expect."

Point specifically to:
- The 67-day outstanding check flagged in the exceptions tab
- The proposed JEs with full debit/credit coding and confidence labels
- The audit trail tab showing exactly which source files were used

---

## Step 4 — Show the Flux Agent (5 minutes)

Open the Flux & Variance Agent Claude Project (or run it in the same session if not yet built).

> "After recs are done on BD2, the Flux Agent runs on BD4. It looks at the same trial balance and asks: what changed, and why?"

Run this prompt:

> "Run flux analysis for LuminaUS, November 2026. Flag all material BvA variances and draft first-pass commentary."

Point to the Performance Marketing finding:

> "Performance marketing is $3M unfavorable to budget — 20% over. The agent identifies it, attributes it to the Q4 campaign pull-forward, and drafts the commentary. Your FP&A Manager reviews and approves rather than writing from scratch. That's two to three hours of their BD4 back."

---

## Step 5 — Close on the audit trail (3 minutes)

Navigate to `close-cycles/2026-11/06-audit-trail/` in the GitHub repo.

> "This is the part most finance AI tools can't do. Every output is traceable. Every workpaper shows which source files it read, which version of the skill was loaded, and who reviewed it. If your auditors ask 'how did you get this number,' the answer is a file path, not a conversation."

Pause here. Let the implication land for a Controller audience — this is what makes AI-generated close work defensible.

---

## Handling objections

**"How does this connect to our ERP?"**

> "Great question — that's always the buying signal. Phase 1 runs on file drops. Your team exports the TB and sub-ledgers as they normally would, drops them into a Drive folder, and the agents read from there. No ERP integration needed to start. Phase 2 wires directly into your NetSuite or Sage via MCP connectors — that's typically weeks three through six of an engagement. Most pilots go live in four to six weeks total."

See `docs/mcp-integration-guide.md` for the full technical answer.

**"What happens when the agent is wrong?"**

> "That's exactly why human-in-the-loop is non-negotiable. The agent proposes; your team approves. Nothing posts automatically. When the agent is wrong — and it will be, occasionally — a human catches it before it matters. What you've gained is that your team is reviewing work rather than producing it. That's a different kind of error than missing something because you were producing six recs simultaneously."

**"We already have a close tool / BlackLine / FloQast."**

> "This isn't a replacement for your close management platform. Those tools help you track tasks and manage the close calendar. This handles the analytical work that happens inside those tasks — the reconciliation, the JE review, the commentary. They're complementary."

**"Is this secure? Is our data leaving our environment?"**

> "In Phase 1, the agents read from files your team controls — Google Drive or SharePoint. Nothing is sent anywhere you don't control. In Phase 2, we can discuss deployment options including private cloud. Data governance is a first-class concern, not an afterthought."

---

## Closing

End every demo with the same question:

> "Which part of your close would you want to start with?"

The answer tells you where the pain is sharpest and which agent to build first for their engagement.
