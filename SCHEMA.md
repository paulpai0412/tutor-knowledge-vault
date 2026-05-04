# Tutor Knowledge Schema

## Domain

這個 knowledge wiki 是建在 tutor runtime 旁的衍生知識層，用來把課文、考卷、作答紀錄、錯題與複習計畫整理成可持續累積的知識網。

## Truth Boundary

- Canonical tutor records live under `../wiki/`, `../indexes/`, and `../raw/`.
- `knowledge/` pages are derived knowledge pages for synthesis, comparison, and review.
- `knowledge/` must not overwrite or replace canonical tutor artifacts.

## Obsidian / LLM Wiki Conventions

- Every knowledge page starts with YAML frontmatter.
- Use `[[wikilinks]]` for internal links so Obsidian can build a graph view.
- Every generated knowledge page should link to at least two other knowledge pages.
- New or updated pages must be listed in `index.md` and logged in `log.md`.
- File names stay lowercase-with-hyphens for stable Obsidian links.
- Human-readable titles should live in frontmatter `title`, while filenames remain stable slugs.

## Knowledge Sections

- `concepts/`: 課程核心概念、主題脈絡、重要人物與制度關係。
- `misconceptions/`: 學生常見迷思、錯題模式、易混淆點。
- `teaching-notes/`: 教學策略、複習建議、提示設計。
- `sources/`: 課文與考卷等來源 note，作為圖譜中的 source nodes。
- `entities/`: 人物、名詞、制度、組織等細粒度節點。
- `events/`: 學習事件、歷史事件、流程節點。
- `comparisons/`: 並列比較頁，例如人物、制度、時期、概念差異。
- `queries/`: 值得保留的查詢結果，例如單一學生考後整理。

## Frontmatter

```yaml
---
title: 頁面標題
created: YYYY-MM-DD
updated: YYYY-MM-DD
type: concept | summary | query | comparison | entity
tags: [history, grade-7, ...]
sources: [wiki/..., indexes/...]
confidence: high | medium | low
lesson_group_id: history-g7-l003
student_id: student-001
---
```

## Tag Taxonomy

允許的核心 tags：history, grade-7, lesson, concept, misconception, teaching-strategy, exam-analysis, student-progress, taiwan-history, japanese-rule, education, modernization, social-movements, local-autonomy, public-health, time-discipline, culture, politics, comparison, source-note, event, entity
