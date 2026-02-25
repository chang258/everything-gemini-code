---
name: deployment-patterns
description: 生產部署工作流程與 CI/CD 模式。包含 Docker 最佳實踐、藍綠/金絲雀部署策略及健康檢查 (Health Checks) 配置。
---

# Deployment Patterns & CI/CD

此技能提供確保應用程式平滑發佈與高可用性的部署策略。

## 部署策略
- **滾動更新 (Rolling)**: 逐台替換實例，零停機。
- **藍綠部署 (Blue-Green)**: 原子化切換流量，支援即時回滾。
- **金絲雀部署 (Canary)**: 小規模測試流量，逐步擴大。

## Docker 最佳實踐
- 使用 **多階段構建 (Multi-stage build)** 以減小映像檔體積。
- 以 **非 root 使用者** 執行應用程式。
- 實作 **HEALTHCHECK** 以供容器編排器監測狀態。

---
*註：所有環境配置應透過環境變數注入，遵循「十二要素應用程式」規範。*
