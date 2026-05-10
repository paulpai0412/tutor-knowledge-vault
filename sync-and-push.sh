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

max_push_attempts="${MAX_PUSH_ATTEMPTS:-3}"
push_retry_delay="${PUSH_RETRY_DELAY_SECONDS:-5}"
push_attempt=1
while true; do
  if git push origin main; then
    break
  fi

  if [ "$push_attempt" -ge "$max_push_attempts" ]; then
    echo "git push failed after ${push_attempt} attempt(s)." >&2
    exit 1
  fi

  echo "git push failed on attempt ${push_attempt}/${max_push_attempts}; retrying in ${push_retry_delay}s..." >&2
  sleep "$push_retry_delay"
  push_attempt=$((push_attempt + 1))
done

echo "Knowledge vault synced and pushed successfully."
