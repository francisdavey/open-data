XELATEX=/usr/local/texlive/2013basic/bin/universal-darwin/xelatex

all: handout.html handout.pdf

handout.html: handout.md
	pandoc handout.md --standalone --template templates/default.FORMAT -o handout.html

handout.pdf: handout.md
	pandoc handout.md -o handout.pdf --latex-engine=$(XELATEX)

handout.docx: handout.md
	pandoc handout.md -o handout.docx
