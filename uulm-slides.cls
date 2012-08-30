\ProvidesClass{uulm-slides}[2012/07/12 UUlm Slides]

\LoadClass{beamer}

\RequirePackage[utf8]{inputenc}
\RequirePackage[english,ngerman,german]{babel}
\RequirePackage{calc}
\RequirePackage{amsmath,amssymb,amsfonts} 
\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage{microtype}
\RequirePackage{footnpag}
\RequirePackage{wasysym}
\RequirePackage{pgfpages}

% Command for multiple choice answer
\newcommand{\mc}[1]{\indent\hspace{0.5cm}$\bigcirc$ #1 \\}
\newcommand{\mcselected}[1]{\indent\hspace{0.5cm}$\rlap{\hspace*{0.1cm}\checkmark}\bigcirc$ #1 \\}
% Command for selection choice answer
\newcommand{\select}[1]{\indent\hspace{0.5cm}$\Box$ #1 \\}
\newcommand{\selected}[1]{\indent\hspace{0.5cm}$\rlap{$\checkmark$}\square$ #1 \\}

% Color Theme
\definecolor{uulm-akzent}{rgb}{.663 .635 .553}

\definecolor{uulm-in}{rgb}{.639 .149 .230}
\definecolor{uulm-med}{rgb}{0.4901,0.6039,0.6666}
\definecolor{uulm-mawi}{rgb}{0.3372,0.6667,0.1098}
\definecolor{uulm-nawi}{rgb}{0.7411,0.3764,0.0196}

\definecolor{uulm3}{RGB}{179,7,56}

\definecolor{uulm2}{RGB}{185,46,66}
\definecolor{uulm1}{RGB}{193,71,82}
\definecolor{uulm0}{RGB}{199,92,96}

\definecolor{uulm-block0}{RGB}{244,243,237}
\definecolor{uulm-block1}{RGB}{229,227,213}
\definecolor{uulm-block2}{RGB}{236,236,224}

\setbeamercolor{structure}{fg=uulm-in}
\setbeamercolor{headbox}{bg=uulm-in,fg=white}
\setbeamercolor{alerted text}{fg=uulm-in}
\setbeamercolor{lighthead}{fg=uulm-in!80!black,bg=white}

\setbeamercolor{palette primary}{use=structure,fg=structure.fg}
\setbeamercolor{palette secondary}{fg=uulm-akzent}
\setbeamercolor{palette tertiary}{use=palette secondary,fg=palette secondary.fg!40!white}

\setbeamercolor{block title}{use=palette primary, bg=palette primary.fg,fg=white}
\setbeamercolor{block body}{use=palette tertiary, bg=palette tertiary.fg}

\setbeamercolor{navigation symbols}
    {use=palette secondary, fg=palette secondary.fg!80!white}
\setbeamercolor{navigation symbols dimmed}
    {use=navigation symbols, fg=navigation symbols.fg!80!white}

\setbeamercolor{block title}{fg=black,bg=uulm-block1}
\setbeamercolor{block title alerted}{use=alerted text,fg=uulm3,bg=alerted text.fg!75!bg}
\setbeamercolor{block title example}{use=example text,fg=uulm3,bg=example text.fg!75!bg}

\setbeamercolor{block body}{fg=black,bg=uulm-block0}
%\setbeamercolor{block body}{parent=normal text,use=block title,bg=block title.bg!25!bg}
\setbeamercolor{block body alerted}{parent=normal text,use=block title alerted,bg=block title alerted.bg!25!bg}
\setbeamercolor{block body example}{parent=normal text,use=block title example,bg=block title example.bg!25!bg}

\setbeamercolor*{itemize item}{fg=uulm-akzent}

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
	\vskip 8pt
			\textcolor{uulm-in}{\line(1,0){500}}

	\vskip0pt
	\hskip-4pt
	\hbox{
	    \begin{beamercolorbox}[wd=.05\paperwidth,ht=2.75ex,dp=1.5ex,center]{headbox}
			\textbf{\insertframenumber}
		\end{beamercolorbox}
		\hskip 5pt

		\begin{beamercolorbox}[wd=.95\paperwidth,ht=2.75ex,dp=1.5ex,left]{lighthead}
			\hspace*{1.5em}\insertshorttitle{} $|$ \insertshortauthor{} $|$ \insertshortdate
	    \end{beamercolorbox}
	}
	\vskip2.7em
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
    \begin{beamercolorbox}[left,leftskip=-0.075\paperwidth,wd=.385\paperwidth]{author}
	\usebeamerfont{author}\insertauthor
        \vskip5pt
	\insertdate
\end{beamercolorbox}
% \hskip5pt
% \hfill
\begin{beamercolorbox}[left,wd=.5\paperwidth]{title}
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

\let\oldfootnotesize\footnotesize
\renewcommand*{\footnotesize}{\oldfootnotesize\tiny}


