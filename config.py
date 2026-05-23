"""
config.py — Reconciliation Agent policy thresholds and close calendar constants.

All workpaper builders import from here. Change a number once; it propagates
to every rec type. Values reflect Lumina Streaming Co. policy as of Nov-2026.

To adapt for a different entity or policy update, modify this file only.
"""

# ── Materiality ───────────────────────────────────────────────────────────────
# Performance materiality: ~50bps of ~$800M estimated annual revenue.
PERFORMANCE_MATERIALITY: int = 4_000_000

# Trivial threshold: 5% of performance materiality.
# Items below this are recorded in the workpaper but excluded from the
# executive memo and the output envelope exceptions list.
TRIVIAL_THRESHOLD: int = 200_000

# Auto-investigate: flag regardless of age when amount exceeds this.
AUTO_INVESTIGATE_THRESHOLD: int = 250_000

# BS rec exception trigger: either condition alone is sufficient to raise an exception.
BS_REC_EXCEPTION_AMOUNT: int = 100_000
BS_REC_EXCEPTION_AGE_DAYS: int = 30

# ── Outstanding check aging ───────────────────────────────────────────────────
# Checks outstanding beyond this threshold require vendor confirmation and
# potential voiding per Lumina policy.
OUTSTANDING_CHECK_FLAG_DAYS: int = 60

# ── Deposit in transit ────────────────────────────────────────────────────────
# Deposits recorded in the book but not yet on the bank statement for longer
# than this threshold should be escalated to treasury.
DEPOSIT_IN_TRANSIT_FLAG_DAYS: int = 5

# ── Intercompany ─────────────────────────────────────────────────────────────
# IC receivable / payable pairs with no movement for longer than this are
# considered stale and flagged for investigation.
STALE_IC_BALANCE_DAYS: int = 60

# ── Accruals ─────────────────────────────────────────────────────────────────
# Accruals older than this without an active or recurring reversal status are
# flagged as stale. This is the highest-frequency finding in accrual reviews.
STALE_ACCRUAL_DAYS: int = 90

# ── AP ───────────────────────────────────────────────────────────────────────
# Standard vendor payment terms. AP older than this may indicate a dispute
# or a process breakdown.
AP_STANDARD_TERMS_DAYS: int = 30

# ── AR ───────────────────────────────────────────────────────────────────────
# Flag when 90+ day AR exceeds this percentage of the total AR balance.
AR_NINETY_DAY_PCT_THRESHOLD: float = 0.05  # 5%

# ── Close calendar ───────────────────────────────────────────────────────────
# Business days after period end on which each rec type is due.
CLOSE_CALENDAR: dict[str, int] = {
    "bank":     2,   # BD2 morning
    "interco":  2,   # BD2 morning
    "ar_ap":    2,   # BD2 afternoon
    "accrual":  2,   # BD2 afternoon
    "prepaid":  3,   # BD3 morning (after amortization JEs are posted)
}
