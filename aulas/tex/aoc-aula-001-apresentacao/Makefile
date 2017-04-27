all: main

CLASSNAME=$(shell basename $(CURDIR))
DROPBOXDIR=../

main:
	pdflatex main.tex
	bibtex main
	pdflatex main.tex
	@cp main.pdf $(CLASSNAME).pdf
	okular $(CLASSNAME).pdf
	rm *~ *.aux *.dvi *.bbl *.blg *.log *.lot *.lof *.toc *.out *.nav *.snm *.vrb main.pdf

deploy:
	$(shell cp $(CLASSNAME).pdf $(DROPBOXDIR))

clean:
	rm *~ *.aux *.dvi *.bbl *.blg *.log *.lot *.lof *.toc *.out *.nav *.snm *.vrb main.pdf main.synctex.gz
