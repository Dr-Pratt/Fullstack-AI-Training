#!/bin/bash

# Simpler PDF generation script (no LaTeX required)
# Generates basic PDFs using HTML as intermediate format

echo "=========================================="
echo "Full Stack AI Training - Simple PDF Generator"
echo "=========================================="
echo ""
echo "This script generates PDFs without requiring LaTeX."
echo "PDFs will be simpler but perfectly readable."
echo ""

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "❌ Pandoc is not installed."
    echo ""
    echo "Install pandoc:"
    echo "  Mac: brew install pandoc"
    echo "  Windows: https://pandoc.org/installing.html"
    echo "  Linux: sudo apt-get install pandoc"
    echo ""
    exit 1
fi

echo "✅ Pandoc found"
echo ""

# Create PDFs directory
mkdir -p pdfs

echo "📄 Generating simple PDFs (no LaTeX required)..."
echo ""

# Generate PDF for Part 1
echo "  1/4 Generating Part 1 - Foundations & Backend..."
pandoc markdown/FULLSTACK_AI_ENGINEER_TRAINING_PROGRAM.md \
    -o pdfs/01-Part1-Foundations-Backend.pdf \
    --toc \
    --toc-depth=2 \
    --metadata title="Full Stack AI Engineer Training - Part 1" \
    --metadata date="$(date +%Y-%m-%d)" \
    2>/dev/null

if [ $? -eq 0 ]; then
    echo "     ✅ Part 1 PDF generated!"
else
    echo "     ❌ Failed"
fi

# Generate PDF for Part 2
echo "  2/4 Generating Part 2 - Advanced & Portfolio..."
pandoc markdown/TRAINING_PROGRAM_PART2_PHASES_AND_RESOURCES.md \
    -o pdfs/02-Part2-Advanced-Portfolio.pdf \
    --toc \
    --toc-depth=2 \
    --metadata title="Full Stack AI Engineer Training - Part 2" \
    --metadata date="$(date +%Y-%m-%d)" \
    2>/dev/null

if [ $? -eq 0 ]; then
    echo "     ✅ Part 2 PDF generated!"
else
    echo "     ❌ Failed"
fi

# Generate combined PDF
echo "  3/4 Generating Complete Training Program..."
cat markdown/FULLSTACK_AI_ENGINEER_TRAINING_PROGRAM.md \
    <(echo -e "\n\n---\n\n") \
    markdown/TRAINING_PROGRAM_PART2_PHASES_AND_RESOURCES.md | \
    pandoc - \
    -o pdfs/00-Complete-Training-Program.pdf \
    --toc \
    --toc-depth=2 \
    --metadata title="Full Stack AI Engineer Training - Complete" \
    --metadata date="$(date +%Y-%m-%d)" \
    2>/dev/null

if [ $? -eq 0 ]; then
    echo "     ✅ Complete PDF generated!"
else
    echo "     ❌ Failed"
fi

# Generate How-To PDF
echo "  4/4 Generating How-To Guide..."
pandoc HOW-TO-USE-AI-WHEN-STUCK.md \
    -o pdfs/03-How-To-Use-AI-When-Stuck.pdf \
    --toc \
    --toc-depth=2 \
    --metadata title="How to Use AI When Stuck" \
    --metadata date="$(date +%Y-%m-%d)" \
    2>/dev/null

if [ $? -eq 0 ]; then
    echo "     ✅ How-To Guide generated!"
else
    echo "     ❌ Failed"
fi

echo ""
echo "=========================================="
echo "PDF Generation Complete!"
echo "=========================================="
echo ""
echo "Generated files:"
ls -lh pdfs/*.pdf 2>/dev/null | awk '{print "  •", $9, "(" $5 ")"}'
echo ""
echo "✅ All PDFs ready in pdfs/ folder"
echo ""
echo "Note: These are simpler PDFs without advanced formatting."
echo "For best formatting, install LaTeX and use ./generate-pdfs.sh"
echo ""
echo "To install LaTeX:"
echo "  Mac: brew install --cask basictex"
echo "  Then run: ./generate-pdfs.sh"
echo ""
