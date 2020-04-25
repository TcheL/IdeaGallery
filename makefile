file := Ideas

dirs := sources \
        sources/FWI \
		sources/Modelling \
		sources/Inversion \
		sources/Other

sufs := aux \
        bbl bcf blg \
        fdb_latexmk fls \
        idx ind ilg \
        listing loc lof log lol los lot ltx \
        nav nlo nls \
        out \
        toc \
        run.xml \
        snm synctex.gz \
        vrb \
        xdv

all : tex2pdf view

tex2pdf :
	pdflatex $(file)

full :
	latexmk -pdf -interaction=nonstopmode $(file)

view :
	evince $(file).pdf

clean :
	-rm -f $(foreach suf,$(sufs),$(file).$(suf)) pdflatex*.fls
	-rm -f $(foreach dir,$(dirs),$(foreach suf,$(sufs),$(dir)/*.$(suf)))

clear :
	-rm -f $(file).pdf

# vim:ft=make:noet:noai:ts=4
