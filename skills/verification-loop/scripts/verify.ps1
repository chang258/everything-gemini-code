# Gemini Verification Loop - Universal Checker (Windows Version)
# 功能：自動偵測專案類型、執行全域 CI 驗證並進行品質稽核。

$projectName = Split-Path $PWD -Leaf
$globalScriptsDir = "$PSScriptRoot\..\..\..\scripts"
$allPassed = $true

Write-Host "--- 正在驗證專案: $projectName ---" -ForegroundColor Cyan

function Run-Step($name, $command, $isNodeCommand = $false) {
    Write-Host "`n[階段: $name]" -ForegroundColor Yellow
    if ($isNodeCommand) {
        node $command
    } else {
        Invoke-Expression $command
    }
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ $name 失敗 (代碼: $LASTEXITCODE)" -ForegroundColor Red
        return $false
    }
    Write-Host "✅ $name 通過" -ForegroundColor Green
    return $true
}

# 1. 全域 CI 驗證 (Global CI Validation)
Write-Host "`n[階段: 全域項目結構驗證]" -ForegroundColor Yellow
$ciScripts = Get-ChildItem "$globalScriptsDir\ci\validate-*.js"
foreach ($script in $ciScripts) {
    if (! (Run-Step "驗證 $($script.BaseName)" $script.FullName $true)) { $allPassed = $false }
}

# 2. 專案類型偵測與驗證
$isNode = Test-Path "package.json"
$isPython = (Test-Path "requirements.txt") -or (Test-Path "pyproject.toml")

if ($isNode) {
    Write-Host "`n偵測到 Node.js 專案" -ForegroundColor Gray
    if (! (Run-Step "建置檢查" "npm run build")) { $allPassed = $false }
    if (! (Run-Step "代碼檢查" "npm run lint")) { $allPassed = $false }
    if (! (Run-Step "測試套件" "npm test -- --coverage")) { $allPassed = $false }
}
elseif ($isPython) {
    Write-Host "`n偵測到 Python 專案" -ForegroundColor Gray
    if (! (Run-Step "型別檢查" "pyright .")) { $allPassed = $false }
    if (! (Run-Step "代碼檢查" "ruff check .")) { $allPassed = $false }
    if (! (Run-Step "測試套件" "pytest --cov")) { $allPassed = $false }
}

# 3. 代碼日誌稽核 (Log Audit)
Write-Host "`n[階段: 代碼日誌稽核]" -ForegroundColor Yellow
if (Test-Path "$globalScriptsDir\hooks\check-console-log.js") {
    # 這裡我們手動觸發 hooks，不帶 stdin 數據以執行全量掃描模式（或模擬 modified files）
    if (! (Run-Step "console.log 檢查" "$globalScriptsDir\hooks\check-console-log.js" $true)) { $allPassed = $false }
}

# 4. 通用安全掃描 (Secret Scan)
Write-Host "`n[階段: 安全掃描]" -ForegroundColor Yellow
$secrets = Get-ChildItem -Recurse -Include *.ts,*.js,*.py,*.env -Exclude node_modules,dist,build,*.test.* | Select-String -Pattern "sk-", "api_key", "password="
if ($secrets) {
    Write-Host "⚠️ 偵測到疑似機密資訊：" -ForegroundColor Magenta
    $secrets | ForEach-Object { Write-Host "  $($_.Path):$($_.LineNumber)" }
    $allPassed = $false
} else {
    Write-Host "✅ 未發現明顯機密洩漏" -ForegroundColor Green
}

# 5. 總結報告 (Summary)
Write-Host "`n===================================="
if ($allPassed) {
    Write-Host "🎉 VERIFICATION: PASS" -ForegroundColor Green
    Write-Host "項目已就緒，符合生產環境標準。" -ForegroundColor Green
} else {
    Write-Host "🚫 VERIFICATION: FAIL" -ForegroundColor Red
    Write-Host "請修正上述錯誤後再進行提交。" -ForegroundColor Red
}
Write-Host "===================================="
