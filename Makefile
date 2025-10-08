# Automatically pick the first .tex file in the current directory
TEXFILE := $(basename $(wildcard *.tex))

# Default target
all: $(TEXFILE).pdf

# Build PDF
$(TEXFILE).pdf: $(TEXFILE).tex
	xelatex $(TEXFILE).tex
	xelatex $(TEXFILE).tex    # run twice for cross-references

# Clean up auxiliary files
clean:
	rm -f *.aux *.log *.toc *.out *.bbl *.blg *.synctex.gz

distclean: clean
	rm -f $(TEXFILE).pdf
