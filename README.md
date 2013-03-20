UUlm Latex Beamer Template
==========================

A document class that can be used to create LaTeX `beamer` slides featuring the original UUlm corporate design, an alternate design, and optional support for the Meta font using XeLaTeX.

Look at the `example` folder for working examples.

Class Options
-------------
 * *none* – Original corporate design, default font (i.e. for usage with pdflatex)
 * `metafont`  – original corporate design using Meta font via XeLaTeX.
 * `metaprofont`  – original corporate design using MetaPro font via XeLaTeX.
 * `alternate` – alternate design.
 * `pdflogo` – use `uulm-logo-color.pdf` (must be in path) as logo instead of the embedded tikz code.
 * `uulm-in`, `-med`, `-mawi`, `-nawi`, `-central` – use color scheme of corresponding faculty.
 * `vslogo` – inserts distributed systems institute logo on title slide.
 * All options can be combined, except `metafont` and `metaprofont`.

Commands
--------

Standard latex beamer commands work. In addition, the following notable extra commands are introduced:

* `\titlegraphiclicense{...}` – puts a text in the bottom left corner of the title graphic to indicate the license.

Installation (optional)
-----------------------

The script `install.sh` can be used to install the package into the local `texmf` tree. Alternatively, you can check out the git repository directly into the `texmf` tree.

Usage (without install)
-----------------------

If you prefer not to install the template and use self-contained sources instead, place a copy of the .cls file and, optionally, `uulm-logo-color.pdf` (if you use the in the `pdflogo` option) in the directory of your slide deck source file.
