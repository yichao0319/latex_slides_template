SOURCES = *.tex
MAIN = results
#GRAPHS = graphs/*.ps
#FIGURES = figures/*.ps

$(MAIN).ps ps: $(MAIN).dvi
	dvips -P pdf -G0 -o results.ps results.dvi

$(MAIN).dvi: $(SOURCES) Makefile
	latex $(MAIN)
	latex $(MAIN)
	latex $(MAIN)

$(MAIN).pdf pdf: $(MAIN).ps
	ps2pdf $(MAIN).ps $(MAIN).pdf

all: pdf

clean:
	rm -f *.log $(MAIN).ps *.dvi *.pdf *.aux *.bbl *.blg *.tpm *.out

