LATEX=pdflatex
FLAGS=-output-directory=build -halt-on-error

.PHONY: all
all: SoliTex.pdf Cards.pdf

SoliTex.pdf: main.tex core.tex draw_cards.tex
	mkdir -p build
	$(LATEX) $(FLAGS) $<
	$(LATEX) $(FLAGS) $<
	mv build/main.pdf ./SoliTex.pdf

Cards.pdf: Cards.tex draw_cards.tex
	mkdir -p build
	$(LATEX) $(FLAGS) $<
	mv build/$@ .

.PHONY: clean
clean:
	rm -rf build SoliTex.pdf Cards.pdf
