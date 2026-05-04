#!/usr/bin/env bash
set -euo pipefail

ROOT="/home/timmypai/obsidian-knowledge-vault"
RUNTIME_VAULT="/home/timmypai/.hermes/profiles/wiki-tutor-agent/workspace/runtime/tutor"
CLI="/home/timmypai/apps/wiki/.venv/bin/edu-cli"

STUDENT_ID="${1:-student-001}"
SUBJECT="${2:-history}"
GRADE="${3:-7}"
LESSON_NO="${4:-3}"
COMMIT_MSG="${COMMIT_MSG:-sync: update tutor knowledge vault}"

cd "$ROOT"

"$CLI" sync-knowledge \
  --vault-root "$RUNTIME_VAULT" \
  --student-id "$STUDENT_ID" \
  --subject "$SUBJECT" \
  --grade "$GRADE" \
  --lesson-no "$LESSON_NO"

"$ROOT/sync-from-runtime.sh"

git add -A
if git diff --cached --quiet; then
  echo "No knowledge vault changes to commit."
  exit 0
fi

git commit -m "$COMMIT_MSG"
git push origin main

echo "Knowledge vault synced and pushed successfully."
