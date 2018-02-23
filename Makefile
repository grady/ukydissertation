All: example.pdf

%.pdf : *.tex
	latexmk -pdf $(basename $@)


