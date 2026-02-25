---
name: continuous-learning
description: 自動化模式提取系統。在會話結束時透過評估腳本識別可複用的開發模式，並儲存為學習技能。
---

# Continuous Learning v1 (Pattern-based)

這是第一代學習系統，專注於在會話結束時進行完整的模式提取。

## 觸發時機
- 會話長度達到閾值（預設 10+ 訊息）時。
- 會話包含錯誤解決、使用者修正或獨特的調試技術時。

## 會話評估工具 (Evaluation Tool)
此技能內建了會話評估腳本，用於判斷當前對話是否具備提取價值。

### 執行方式
您可以要求我執行以下指令來評估當前會話：
```powershell
powershell -File "$HOME\.gemini\skills\everything-gemini-code\skills\continuous-learning\scripts\evaluate-session.ps1"
```

## 運作方式
1. **會話評估**: 檢查會話訊息數量。
2. **模式檢測**: 識別「問題-對策」結構。
3. **技能提取**: 將成果寫入 `~/.gemini/skills/learned/`。

---
*註：此版本與 v2 可並行運作，v1 適合提取長篇的工作流程，v2 適合捕捉細微的偏好。*

