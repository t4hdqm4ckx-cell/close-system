# Flux & Variance Commentary — November 2026 Close
**Entity:** LuminaUS  
**Period:** November 30, 2026  
**Prepared by:** Flux & Variance Agent v0.1.0  
**Reviewer:** *Pending FP&A Manager sign-off*  
**Status:** FIRST-PASS — not cleared for close package

---

## Triage Summary

| Test | Threshold | Accounts Flagged |
|---|---|---|
| MoM only | \|$\| > $250K AND \|%\| > 5% | 4 (Adv Rev US, Adv Rev APAC, Sales Commissions, FX) |
| BvA only | \|$\| > $500K AND \|%\| > 5% | 0 |
| Both MoM + BvA | Both conditions met on both tests | 3 (Mktg Performance, CDN, Adv Rev APAC) |
| Anomaly flags | Beyond threshold — directionally surprising | 2 (Accrued Marketing BS, Adv APAC attribution) |

Total IS accounts reviewed: 25. Accounts requiring commentary: 7. Accounts below threshold: 18.

> **Pre-commentary condition:** JE-2026-11-0042 (Saturday, $1.5M reclass from Marketing - Performance
> to Content Amortization, no support doc reference) is under JE Reviewer scope. All commentary below
> assumes this entry stands. If reversed, the Marketing - Performance BvA variance widens from $3.0M
> to $4.5M (-30%). Commentary will require revision accordingly.

---

## Material Variances by Section

### Operating Expenses

---

#### 600100 · Marketing - Performance · BvA + MoM ⚠️

**Marketing - Performance was $3.0M unfavorable vs. November budget (-20%) and $3.5M above October actuals (+24.1%).**

The budget overage reflects accelerated digital spend on Meta and Google platforms associated with the Q4 subscriber acquisition campaign, which launched approximately two weeks ahead of the original plan. Supporting documentation is on file: campaign brief MKT-2026-11-031 underpins the November performance marketing accrual (JE-2026-11-0040, $8.45M). The three active platforms — Meta ($8.0M AP), Google ($7.5M AP), and TikTok ($2.5M AP) — are all current in AP aging with December due dates.

Two adjustments intersect this line and must be resolved before the variance is final:

1. **JE-2026-11-0042 (Saturday posting, $1.5M reclass):** This entry credits Marketing - Performance and debits Content Amortization. It is flagged in the JE log for review (posted by James Walker on Saturday November 28, no support doc reference). If the JE Reviewer rejects it, the BvA variance widens to $4.5M unfavorable (-30%).

2. **Stale Oct-26 accrual ACR-2026-10-12 ($850K):** Per the Reconciliation Agent memo (EX-005), this Meta retargeting accrual originated in October, the corresponding AP invoice was received and posted in November, but the accrual reversal was missed. The accrual still sits at $850K, overstating Marketing - Performance by $850K. JE-PROP-005 (reversal, high confidence) is pending Controller approval. If approved and posted, the BvA variance narrows to approximately $2.15M (-14%).

**Trend:** This is the first month Marketing - Performance has materially exceeded budget; October was at or near plan. The November overage is a timing pull-forward, not a structural step-up — the campaign brief documents that Q4 total spend remains within the approved full-quarter budget envelope.

**Action required:** FP&A Manager to (1) confirm campaign brief MKT-2026-11-031 is properly referenced and filed, (2) confirm resolution of JE-0042 with the JE Reviewer before finalizing commentary, and (3) confirm JE-PROP-005 approval with the Controller.

---

#### 500200 · Streaming Delivery (CDN) · BvA + MoM ⚠️

**Streaming Delivery (CDN) was $0.8M unfavorable vs. November budget (-9.8%) and $0.6M above October actuals (+7.1%).**

The variance is primarily driven by a $0.8M CDN cost accrual for November traffic booked via JE-2026-11-0041 (supported by INFRA-2026-11-007). Elevated CDN costs are consistent with above-plan streaming activity in a content-heavy month and are directionally correlated with the Q4 subscriber acquisition campaign driving higher impression and playback volume.

October CDN was on budget ($8.4M actual vs. implied budget), making this a new development rather than a recurring trend. The AP aging shows Akamai ($4.5M, due December 18) as the primary CDN vendor, in addition to AWS ($5.0M infrastructure), which may include CDN-adjacent compute costs.

