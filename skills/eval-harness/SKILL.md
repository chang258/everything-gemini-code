---
name: eval-harness
description: 評估驅動開發 (EDD) 框架。用於定義 AI 代理任務的成功準則、測量可靠性指標 (pass@k) 與追蹤迴歸測試 (Regression evals)。
---

# Eval Harness (評估套件)

此技能實現了「評估驅動開發 (Eval-Driven Development)」原則。當使用 `/eval` 或 `/learn-eval` 指令時，請遵循以下規範。

## 指令集 (CLI Commands)

### 1. `/eval` - 管理評估工作流
- **`define <name>`**：在 `.claude/evals/` 下建立評估定義文件。
- **`check <name>`**：執行指定功能的評估，並記錄 PASS/FAIL 於日誌中。
- **`report <name>`**：產生包含能力、迴歸指標及 SHIP/NEEDS WORK 建議的報告。
- **`list`**：列出所有已定義的評估及其當前狀態。

### 2. `/learn-eval` - 提取、評估後儲存
**用途**：從會話中提取模式，在經過自我品質檢查後儲存為新技能。
**自我評估維度 (Self-Evaluation Rubric)**：
- **Specificity (具體性)**：是否包含豐富的代碼範例？
- **Actionability (可操作性)**：步驟是否清晰、立即執行？
- **Scope Fit (範圍契合)**：名稱與內容是否高度對齊？
- **Non-redundancy (非重複性)**：是否有獨特價值？
- **Coverage (覆蓋率)**：是否涵蓋主要情況與坑點？
*評分標準：每一項需 ≥ 3 分（滿分 5 分）方可儲存。*

## 評估範本 (Templates)

### 能力評估 (Capability Evals)
測試新功能的達成率。標準：`pass@3 > 90%`。
- [ ] [能力描述 1]
- [ ] [能力描述 2]

### 迴歸評估 (Regression Evals)
確保舊功能未損壞。標準：`pass^3 = 100%`。
- [ ] [現有行為 1 依然正常]
- [ ] [現有行為 2 依然正常]

## 儲存位置決策
- **Global (`~/.gemini/skills/`)**：通用模式（Bash、LLM 行為、通用調試）。
- **Project (`.claude/skills/`)**：專案特定知識（架構規範、特定配置）。

---
*註：優先使用「代碼判定 (Code-Based Grader)」來實現確定性的自動化檢查。*
