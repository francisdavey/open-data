# http://www.tylercipriani.com/2014/05/13/replace-jekyll-with-pandoc-makefile.html

XELATEX = /usr/local/texlive/2013basic/bin/universal-darwin/xelatex
SOURCE_DIR = source
PAGES_DIR = pages
PDF_DIR = pdf
PAGES=$(addprefix $(PAGES_DIR)/, $(subst .tex,.html, $(subst source/,,$(wildcard source/*.tex))))
PDF_PAGES=$(addprefix $(PDF_DIR)/, $(subst .tex,.pdf, $(subst source/,,$(wildcard source/*.tex))))

all: $(PAGES) $(PDF_PAGES) handout.pdf handout.docx index.html

$(PAGES): $(PAGES_DIR)/%.html : $(SOURCE_DIR)/%.tex templates/default.FORMAT
	pandoc -f latex -t html --standalone --template templates/default.FORMAT -o "$@" "$<"

$(PDF_PAGES): $(PDF_DIR)/%.pdf : $(SOURCE_DIR)/%.tex templates/default.latex
	pandoc -f latex --template templates/default.latex --latex-engine=$(XELATEX) -o "$@" "$<"

index.html: README.md templates/readme.FORMAT
	pandoc README.md -o index.html --template=templates/readme.FORMAT
