---
name: docker-patterns
description: Docker 與 Docker Compose 開發模式。涵蓋本地開發環境建置、多階段構建 (Multi-stage build)、容器安全、網路配置與卷 (Volume) 管理策略。
---

# Docker Patterns for Development

此技能定義了容器化開發的最佳實踐，旨在建立高效、安全且可重現的開發與生產環境。

## 核心模式

### 1. 本地開發環境 (Docker Compose)
- **熱重載 (Hot Reload)**: 透過 Bind Mount 將原始碼掛載至容器內。
- **依賴隔離**: 使用匿名卷 (Anonymous Volume) 保護容器內的 `node_modules` 或依賴項。
- **服務發現**: 同一個 Compose 網路中的服務可透過服務名稱（如 `db`, `redis`）直接存取。

### 2. 多階段構建 (Multi-stage Build)
- **開發階段**: 包含偵錯工具與原始碼掛載。
- **構建階段**: 執行編譯與相依項裁剪。
- **生產階段**: 僅保留運行必備的 Artifact，並以非 root 使用者執行，以縮小映像檔體積並提升安全性。

### 3. 資料持久化 (Volumes)
- **具名卷 (Named Volumes)**: 用於持久化資料庫數據。
- **繫結掛載 (Bind Mounts)**: 用於開發時同步代碼。

### 4. 容器安全
- **非 Root 執行**: 始終在 Dockerfile 中建立並使用專屬使用者。
- **最小化權限**: 僅授予容器運作所需的 Linux Capabilities。
- **機密管理**: 嚴禁將 API Key 或密碼寫死在映像檔層級，應透過 `.env` 或系統環境變數注入。

## 常用偵錯指令
- `docker compose logs -f`: 追蹤日誌。
- `docker compose exec [service] sh`: 進入容器終端。
- `docker compose ps`: 查看服務狀態。

---
*註：生產環境建議搭配 Kubernetes 或雲端託管服務 (如 ECS/Railway)，避免直接在生產環境裸跑 Docker Compose。*
