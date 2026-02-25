import os
import re
import sys

def format_vba_content(content):
    lines = content.splitlines()
    formatted_lines = []
    
    # 規則：4-space 縮排 (取代 Tab 或不一致的空格)
    # 規則：函數間保持空行
    # 規則：修正 Attribute 與 Option 區塊後的間距
    
    indent_level = 0
    for line in lines:
        stripped = line.strip()
        
        # 簡單的縮排邏輯
        if any(stripped.startswith(kw) for kw in ["End Sub", "End Function", "End Type", "End Property", "Next", "Loop", "End If", "End Select"]):
            indent_level = max(0, indent_level - 1)
        
        indent_str = "    " * indent_level
        formatted_lines.append(indent_str + stripped if stripped else "")
        
        # 增加下一行的縮排
        if any(stripped.startswith(kw) for kw in ["Sub ", "Function ", "Type ", "Property ", "For ", "Do ", "If ", "Select Case"]) and not stripped.endswith("End If") and "Then" in stripped:
            if not stripped.endswith("Then"): # 排除單行 If
                pass
            else:
                indent_level += 1
        elif any(stripped.startswith(kw) for kw in ["Sub ", "Function ", "Type "]):
            indent_level += 1

    return "\n".join(formatted_lines)

def process_files(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith((".bas", ".cls", ".doccls")):
                path = os.path.join(root, file)
                print(f"Formatting: {file}")
                with open(path, "r", encoding="utf-8-sig") as f:
                    content = f.read()
                
                formatted = format_vba_content(content)
                
                with open(path, "w", encoding="utf-8-sig") as f:
                    f.write(formatted)

if __name__ == "__main__":
    target_dir = sys.argv[1] if len(sys.argv) > 1 else "."
    process_files(target_dir)
