#!/bin/bash
# publish-cv.sh — Export CV from Obsidian vault to PDF and publish to willettjf.com
# Usage: ./publish-cv.sh

set -e

VAULT_CV="/Users/justinwillett/Obsidian Vault/core/curriculum_vitae.md"
REPO="/Users/justinwillett/Documents/GitHub/willettjf.github.io"
OUTPUT="$REPO/assets/files/curriculum_vitae.pdf"

echo "Exporting CV to PDF..."
pandoc "$VAULT_CV" \
  -o "$OUTPUT" \
  --pdf-engine=xelatex \
  --metadata title="" \
  -V mainfont="Times New Roman" \
  -V geometry:margin=1in -V fontsize=12pt \
  -V colorlinks=true -V urlcolor=NavyBlue

echo "Publishing to willettjf.com..."
cd "$REPO"
git add assets/files/curriculum_vitae.pdf
git commit -m "Update CV $(date +%Y-%m-%d)"
git push

echo "Done. CV is live (allow a minute for GitHub Pages to rebuild)."
