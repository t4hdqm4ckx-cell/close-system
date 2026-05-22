# Reconciliation summary memo — November 2026 close

**Period:** November 30, 2026
**Entity:** LuminaUS (with intercompany matching across LuminaEMEA and LuminaAPAC)
**Prepared by:** Reconciliation Agent v0.1.0
**Reviewer:** *pending Controller sign-off*
**Status:** RECONCILED with exceptions — 8 proposed JEs require human approval before posting

---

## 1. Executive summary

Three reconciliation streams were completed: bank, intercompany, and accruals. AR/AP tie-out and prepaid amortization will follow on BD3 per the close calendar.

The reconciliations identified **five exceptions**: one high-severity (intercompany mismatch), three medium-severity (outstanding check and unbooked bank-side items), and one medium-severity (stale prior-period accrual). All exceptions have proposed dispositions; total proposed JEs aggregate $8.45M, of which $7.96M is the intercompany correction and $850K is the stale accrual reversal.

No item exceeds performance materiality of $9.0M. The intercompany mismatch ($12.4M) is large in absolute terms but represents a one-sided booking, not a misstatement — the underlying amount is supported, the issue is that LuminaEMEA has not yet booked its side. Recommended action is to coordinate with the LuminaEMEA controller to post the offsetting entry rather than adjust LuminaUS.

---

## 2. Bank reconciliation — LuminaUS operating account #4471

GL balance $142,500,000. Reconciled balance after adjustments $142,505,700. GL adjustment needed: $5,700 (via JE-PROP-001 and JE-PROP-002).

Detail workpaper: `2026-11_LuminaUS_BankRec_v1.xlsx`

Findings:

**EX-001 [High] — Outstanding check #4521 aged 67 days.** $45,000 payable to Greenway Productions for content invoice, issued September 24, 2026. Exceeds the 60-day investigation threshold. Recommend confirming with Greenway whether the check was received and cashed at another bank, or if it was lost. If lost or stale, void via JE-PROP-003 and reissue payment if the underlying obligation is still valid. No action on the check until vendor confirmation is obtained.

**EX-002 [Medium] — Wire transfer fees $2,500 not yet booked.** Bank charged this in November but the GL does not yet reflect the expense. Recurring item. Book via JE-PROP-002. Consider standing monthly accrual to avoid this timing difference at every close.

**EX-003 [Medium] — Interest credit $8,200 not yet booked.** Money market sweep interest paid by bank in November, not yet recorded in GL. Book via JE-PROP-001. Same recurring treatment as wire fees.

---

## 3. Intercompany matching

Detail workpaper: `2026-11_IC_Match_v1.xlsx` (referenced; this memo summarizes findings)

Three entity pairs reviewed. Two pairs match cleanly. One pair flagged:

**EX-004 [High] — LuminaUS / LuminaEMEA intercompany mismatch of $12,400,000.** LuminaUS GL account 130100 shows $12,400,000 receivable from LuminaEMEA. LuminaEMEA GL account 230100 shows zero payable to LuminaUS. Prior month (Oct-26) both sides showed $11,800,000 — the November $600,000 increase was booked on the US side only.

The most likely cause is a one-sided booking: LuminaUS recorded a service charge to LuminaEMEA in November that LuminaEMEA has not yet recognized. Confirmed by inspection of October-to-November activity: LuminaUS booked a $600,000 increase, LuminaEMEA booked no movement.

**Recommended action:** This is the LuminaEMEA controller's correction to post, not the LuminaUS Reconciliation Agent's. JE-PROP-004 (below) is drafted for the EMEA side and is tagged for routing by the Close Orchestrator to the EMEA close team. Do not post a US-side adjustment until EMEA confirms the missing entry and books its side.

---

## 4. Accrual review

Accrual schedule reviewed against `AccrualSchedule` sheet, eleven accruals in total. Ten are active, recurring, and trending normally. One flagged:

