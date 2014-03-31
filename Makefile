XELATEX=/usr/local/texlive/2013basic/bin/universal-darwin/xelatex

all: handout.html handout.pdf handout.docx index.html

handout.html: handout.md templates/default.FORMAT
	pandoc handout.md --standalone --template templates/default.FORMAT -o handout.html

handout.pdf: handout.md templates/default.latex
	pandoc handout.md -o handout.pdf --template=templates/default.latex --latex-engine=$(XELATEX)

handout.docx: handout.md
	pandoc handout.md -o handout.docx

index.html: README.md templates/readme.FORMAT
	pandoc README.md -o index.html --template=templates/readme.FORMAT
