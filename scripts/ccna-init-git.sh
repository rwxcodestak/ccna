#!/usr/bin/env bash
set -euo pipefail

# ----------------------------
# Safety Checks
# ----------------------------
if [ ! -d ".git" ]; then
  echo "Error: Not inside a Git repository."
  exit 1
fi

# ----------------------------
# Branch Setup
# ----------------------------
FEATURE_BRANCH="feature/initial-structure"

# Check if branch already exists
if git rev-parse --verify "$FEATURE_BRANCH" >/dev/null 2>&1; then
  echo "Branch '$FEATURE_BRANCH' already exists. Checking it out..."
  git checkout "$FEATURE_BRANCH"
else
  echo "Creating new branch: $FEATURE_BRANCH"
  git checkout -b "$FEATURE_BRANCH"
fi

# ----------------------------
# Stage All Files
# ----------------------------
git add .

# ----------------------------
# Commit Changes
# ----------------------------
COMMIT_MESSAGE="feat(repo): initialize CCNA structured layout"

# Check if there is anything to commit
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "$COMMIT_MESSAGE"
  echo "Initial structure committed on branch '$FEATURE_BRANCH'."
fi

# ----------------------------
# Optional: Reminder to Push
# ----------------------------
echo "Done. You can now push your branch:"
echo "  git push -u origin $FEATURE_BRANCH"
