#!/usr/bin/env bash

set -euo pipefail

if [ ! -d ".git" ]; then
  echo "Error: Not inside a Git repository."
  exit 1
fi

ROOT_DIR="."

echo "Creating CCNA structure in current repository..."

# ----------------------------
# Create directory structure
# ----------------------------

mkdir -p "$ROOT_DIR"/{
fundamentals,
networking-basics,
switching,
routing,
services,
security,
labs,
diagrams,
meta
}

# ----------------------------
# Create root-level files
# ----------------------------

cat > "$ROOT_DIR/README.md" <<'EOF'
# CCNA Study Repository

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

EOF

cat > "$ROOT_DIR/CONTRIBUTING.md" <<'EOF'
# Contribution Guidelines

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
EOF

cat > "$ROOT_DIR/CHANGELOG.md" <<'EOF'
# Changelog

All notable changes to this project will be documented here.

## [Unreleased]
- Initial repository structure
EOF

cat > "$ROOT_DIR/.gitignore" <<'EOF'
# OS
.DS_Store
Thumbs.db

# Editors
.vscode/
.idea/

# Logs
*.log
EOF

# ----------------------------
# Markdown Topic Template
# ----------------------------

create_topic_file () {
  local filepath="$1"
  cat > "$filepath" <<'EOF'
# Topic Name

## Definition

## Why It Exists

## How It Works

## Packet-Level Behavior

## Configuration Example

```bash
# Example CLI configuration
