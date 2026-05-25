#!/usr/bin/env bash
# push_to_github.sh — Stage and push reconciliation agent changes to GitHub.
# Repo: https://github.com/t4hdqm4ckx-cell/close-system
# Branch: main
#
# Usage:
#   chmod +x push_to_github.sh
#   ./push_to_github.sh

set -euo pipefail

REMOTE_URL="https://github.com/t4hdqm4ckx-cell/close-system.git"
BRANCH="main"
FILES=(
    "config.py"
    "build_bank_rec_workpaper.py"
)
COMMIT_MSG="refactor: extract policy thresholds to config.py

- Add config.py with all materiality and aging thresholds
- Remove hardcoded magic numbers from build_bank_rec_workpaper.py
- Add argparse CLI (--src, --out, --period) replacing hardcoded paths
- Extract each workpaper tab into its own _build_* function
- Add FileNotFoundError guard and auto-mkdir for output path"

# ── Preflight checks ──────────────────────────────────────────────────────────

echo ">>> Checking git is installed..."
if ! command -v git &>/dev/null; then
    echo "ERROR: git is not installed or not on PATH." >&2
    exit 1
fi

echo ">>> Checking we are inside a git repository..."
if ! git rev-parse --git-dir &>/dev/null; then
    echo "ERROR: Not a git repository. Run 'git init' first or cd into the repo root." >&2
    exit 1
fi

echo ">>> Checking all files exist..."
for f in "${FILES[@]}"; do
    if [[ ! -f "$f" ]]; then
        echo "ERROR: Expected file not found: $f" >&2
        exit 1
    fi
done

# ── Remote ───────────────────────────────────────────────────────────────────

if git remote get-url origin &>/dev/null; then
    CURRENT_REMOTE=$(git remote get-url origin)
    if [[ "$CURRENT_REMOTE" != "$REMOTE_URL" ]]; then
        echo "WARNING: origin is set to $CURRENT_REMOTE"
        echo "         Expected:  $REMOTE_URL"
        read -rp "         Update remote to expected URL? [y/N] " confirm
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            git remote set-url origin "$REMOTE_URL"
            echo ">>> Remote updated."
        fi
    fi
else
    echo ">>> No origin remote found. Adding..."
    git remote add origin "$REMOTE_URL"
fi

# ── Stage and commit ──────────────────────────────────────────────────────────

echo ">>> Staging files..."
git add "${FILES[@]}"

echo ">>> Files staged:"
git diff --cached --name-status

if git diff --cached --quiet; then
    echo ">>> Nothing to commit — working tree clean for these files."
    exit 0
fi

echo ">>> Committing..."
git commit -m "$COMMIT_MSG"

# ── Push ─────────────────────────────────────────────────────────────────────

echo ">>> Pushing to origin/$BRANCH..."
git push origin "$BRANCH"

echo ""
echo "✓ Done. View at: https://github.com/t4hdqm4ckx-cell/close-system"
