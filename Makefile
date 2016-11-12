talk-file = talk.org

all: talk.html talk.tex talk.pdf talk-handout.pdf talk-notes.pdf

start: talk.html
	sensible-browser $<

talk.html: $(talk-file) reveal.js filters/transform-notes.hs
	pandoc --standalone --slide-level=2 --to revealjs \
		--filter ./filters/transform-notes.hs \
		--css style.css \
		-S -o $@ $<

talk.tex: $(talk-file) filters/transform-notes-beamer.hs
	pandoc --standalone --slide-level=2 --to beamer \
		--filter ./filters/transform-notes-beamer.hs \
		-o $@ $<

talk.pdf: $(talk-file) filters/transform-notes-beamer.hs
	pandoc --standalone --slide-level=2 --to beamer \
		--filter ./filters/transform-notes-beamer.hs \
		--latex-engine=xelatex \
		-o $@ $<

talk-notes.pdf: $(talk-file) filters/transform-notes-beamer.hs
	pandoc --standalone --slide-level=2 --to beamer \
		--filter ./filters/transform-notes-beamer.hs \
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
