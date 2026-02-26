---
name: skill-creator-local
description: 在地技能生成代理。分析本地 Git 歷史紀錄以提取代碼模式，並生成符合團隊慣例的 SKILL.md 指引。
---

# Local Skill Creator (在地技能生成)

此技能專注於從 Git 歷史紀錄中自動偵測團隊的開發模式（Commit 規範、檔案結構、重覆性工作流）。當使用 `/skill-create` 指令時，請遵循以下步驟。

## 指令用法：`/skill-create`

**參數**：
- `--commits <n>`：分析最近的 n 個提交。
- `--output <path>`：指定產出的 SKILL.md 目錄。
- `--instincts`：同時生成供持續學習 v2 使用的直覺。

## 分析步驟

1.  **解析 Git 歷史**：分析提交訊息、受影響檔案及模式。
2.  **偵測模式 (Pattern Detection)**：
    - **Commit 慣例**：前綴（feat:, fix:, chore:）的使用比率。
    - **架構模式**：資料夾結構與命名規範。
    - **工作流序列**：總是同時變動的檔案（如：修改 API 時必改測試）。
    - **測試模式**：測試檔案的位置、命名與覆蓋率目標。
3.  **生成技能文件 (SKILL.md)**：產生具備名稱、描述、模式說明與範例的完整技能檔案。
4.  **生成直覺 (Instincts)**：若指定 `--instincts`，則產生具備 Trigger 與 Action 的原子學習點。

## 偵測維度
- **提交規範**：判斷是否遵循 Conventional Commits。
- **檔案關聯**：檔案 co-changes 分析。
- **代碼架構**：資料夾層次結構。

---
*註：分析結果應優先由開發者進行品質確認，方可正式併入技能庫。*
