---
title: 歷史七下第3課錯題與教學重點同步方案
created: 2026-05-04
updated: 2026-05-04
type: query
tags: [subject-history, grade-7, teaching-strategy, exam-pattern, retake]
sources: [../wiki/students/student-001/progress/history/g7/l003/summary.md, ../wiki/lessons/history/g7/l003/drive-s2-textbook.md, ../wiki/exams/history/g7/l003/drive-s2-quiz.md]
lesson_group: history-g7-l003
confidence: high
---

# 歷史七下第3課錯題與教學重點同步方案

## 目標
在不改變 canonical tutor artifacts 結構的前提下，將教學過程中累積出的高價值知識，自動或半自動整理到 `knowledge/`。第一階段先聚焦兩類內容：

1. 錯題與常見迷思
2. 教學重點與提示策略

## Canonical truth boundary
真正的來源仍是 tutor runtime 既有 artifacts：

- `../wiki/lessons/...`
- `../wiki/exams/...`
- `../wiki/students/.../answer-history/...`
- `../wiki/students/.../progress/...`
- `../indexes/...`

`knowledge/` 只保存整理後的衍生知識，不回寫判分結果，不取代 lesson/exam/progress 真實紀錄。

## 推薦的同步節點

### A. 課文或考卷 ingest 完成後
可同步建立或更新：
- `concepts/<lesson-group>.md`
- `teaching-notes/<lesson-group>-teaching-focus.md`

資料來源：
- lesson markdown
- exam markdown
- questions sidecar

用途：
- 歸納本課核心概念
- 抽出常考題型
- 先建立課前/課中提示骨架

### B. 一輪考試作答結束後
可同步更新：
- `misconceptions/<lesson-group>-misconceptions.md`
- `queries/<lesson-group>-exam-report.md`

資料來源：
- answer history
- progress summary
- outstanding wrong questions

用途：
- 抽出本輪真正答錯過的概念
- 區分「首輪答錯但重考已改正」與「仍未改正」
- 保留本輪學習報告

### C. 錯題重考結束後
可再更新：
- misconceptions page 補上 corrected framing
- teaching-notes page 補上有效提示語法

用途：
- 讓 knowledge wiki 記住哪些提示有效
- 形成未來相似題目的 tutoring hints

## 建議的 knowledge page 設計

### 1. Concepts page
建議檔名：
- `concepts/history-g7-l003-social-and-cultural-change.md`

內容欄位：
- 本課時代脈絡
- 核心概念
- 常考主題
- 易混淆對比
- 連到 `[[history-g7-l003-misconceptions]]`
- 連到 `[[history-g7-l003-teaching-focus]]`

### 2. Misconceptions page
建議檔名：
- `misconceptions/history-g7-l003-misconceptions.md`

內容格式：
- misconception label
- mistaken pattern
- corrected framing
- evidence questions
- hint strategy

這次實例可先放入：
- 留學題誤判成女性只能讀到公學校
- 林獻堂 vs 蔣渭水人物辨識
- 中日戰爭 vs 霧社事件
- 時間觀念海報誤判成衛生宣導
- 24小時制/星期制 vs 司法制度混淆

### 3. Teaching-notes page
建議檔名：
- `teaching-notes/history-g7-l003-teaching-focus.md`

內容格式：
- 課堂最重要觀念
- 出題高頻點
- 可用提示模板
- 哪些題目適合用年代排除法
- 哪些題目適合用人物關鍵詞辨識

### 4. Query/report page
建議檔名：
- `queries/history-g7-l003-exam-report-2026-05-04.md`

內容格式：
- 作答總次數
- 題目總數
- 首輪錯題
- 重考後結果
- 本輪學習總結

## 實作方式建議

### 方案 1：CLI 後處理命令（最推薦）
新增一個明確命令，例如：

```bash
edu-cli sync-knowledge \
  --vault-root <tutor-root> \
  --student-id student-001 \
  --subject history \
  --grade 7 \
  --lesson-no 3 \
  --lesson-variant-id drive-s2-textbook \
  --exam-variant-id drive-s2-quiz
```

優點：
- 邊界清楚
- 不會把知識層和判分主流程耦合太緊
- 容易測試與重跑

### 方案 2：在 `export-progress` 後附帶同步（次推薦）
在 progress summary 產出後順手更新 knowledge pages。

缺點：
- `export-progress` 職責會變重
- 若知識同步失敗，容易和 progress 問題混在一起

### 方案 3：cron 定時彙整（適合後期）
每日或每課結束後，由 cron 掃描新 answer-history / progress，再整理進 `knowledge/`。

適用情境：
- 多學生
- 多課次
- 長期累積

## 最小可行版本（MVP）
第一版只做這三件事就夠：

1. 從 `summary.md` 讀出本輪答題統計
2. 從 `answer-history` 找出曾錯後對的題目與仍錯題目
3. 產生 / 更新：
   - `misconceptions/<lesson-group>-misconceptions.md`
   - `teaching-notes/<lesson-group>-teaching-focus.md`
   - `queries/<lesson-group>-exam-report-YYYY-MM-DD.md`

## 同步邏輯建議

### Misconceptions 提取規則
- 只收錄「首輪答錯」或「重考後才改正」的題目
- 同類誤解合併成一個 misconception entry
- 每個 entry 至少記：
  - question ids
  - mistaken pattern
  - corrected framing
  - recommended hint

### Teaching focus 提取規則
- 從 lesson markdown 的章節標題與整理段落抓概念
- 從 exam 題目抓高頻題型
- 從 tutoring 過程中實際有效的提示抽出 hint template

## 驗證標準
同步完後至少要能驗證：

- `knowledge/index.md` 有新增條目
- `knowledge/log.md` 有新增同步紀錄
- 目標知識頁面存在
- 每頁 `sources:` 指向 canonical tutor artifacts
- 不修改 canonical lesson/exam/student markdown 內容

## 建議下一步開發順序
1. 先做 `sync-knowledge` CLI 骨架
2. 先支援單一 lesson group
3. 先輸出 misconceptions 與 exam report
4. 再補 teaching-notes 自動萃取
5. 最後再考慮 cron 自動化

## 關聯頁面
- [[history-g7-l003-social-and-cultural-change]]
- [[history-g7-l003-misconceptions]]
- [[history-g7-l003-teaching-focus]]
