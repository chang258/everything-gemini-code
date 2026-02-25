---
name: continuous-learning-v2
description: 基於直覺的自動化學習系統。透過觀察會話建立具備置信度評分的原子直覺 (Instincts)，並將其演進為可複用的技能、指令或代理。
---

# Continuous Learning v2 (Instinct-based)

此技能實現了一個高度動態的學習循環，將日常會話中的模式轉化為系統的「直覺」，進而演進為正式的能力。

## 核心機制：直覺模型 (Instinct Model)
- **原子性**: 每個直覺僅代表一個微小的行為模式。
- **置信度評分 (0.3 - 0.9)**: 隨模式重複增加，隨使用者糾正減少。
- **證據支持**: 記錄觸發該模式的具體會話證據。

## 管理指令 (CLI Tools)
您可以要求我執行以下指令來管理您的直覺庫：

### 1. 查看狀態
顯示所有已學習的直覺及其置信度：
```powershell
python "$HOME\.gemini\skills\everything-gemini-code\skills\continuous-learning-v2\scripts\instinct-cli.py" status
```

### 2. 演化直覺
將累積的直覺叢集化為正式技能：
```powershell
python "$HOME\.gemini\skills\everything-gemini-code\skills\continuous-learning-v2\scripts\instinct-cli.py" evolve
```

### 3. 匯入/匯出
```powershell
# 匯出直覺備份
python "$HOME\.gemini\skills\everything-gemini-code\skills\continuous-learning-v2\scripts\instinct-cli.py" export ./my_instincts.json

# 從外部檔案匯入
python "$HOME\.gemini\skills\everything-gemini-code\skills\continuous-learning-v2\scripts\instinct-cli.py" import ./shared_instincts.json
```

## 部署與配置
- **數據路徑**: `~/.gemini/homunculus/`。
- **配置文件**: `config.json` 用於調整置信度閾值與觀察頻率。

---
*註：v2 優先於 v1，因為它具備更細粒度的學習能力與置信度驗證。*

