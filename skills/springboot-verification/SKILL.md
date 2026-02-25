---
name: springboot-verification
description: Spring Boot 專案驗證循環。包含建置檢查、靜態分析 (SpotBugs/PMD)、測試覆蓋率驗證、安全性掃描與發佈前的 Diff 審查。
---

# Spring Boot Verification Loop

此技能提供發佈前或提交 PR 前的完整檢核流程，確保交付物符合生產品質。

## 驗證階段
1. **建置 (Build)**: 執行 `mvn clean verify` 確保編譯與封裝正常。
2. **靜態分析**: 使用 SpotBugs, PMD 或 Checkstyle 檢查潛在的 Code Smell。
3. **覆蓋率驗證**: 檢查 JaCoCo 報告是否達到門檻（預設 80%）。
4. **安全掃描**: 使用 `dependency-check` 掃描已知 CVE 漏洞。
5. **差異審查**: 檢查代碼中是否遺留偵錯日誌（如 `System.out.println`）。

---
*註：快速回饋勝過最後一刻的驚喜。建議每 30 分鐘執行一次核心驗證流程。*
