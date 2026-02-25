# Gemini Skill Stocktake - Quick Diff (PowerShell Version)
param([string]$ResultsJson, [string]$CwdSkillsDir)

if (!(Test-Path $ResultsJson)) { exit 1 }

$results = Get-Content $ResultsJson -Raw | ConvertFrom-Json
$evalAt = [DateTime]::Parse($results.evaluated_at)
$knownPaths = $results.skills.psobject.properties.name # 獲取所有路徑鍵名

$GLOBAL_DIR = Join-Path $HOME ".gemini\skills"
$PROJECT_DIR = if ($CwdSkillsDir) { $CwdSkillsDir } else { Join-Path $PWD ".gemini\skills" }

function Get-ChangedFiles($dir) {
    if (!(Test-Path $dir)) { return @() }
    $files = Get-ChildItem $dir -Filter "*.md" -Recurse
    $changed = foreach ($f in $files) {
        $dp = $f.FullName.Replace($HOME, "~")
        $isNew = $true
        
        # 檢查是否已知
        if ($results.skills.$dp) {
            $isNew = $false
            if ($f.LastWriteTime.ToUniversalTime() -le $evalAt) { continue }
        }

        [PSCustomObject]@{
            path = $dp
            mtime = $f.LastWriteTime.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
            is_new = $isNew
        }
    }
    return $changed
}

$allChanged = Get-ChangedFiles $GLOBAL_DIR
$allChanged += Get-ChangedFiles $PROJECT_DIR

$allChanged | ConvertTo-Json
