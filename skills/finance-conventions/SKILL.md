---
name: finance-conventions
description: "Use this skill whenever you need to apply shared financial conventions during close work — including chart of accounts structure, entity codes, sign conventions, date and period formats, file naming rules, currency handling, or account-specific GL treatment. This skill is loaded by all five close agents as a shared foundation. Triggers include any task involving GL account coding, entity identification, period references, or file naming. When in doubt about a convention, read this skill before proceeding."
---

# Finance conventions — shared reference

## Company context

**Lumina Streaming Co.** — synthetic streaming/media company used throughout the close system demo.

- Fiscal year end: December 31
- Reporting currency: USD
- Accounting standard: US GAAP
- Close target: 5 business days (BD1–BD5)
- Annual revenue: ~$1.8B; monthly run-rate ~$150M

## Entity codes

| Code | Full name | Functional currency | Region |
|---|---|---|---|
| LuminaUS | Lumina Streaming USA, Inc. | USD | Americas |
| LuminaEMEA | Lumina Streaming EMEA Ltd. | EUR | EMEA |
| LuminaAPAC | Lumina Streaming APAC Pte. Ltd. | SGD | APAC |

LuminaUS is the parent entity and reporting entity. Consolidated financials roll up from all three entities.

When an entity is not specified in a prompt, assume LuminaUS unless context suggests otherwise.

## Chart of accounts structure

Six-digit GL accounts. First digit denotes statement category:

| First digit | Category | Statement |
|---|---|---|
| 1xxxxx | Assets | Balance sheet |
| 2xxxxx | Liabilities | Balance sheet |
| 3xxxxx | Equity | Balance sheet |
| 4xxxxx | Revenue | Income statement |
| 5xxxxx | Cost of goods sold (COGS) | Income statement |
| 6xxxxx | Operating expenses | Income statement |
| 7xxxxx | Non-operating items | Income statement |
| 8xxxxx | Income tax | Income statement |

### Key accounts

**Assets**
- 100100 Cash - Operating
- 100200 Cash - Money Market
- 110100 AR - Subscriptions
- 110200 AR - Advertising
- 120100 Prepaid Content Licenses
- 120200 Prepaid Software
- 120300 Prepaid Insurance
- 130100 IC Receivable - LuminaEMEA
- 130200 IC Receivable - LuminaAPAC
- 140100 Capitalized Content - Net
- 150100 PP&E - Net

**Liabilities**
- 200100 AP - Trade
- 200200 AP - Content Vendors
- 210100 Accrued Bonus
- 210200 Accrued Vacation
- 210300 Accrued Content Costs
- 210400 Accrued Marketing
- 220100 Deferred Revenue
- 230100 IC Payable - LuminaUS (booked by EMEA/APAC)
- 240100 Long-term Debt

**Revenue**
- 400100 Subscription Revenue
- 400200 Advertising Revenue
- 400300 Other Revenue

**COGS**
- 500100 Content Amortization
- 500200 Streaming Delivery (CDN)
- 500300 Royalties

**Operating expenses**
- 600100 Marketing - Performance
- 600200 Marketing - Brand
- 600300 Sales Commissions
- 600400 Salaries - Engineering
- 600500 Salaries - G&A
- 600600 Tech Infrastructure
- 600700 Professional Fees
- 600800 Travel & Entertainment

**Non-operating**
- 700100 Interest Income
- 700200 Interest Expense
- 700300 FX Gain/Loss

**Tax**
- 800100 Income Tax Expense

## Sign conventions

US GAAP standard debit/credit convention. In the trial balance and all agent outputs:

- **Assets and expenses:** normal balance is debit (positive in TB means debit balance)
- **Liabilities, equity, and revenue:** normal balance is credit (positive in TB means credit balance)

**For variance reporting purposes only**, state all variances in business terms:
- Revenue: actual > budget = **favorable**
- Expenses: actual < budget = **favorable** (spending less than planned)

Never use "positive" or "negative" as synonyms for favorable/unfavorable — the sign of the number depends on whether the account is a debit or credit normal balance.

## Period naming conventions

| Format | Example | Used for |
|---|---|---|
| YYYY-MM | 2026-11 | File names, folder names, output envelopes |
| Mon-YY | Nov-26 | Narrative references in memos |
| Q1 2026 | Q1 2026 | Quarterly references |
| BD1–BD5 | BD3 | Close calendar references |
| FY2026 | FY2026 | Annual references |

In close calendar context, BD1 is always the first business day after the last calendar day of the period. For November 2026, BD1 = December 1, 2026.

## File naming conventions

All output files follow this pattern: `YYYY-MM_<entity>_<artifact>_v<n>.<ext>`

Examples:
- `2026-11_LuminaUS_BankRec_v1.xlsx`
- `2026-11_LuminaUS_JEReview_v1_memo.md`
- `2026-11_LuminaUS_Flux_v1.xlsx`
- `2026-11_LuminaUS_ExecutiveMemo_v1.docx`

Version numbers start at 1. When a file is revised after the reviewer returns comments, increment to v2. Never overwrite a prior version — retain all versions for audit purposes.

## Folder structure (per close cycle)

```
/close-cycles/YYYY-MM/
  01-inputs/          # TB, sub-ledgers, bank statements as received — read-only
  02-reconciliations/ # Reconciliation Agent outputs
  03-journal-entries/ # JE Reviewer outputs
  04-flux-analysis/   # Flux & Variance Agent outputs
  05-close-package/   # Close Reporting Agent outputs
  06-audit-trail/     # Agent transcripts, envelopes, reviewer sign-offs
```

Agents write only to their designated subfolder. The Orchestrator writes status memos to the cycle root. No agent modifies files in `01-inputs/`.

## Currency conventions

All amounts in USD unless otherwise specified. For EMEA and APAC entities, functional currency amounts are translated to USD at the period-end spot rate for balance sheet items and the period-average rate for income statement items. FX translation differences are recorded in account 700300.

In all agent outputs, state amounts in USD. If the underlying transaction was in a foreign currency, note the original currency and exchange rate used.

## Supporting documentation naming

Supporting documentation references in JE entries and reconciliation workpapers follow these prefixes:

| Prefix | Document type |
|---|---|
| AMORT-YYYY-MM-### | Amortization schedule |
| COMP-YYYY-MM-### | Compensation / payroll document |
| MKT-YYYY-MM-### | Marketing invoice or campaign brief |
| INS-YYYY-MM-### | Insurance schedule |
| FX-YYYY-MM-### | FX revaluation calculation |
| INFRA-YYYY-MM-### | Infrastructure invoice |
| BANK-YYYY-MM-### | Bank statement reference |

When a JE is missing a support doc reference or the reference does not match one of these prefixes, flag it in the JE review.

## Intercompany conventions

All intercompany transactions must be booked on both sides in the same period. LuminaUS records receivables in accounts 130100/130200. EMEA and APAC record payables in accounts 230100/230200.

The receivable and payable must mirror exactly (in USD) after FX translation. Any mismatch is an IC exception per the `reconciliation` skill.

## Agent output conventions

Every agent returns a JSON envelope with the fields `result`, `exceptions`, and `_metadata`. These conventions apply across all five agents:

- Timestamps in ISO 8601 UTC format: `2026-12-02T14:32:18Z`
- File paths use forward slashes regardless of OS
- Amount fields in actual dollars (not thousands)
- Severity values: `high`, `medium`, `low` (lowercase)
- Agent names: `orchestrator`, `reconciliation`, `je-reviewer`, `flux-variance`, `close-reporting`
