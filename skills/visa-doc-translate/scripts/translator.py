import os
import sys
from pathlib import Path
from PIL import Image
import io
import re

try:
    import easyocr
    import fitz  # PyMuPDF
    from deep_translator import GoogleTranslator
    from reportlab.pdfgen import canvas
    from reportlab.lib.pagesizes import A4
    from reportlab.pdfbase import pdfmetrics
    from reportlab.pdfbase.ttfonts import TTFont
except ImportError:
    print("❌ 缺少必備庫。請執行: pip install easyocr deep-translator reportlab pillow pymupdf")
    sys.exit(1)

# 註冊中文字型
FONT_PATH = "C:\\Windows\\Fonts\\msjh.ttc"
HAS_CHINESE_FONT = False
if os.path.exists(FONT_PATH):
    try:
        pdfmetrics.registerFont(TTFont('MSJH', FONT_PATH))
        HAS_CHINESE_FONT = True
    except:
        pass

def is_mostly_english(text):
    if not text: return True
    letters = re.findall(r'[a-zA-Z]', text)
    return (len(letters) / len(text)) > 0.5 if len(text) > 0 else True

def process_file(file_path):
    p = Path(file_path)
    if not p.exists():
        print(f"❌ 找不到檔案: {file_path}")
        return

    output_pdf = p.parent / f"{p.stem}_Merged.pdf"
    print(f"🚀 [v2.4] 完美收官版啟動: {p.name}")

    print("⏳ 載入 AI 模型中...")
    reader = easyocr.Reader(['ch_tra', 'en'])
    
    c = canvas.Canvas(str(output_pdf), pagesize=A4)
    width, height = A4

    def process_page(c, original_image_stream, page_num):
        img = Image.open(original_image_stream)
        temp_img = f"temp_p{page_num}.png"
        img.save(temp_img)
        
        img_w, img_h = img.size
        scale = min((width - 40) / img_w, (height - 40) / img_h)
        draw_w, draw_h = img_w * scale, img_h * scale
        offset_x, offset_y = (width - draw_w)/2, (height - draw_h)/2
        
        c.drawImage(temp_img, offset_x, offset_y, width=draw_w, height=draw_h)

        print(f"  - 第 {page_num} 頁: 佈局掃描與文字替換...")
        results = reader.readtext(temp_img, detail=1)
        os.remove(temp_img)

        for (bbox, text, prob) in results:
            if prob < 0.3 or len(text.strip()) < 2: continue
            
            box_w = (bbox[1][0] - bbox[0][0]) * scale
            box_h = (bbox[2][1] - bbox[0][1]) * scale
            pdf_x = offset_x + (bbox[0][0] * scale)
            pdf_y = (height - offset_y) - (bbox[2][1] * scale)

            try:
                if is_mostly_english(text):
                    trans = GoogleTranslator(source='auto', target='zh-TW').translate(text)
                    
                    # 繪製遮罩
                    c.setFillColorRGB(1, 1, 1)
                    c.rect(pdf_x - 0.5, pdf_y - 0.5, box_w + 1, box_h + 1, fill=1, stroke=0)
                    
                    # 動態字級縮放邏輯
                    font_name = "MSJH" if HAS_CHINESE_FONT else "Helvetica"
                    # 根據字數與方塊寬度估算理想字級
                    estimated_fs = max(5, min(box_h * 0.85, (box_w / (len(trans) + 0.5)) * 1.5))
                    if estimated_fs > 16: estimated_fs = 16
                    
                    c.setFillColorRGB(0, 0, 0)
                    c.setFont(font_name, estimated_fs)
                    # 垂直置中校準
                    c.drawString(pdf_x + 1, pdf_y + (box_h - estimated_fs)/2 + 1, trans)
            except:
                pass
        
        c.showPage()

    if p.suffix.lower() == '.pdf':
        doc = fitz.open(file_path)
        for i in range(len(doc)):
            process_page(c, io.BytesIO(doc[i].get_pixmap(dpi=200).tobytes("png")), i + 1)
        doc.close()
    else:
        with open(file_path, 'rb') as f:
            process_page(c, io.BytesIO(f.read()), 1)

    c.save()
    print(f"\n✅ 翻譯任務完成！輸出：{output_pdf}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("用法: python translator.py <檔案路徑>")
    else:
        process_file(sys.argv[1])
