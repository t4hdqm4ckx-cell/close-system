# Executive Close Memo
## Lumina Streaming Co. — LuminaUS
## November 2026 | Prepared by Close Reporting Agent v0.1.0

---

**DRAFT — Pending CFO review and sign-off**

---

## 1. Period summary

November revenue of $152.0M was $4.0M favorable to budget (+2.7%) and $5.3M ahead of October, driven by stronger-than-expected advertising performance in the US market and continued subscription growth. Gross margin of 69.7% was in line with budget. Operating income of $63.75M was $3.85M favorable to budget (+6.4%), as revenue outperformance and Engineering salaries running below plan more than offset the Performance Marketing overage. The close is substantially clean — four of five reconciliation exceptions were resolved during BD2 and BD3; one intercompany item remains open and is pending the LuminaEMEA controller.

---

## 2. Key variances

- **Marketing - Performance $2.15M unfavorable to budget (-14.3%, adjusted).** Q4 subscriber acquisition campaign launched two weeks ahead of plan, pulling digital spend on Meta, Google, and TikTok forward from December into November. CMO sign-off on the campaign brief is required before the close package is finalised. December Performance Marketing is expected to run $2–3M below budget as spend normalises.

- **CDN / Streaming Delivery $800K unfavorable to budget (-9.8%).** Elevated streaming hours associated with the November content slate launch — three original titles went live November 8–15. Unit costs are in range; the variance is volume-driven. Second consecutive month of CDN overage; FP&A to assess Q4 budget assumption at the December reforecast.

- **Advertising Revenue $1.5M favorable to budget (+4.8%) and $4.3M ahead of October (+15.2%).** Strong Q4 upfront performance in the US market. Percentage BvA falls just below the 5% commentary threshold; noted as a positive signal.

- **Engineering Salaries $500K favorable to budget (-3.4%).** Open headcount running below plan. No action required; monitor for December as backfills are expected to start.

---

## 3. Close exceptions

Five exceptions were identified during the BD2 reconciliation. Four are resolved: outstanding check #4521 to Greenway Productions ($45K, voided after written vendor confirmation), a stale October marketing accrual ($850K, reversed — this correction reduced the Marketing BvA from $3.0M to $2.15M as reflected above), and two unbooked bank items totalling $10.7K. One exception remains open: a $12.4M intercompany mismatch between LuminaUS and LuminaEMEA. LuminaUS correctly records a $12.4M receivable from EMEA; LuminaEMEA has not yet posted the corresponding payable. The LuminaEMEA controller has been notified and the entry is pending. This item does not affect LuminaUS standalone results; it will eliminate on consolidation once both sides are posted. The JE review identified no close-blocking exceptions.

---

## 4. Cash and liquidity

Ending cash of $427.5M ($142.5M operating, $285.0M money market) was $8.6M above October. Long-term debt remains at $750.0M with no changes in November. The company maintains strong liquidity; no near-term financing needs anticipated.

---

## 5. Open items requiring action

- **IC mismatch — LuminaEMEA** ($12.4M): LuminaEMEA controller to post intercompany payable entry before consolidated close is declared complete. Owner: Consolidations Lead. Deadline: BD5.
- **CMO campaign brief confirmation**: FP&A Manager to obtain CMO sign-off on Q4 campaign documentation supporting the Marketing variance. Owner: FP&A Manager. Deadline: BD5.
- **CDN Q4 reforecast**: FP&A to assess whether Q4 CDN budget requires revision given two consecutive months of overage. Owner: FP&A Manager. Deadline: December reforecast cycle.
- **Vertex Media AR**: $2.3M outstanding 108 days past due. AR Manager to provide collection status. Owner: AR Manager. Deadline: BD5.

---

## 6. Sign-off

| Role | Name | Date |
|---|---|---|
| Prepared by | Close Reporting Agent v0.1.0 | 2026-12-05 |
| FP&A Manager review | | |
| Controller approval | | |
| CFO sign-off | | |

---

## Agent output envelope

```json
{
  "result": {
    "period": "2026-11",
    "entity": "LuminaUS",
    "package_complete": false,
    "open_items_count": 4,
    "blocking_items": 1,
    "blocking_detail": "IC mismatch LuminaUS/EMEA $12.4M — pending EMEA posting",
    "memo_status": "DRAFT — pending CFO review"
  },
  "exceptions": [
    {
      "severity": "high",
      "category": "ic_mismatch",
      "description": "LuminaEMEA has not posted IC payable — consolidation incomplete",
      "owner": "Consolidations Lead",
      "deadline": "BD5"
    }
  ],
  "_metadata": {
    "agent": "close-reporting",
    "version": "0.1.0",
    "run_timestamp": "2026-12-05T08:00:00Z",
    "upstream_agents": ["reconciliation v0.1.0", "flux-variance v0.1.0"],
    "human_reviewer": null
  }
}
```
