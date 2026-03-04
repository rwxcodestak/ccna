#!/usr/bin/env bash
set -euo pipefail

# ----------------------------
# Safety Checks
# ----------------------------
if [ ! -d ".git" ]; then
  echo "Error: Not inside a Git repository."
  exit 1
fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
FEATURE_BRANCH="feature/initial-structure"

# ----------------------------
# Branch Management
# ----------------------------
if [ "$CURRENT_BRANCH" == "main" ]; then
  # Check if feature branch exists
  if git rev-parse --verify "$FEATURE_BRANCH" >/dev/null 2>&1; then
    echo "Branch '$FEATURE_BRANCH' already exists. Checking it out..."
    git checkout "$FEATURE_BRANCH"
  else
    echo "Creating new branch: $FEATURE_BRANCH from main"
    git checkout -b "$FEATURE_BRANCH"
  fi
else
  echo "Currently on branch '$CURRENT_BRANCH'. Using it for setup."
fi

ROOT_DIR="."

echo "Creating CCNA structure in branch $(git rev-parse --abbrev-ref HEAD)..."

# ----------------------------
# Directories
# ----------------------------
dirs=(
  "fundamentals"
  "networking-basics"
  "switching"
  "routing"
  "services"
  "security"
  "labs"
  "diagrams"
  "meta"
)

for dir in "${dirs[@]}"; do
  if [ ! -d "$ROOT_DIR/$dir" ]; then
    mkdir -p "$ROOT_DIR/$dir"
    echo "Created directory: $dir"
  else
    echo "Directory already exists: $dir"
  fi
done

# ----------------------------
# Root-level files
# ----------------------------
declare -A files
files["README.md"]="# CCNA Study Repository

Structured, version-controlled CCNA study notes.

## Scope

- Routing
- Switching
- Network Fundamentals
- Services
- Security
- Lab Validation

## Study Philosophy

This repository treats documentation as production-grade technical material.

- No direct commits to main
- Feature-branch workflow
- Structured topic templates
- Lab-validated concepts

## Progress

Routing      [░░░░░░░░░░]
Switching    [░░░░░░░░░░]
Security     [░░░░░░░░░░]
"

files["CONTRIBUTING.md"]="# Contribution Guidelines

## Branch Naming

- feature/<topic>
- fix/<topic>
- refactor/<section>
- docs/<topic>

## Commit Style

Use Conventional Commits:

- feat(topic): description
- fix(topic): description
- docs(topic): description
- refactor(topic): description

## Documentation Template

All topic files must follow the standard template structure.
"

files["CHANGELOG.md"]="# Changelog

All notable changes to this project will be documented here.

## [Unreleased]
- Initial repository structure
"

files[".gitignore"]="# OS
.DS_Store
Thumbs.db

# Editors
.vscode/
.idea/

# Logs
*.log
"

for f in "${!files[@]}"; do
  if [ ! -f "$ROOT_DIR/$f" ]; then
    echo "${files[$f]}" > "$ROOT_DIR/$f"
    echo "Created file: $f"
  else
    echo "File already exists: $f"
  fi
done

# ----------------------------
# Topic Template Function
# ----------------------------
create_topic_file() {
  local filepath="$1"
  if [ -f "$filepath" ]; then
    echo "File already exists: $filepath"
    return
  fi

  cat > "$filepath" <<'EOF'
# Topic Name

## Definition

## Why It Exists

## How It Works

## Packet-Level Behavior

## Configuration Example

```bash
# Example CLI configuration
