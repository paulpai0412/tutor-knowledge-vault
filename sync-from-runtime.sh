#!/usr/bin/env bash
set -euo pipefail

SRC="/home/timmypai/.hermes/profiles/wiki-tutor-agent/workspace/runtime/tutor/knowledge"
DST="/home/timmypai/obsidian-knowledge-vault"

if [ ! -d "$SRC" ]; then
  echo "Source knowledge vault not found: $SRC" >&2
  exit 1
fi

mkdir -p "$DST"
rsync -av --delete \
  --exclude '.git/' \
  --exclude '.obsidian/' \
  --exclude 'README.md' \
  --exclude '.gitignore' \
  --exclude 'sync-from-runtime.sh' \
  --exclude 'sync-and-push.sh' \
  "$SRC/" "$DST/"

echo "Synced runtime knowledge vault into $DST"
