---
name: continuous-learning-v2
description: 基於直覺的自動化學習系統。透過觀察會話建立具備置信度評分的原子直覺 (Instincts)，並將其演進為可複用的技能、指令或代理。
---

# Continuous Learning v2 (基於直覺的學習)

此技能實現了一個高度動態的學習循環，將日常會話中的模式轉化為系統的「直覺 (Instincts)」，進而演進為正式的能力。

## 指令集 (CLI Commands)

### 1. `/learn` - 主動學習模式
**用途**：分析當前會話或指定的代碼庫，提取可重用的模式。
**觸發時機**：
- 完成一個複雜任務後。
- 當使用者提到「記住這個做法」時。
- 定期盤點專案特定的最佳實踐。

### 2. `/instinct-status` - 查看狀態
顯示所有已學習直覺的置信度、觸發次數與來源。
```powershell
# 查詢特定領域的直覺
/instinct-status --domain git
```

### 3. `/evolve` - 演化直覺
當多個直覺顯示出關聯性時，將其「叢集化 (Clustering)」並生成正式的 `SKILL.md` 或 AI 代理配置。
- **目標**：從分散的規則演進為結構化的知識。

### 4. `/instinct-import` / `/instinct-export`
**匯出**：備份您的直覺庫，或分享給團隊成員。
**匯入**：載入團隊共用的直覺，快速同步開發規範。

## 直覺模型規範 (Instinct Model)

每個直覺包含以下欄位：
- **ID**: 唯一識別碼。
- **Trigger**: 觸發情境（例如：「當撰寫提交訊息時」）。
- **Action**: 建議採取的行為或規範。
- **Confidence (0.3 - 0.9)**: 隨重複次數增加。
- **Evidence**: 關聯的檔案路徑或會話摘要。

## 管理腳本位置
- 狀態/演化/匯出入：`scripts\instinct-cli.py`
- 數據路徑：`~/.gemini/homunculus/`

---
*註：v2 優先於 v1，因為它具備更細粒度的學習能力與置信度驗證。*

