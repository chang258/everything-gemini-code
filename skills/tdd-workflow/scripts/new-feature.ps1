# Gemini TDD Scaffolder
# 功能：快速產生符合 TDD 規範的元件/功能模組樣板。

param([string]$Name)

if (-not $Name) {
    $Name = Read-Host "請輸入功能或元件名稱 (例如: UserAuth)"
}

$isNode = Test-Path "package.json"

if ($isNode) {
    $dir = "src/components/$Name"
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    
    # 產生代碼檔
    @"
export function $Name() {
    return (
        <div>$Name Component</div>
    );
}
"@ | Out-File "$dir/$Name.tsx" -Encoding utf8

    # 產生測試檔
    @"
import { render, screen } from '@testing-library/react';
import { $Name } from './$Name';

describe('$Name Component', () => {
    it('should render correctly', () => {
        render(<$Name />);
        expect(screen.getByText(/$Name/i)).toBeInTheDocument();
    });
});
"@ | Out-File "$dir/$Name.test.tsx" -Encoding utf8

    Write-Host "✅ 已為 Node.js 專案建立 $Name 腳手架於 $dir" -ForegroundColor Green
}
else {
    # 預設產生 Python 樣板
    $fileName = $Name.ToLower()
    @"
def ${fileName}_function():
    return True
"@ | Out-File "${fileName}.py" -Encoding utf8

    @"
import pytest
from ${fileName} import ${fileName}_function

def test_${fileName}():
    assert ${fileName}_function() is True
"@ | Out-File "test_${fileName}.py" -Encoding utf8

    Write-Host "✅ 已建立 Python 功能樣板: ${fileName}.py 與 test_${fileName}.py" -ForegroundColor Green
}
