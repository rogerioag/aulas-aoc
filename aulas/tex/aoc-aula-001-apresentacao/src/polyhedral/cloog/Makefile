
PET_HOME=/dados/rogerio/USP/doutorado/pet-0.05
CLAN_HOME=/dados/rogerio/USP/doutorado/clan

all:
	# /dados/rogerio/USP/doutorado/cloog-0.18.1/cloog -compilable 1 wavefront.cloog -o wavefront-skewed.c
	gcc wavefront.c -o wf -lm
	gcc wavefront-skewed.c -o wfs -lm
	./wf > wf-iteration-domain.txt
	./wfs > wfs-iteration-domain.txt
	$(PET_HOME)/pet wavefront-pet-scop-detection.c > wf-pet-scop-detection.scop
	$(CLAN_HOME)/clan wavefront-pet-scop-detection.c > wf-clan-scop-detection.scop
	# /dados/rogerio/USP/doutorado/clan wavefront-pet-scop-detection.c

clean:
	rm wf wfs
