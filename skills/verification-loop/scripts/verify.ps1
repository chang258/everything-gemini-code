# Gemini Verification Loop - Universal Checker (Windows Version)
# 功能：自動偵測專案類型並執行完整品質檢查。

$projectName = Split-Path $PWD -Leaf
Write-Host "--- 正在驗證專案: $projectName ---" -ForegroundColor Cyan

# 1. 偵測專案類型
$isNode = Test-Path "package.json"
$isPython = (Test-Path "requirements.txt") -or (Test-Path "pyproject.toml")

function Run-Step($name, $command) {
    Write-Host "`n[階段: $name]" -ForegroundColor Yellow
    Invoke-Expression $command
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ $name 失敗 (代碼: $LASTEXITCODE)" -ForegroundColor Red
        return $false
    }
    Write-Host "✅ $name 通過" -ForegroundColor Green
    return $true
}

# 2. 執行驗證流程
$allPassed = $true

if ($isNode) {
    Write-Host "偵測到 Node.js 專案" -ForegroundColor Gray
    if (! (Run-Step "編譯檢查" "npm run build")) { $allPassed = $false }
    if (! (Run-Step "代碼檢查" "npm run lint")) { $allPassed = $false }
    if (! (Run-Step "測試套件" "npm test -- --coverage")) { $allPassed = $false }
}
elseif ($isPython) {
    Write-Host "偵測到 Python 專案" -ForegroundColor Gray
    if (! (Run-Step "型別檢查" "pyright .")) { $allPassed = $false }
    if (! (Run-Step "代碼檢查" "ruff check .")) { $allPassed = $false }
    if (! (Run-Step "測試套件" "pytest --cov")) { $allPassed = $false }
}
else {
    Write-Host "未偵測到支援的專案類型，僅執行通用檢查。" -ForegroundColor Gray
}

# 3. 通用安全掃描 (Secret Scan)
Write-Host "`n[階段: 安全掃描]" -ForegroundColor Yellow
$secrets = Get-ChildItem -Recurse -Include *.ts,*.js,*.py,*.env | Select-String -Pattern "sk-", "api_key", "password=" -Exclude "*.test.*"
if ($secrets) {
    Write-Host "⚠️ 偵測到疑似機密資訊：" -ForegroundColor Magenta
    $secrets | ForEach-Object { Write-Host "  $($_.Path):$($_.LineNumber)" }
    $allPassed = $false
} else {
    Write-Host "✅ 未發現明顯機密洩漏" -ForegroundColor Green
}

# 4. 總結報告
Write-Host "`n===================================="
if ($allPassed) {
    Write-Host "🎉 驗證全數通過！專案已就緒。" -ForegroundColor Green
} else {
    Write-Host "⚠️ 驗證過程中發現問題，請修正後再提交。" -ForegroundColor Red
}
Write-Host "===================================="
