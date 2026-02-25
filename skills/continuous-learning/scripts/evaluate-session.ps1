# Gemini Continuous Learning - Session Evaluator (PowerShell Version)
# 用於評估會話長度並決定是否執行模式提取。

$SCRIPT_DIR = $PSScriptRoot
$CONFIG_FILE = Join-Path $SCRIPT_DIR "config.json"
$LEARNED_SKILLS_PATH = Join-Path $HOME ".gemini\skills\learned"
$MIN_SESSION_LENGTH = 10

# 1. 載入配置 (如果有)
if (Test-Path $CONFIG_FILE) {
    try {
        $config = Get-Content $CONFIG_FILE -Raw | ConvertFrom-Json
        if ($config.min_session_length) { $MIN_SESSION_LENGTH = $config.min_session_length }
        if ($config.learned_skills_path) { 
            $LEARNED_SKILLS_PATH = $config.learned_skills_path.Replace("~", $HOME)
        }
    } catch {
        Write-Warning "[ContinuousLearning] 無法解析 config.json，將使用預設值。"
    }
}

# 確保目錄存在
if (!(Test-Path $LEARNED_SKILLS_PATH)) {
    New-Item -ItemType Directory -Force -Path $LEARNED_SKILLS_PATH | Out-Null
}

# 2. 獲取對話紀錄路徑 (從 Stdin 或 環境變數)
$transcriptPath = ""
$stdinData = $input | Out-String

if ($stdinData -and $stdinData.Contains("transcript_path")) {
    if ($stdinData -match '"transcript_path":"([^"]*)"') {
        $transcriptPath = $matches[1]
    }
}

if (-not $transcriptPath) {
    $transcriptPath = $env:GEMINI_TRANSCRIPT_PATH
}

# 3. 檢查檔案是否存在
if (-not $transcriptPath -or -not (Test-Path $transcriptPath)) {
    exit 0
}

# 4. 計算 User 訊息數量
try {
    $content = Get-Content $transcriptPath -Raw
    $matches = [regex]::Matches($content, '"type":"user"')
    $messageCount = $matches.Count
} catch {
    $messageCount = 0
}

# 5. 輸出結果
if ($messageCount -lt $MIN_SESSION_LENGTH) {
    Write-Host "[ContinuousLearning] 會話過短 ($messageCount 則訊息)，跳過模式提取。" -ForegroundColor Gray
    exit 0
}

Write-Host "[ContinuousLearning] 偵測到 $messageCount 則訊息 - 建議啟動模式提取流程。" -ForegroundColor Green
Write-Host "[ContinuousLearning] 學習到的技能將存儲於: $LEARNED_SKILLS_PATH" -ForegroundColor Cyan
