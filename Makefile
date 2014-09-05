# http://www.tylercipriani.com/2014/05/13/replace-jekyll-with-pandoc-makefile.html

XELATEX = /usr/local/texlive/2013basic/bin/universal-darwin/xelatex
SOURCE_DIR = source
PAGES_DIR = pages
PAGES=$(addprefix $(PAGES_DIR)/, $(subst .tex,.html, $(subst source/,,$(wildcard source/*.tex))))

#HTMLPAGES=$(addprefix $(PAGES)/, $(addsuffix .html, $(subst source/,,$(wildcard source/*.tex))))

all: $(PAGES) handout.pdf handout.docx index.html

$(PAGES): $(PAGES_DIR)/%.html : $(SOURCE_DIR)/%.tex
	pandoc -f latex -t html --standalone --template templates/default.FORMAT -o "$@" "$<"

#handout.pdf: $(source)/handout.tex templates/default.latex
#	pandoc handout.tex -f latex -o handout.pdf --template=templates/default.latex --latex-engine=$(XELATEX)
#
#handout.docx: $(source)/handout.tex
#	pandoc handout.tex -f latex -o handout.docx
#
index.html: README.md templates/readme.FORMAT
	pandoc README.md -o index.html --template=templates/readme.FORMAT
