---
name: security-scan
description: AI 代理配置安全掃描。針對 .gemini / .claude 目錄下的配置（如 settings.json, CLAUDE.md）檢查提示注入風險與配置錯誤。
---

# AI Agent Configuration Security Scan

此技能用於掃描與審計 AI 代理的配置環境，防範「提示注入」與「權限過大」導致的安全風險。

## 掃描範疇
- **CLAUDE.md / GEMINI.md**: 檢查是否存在自動執行危險指令的引導語。
- **Settings.json**: 審查允許列表 (Allowed lists) 是否過於寬鬆。
- **MCP Servers**: 檢查是否存在具備高風險工具存取權的第三方服務。
- **Hooks**: 檢查 Pre/Post hooks 是否存在命令注入漏洞。

## 修復建議
- **初始化安全配置**: 使用 `/security-scan init` 建立基準線。
- **權限最小化**: 僅開放必要的工具與目錄存取權限。

---
*註：此技能建議在修改任何系統級配置後執行。*