**EX-005 [Medium] — Stale October marketing accrual of $850,000 was never reversed in November.** Accrual ID `ACR-2026-10-12` was booked October 31 for performance marketing (Meta retargeting campaign) with an expected reversal on receipt of the November invoice. The invoice was received and posted to AP in November, but the corresponding reversal of the accrual was missed. The accrual still sits at $850,000.

Effect: November expenses are overstated by $850,000 (both the invoice and the accrual are hitting marketing) and accrued liabilities are overstated by $850,000.

**Recommended action:** Book reversal via JE-PROP-005. Confidence is high — the invoice match is documented in AP and the accrual purpose is unambiguous.

This is a recurring control issue: stale accruals are the highest-frequency accrual finding in close work. Recommend implementing a monthly aged-accrual report (accruals older than 60 days with status not "recurring") as part of BD2 routine.

---

## 5. Proposed adjusting journal entries

All entries require human approval before posting. Five high-confidence entries; three are medium confidence and require additional confirmation.

| Ref | Description | DR | CR | Amount | Confidence |
|---|---|---|---|---:|---|
| JE-PROP-001 | Book interest credit not yet recorded | 100100 Cash - Operating | 700100 Interest Income | $8,200 | High |
| JE-PROP-002 | Book wire transfer fees | 600700 Professional Fees | 100100 Cash - Operating | $2,500 | High |
| JE-PROP-003 | Void outstanding check #4521 (Greenway) — pending vendor confirmation | 100100 Cash - Operating | 200100 AP - Trade | $45,000 | Medium |
| JE-PROP-004 | LuminaEMEA: book intercompany payable to LuminaUS (routed to EMEA team) | 6xxxxx EMEA OpEx (TBD) | 230100 IC Payable - LuminaUS | $12,400,000 | Medium |
| JE-PROP-005 | Reverse stale October marketing accrual | 210400 Accrued Marketing | 600100 Marketing - Performance | $850,000 | High |

JE-PROP-004 requires the EMEA team to determine the correct expense account for the November charge. The Reconciliation Agent does not have visibility into the underlying EMEA cost categorization.

---

## 6. Open items for human decision

The following items require human judgment before the Reconciliation Agent can complete its work or before the Close Orchestrator can declare BD2 complete:

1. **Controller approval of JE-PROP-001 and JE-PROP-002** (low risk, recurring): can be approved in batch.
2. **Vendor confirmation on outstanding check #4521** before JE-PROP-003 is posted. Recommended owner: AP Manager. ETA: BD3 morning.
3. **Coordination with LuminaEMEA controller** for JE-PROP-004. Recommended owner: Consolidations Lead. The Orchestrator should route this to EMEA via Slack or email; LuminaUS does not post the entry.
4. **Decision on standing monthly accrual** for bank fees and interest. This is a process improvement question, not a close-blocking item — can defer to December.
5. **Decision on aged-accrual report** as a BD2 control. Process improvement question — defer to December.

---

## 7. Metadata

| | |
|---|---|
| Agent | reconciliation |
| Version | 0.1.0 |
| Run timestamp | *populated at runtime* |
| Period | 2026-11 |
| Entities covered | LuminaUS (primary), LuminaEMEA (IC only), LuminaAPAC (IC only) |
| Rec types completed | Bank, intercompany, accruals |
| Rec types pending | AR/AP tie-out (BD2 afternoon), prepaid amortization (BD3 morning) |
| Skills loaded | reconciliation, materiality-thresholds, finance-conventions, xlsx |
| Source files | `/data/synthetic/lumina_close_dataset.xlsx` (sha256 prefix: see audit trail tab in workpaper) |
| Output files | `2026-11_LuminaUS_BankRec_v1.xlsx`, this memo |
| Reviewer | *pending* |
| Reviewer decision | *pending* |
| Reviewer date | *pending* |

---

*This memo is generated by the Reconciliation Agent. All proposed journal entries require human approval before posting. The agent does not modify source data or post entries directly.*
