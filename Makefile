# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Nemanja Micovic <nmicovic@outlook.com> 
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
PROJECT = deepdream
OUTPUT = $(PROJECT).pdf
SRC = $(PROJECT).tex
BIB = $(PROJECT).bib
LATEX = pdflatex -shell-escape
BIBTEX = bibtex
FILES = $(SRC) $(BIB) $(OUTPUT) Makefile
JUNK = *.aux *.log *.out *.toc *.blg *.bbl
CLOC = $(shell type -p cloc || echo wc -l)
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
$(OUTPUT): $(SRC) $(PROJECT).aux
	$(BIBTEX) $(PROJECT).aux
	$(LATEX) $<
	$(LATEX) $<

$(PROJECT).aux: $(SRC)
	$(LATEX) $<
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
.PHONY: clean dist author

clean:
	@rm -rf *~ $(JUNK)
	@clear
	@echo "Workspace cleared!"

dist:
	@make
	@clear
	@tar -cvf $(PROJECT).tar $(FILES)
	@make clean
	@echo "Project packed up."

author:
	@clear
	@echo "Created by: Nemanja Micovic"

# Count lines of code.
lines:
	$(CLOC) *		
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
