SLIDES := $(patsubst %.odp,%.odp.slides.pdf,$(wildcard *.odp))
HANDOUTS := $(patsubst %.odp,%.odp.handout.pdf,$(wildcard *.odp))
ZIP := $(patsubst %.odp,%-cod.zip,$(wildcard *.odp))

PDFDIR=../../pdf
CODDIR=../../cod


all : clean $(SLIDES) $(HANDOUTS)

%.odp.slides.pdf : %.odp
	libreoffice --headless --convert-to pdf $^
	mv *.pdf $@
	evince $@ &

%.odp.handout.pdf : %.odp.slides.pdf
	pdfnup $^ --nup 1x2 --no-landscape --keepinfo \
		--paper letterpaper --frame true --scale 0.9 \
		--suffix "nup" $^
	mv $*.odp.slides-nup.pdf $@

deploy: 
	@echo "Deploying the PDF files in ../../pdf"
	cp $(SLIDES) $(HANDOUTS) $(PDFDIR)
	zip -r $(ZIP) src
	cp $(ZIP) $(CODDIR)

clean : 
	rm -f $(SLIDES)
	rm -f $(HANDOUTS)
	rm -f $(ZIP)
