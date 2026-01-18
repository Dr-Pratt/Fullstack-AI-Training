# How to Generate PDFs

The training materials are provided in Markdown format. To create PDF versions for easier reading, follow these instructions:

## Option 1: Use the Provided Script (Recommended)

### Step 1: Install Pandoc

**On macOS:**
```bash
brew install pandoc
```

**On Windows:**
1. Download installer from: https://pandoc.org/installing.html
2. Run the installer
3. Restart your terminal

**On Linux (Ubuntu/Debian):**
```bash
sudo apt-get install pandoc texlive-xelatex
```

### Step 2: Run the PDF Generation Script

```bash
cd fullstack-ai-training
./generate-pdfs.sh
```

This will create 4 PDFs in the `pdfs/` folder:
1. `00-Complete-Training-Program.pdf` - Full 16-week program (all content)
2. `01-Part1-Foundations-Backend.pdf` - Weeks 1-6 (Setup, Java, Node, Python)
3. `02-Part2-Advanced-Portfolio.pdf` - Weeks 7-16 (Frontend, AI, Portfolio)
4. `03-How-To-Use-AI-When-Stuck.pdf` - AI prompting guide

All PDFs will have:
- ✅ Clickable table of contents
- ✅ Working hyperlinks to external resources
- ✅ Syntax-highlighted code blocks
- ✅ Professional formatting
- ✅ Section numbering

---

## Option 2: Online Markdown to PDF Converters

If you prefer not to install software:

### Method 1: Markdown to PDF (Web)
1. Go to: https://www.markdowntopdf.com/
2. Upload markdown file from `markdown/` folder
3. Click "Convert"
4. Download PDF

### Method 2: Dillinger (Online Editor)
1. Go to: https://dillinger.io/
2. Import markdown file
3. Export as PDF

**Note**: Online converters may not preserve all formatting and hyperlinks.

---

## Option 3: VS Code Extension

If you use VS Code:

1. Install extension: **"Markdown PDF"** by yzane
2. Open any `.md` file from `markdown/` folder
3. Right-click → "Markdown PDF: Export (pdf)"
4. PDF saved in same folder

---

## Option 4: Use GitHub (No Installation Needed)

1. Push this folder to GitHub
2. GitHub automatically renders Markdown beautifully
3. Read directly on GitHub (no PDF needed!)

To read on GitHub:
- Click on any `.md` file
- GitHub renders it with formatting
- All links work
- Code blocks are syntax-highlighted

---

## Troubleshooting

### "Pandoc not found"
- Make sure pandoc is installed: `pandoc --version`
- Restart terminal after installation
- On Windows, check PATH includes pandoc

### "PDF generation failed"
- Make sure you have LaTeX installed (xelatex)
  - Mac: `brew install --cask basictex`
  - Windows: Install MiKTeX from https://miktex.org/
  - Linux: `sudo apt-get install texlive-xelatex`

### "Permission denied"
- Make script executable: `chmod +x generate-pdfs.sh`
- Run from correct directory: `cd fullstack-ai-training`

### "Some characters not rendering"
- This is a font issue with XeLaTeX
- PDFs still work, just may have some missing unicode characters
- Read markdown directly for best formatting

---

## Alternative: Read Markdown Files Directly

**Markdown files are perfectly readable as-is!**

### On Mac:
- Install **Marked 2** (paid) or **MacDown** (free)
- Drag `.md` files to open

### On Windows:
- Install **Typora** or **Mark Text** (free)
- Open `.md` files

### On Any Platform:
- Use **VS Code** with "Markdown Preview"
- Open file, press `Cmd+Shift+V` (Mac) or `Ctrl+Shift+V` (Windows)

### Online:
- Upload to GitHub
- Or use https://dillinger.io/

---

## Recommended Approach

**For Learning (Best Experience):**
- Read markdown files in VS Code with preview
- All links work
- Copy-paste code easily
- Can make notes directly

**For Printing/Offline:**
- Generate PDFs using the script
- Print specific sections
- Read on tablet/iPad

**For Quick Reference:**
- Use PDFs
- Easier to navigate with table of contents
- Better for highlighting and annotations

---

## File Sizes (Approximate)

- **Complete PDF**: ~8-10 MB (600+ pages)
- **Part 1 PDF**: ~4-5 MB (300+ pages)
- **Part 2 PDF**: ~4-5 MB (300+ pages)
- **How-To PDF**: ~1-2 MB (60+ pages)

---

## Need Help?

If you can't generate PDFs:

1. **Read markdown files directly** - They're designed to be readable!
2. **Upload to GitHub** - Free, easy, works great
3. **Use online converter** - Quick but may lose some formatting
4. **Ask for help**:
   - Google: "convert markdown to pdf"
   - Stack Overflow
   - Or use AI: "How do I convert markdown to PDF on [your OS]?"

---

**Happy Learning! 📚**

You don't need PDFs to start. The markdown files are ready to read right now!

Open `markdown/FULLSTACK_AI_ENGINEER_TRAINING_PROGRAM.md` in any text editor and start Week 1. 🚀
