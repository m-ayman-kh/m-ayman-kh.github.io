# m-ayman-kh.github.io

Personal page of Mohamed Ayman Khalifa: https://m-ayman-kh.github.io

Plain HTML and CSS, no build step. GitHub Pages publishes whatever is on the `master` branch.

## Files
- `index.html`: the page content
- `style.css`: the look (light and dark mode, phone layout, print layout)
- `resume/Mohamed_Khalifa_Resume.pdf`: the downloadable resume. Keep this file name so the link never breaks.
- `update-resume.sh`: puts a new resume online

## Updating the resume
1. Save the new PDF over `~/Documents/Mohamed_Khalifa_Resume.pdf` (or anywhere).
2. Run `./update-resume.sh` (or `./update-resume.sh /path/to/new.pdf`).

The script copies the PDF in, sets "Resume updated <month year>" on the page, commits and pushes. The site refreshes in about a minute.

## Changing the page text
Edit `index.html`, then `git add -A && git commit -m "..." && git push`.
