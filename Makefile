# If user passes TEXFILE=name on command-line, use it;
# otherwise pick the first .tex file in current directory (without extension)
TEXFILE ?= $(basename $(firstword $(wildcard *.tex)))

# Default target
all: $(TEXFILE).pdf

# Build PDF
$(TEXFILE).pdf: $(TEXFILE).tex
	xelatex $(TEXFILE).tex
	xelatex $(TEXFILE).tex     # run twice for cross-refs (TOC, etc.)

# Remove auxiliary LaTeX files
clean:
	rm -f *.aux *.log *.toc *.out *.bbl *.blg *.synctex.gz

# Remove everything including the PDF
distclean: clean
	rm -f $(TEXFILE).pdf
