---
name: close-reporting
description: "Use this skill when assembling a month-end close package, drafting an executive close memo, building a KPI dashboard, or producing board or audit committee slides from close outputs. Triggers include phrases like 'assemble the close package', 'write the executive memo', 'build the KPI dashboard', 'prepare board slides', 'close reporting', or any request to synthesize specialist agent outputs into CFO-ready deliverables. Use when upstream reconciliation, JE review, and flux outputs are available and the task is to consolidate them into a coherent package."
---

# Close reporting and package assembly

## Purpose

The close package is the definitive record of the period — what happened financially, what was found during the close, what was resolved, and what remains open. It is the primary deliverable the CFO uses to sign off on the period and the primary input for board and audit committee reporting.

Good close reporting is synthesis, not reproduction. The executive memo does not contain reconciliation workpapers. The board slides do not contain JE exception lists. Each deliverable is calibrated to its audience — CFO, board, audit committee — and written in the language of business, not accounting.

## Assembly checklist

Before producing any deliverable, confirm all inputs are present:

- [ ] Reconciliation Agent output — all BS accounts reconciled, difference within trivial threshold or exceptions documented with resolution
- [ ] JE Reviewer output — no high-severity exceptions without documented resolution
- [ ] Flux & Variance output — no unexplained anomaly flags without documented resolution
- [ ] Final locked TB — Controller has confirmed the TB is locked
- [ ] KPI data — provided or derivable from the TB and prior period

If any input is missing, halt and return an exception listing what is missing and what is needed to proceed. Do not produce a partial package.

## Executive memo

### Audience

Controller, CFO, and in some cases the audit committee. Assume financial sophistication but not accounting detail. Write in plain English.

### Length and format

Two to three pages maximum. No tables of numbers — those belong in the KPI dashboard. The memo is narrative.

### Structure

**1. Period summary (one paragraph)**

Revenue, gross margin, and operating income — actual vs. budget and vs. prior period. Three numbers, plain English. No more than five sentences. This paragraph should stand alone as a summary for someone who reads only this far.

Example:
> November revenue of $152M was $4M favorable to budget and $5M ahead of October, driven by stronger-than-expected advertising performance and subscription growth in the US segment. Gross margin of 70% was in line with budget. Operating income of $46M was $2M favorable to budget, partially offset by performance marketing overages in the US.

**2. Key variances (three to five bullets)**

The material items from the flux commentary, condensed to one sentence each. Include the dollar amount, direction, and one-line driver. Do not reproduce the full flux commentary.

Example:
> - Performance Marketing $3.0M unfavorable to budget: Q4 campaign pull-forward approved by CMO; expected to reduce December spend by a comparable amount.
> - APAC Advertising Revenue $0.7M unfavorable to budget: lower CPMs on regional inventory; FP&A monitoring.
> - CDN/Streaming Delivery $0.8M unfavorable to budget: elevated streaming hours from November content launch; within operating range.

**3. Close exceptions (one paragraph)**

What was found, what was resolved, what remains open. Reference workpapers for detail — do not reproduce them. If the close is clean, say so explicitly.

Example:
> Three reconciliation exceptions were identified during BD2: an outstanding check aged 67 days ($45K, voided and reissued), a wire fee not yet booked ($2.5K, JE posted), and a LuminaUS/LuminaEMEA intercompany mismatch ($12.4M, resolved via EMEA journal entry posted BD3). No exceptions remain open. The JE review identified one entry requiring additional support documentation (JE-2026-11-0042); support was received and reviewed by BD4.

**4. Cash and liquidity (one paragraph)**

Ending cash, key movements in the month, and current runway or liquidity position if relevant.

**5. Open items (bulleted list)**

Anything requiring CFO or board action. If the close is clean, this section reads "None." Do not omit this section — an empty list is a positive signal.

**6. Sign-off block**

Prepared by | Reviewed by | Approved by | Date. Leave fields blank for human completion.

## KPI dashboard

### Audience

CFO and FP&A leadership. Assume full financial fluency.

### Format

Single Excel tab, printable on one page. No scrolling.

### Layout

| KPI | Nov-26 Actual | Nov-26 Budget | Nov-26 Variance | Oct-26 Actual | YTD Actual | YTD Budget |
|---|---|---|---|---|---|---|

Group KPIs into sections: Revenue, Margins, Operating Expenses, Cash & Balance Sheet, Operating Metrics.

### KPIs to include

**Revenue**
- Total revenue
- Subscription revenue (and % of total)
- Advertising revenue (and % of total)
- Revenue per subscriber (ARPU) if data available

**Margins**
- Gross profit and gross margin %
- Operating income and operating margin %
- EBITDA and EBITDA margin % (if applicable)

**Operating expenses**
- Content amortization (and % of revenue)
- Marketing (total and % of revenue)
- R&D / Engineering (and % of revenue)
- G&A (and % of revenue)

**Cash and balance sheet**
- Ending cash and equivalents
- Net cash movement in period
- AR days outstanding
- AP days outstanding

**Operating metrics**
- Total subscribers (if available)
- Net subscriber additions
- Monthly churn rate (if available)

### Formatting conventions

- Favorable variances: green font or fill
- Unfavorable variances: red font or fill
- Use accounting number format, not general
- Include period label in the header so the dashboard is self-contained

## Board snippets

### Audience

Board of directors or audit committee. Assume business sophistication, limited accounting detail. Prioritize visual clarity over completeness.

### Format

Three to five PowerPoint slides. Each slide has one message. No slide should require more than 30 seconds to read.

### Standard slides

**Slide 1 — Financial summary**
One-page income statement: revenue, gross profit, operating income, net income. Actual vs. budget vs. prior period. Waterfall or simple table. Headline is the key takeaway (e.g., "November: $4M ahead of budget, margin in line").

**Slide 2 — Revenue bridge**
Waterfall chart showing prior period → current period revenue movement by component (subscription, advertising, other, FX if applicable). One-sentence title stating the net direction.

**Slide 3 — Key variance explanations**
Three to five bullets matching the executive memo key variances section. Amounts and drivers. No accounting jargon.

**Slide 4 — Cash position**
Ending cash vs. prior period and vs. plan. Simple bar or bridge. One-sentence narrative on liquidity.

**Slide 5 — Close exceptions (if any)**
Only include if there are open exceptions requiring board awareness. If the close is clean, omit this slide or replace with operating metrics.

## Writing standards

- Write for the reader, not the preparer. The CFO should not need to ask what anything means.
- Use active voice. "Marketing exceeded budget by $3M" not "Budget was exceeded by marketing in the amount of $3M."
- State variances in business terms: favorable / unfavorable, ahead / behind, above / below. Not adverse, not positive/negative.
- Round to one decimal place in narrative ($3.0M not $3,000,000 and not $3M).
- Never reproduce upstream workpapers or JE logs in the close package. Reference them by path.

## Common pitfalls

- **Assembling with incomplete inputs.** A close package missing a JE resolution or an unexplained anomaly is not a close package — it is a draft. Do not label it final.
- **Writing commentary that contradicts the flux file.** If the flux file says a variance is unexplained, the memo cannot say it is explained. Reconcile before assembling.
- **Over-length executive memos.** If the memo exceeds three pages, cut. The audience has limited time. Every sentence that does not help the CFO make a decision is noise.
- **Board slides with too many numbers.** One key number per slide. Everything else is supporting context.
