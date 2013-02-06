UUlm Latex Beamer Template
==========================

A document class that can be used to create LaTeX `beamer` slides featuring the original UUlm corporate design, an alternate design, and optional support for the Meta font using XeLaTeX.

Look at the `example` folder for working examples.

Class Options
--------------
 * *none* – Original corporate design, default font (i.e. for usage with pdflatex)
 * `metafont`  – original corporate design using Meta font via XeLaTeX.
 * `alternate` – alternate design.
 * `pdflogo` - use `uulm-logo-color.pdf` (must be in path) as logo instead of the embedded tikz code.
 * All options can be combined.


Installation (optional)
-----------------------

The script `install.sh` can be used to install the package into the local `texmf` tree. Alternatively, you can check out the git repository directly into the `texmf` tree.

Usage (without install)
-----------------------

If you prefer not to install the template and use self-contained sources instead, place a copy of the .cls file and `uulm-logo-color.pdf` in the directory of your slide deck source file.