Driver is not fully confirmed pending infrastructure data — specifically, whether the overage is attributable to higher streaming volume, rate changes on Akamai contracts, or a combination. Attribution has been attempted against the JE log and is directionally supported by campaign context, but has not been quantified at the unit-rate level.

**Action required:** FP&A to request CDN volume and unit-rate bridge from Engineering/Infrastructure before the close package is assembled. If the overage is purely volume-driven and correlated with subscriber acquisition, the commentary can be finalized. If a rate change is identified, it should be flagged as a forward-looking budget risk for December.

---

### Revenue

---

#### 400200 · Advertising Revenue — LuminaAPAC · BvA + MoM ⚠️

**Advertising Revenue - APAC was $0.7M unfavorable vs. budget (-17.5%).** Revenue came in at $3.3M against a $4.0M plan. MoM, APAC improved $0.3M (+10%) from $3.0M in October, but the absolute BvA shortfall is the more significant signal for management reporting.

**Driver not yet attributed.** No advertiser-level or deal-level data has been provided to the Flux Agent. Possible causes include: (a) a deal or campaign that was expected to close in November but slipped to December; (b) lower-than-planned ad impression volume in APAC due to regional platform mix; or (c) a budget assumption that proved aggressive for the period. The Flux Agent does not fabricate a driver — this item is flagged as unexplained and must be attributed before close package assembly.

**Action required:** FP&A Manager to obtain a revenue bridge from the APAC commercial/revenue team identifying which advertisers or campaigns drove the $700K shortfall. If slip-to-December, note in commentary for CFO awareness. Anomaly flag has been raised.

---

#### 400200 · Advertising Revenue — LuminaUS · MoM only

**Advertising Revenue - US was $4.3M favorable vs. October (+15.2%).** BvA variance of $1.5M is favorable but does not clear the 5% BvA percentage threshold (4.8%); BvA commentary is not required.

The MoM improvement is consistent with a strong November advertising environment driven by Q4 campaign launches from major clients. Hudson Brands Group ($4.5M), Westcoast Mobility ($5.1M), and Sterling Retail ($3.8M) are all current in AR aging with December due dates, providing confidence in collectability.

**Action:** No action required. Favorable trend noted for CFO context.

---

### Operating Expenses (continued)

---

#### 600300 · Sales Commissions · MoM only

**Sales Commissions were $0.3M above October (+9.4%).** BvA variance of $0.1M is below the $500K dollar threshold; BvA commentary is not required.

The increase is directionally tied to higher commission-eligible advertising revenue in November — commission rates and headcount are unchanged per the JE log (JE-2026-11-0045, COMP-2026-11-020). Variance is consistent with business activity and requires no corrective action.

---

### Non-Operating Items

---

#### 700300 · FX Gain/Loss · MoM only

**FX Gain/Loss swung $0.65M favorable MoM, from a $0.2M loss in October to a $0.45M gain in November.** The movement is driven by the revaluation of IC balances at period-end spot rates, booked via JE-2026-11-0046 (supported by FX-2026-11-001).

No budget was established for this account; BvA analysis is not applicable. The $0.45M gain is below performance materiality ($9.0M) and requires no corrective action. Directional reversal from prior month is noted for CFO reporting context — favorable this month, unfavorable last month — suggesting modest FX volatility in EUR/USD or USD/SGD rates affecting IC balance translation.

**Note:** The IC mismatch flagged by the Reconciliation Agent (EX-004, $12.4M US receivable with no EMEA payable) does not affect this FX line directly, but pending resolution of that mismatch may result in a correcting FX entry when the EMEA side is posted.

---

## Accounts Within Threshold — No Commentary Required

The following IS accounts were reviewed and are within materiality thresholds on both MoM and BvA tests. No commentary is required; values are included in the flux file for completeness.

