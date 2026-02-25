# Gemini Skill Stocktake - Scanner (PowerShell Version)
param([string]$CwdSkillsDir)

$GLOBAL_DIR = Join-Path $HOME ".gemini\skills"
$PROJECT_DIR = if ($CwdSkillsDir) { $CwdSkillsDir } else { Join-Path $PWD ".gemini\skills" }
$OBSERVATIONS = Join-Path $HOME ".gemini\homunculus\observations.jsonl"

function Extract-FrontmatterField($filePath, $field) {
    try {
        $content = Get-Content $filePath -Raw
        if ($content -match '(?s)^---(.*?)---') {
            $fm = $matches[1]
            if ($fm -match "$field`:\s*(.*)") {
                return $matches[1].Trim().Trim('"').Trim("'")
            }
        }
    } catch {}
    return ""
}

function Get-UsageCounts($obsPath, $days) {
    $counts = @{}
    if (Test-Path $obsPath) {
        $cutoff = (Get-Date).AddDays(-$days).ToUniversalTime()
        Get-Content $obsPath | ForEach-Object {
            try {
                $obj = $_ | ConvertFrom-Json
                if ($obj.tool -eq "Read") {
                    $ts = [DateTime]::Parse($obj.timestamp)
                    if ($ts -ge $cutoff) {
                        $p = $obj.path
                        $counts[$p] = ($counts[$p] ?? 0) + 1
                    }
                }
            } catch {}
        }
    }
    return $counts
}

$u7 = Get-UsageCounts $OBSERVATIONS 7
$u30 = Get-UsageCounts $OBSERVATIONS 30

function Scan-Directory($dir) {
    if (!(Test-Path $dir)) { return @() }
    $files = Get-ChildItem $dir -Filter "*.md" -Recurse
    $results = foreach ($f in $files) {
        $path = $f.FullName.Replace($HOME, "~")
        [PSCustomObject]@{
            path = $path
            name = Extract-FrontmatterField $f.FullName "name"
            description = Extract-FrontmatterField $f.FullName "description"
            use_7d = $u7[$path] ?? 0
            use_30d = $u30[$path] ?? 0
            mtime = $f.LastWriteTime.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
        }
    }
    return $results
}

$globalSkills = Scan-Directory $GLOBAL_DIR
$projectSkills = Scan-Directory $PROJECT_DIR

$allSkills = $globalSkills + $projectSkills

$output = [PSCustomObject]@{
    scan_summary = @{
        global = @{ found = (Test-Path $GLOBAL_DIR); count = $globalSkills.Count }
        project = @{ found = (Test-Path $PROJECT_DIR); path = $PROJECT_DIR; count = $projectSkills.Count }
    }
    skills = $allSkills
}

$output | ConvertTo-Json -Depth 10
