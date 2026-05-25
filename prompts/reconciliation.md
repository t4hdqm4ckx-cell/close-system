# Reconciliation Agent — Prompts

Agent definition: `agents/reconciliation/AGENT.md`
Skills: `reconciliation`, `materiality-thresholds`, `finance-conventions`
Dataset sheet: `BankRec`, `IntercoMatrix`, `AccrualSchedule`, `AR_Aging`, `AP_Aging`

---

## Basic prompts

### Full BD2 run

```
Reconcile cash for LuminaUS, period November 2026. Use the synthetic dataset
in /data/synthetic/lumina_close_dataset.xlsx. Work through the bank reconciliation,
intercompany matching, and accrual review. Produce a workpaper and memo.
Write outputs to /close-cycles/2026-11/02-reconciliations/ with a v2 suffix.
```

**Expected findings:**
- Bank rec: check #4521 aged 67 days ($45,000 to Greenway Productions) — flag for investigation
- Bank rec: wire fees $2,500 and interest credit $8,200 not yet booked — propose JEs
- IC: $12,400,000 mismatch between LuminaUS receivable from EMEA and EMEA payable to US
- Accruals: $850,000 Oct-26 marketing accrual (ACR-2026-10-12) not reversed — stale flag

---

## Targeted prompts

### Bank reconciliation only

```
Run the bank reconciliation for LuminaUS operating account #4471, November 2026.
Use the BankRec sheet in the synthetic dataset. Show me both sides of the rec,
the adjusted balances, any outstanding items aged over 60 days, and your
proposed adjusting journal entries.
```

**What to verify:** Adjusted bank and adjusted book both land at $142,505,700 after proposed JEs.

---

### Intercompany matching only

```
Check the intercompany balances between LuminaUS and LuminaEMEA for November 2026.
Use the IntercoMatrix sheet. Tell me whether the receivable/payable mirror and
flag any mismatch above the trivial threshold.
```

**What to verify:** Agent flags the $12.4M mismatch and recommends routing the correction to the LuminaEMEA controller rather than posting a US-side adjustment.

---

### Accrual review only

```
Review the November 2026 accrual schedule for LuminaUS. Use the AccrualSchedule
sheet. Flag any stale accruals — specifically anything that should have reversed
in November but didn't.
```

**What to verify:** Agent identifies ACR-2026-10-12 ($850K marketing accrual, status "NOT REVERSED") and proposes a reversal JE.

---

### AR aging tie-out

```
Tie out the AR aging for LuminaUS, November 2026. Use the AR_Aging sheet.
Confirm the aging buckets sum to the GL balance in the trial balance, and
flag any customer with a balance in the 90+ day bucket above the materiality threshold.
```

**What to verify:** Agent flags Vertex Media with $2,300,000 in the 90+ day bucket.

---

## Edge case prompts

### Missing support data

```
Reconcile the prepaid content licenses account (120100) for LuminaUS, November 2026.
Use the PrepaidSchedule sheet. Note: no prior period rec is available for comparison.
```

**What to verify:** Agent proceeds with available data, notes the absence of a prior period comparison, and flags any assets where the schedule total doesn't tie to the GL.

---

### Escalation threshold test

```
The intercompany mismatch between LuminaUS and LuminaEMEA is $12,400,000.
Apply the materiality thresholds from /config/materiality.yaml and tell me
whether this requires escalation to the CFO, investigation by the account owner,
or is below the threshold for action.
```

**What to verify:** Agent classifies as "investigate" (exceeds the $100K BS rec threshold, below the $9M performance materiality escalation threshold), routes to the Consolidations Lead.

---

### Proposed JE format check

```
For the bank reconciliation of LuminaUS November 2026, produce only the
proposed adjusting journal entries in the standard JE proposal format
defined in the reconciliation skill.
```

**What to verify:** Each JE includes description, debit account (code + name), credit account (code + name), amount, period, reason, source, and confidence label.
