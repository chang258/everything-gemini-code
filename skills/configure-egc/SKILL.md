---
name: configure-egc
description: Everything Gemini Code (EGC) 的互動式配置助手。引導使用者安裝、驗證與優化本地技能 (Skills) 與規則 (Rules)，確保路徑正確且符合專案需求。
---

# Configure Everything Gemini Code (EGC)

此技能是 EGC 技能庫的總管助手，負責管理、部署與優化您的 Gemini CLI 技能環境。

## 觸發時機
- 使用者要求「配置 EGC」、「安裝新技能」或「同步技能庫」時。
- 需要驗證現有技能目錄結構是否正確時。
- 需要根據當前專案技術棧優化已安裝技能的指令內容時。

## 核心工作流程

### 1. 技能庫定位
- 預設來源：`$HOME\.gemini\skills\everything-gemini-code\`。
- 驗證 `skills/` 與 `rules/` 目錄是否存在。

### 2. 互動式安裝 (Wizard)
- 使用 `ask_user` 詢問要部署的技能類別。
- 支援部署至：
    - **全域層級**: `$HOME\AppData\Roaming\npm\node_modules\@google\gemini-cli\...` (或使用者設定路徑)。
    - **專案層級**: 當前工作目錄下的 `.gemini/skills/`。

### 3. 自動化驗證 (Validation)
- **檔案完整性**: 檢查每個技能是否包含必備的 `SKILL.md`。
- **路徑校準**: 掃描技能內部的路徑參考，將 `~/.claude/` 或舊路徑自動修正為當前的 `.gemini/` 路徑。
- **依賴檢查**: 確保如 `django-tdd` 等相依技能已一併安裝。

### 4. 專案級優化 (Optimization)
- **內容裁剪**: 移除技能中不相關的程式語言或框架部分。
- **規則微調**: 根據專案需求調整測試覆蓋率標準（如從 80% 改為 90%）。

## 執行指令參考

### 初始化與同步
- 使用 `run_shell_command` 執行 `git pull` 以更新 EGC 原始碼。
- 使用 `skill-creator` 的打包工具將目錄封裝為 `.skill` 檔案。

### 部署範例
```bash
# 打包特定技能
node .../package_skill.cjs <source_path> <output_path>

# 安裝技能
gemini skills install <path_to_skill> --scope user
```

## 故障排除指引
- **技能未生效**: 檢查目錄結構是否為 `skills/名稱/SKILL.md`（而非多層巢狀）。
- **指令衝突**: 檢查全域與專案層級是否有重複的技能名稱。

---
*註：執行任何安裝或修改操作前，務必先取得使用者確認。*

