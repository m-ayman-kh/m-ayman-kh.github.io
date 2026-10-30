#!/bin/zsh
# Puts a new resume PDF on the website.
# Usage:  ./update-resume.sh                 (uses ~/Documents/Mohamed_Khalifa_Resume.pdf)
#         ./update-resume.sh /path/to/new.pdf
# The public link never changes: https://m-ayman-kh.github.io/resume/Mohamed_Khalifa_Resume.pdf
set -e
cd "$(dirname "$0")"

src="${1:-$HOME/Documents/Mohamed_Khalifa_Resume.pdf}"
dest="resume/Mohamed_Khalifa_Resume.pdf"

if [[ ! -f "$src" ]]; then
  echo "Can't find the resume at: $src"
  exit 1
fi
if [[ "$(head -c 4 "$src")" != "%PDF" ]]; then
  echo "That file is not a PDF: $src"
  exit 1
fi

cp "$src" "$dest"
when="$(LC_ALL=en_US.UTF-8 date '+%B %Y')"
sed -i '' "s|<span id=\"resume-date\">[^<]*</span>|<span id=\"resume-date\">$when</span>|" index.html

git add "$dest" index.html
if git diff --cached --quiet; then
  echo "The website already has this exact resume. Nothing to do."
  exit 0
fi
git commit -q -m "Update resume ($when)"
git push -q
echo "Done. The new resume will be live in about a minute:"
echo "https://m-ayman-kh.github.io/$dest"
