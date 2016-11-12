Preparing slides with Pandoc and Org-mode
=========================================

This is a stub talk, intended to demonstrate a possible use of [Emacs org-mode]
with [reveal.js] and [LaTeX beamer] to create presentation slides and handouts.

Usage
-----

Built and open the HTML-version of the talk by running

    make start

in the project's root directory. This will convert the talk from Emacs org-mode
format into a reveal.js presentation and open it in your default browser. The
programs `git`, `xelatex`, `pandoc` (including development files), and `ghc`
must be install on your system for this to work.

If your OS doesn't support the `sensible-browser` command, run `make talk.html`
and open the resulting file with the browser of your choice.

Other files that can be created by running `make FILENAME`:

talk.pdf:

:   PDF version of the talk, created via [LaTeX beamer].  Does not include
    speaker notes.

talk-notes.pdf

:   Combination of slides and speaker notes.

talk-handout.pdf

:   Print-version of the talk, includes speaker notes.


[Emacs org-mode]: https://orgmode.org/
[reveal.js]: http://lab.hakim.se/reveal-js/
[LaTeX beamer]: https://bitbucket.org/rivanvx/beamer/wiki/Home


License
-------

Copyright (c) 2016 Albert Krewinkel

Permission to use, copy, modify, and/or distribute this software for any purpose
with or without fee is hereby granted, provided that the above copyright notice
and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
THIS SOFTWARE.
