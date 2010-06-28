NAME1 = diss
PRODUCT1 = $(NAME1).dvi
TEXSOURCE1 = $(NAME1).tex \
		    abstract.tex ack.tex glossary.tex intro.tex version.tex \
		    ubcdiss.cls
BBL1 = $(NAME1).bbl

#         NAME2 =
#      PRODUCT2 = $(NAME2).pdf
#    TEXSOURCE2 = $(NAME2).tex 
#          BBL2 = $(NAME2).bbl

BIBINPUTS = biblio.bib

PDFFIGURES = 
PNGFIGURES = 
GIFFIGURES = 
SVGFIGURES = 
# Following is for Berkeley Make syntax:
#BUILTPDFFIGURES = \
#		    ${PNGFIGURES:C/\.png/.pdf/g} \
#		    ${GIFFIGURES:C/\.gif/.pdf/g} \
#		    ${SVGFIGURES:C/\.svg/.pdf/g}

all: $(PRODUCT1)

# $(NAME1).pdf: $(TEXSOURCE1) $(BBL1) $(PDFFIGURES)
$(NAME1).dvi: $(TEXSOURCE1) $(BBL1) $(EPSFIGURES)
$(NAME1).bbl: $(TEXSOURCE1) $(BIBINPUTS) $(PDFFIGURES)

#$(NAME2).pdf: $(TEXSOURCE2) $(BBL2) $(BUILTPDFFIGURES)
#$(NAME2).dvi: $(TEXSOURCE2) $(BBL2) $(BUILTEPSFIGURES)
#$(NAME2).bbl: $(TEXSOURCE2) $(BIBINPUTS) $(BUILTEPSFIGURES) $(BUILTPDFFIGURES)

clean:
	$(RM) $(NAME1).aux $(NAME1).dvi \
	    $(NAME1).log $(NAME1).blg $(NAME1).bbl $(NAME1).out \
	    $(NAME1).toc $(NAME1).lof $(NAME1).lot $(NAME1).brf

# configuration issues
.SUFFIXES: .tex .pdf .bbl .dvi

PDFLATEX=	latex
BIBTEX=		bibtex
XELATEX=	xelatex 
LATEX=		latex
BIBLATEX=	$(PDFLATEX)
BIBTEX=		bibtex 
RM=		del 
MV=		mv

.tex.dvi:
	$(PDFLATEX) $(LATEXFLAGS) $<
	$(PDFLATEX) $(LATEXFLAGS) $<

.tex.bbl: 
	$(BIBLATEX) $(LATEXFLAGS) $<
	$(BIBTEX) $*
	$(RM) $*.aux $*.dvi $*.pdf

