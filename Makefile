talk-file = talk.org

all: talk.html talk.tex talk.pdf talk-handout.pdf talk-notes.pdf

start: talk.html
	sensible-browser $<

talk.html: $(talk-file) reveal.js
	pandoc --standalone --slide-level=2 --to revealjs --css style.css \
		-S -o $@ $<

talk.tex: $(talk-file)
	pandoc --standalone --slide-level=2 --to beamer -o $@ $<

talk.pdf: $(talk-file)
	pandoc --standalone --slide-level=2 --to beamer \
		--latex-engine=xelatex \
		-o $@ $<

talk-notes.pdf: $(talk-file)
	pandoc --standalone --slide-level=2 --to beamer \
		--latex-engine=xelatex \
		--metadata='classoption:notes=only' \
		-o $@ $<

talk-handout.pdf: $(talk-file)
	pandoc --standalone --to latex \
		--latex-engine=xelatex \
		-o $@ $<

reveal.js:
	git submodule update --init

clean:
	git clean -dXf

.PHONY: all clean open
