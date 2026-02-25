# Gemini Skill Stocktake - Save Results (PowerShell Version)
param([string]$ResultsJson)

$evalAt = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
$inputJson = $input | Out-String | ConvertFrom-Json

if (!(Test-Path $ResultsJson)) {
    $inputJson | Add-Member -MemberType NoteProperty -Name "evaluated_at" -Value $evalAt
    $inputJson | ConvertTo-Json -Depth 10 | Out-File $ResultsJson -Encoding utf8
    exit 0
}

$existing = Get-Content $ResultsJson -Raw | ConvertFrom-Json

# 合併數據
$existing.evaluated_at = $evalAt
if ($inputJson.mode) { $existing.mode = $inputJson.mode }
if ($inputJson.batch_progress) { $existing.batch_progress = $inputJson.batch_progress }

# 合併技能列表
if ($inputJson.skills) {
    foreach ($prop in $inputJson.skills.psobject.properties) {
        $existing.skills | Add-Member -MemberType NoteProperty -Name $prop.Name -Value $prop.Value -Force
    }
}

$existing | ConvertTo-Json -Depth 10 | Out-File $ResultsJson -Encoding utf8
