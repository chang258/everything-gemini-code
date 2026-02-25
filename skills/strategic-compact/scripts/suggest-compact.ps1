# Gemini Strategic Compact Suggester (PowerShell Version)
# 用於跟蹤工具調用次數，並在適當時機建議執行 /compact。

$sessionId = $env:GEMINI_SESSION_ID
if (-not $sessionId) { $sessionId = "default" }

$tempDir = $env:TEMP
$counterFile = Join-Path $tempDir "gemini-tool-count-$sessionId.txt"
$threshold = if ($env:COMPACT_THRESHOLD) { [int]$env:COMPACT_THRESHOLD } else { 50 }

# 1. 初始化或增加計數
$count = 1
if (Test-Path $counterFile) {
    try {
        $count = [int](Get-Content $counterFile -Raw).Trim() + 1
    } catch {
        $count = 1
    }
}
$count | Out-File -FilePath $counterFile -Encoding ascii -NoNewline

# 2. 判斷是否輸出建議 (輸出至錯誤串流以避免干擾正常工具輸出)
if ($count -eq $threshold) {
    Write-Host "[StrategicCompact] 已達到 $threshold 次工具調用 - 若研究/規劃已完成，建議執行 /compact 以釋放 Context。" -ForegroundColor Yellow
}
elseif ($count -gt $threshold -and ($count % 25 -eq 0)) {
    Write-Host "[StrategicCompact] 目前工具調用次數: $count - 良好的檢核點，可考慮執行 /compact 保持對話連貫性。" -ForegroundColor Cyan
}
