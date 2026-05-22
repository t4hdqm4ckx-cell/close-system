---
name: flux-analysis
description: "Use this skill when performing month-over-month or budget-vs-actual variance analysis at the GL level, writing variance commentary, attributing variances to drivers, or identifying anomalies in the income statement or balance sheet during a month-end close. Triggers include phrases like 'run flux analysis', 'write variance commentary', 'explain this variance', 'what drove the change', 'flag material variances', 'MoM analysis', 'BvA analysis', or any request to analyze financial movements and draft explanations. Use when a trial balance with current, prior, and budget columns is provided and the task is to identify what changed and why."
---

# Flux and variance analysis

## Purpose

Flux analysis answers two questions for every material account: what changed, and why. The output is a triage of the income statement and balance sheet that tells the Controller and CFO where to focus attention, with first-pass commentary that reduces the FP&A team's drafting time.

The goal is not to produce polished commentary — that is the human's job. The goal is to produce accurate, well-structured first-pass commentary that is 80% of the way there so the FP&A Manager can review, adjust, and approve rather than write from scratch.

## Trigger tests

Always load `materiality-thresholds` first. Apply both trigger tests to every account. An account requires commentary when BOTH conditions are true:

**Month-over-month (MoM):** absolute change > $250,000 AND percentage change > 5% vs. prior month

**Budget vs. actual (BvA):** absolute variance > $500,000 AND percentage variance > 5% vs. budget

Accounts meeting one condition are noted. Accounts meeting both are prioritized and appear first in the output. Accounts below the trivial threshold ($450K) are excluded from commentary but shown in the flux file.

When the TB contains all three columns (actual, prior, budget), run both tests simultaneously and produce a single triage list sorted by the larger of the two absolute variances.

## Commentary structure

Every material account gets one commentary block following this structure:

> **[Account name]** was $[X]M [favorable/unfavorable] vs. [prior month/budget], [direction and %]. [Driver sentence.] [Trend sentence.] [Action sentence.]

**Driver sentence:** What specifically caused the movement. Name the vendor, campaign, headcount event, contract, or volume driver. "Higher spend" and "increased activity" are not drivers — they restate the variance.

**Trend sentence:** Is this consistent with the prior two to three periods, or is it a new development? "This is the third consecutive month of elevated spend" reads differently than "this is the first time this account has moved materially."

**Action sentence:** Is this expected and approved, or does it require follow-up? One of: "No action required — variance is expected and documented in [source]." / "FP&A to confirm with [owner] before close package assembly." / "Under investigation — see open items."

### Commentary templates by account category

**Subscription revenue**
> Subscription revenue was $[X]M [favorable/unfavorable] vs. budget ([%]). [Subscriber count or ARPU movement.] [Churn or cohort driver if known.] [Outlook sentence — is this a timing issue or a run-rate shift?]

**Advertising revenue**
> Advertising revenue was $[X]M [favorable/unfavorable] vs. budget ([%]). [CPM/volume driver.] [Seasonal context — Q4 upfronts, political spend, etc.] [Named advertiser concentration if applicable.]

**Content amortization**
> Content amortization was $[X]M vs. budget ([%]). [Schedule driver — new titles launched, titles fully amortized, budget assumption vs. actual slate.] [Reference the prepaid content schedule for detail.]

**Marketing — performance**
> Performance marketing was $[X]M [unfavorable/favorable] vs. budget ([%]). [Channel breakdown if available — Meta, Google, TikTok, etc.] [Campaign timing driver — pull-forward, delay, budget reallocation.] [Efficiency metric if available — CAC, ROAS.]

**Salaries and compensation**
> [Department] salaries were $[X]M vs. budget ([%]). [Headcount vs. plan — X actual vs. Y budgeted.] [Timing driver — backfills, early starts, late terminations.] [Bonus accrual movement if applicable.]

**Tech infrastructure / CDN**
> Tech infrastructure was $[X]M vs. budget ([%]). [Volume driver — streaming hours, active subscribers, traffic events.] [Rate driver — contract renegotiation, spot pricing.] [Reference the infrastructure team's volume report if available.]

## Driver attribution hierarchy

Attempt attribution in this order, stopping when attribution is confirmed:

1. **JE log** — is the variance explained by a single large entry? Note the JE reference.
2. **Reconciliation Agent envelope** — is the variance explained by a rec adjustment (stale accrual reversal, IC entry)?
3. **Provided driver data** — headcount, volume, rate, mix data explicitly provided for the close
4. **External business context** — known events: campaign timing, contract renewals, product launches, macro factors
5. **Unexplained** — flag for FP&A follow-up; note "driver not yet attributed" and list what was checked

Never fabricate a driver. "Timing" and "mix" as standalone explanations are not acceptable — they must be tied to something specific.

## Sign conventions

Read `finance-conventions` for account-specific sign rules. General conventions:

- Revenue: actual > budget = **favorable**
- Expenses: actual < budget = **favorable** (spending less than planned)
- Balance sheet: direction depends on account type — read the account conventions

Always state variances in business terms (favorable/unfavorable) in addition to the arithmetic sign. A CFO reading "Marketing was $3M unfavorable" understands it immediately; "$3M adverse" or "$(3M)" requires translation.

## Anomaly detection

Beyond the standard trigger tests, flag these patterns for human review:

- **Sign flip:** an account that was positive last month is now negative (or vice versa) without a known driver
- **Step change:** a variance that is more than 3x the largest single-month movement in the trailing 12 months
- **Correlation break:** two accounts that historically move together have diverged materially (e.g., subscription revenue up, subscriber count flat)
- **Budget variance in a fixed-cost account:** a lease or depreciation line that was budgeted at a fixed amount shows a large variance (possible mis-booking or contract change)

Anomaly flags are not commentary — they are escalations. Write: "Anomaly detected — [description]. Requires FP&A investigation before commentary can be completed."

## Flux file format (xlsx)

Filename: `YYYY-MM_<entity>_Flux_v<n>.xlsx`

Tabs:
1. **Summary** — total accounts reviewed, flagged count, MoM-only vs. BvA-only vs. both, anomaly count
2. **Flux detail** — one row per account: account code, name, actual, prior, budget, MoM $, MoM %, BvA $, BvA %, materiality flag, commentary (populated for flagged accounts)
3. **Anomalies** — detail on any anomaly flags
4. **Drivers** — driver data provided for the period (headcount, volume, rates)
5. **Audit trail** — sources, timestamp, agent version

## Common pitfalls

- **Don't start writing commentary before triaging.** Run the trigger tests first, rank by absolute variance, then write in priority order. You will run out of context writing commentary on trivial accounts before you get to the material ones.
- **Don't confuse MoM and BvA drivers.** A variance vs. prior month may have a different driver than a variance vs. budget. State each separately if they differ.
- **Don't skip balance sheet flux.** Material BS movements (cash burn, AR build, deferred revenue shift) belong in the flux file even if they are not income statement items.
- **Don't restate the number as the explanation.** "Revenue was higher because we had more revenue" is not commentary. Every driver sentence must explain the underlying business event.
