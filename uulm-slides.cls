\ProvidesClass{uulm-slides}[2012/07/12 UUlm Slides]

\LoadClass{beamer}

\RequirePackage[utf8]{inputenc}
\RequirePackage[german]{babel}
\RequirePackage{calc}

% Command for multiple choice answer
\newcommand{\mc}[1]{\indent\hspace{0.5cm}$\bigcirc$ #1 \\}
\newcommand{\mcselected}[1]{\indent\hspace{0.5cm}$\rlap{\hspace*{0.1cm}\checkmark}\bigcirc$ #1 \\}
% Command for selection choice answer
\newcommand{\select}[1]{\indent\hspace{0.5cm}$\Box$ #1 \\}
\newcommand{\selected}[1]{\indent\hspace{0.5cm}$\rlap{$\checkmark$}\square$ #1 \\}

% Color Theme
\definecolor{uuinf}{rgb}{.639 .149 .230}
\definecolor{uuakzent}{rgb}{.663 .635 .553}

\setbeamercolor{structure}{fg=uuinf}
\setbeamercolor{headbox}{bg=uuinf,fg=white}
\setbeamercolor{alerted text}{fg=uuinf}
\setbeamercolor{lighthead}{fg=uuinf,bg=uuakzent!20!white}

\setbeamercolor{palette primary}{use=structure,fg=structure.fg}
\setbeamercolor{palette secondary}{fg=uuakzent}
\setbeamercolor{palette tertiary}{use=palette secondary,fg=palette secondary.fg!40!white}

\setbeamercolor{block title}{use=palette primary, bg=palette primary.fg,fg=white}
\setbeamercolor{block body}{use=palette tertiary, bg=palette tertiary.fg}

\setbeamercolor{navigation symbols}
    {use=palette secondary, fg=palette secondary.fg!80!white}
\setbeamercolor{navigation symbols dimmed}
    {use=navigation symbols, fg=navigation symbols.fg!80!white}

% Font Theme
\usepackage{helvet}
\setbeamerfont{author}{size=\footnotesize}
\setbeamerfont{subtitle}{size=\footnotesize}
\setbeamerfont{title}{size=\Large}

% Outer Theme
\setbeamertemplate{footline}{ }
\setbeamertemplate{navigation symbols}{}%remove navigation symbols
\setbeamertemplate{headline}{
    \ifnum\insertframenumber=1
	\vskip15pt
	\begin{beamercolorbox}[wd=.5\paperwidth,leftskip=.5\paperwidth]{structure}
	    \includegraphics[width=.45\paperwidth]{uulm-logo-color}
	\end{beamercolorbox}
    \else
	\hskip-2pt
	\hbox{
	    \begin{beamercolorbox}[wd=.075\paperwidth,ht=2.75ex,dp=1.5ex,center]{headbox}
		\textbf{\insertframenumber}
	    \end{beamercolorbox}
	    \hskip-2pt
	    \begin{beamercolorbox}[wd=.95\paperwidth,ht=2.75ex,dp=1.5ex,left]{lighthead}
		\hspace*{1em}\insertshorttitle{} $|$ \insertshortauthor{} $|$ \insertshortdate
	    \end{beamercolorbox}
	}
	\vskip3em
    \fi
}

% Inner Theme
\useinnertheme{rectangles}
\setbeamertemplate{title page}{
    \begin{beamercolorbox}[wd=\paperwidth,ht=0.390625\paperwidth,leftskip=-0.075\paperwidth]{headbox}
	\includegraphics[keepaspectratio,width=\paperwidth,height=0.390625\paperwidth]{\inserttitlegraphic}
    \end{beamercolorbox}
    \vskip10pt
    \hbox{
    \begin{beamercolorbox}[left,leftskip=-0.075\paperwidth,wd=.25\paperwidth]{author}
	\usebeamerfont{author}\insertauthor
        \vskip5pt
	\insertdate
    \end{beamercolorbox}
	\hskip5pt
    \begin{beamercolorbox}[left,wd=.6\paperwidth]{title}
	\usebeamerfont{title}\inserttitle
        \vskip5pt
	\usebeamerfont{subtitle}
        \insertsubtitle
    \end{beamercolorbox}
    }
    \vskip-30pt
}

\setbeamersize{sidebar width left=.075\paperwidth}
\setbeamersize{text margin left=.3cm}
\setbeamersize{text margin right=.1\paperwidth}

\setlength\leftmargini{1.5em}
\setlength\leftmarginii{1.5em}
\setlength\leftmarginiii{1.5em}
