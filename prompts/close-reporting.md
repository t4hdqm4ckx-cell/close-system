# Close Reporting Agent — Prompts

Agent definition: `agents/close-reporting/AGENT.md`
Skills: `close-reporting`, `finance-conventions`, `docx`, `xlsx`, `pptx`
Dependencies: All four specialist agents must complete before this agent runs.

---

## Basic prompts

### Full close package

```
Assemble the November 2026 close package for LuminaUS. Use the specialist
outputs in /close-cycles/2026-11/ and the final trial balance in the synthetic
dataset. Produce the executive memo, KPI dashboard, and board snippets.
Write outputs to /close-cycles/2026-11/05-close-package/.
```

**Prerequisites:** Reconciliation memo, JE review memo, and flux commentary must exist in the upstream folders.

---

## Targeted prompts

### Executive memo only

```
Write the executive close memo for LuminaUS, November 2026. The period
summary: revenue $152M (+$4M vs budget), gross margin 70% (in line),
operating income $46M (+$2M vs budget). Key variances: Performance Marketing
$3M unfavorable (Q4 campaign pull-forward, approved), CDN $0.8M unfavorable
(elevated traffic from content launch), APAC Advertising $0.7M unfavorable
(lower CPMs). Close exceptions: all resolved. Use the executive memo structure
in the close-reporting skill.
```

**What to verify:** Memo is two to three pages max, written in plain English, opens with a period summary paragraph, uses favorable/unfavorable framing (not positive/negative), and ends with an empty open items section.

---

### KPI dashboard structure

```
Lay out the KPI dashboard for LuminaUS, November 2026 using the close-reporting
skill format. Use the trial balance data for financial KPIs. For operating
metrics (subscribers, ARPU, churn), note that data was not provided and
leave those fields blank with a placeholder.
```

**What to verify:** Dashboard is organized into the five sections (Revenue, Margins, OpEx, Cash, Operating Metrics), includes MoM and YTD columns, and correctly handles missing data by labeling fields as "not provided" rather than defaulting to zero.

---

### Board slide outline

```
Outline the five board slides for the November 2026 close. For each slide,
give me the headline, the one key number or chart type, and two to three
bullet points of supporting content. Use the board snippet templates in
the close-reporting skill.
```

**What to verify:** Each slide has one clear message. No slide reproduces the full flux file or JE log. Financial summary slide has a single headline takeaway (e.g., "$4M ahead of budget, margin in line").

---

## Edge case prompts

### Incomplete inputs test

```
Assemble the close package for November 2026, but the JE Reviewer has not
yet completed its review — JE-2026-11-0042 is still under investigation.
How do you handle this?
```

**What to verify:** Agent halts assembly, returns an exception noting the missing JE resolution, and does not produce a package labeled "final." Offers to produce a draft with the exception clearly marked as open.

---

### Open item in the package

```
Write the open items section of the November 2026 executive memo assuming
one item remains unresolved: the LuminaUS/LuminaEMEA intercompany mismatch
of $12.4M is still awaiting the EMEA team's journal entry.
```

**What to verify:** Open item is clearly labeled, includes the dollar amount, the required action, the owner (LuminaEMEA controller), and a deadline (BD3). The memo does not declare the close clean.

---

### Plain English test

```
Take this accounting description and rewrite it for the CFO in the style
of the close-reporting skill:

"The unfavorable BvA variance in account 600100 Marketing - Performance
of $3,000,000 (-20.0%) is attributable to a timing pull-forward of Q4 
digital acquisition spend into the November period resulting from an
accelerated campaign launch cadence."
```

**What to verify:** Output is shorter, uses active voice, states the business event clearly ("the Q4 campaign launched two weeks early, pulling forward $3M of digital spend into November"), and eliminates jargon like "BvA variance" and "cadence."