| Account | Name | Nov-26 Actual | BvA $ | BvA % | MoM $ | MoM % |
|---|---|---|---|---|---|---|
| 400100 | Subscription Revenue (US) | $74.2M | +$1.7M | +2.3% | +$0.7M | +1.0% |
| 400100 | Subscription Revenue (EMEA) | $22.8M | +$0.8M | +3.6% | +$0.7M | +3.2% |
| 400100 | Subscription Revenue (APAC) | $9.0M | −$0.5M | −5.3% | +$0.2M | +2.3% |
| 400200 | Advertising Revenue (EMEA) | $8.2M | +$0.2M | +2.5% | +$0.8M | +10.8% |
| 500100 | Content Amortization | $32.5M | +$0.5M | +1.6% | +$0.7M | +2.2% |
| 500300 | Royalties | $3.5M | $0 | — | +$0.1M | +2.9% |
| 600200 | Marketing - Brand | $7.0M | $0 | — | +$0.2M | +2.9% |
| 600400 | Salaries - Engineering | $14.0M | −$0.5M | −3.4% | −$0.1M | −0.7% |
| 600500 | Salaries - G&A | $7.5M | $0 | — | +$0.1M | +1.4% |
| 600700 | Professional Fees | $1.2M | +$0.2M | +20% | +$0.1M | +9.1% |
| 600800 | Travel & Entertainment | $0.8M | −$0.1M | −11.1% | +$0.05M | +6.7% |
| 800100 | Income Tax Expense | $6.8M | −$0.2M | −2.9% | +$0.3M | +4.6% |

> **Note on APAC Subscription Revenue:** BvA variance is −$500K (−5.3%), which clears the percentage threshold but does not clear the $500K dollar threshold — the absolute variance is exactly at the boundary. No commentary required per current rules; flagged for FP&A awareness.

> **Note on Professional Fees:** BvA variance of +$200K and MoM of +$100K both fail the dollar thresholds. The 20% BvA percentage is notable but the absolute amount is immaterial. No commentary required.

---

## Anomaly Flags

### AF-001 · High · Accrued Marketing Balance (210400) — Double-Counting Risk

The Accrued Marketing balance (210400) increased $6.6M MoM from $8.2M to $14.8M, a +80.5% jump. This is a balance sheet account and is not itself subject to flux commentary, but the movement is directionally surprising and warrants attention.

Decomposition of the ending balance:
- ACR-2026-11-06 (November marketing accrual): $13.95M ending balance — driven by $8.45M of new November accrual activity per JE-2026-11-0040
- ACR-2026-10-12 (stale October accrual, NOT reversed): $0.85M still sitting in the balance

The stale October accrual (EX-005 from the Reconciliation Agent) means that both the AP invoice and the $850K accrual are hitting Marketing - Performance in November — a double-count of $850K. This is the same item as JE-PROP-005 above. If not corrected before the TB is locked, November marketing expense is overstated and Accrued Marketing is overstated by $850K.

**Action:** Controller to approve JE-PROP-005. FP&A to verify the ending Accrued Marketing balance of $14.8M ties to the accrual schedule net of the pending reversal (expected corrected balance: $13.95M).

### AF-002 · Medium · APAC Advertising Revenue — Unexplained BvA Shortfall

See commentary section above (400200 · LuminaAPAC). Attribution is not available; flagged for FP&A follow-up with APAC regional team before close package assembly.

---

## Open Items Before Close Package Assembly

| # | Item | Owner | Blocking? |
|---|---|---|---|
| 1 | Confirm resolution of JE-0042 (Saturday reclass) with JE Reviewer | JE Reviewer → FP&A | Yes — affects Marketing commentary |
| 2 | Controller approval of JE-PROP-005 (stale accrual reversal) | Controller | Yes — affects Marketing variance |
| 3 | APAC revenue bridge for Advertising shortfall | APAC commercial team via FP&A | Yes — AF-002 must be attributed |
| 4 | CDN volume/rate attribution from Infrastructure | Engineering/Infrastructure | Preferred — for commentary precision |
| 5 | Verify Accrued Marketing ending balance ties to accrual schedule | FP&A / Controller | Yes — AF-001 |

---

## Agent Notes

- Sign conventions applied per `finance-conventions`: expense variances use budget − actual (positive = favorable); revenue variances use actual − budget (positive = favorable).
- Reconciliation Agent memo (`2026-11_LuminaUS_Recon_v1_memo.md`) referenced for EX-005 (stale accrual) and EX-004 (IC mismatch). IC mismatch has no direct P&L impact at LuminaUS and is excluded from this analysis.
- JE log cross-referenced for JE-0042 (Saturday posting flag) and JE-0040/JE-0041 (accrual entries explaining Marketing and CDN variances).
- Driver attribution follows the hierarchy defined in the agent spec: JE log → Rec Agent envelope → provided driver data → external context → unexplained. APAC advertising reached step 5 (unexplained).

---

*This commentary is first-pass and has not been reviewed or approved. All figures subject to final TB lock. Do not include in close package until FP&A Manager sign-off is obtained.*
