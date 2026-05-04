# Tutor Knowledge Vault

這個 repo 是 tutor runtime knowledge vault 的 GitHub mirror，供本機用 Obsidian 開啟。

## Source of truth

- Canonical tutor artifacts: server runtime (`wiki/`, `indexes/`, `raw/`)
- Derived knowledge vault: server 端 `/home/timmypai/.hermes/profiles/wiki-tutor-agent/workspace/runtime/tutor/knowledge`
- 此 repo: 給 Obsidian 桌面端 pull/clone 的 mirror

## 建議使用方式

1. Server 端先執行 `edu-cli sync-knowledge`
2. 再把 server 上最新的 `knowledge/` 同步到此 repo
3. `git add -A && git commit && git push`
4. 本機桌面 `git pull`
5. 用 Obsidian 開啟 repo 根目錄

## 注意

- `concepts/`, `misconceptions/`, `teaching-notes/`, `queries/`, `sources/`, `entities/`, `events/`, `comparisons/` 主要由 server 自動生成
- 若本機要補人工筆記，後續建議使用獨立資料夾，例如 `manual-notes/`
