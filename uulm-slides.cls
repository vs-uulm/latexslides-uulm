\ProvidesClass{uulm-slides}[2013/02/06 UUlm Slides]

\LoadClass{beamer}

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
\RequirePackage{listings}
\RequirePackage{ifthen}
\RequirePackage{iftex}

\newboolean{alternate}\setboolean{alternate}{false}
\DeclareOption{alternate}{\setboolean{alternate}{true}}
\newboolean{metafont}\setboolean{metafont}{false}
\DeclareOption{metafont}{\setboolean{metafont}{true}}
\ProcessOptions*

\ifXeTeX
% \RequirePackage{fontspec}
\else
\RequirePackage[utf8]{inputenc}
\fi

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

% Backwards compatibility
\definecolor{uuakzent}{named}{uulm-akzent}
\definecolor{uuinf}{named}{uulm-in}

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
\setbeamercolor*{itemize subitem}{fg=uulm-med}
\setbeamercolor*{itemize subsubitem}{fg=uulm-med!50}

\setbeamercolor*{item projected}{bg=uulm-akzent, fg=white}
\setbeamercolor*{subitem projected}{bg=uulm-med, fg=white}
\setbeamercolor*{subsubitem projected}{bg=uulm-med!50, fg=white}

% Font Theme
\usepackage{helvet}
\setbeamerfont{author}{size=\footnotesize}
\setbeamerfont{subtitle}{size=\footnotesize}
\setbeamerfont{title}{size=\Large}

\ifthenelse{\boolean{alternate}}{
\setbeamercolor{lighthead}{fg=uuakzent!80!black,bg=uuakzent!20!white}
}{}

\ifthenelse{\boolean{metafont}}{
\ifXeTeX
\RequirePackage{fontspec}
\setsansfont[
Mapping=tex-text,Numbers={OldStyle,Proportional},Scale=.96,
BoldFont={MetaPro-Bold},
BoldItalicFont={MetaPro-BoldItalic},
ItalicFont={MetaPro-BookItalic}
]{MetaPro-Book}
\else
\ClassError{uulm-slides}{Option metafont requires compilation with XeLaTeX}{}
\fi
}{% no meta font
\ifXeTeX
\ClassError{uulm-slides}{Compilation with XeLaTeX requires use of Meta font}{}
\fi
}

% Outer Theme
\setbeamertemplate{footline}{ }
\setbeamertemplate{navigation symbols}{}%remove navigation symbols
\setbeamertemplate{headline}{
    \ifnum\insertframenumber=1 % title slide content
	\vskip15pt
	\begin{beamercolorbox}[wd=.5\paperwidth,leftskip=.5\paperwidth]{structure}
	    \includegraphics[width=.45\paperwidth]{uulm-logo-color}
	\end{beamercolorbox}
    \else % header line for subsequent slides
	\ifthenelse{\boolean{alternate}}{% use alternate header
	\hskip-2pt
		\hbox{
		    \begin{beamercolorbox}[wd=.075\paperwidth,ht=2.75ex,dp=1.5ex,center]{headbox}
			\textbf{\insertframenumber}
		    \end{beamercolorbox}
		    \hskip-2pt
		    \begin{beamercolorbox}[wd=.95\paperwidth,ht=2.75ex,dp=1.5ex,left]{lighthead}
			\hspace*{1.5em}\insertshorttitle{} $|$ \insertshortauthor{} $|$ \insertshortdate
		    \end{beamercolorbox}
		}
		\vskip3em
	}{% use normal header
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
	}% /if alternate
    \fi% /header
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


\definecolor{darkviolet}{rgb}{0.5,0,0.4}
\definecolor{darkgreen}{rgb}{0,0.4,0.2} 
\definecolor{darkblue}{rgb}{0.1,0.1,0.9}
\definecolor{darkgrey}{rgb}{0.5,0.5,0.5}
\definecolor{lightblue}{rgb}{0.4,0.4,1}

%Eclipse style (http://trac.rtsys.informatik.uni-kiel.de/trac/rtsys/wiki/Latex/Examples/Listings)
\lstdefinestyle{eclipse}{
	basicstyle=\tiny\ttfamily,
	emphstyle=\color{red}\bfseries, 
	keywordstyle=\color{darkviolet}\bfseries,
	commentstyle=\color{darkgreen},
	stringstyle=\color{darkblue},
	numberstyle=\color{darkgrey}\tiny\ttfamily,
	emphstyle=\color{red},
	morecomment=[s][\color{lightblue}]{/**}{*/},
	showstringspaces=false,
	numbers=left
}

\lstdefinestyle{bw}{
	basicstyle=\tiny\ttfamily,
	numbers=left,
	columns=fullflexible,
	breaklines=true,
	mathescape=true,
	escapechar=\#,
	tabsize=4,
	frame=lines,
	showstringspaces=false
}

\lstdefinestyle{console}{
	basicstyle=\ttfamily\tiny\mdseries\color{white},
	keywordstyle=\color{white},
	commentstyle=\color{white},
	stringstyle=\color{white},
	backgroundcolor=\color{black},
	breaklines=true,
	numbers=left,
	columns=fullflexible,
	breaklines=true,
	mathescape=false,
	escapechar=\#,
	tabsize=4,
	frame=lines,
	showstringspaces=false,
	rulecolor=\color{black}
}
