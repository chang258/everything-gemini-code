---
name: strategic-compact
description: 戰略性 Context 壓縮建議。在邏輯任務邊界（如研究結束、里程碑完成）主動提醒執行壓縮，以維持回應的連貫性與效能。
---

# Strategic Compact Skill

此技能旨在優化 Token 使用，透過在邏輯邊界主動提醒壓縮 Context，避免自動壓縮造成關鍵資訊遺失。

## 核心機制
- **工具計數器**: 追蹤當前 Session 執行的工具次數。
- **動態提醒**: 預設 50 次調用時觸發建議，隨後每 25 次循環提醒。

## 自動化追蹤 (Automation)
您可以要求我執行以下指令來手動觸發計數檢查（通常整合在 Hook 中）：
```powershell
powershell -File "$HOME\.gemini\skills\everything-gemini-code\skills\strategic-compact\scripts\suggest-compact.ps1"
```

## 決策指南
- **壓縮**: 調研結束後、Debug 成功後、里程碑完成後。
- **不壓縮**: 實作中途、正在修正連動 Bug 時。

---
*註：壓縮前建議先將關鍵計畫或決策存入 MEMORY.md 或專案檔案中。*

