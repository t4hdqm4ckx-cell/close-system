# Flux & Variance Agent — Prompts

Agent definition: `agents/flux-variance/AGENT.md`
Skills: `flux-analysis`, `bva-variance-analysis`, `materiality-thresholds`, `finance-conventions`
Dataset sheet: `TrialBalance`

---

## Basic prompts

### Full flux run

```
Run flux analysis for LuminaUS, November 2026. Use the TrialBalance sheet
in the synthetic dataset. Apply both MoM and BvA trigger tests, identify
all accounts requiring commentary, and draft first-pass commentary for each.
```

**Expected findings:**
- Marketing - Performance: $3.0M unfavorable to budget (-20%) — material BvA
- Streaming Delivery (CDN): $0.8M unfavorable to budget (-10%) — material BvA
- Advertising Revenue - APAC: $0.7M unfavorable to budget (-17.5%) — material BvA
- Marketing - Performance: $3.5M increase MoM — material MoM

---

## Targeted prompts

### BvA triage only

```
Look at the November 2026 trial balance for LuminaUS. Apply the BvA trigger
tests from /config/materiality.yaml — amount threshold $500K AND percentage
threshold 5%. List every income statement account that meets both conditions,
ranked by absolute variance.
```

**What to verify:** Three accounts surface — Marketing Performance, CDN, and APAC Advertising. Agent does not include accounts that meet only one condition.

---

### First-pass commentary for a single account

```
Draft first-pass variance commentary for account 600100 Marketing - Performance,
LuminaUS, November 2026. The variance is $3.0M unfavorable to budget (-20%).
The driver is a Q4 subscriber acquisition campaign that launched two weeks
ahead of the original plan. Use the commentary structure in the flux-analysis skill.
```

**What to verify:** Commentary follows the driver / trend / action structure. States the dollar amount, percentage, driver (campaign pull-forward), trend context (is this recurring?), and action sentence (no action required if approved, or FP&A sign-off needed).

---

### MoM vs BvA comparison

```
For account 600100 Marketing - Performance, November 2026, tell me:
1. Does it trigger the MoM flux test? Show your work.
2. Does it trigger the BvA flux test? Show your work.
3. If it triggers both, which variance is more important to explain to the CFO and why?
```

**What to verify:** Agent applies both tests independently, shows the math (absolute amount AND percentage), and correctly identifies that BvA is more relevant to the CFO since it measures performance against plan.

---

### Anomaly detection

```
Review the November 2026 trial balance for LuminaUS and flag any accounts
where the movement is anomalous — not just material, but directionally
surprising or inconsistent with what you'd expect from a streaming company
in a month with a major content launch.
```

**What to verify:** Agent goes beyond mechanical threshold tests to note that the Accrued Marketing balance jumped $6.6M MoM (from $8.2M to $14.8M) — which, combined with the stale Oct accrual from the reconciliation agent, suggests double-counting risk.

---

## Edge case prompts

### No budget available

```
Run BvA analysis for account 700300 FX Gain/Loss, LuminaUS, November 2026.
The budget for this account is $0.
```

**What to verify:** Agent notes "no budget established" for this account, skips BvA, and reports only the MoM movement ($450K favorable vs. -$200K prior month — a $650K swing that is below the $250K MoM dollar threshold... wait, actually $650K exceeds $250K, and the % change is very large. Agent should flag this for MoM commentary).

---

### Commentary without driver data

```
Draft commentary for the CDN/Streaming Delivery variance ($800K unfavorable
to budget, -10%) without any driver data provided. Show me what you do when
attribution isn't possible.
```

**What to verify:** Agent drafts what it can (states the variance and that it exceeds thresholds), explicitly notes "driver not yet attributed," lists what was checked (JE log, rec agent envelope), and flags for FP&A follow-up rather than fabricating a driver.

---

### Threshold boundary test

```
Account 600800 Travel & Entertainment has actual spend of $800K vs budget of $900K
— a $100K favorable variance (-11.1%). Does this account require commentary?
Apply the flux-analysis skill and materiality thresholds.
```

**What to verify:** Agent correctly identifies that the $100K absolute variance does NOT exceed the $500K BvA dollar threshold, therefore no commentary is required despite the 11.1% percentage variance. One condition alone is not sufficient.
