#!/bin/bash

# Script to generate PDF versions of training materials
# Run this script after installing pandoc

echo "=========================================="
echo "Full Stack AI Training - PDF Generator"
echo "=========================================="
echo ""

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "❌ Pandoc is not installed."
    echo ""
    echo "Please install pandoc first:"
    echo ""
    echo "On macOS:"
    echo "  brew install pandoc"
    echo ""
    echo "On Windows:"
    echo "  Download from: https://pandoc.org/installing.html"
    echo ""
    echo "On Linux (Ubuntu/Debian):"
    echo "  sudo apt-get install pandoc"
    echo ""
    exit 1
fi

echo "✅ Pandoc found: $(pandoc --version | head -1)"
echo ""

# Check if xelatex (LaTeX) is installed
if ! command -v xelatex &> /dev/null; then
    echo "⚠️  XeLaTeX (LaTeX) is not installed."
    echo ""
    echo "PDFs with code syntax highlighting require LaTeX."
    echo ""
    echo "Install LaTeX:"
    echo ""
    echo "On macOS:"
    echo "  brew install --cask basictex"
    echo "  # Then restart terminal and run:"
    echo "  sudo tlmgr update --self"
    echo "  sudo tlmgr install collection-fontsrecommended"
    echo ""
    echo "On Windows:"
    echo "  Download and install MiKTeX from: https://miktex.org/"
    echo ""
    echo "On Linux (Ubuntu/Debian):"
    echo "  sudo apt-get install texlive-xelatex texlive-fonts-recommended"
    echo ""
    echo "Alternatively, generate simpler PDFs without LaTeX:"
    echo "  1. Edit this script and change --pdf-engine=xelatex to --pdf-engine=wkhtmltopdf"
    echo "  2. Install wkhtmltopdf:"
    echo "     - Mac: brew install wkhtmltopdf"
    echo "     - Windows: https://wkhtmltopdf.org/downloads.html"
    echo "     - Linux: sudo apt-get install wkhtmltopdf"
    echo ""
    exit 1
fi

echo "✅ XeLaTeX found: $(xelatex --version | head -1)"
echo ""

# Create PDFs directory if it doesn't exist
mkdir -p pdfs

echo "📄 Generating PDFs..."
echo ""

# Generate PDF for Part 1 (Foundations and Backend)
echo "  1/3 Generating Part 1 - Foundations & Backend..."
pandoc markdown/FULLSTACK_AI_ENGINEER_TRAINING_PROGRAM.md \
    -o pdfs/01-Part1-Foundations-Backend.pdf \
    --pdf-engine=xelatex \
    --toc \
    --toc-depth=2 \
    --number-sections \
    --highlight-style=tango \
    -V geometry:margin=1in \
    -V fontsize=11pt \
    -V colorlinks=true \
    -V linkcolor=blue \
    -V urlcolor=blue \
    -V toccolor=black \
    --metadata title="Full Stack AI Engineer Training - Part 1" \
    --metadata author="Full Stack AI Training Program" \
    --metadata date="$(date +%Y-%m-%d)"

if [ $? -eq 0 ]; then
    echo "     ✅ Part 1 PDF generated successfully!"
else
    echo "     ❌ Failed to generate Part 1 PDF"
fi

# Generate PDF for Part 2 (Advanced and Portfolio)
echo "  2/3 Generating Part 2 - Advanced & Portfolio..."
pandoc markdown/TRAINING_PROGRAM_PART2_PHASES_AND_RESOURCES.md \
    -o pdfs/02-Part2-Advanced-Portfolio.pdf \
    --pdf-engine=xelatex \
    --toc \
    --toc-depth=2 \
    --number-sections \
    --highlight-style=tango \
    -V geometry:margin=1in \
    -V fontsize=11pt \
    -V colorlinks=true \
    -V linkcolor=blue \
    -V urlcolor=blue \
    -V toccolor=black \
    --metadata title="Full Stack AI Engineer Training - Part 2" \
    --metadata author="Full Stack AI Training Program" \
    --metadata date="$(date +%Y-%m-%d)"

if [ $? -eq 0 ]; then
    echo "     ✅ Part 2 PDF generated successfully!"
else
    echo "     ❌ Failed to generate Part 2 PDF"
fi

# Generate combined PDF
echo "  3/3 Generating Complete Training Program (Combined)..."
cat markdown/FULLSTACK_AI_ENGINEER_TRAINING_PROGRAM.md \
    <(echo -e "\n\n---\n\n") \
    markdown/TRAINING_PROGRAM_PART2_PHASES_AND_RESOURCES.md | \
    pandoc - \
    -o pdfs/00-Complete-Training-Program.pdf \
    --pdf-engine=xelatex \
    --toc \
    --toc-depth=2 \
    --number-sections \
    --highlight-style=tango \
    -V geometry:margin=1in \
    -V fontsize=11pt \
    -V colorlinks=true \
    -V linkcolor=blue \
    -V urlcolor=blue \
    -V toccolor=black \
    --metadata title="Full Stack AI Engineer Training - Complete Program" \
    --metadata author="Full Stack AI Training Program" \
    --metadata date="$(date +%Y-%m-%d)"

if [ $? -eq 0 ]; then
    echo "     ✅ Complete PDF generated successfully!"
else
    echo "     ❌ Failed to generate Complete PDF"
fi

echo ""
echo "=========================================="
echo "PDF Generation Complete!"
echo "=========================================="
echo ""
echo "Generated files:"
ls -lh pdfs/*.pdf 2>/dev/null | awk '{print "  -", $9, "(" $5 ")"}'
echo ""
echo "✅ All PDFs are ready in the pdfs/ folder"
echo ""

# Generate How-To PDF
echo "📄 Generating bonus PDFs..."
echo ""

echo "  Generating How-To Guide..."
pandoc HOW-TO-USE-AI-WHEN-STUCK.md \
    -o pdfs/03-How-To-Use-AI-When-Stuck.pdf \
    --pdf-engine=xelatex \
    --toc \
    --toc-depth=2 \
    --number-sections \
    --highlight-style=tango \
    -V geometry:margin=1in \
    -V fontsize=11pt \
    -V colorlinks=true \
    -V linkcolor=blue \
    -V urlcolor=blue \
    -V toccolor=black \
    --metadata title="How to Use AI When Stuck - Learning Guide" \
    --metadata author="Full Stack AI Training Program" \
    --metadata date="$(date +%Y-%m-%d)"

if [ $? -eq 0 ]; then
    echo "     ✅ How-To Guide PDF generated!"
else
    echo "     ❌ Failed to generate How-To PDF"
fi

echo ""
echo "=========================================="
echo "All Done! 🎉"
echo "=========================================="
echo ""
echo "You now have:"
echo "  • Complete training program (600+ pages)"
echo "  • Part 1: Foundations & Backend"
echo "  • Part 2: Advanced & Portfolio"
echo "  • How-To guide for using AI"
echo ""
echo "Happy learning! 🚀"
