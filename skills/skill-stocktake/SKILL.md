---
name: skill-stocktake
description: 技能庫品質盤點工具。透過 AI 審計盤點全域與專案層級的技能品質，提供保留、改進或汰換建議。支援快速掃描與全量盤點模式。
---

# Skill Stocktake (技能盤點)

此技能用於定期審計 Gemini 技能與命令的品質，確保指令集保持精簡、正確且無重複。

## 盤點模式 (Windows 原生指令)

### 1. 全量盤點 (Full Stocktake)
掃描所有技能並分析使用頻率：
```powershell
powershell -File "$HOME\.gemini\skills\everything-gemini-code\skills\skill-stocktake\scripts\scan.ps1"
```

### 2. 快速差異比對 (Quick Diff)
僅顯示自上次盤點後有變動的技能：
```powershell
powershell -File "$HOME\.gemini\skills\everything-gemini-code\skills\skill-stocktake\scripts\quick-diff.sh" "$HOME\.gemini\skills\skill-stocktake\results.json"
```

## 運作流程
1. **Inventory**: 列出全域 (`~/.gemini/skills/`) 與專案中的所有技能檔案。
2. **Evaluation**: 使用 AI 判斷該技能是否需要保留、更新、改進或合併。
3. **Consolidation**: 根據審計建議進行目錄清理與內容優化。

## 評判標準 (Verdict)
- **Keep**: 具備獨特性且實用的指令。
- **Improve**: 需細化範例或縮減篇幅。
- **Update**: 技術已過時，需更新參考。
- **Retire**: 內容重複或已無使用價值。

---
*註：執行刪除或合併操作前，務必先取得使用者確認。*

