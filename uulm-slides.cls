\ProvidesClass{uulm-slides}[2022/12/03 UUlm Slides]

\LoadClassWithOptions{beamer}

\RequirePackage[english,ngerman,german]{babel}
\RequirePackage{calc}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage{footnpag}
\RequirePackage{wasysym}
\RequirePackage{pgfpages}
\RequirePackage{listings}
\RequirePackage{ccicons}
\RequirePackage{ifthen}
\RequirePackage{iftex}
\RequirePackage{tikz}

\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

\ifxetexorluatex
\RequirePackage{fontspec}
\else
\RequirePackage[utf8]{inputenc}
\RequirePackage{helvet}
\fi

% Color Theme
\definecolor{uulm}{RGB}{125,154,170}
\definecolor{uulm-akzent}{RGB}{169,162,141}

\definecolor{uulm-in}{RGB}{163,38,56}
\definecolor{uulm-med}{RGB}{38,84,124}
\definecolor{uulm-mawi}{RGB}{86,170,28}
\definecolor{uulm-nawi}{RGB}{189,96,5}

\definecolor{uulm-myfak}{named}{uulm-in}
\DeclareOption{uulm-in}{\definecolor{uulm-myfak}{named}{uulm-in}}
\DeclareOption{uulm-med}{\definecolor{uulm-myfak}{named}{uulm-med}}
\DeclareOption{uulm-mawi}{\definecolor{uulm-myfak}{named}{uulm-mawi}}
\DeclareOption{uulm-nawi}{\definecolor{uulm-myfak}{named}{uulm-nawi}}
\DeclareOption{uulm-central}{\definecolor{uulm-myfak}{named}{uulm}}

\newboolean{alternate}\setboolean{alternate}{false}
\newboolean{firafont}\setboolean{firafont}{false}
\newboolean{metafont}\setboolean{metafont}{false}
\newboolean{metaprofont}\setboolean{metaprofont}{false}
\newboolean{pdflogo}\setboolean{pdflogo}{false}
\newboolean{vslogo}\setboolean{vslogo}{false}
\newboolean{xetexwhelvetica}\setboolean{xetexwhelvetica}{true}

\DeclareOption{alternate}{\setboolean{alternate}{true}}
\DeclareOption{firafont}{\setboolean{firafont}{true}}
\DeclareOption{metafont}{\setboolean{metafont}{true}}
\DeclareOption{metaprofont}{\setboolean{metaprofont}{true}}
\DeclareOption{pdflogo}{\setboolean{pdflogo}{true}}
\DeclareOption{vslogo}{\setboolean{vslogo}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions*

% Command for multiple choice answer
\newcommand{\mc}[1]{\indent\hspace{0.5cm}$\bigcirc$ #1 \\}
\newcommand{\mcselected}[1]{\indent\hspace{0.5cm}$\rlap{\hspace*{0.1cm}\checkmark}\bigcirc$ #1 \\}
% Command for selection choice answer
\newcommand{\select}[1]{\indent\hspace{0.5cm}$\Box$ #1 \\}
\newcommand{\selected}[1]{\indent\hspace{0.5cm}$\rlap{$\checkmark$}\square$ #1 \\}

% Backwards compatibility
\definecolor{uuakzent}{named}{uulm-akzent}
\definecolor{uuinf}{named}{uulm-in}

\colorlet{uulm3}{uulm-myfak!90}
\colorlet{uulm2}{uulm-myfak!80}
\colorlet{uulm1}{uulm-myfak!70}
\colorlet{uulm0}{uulm-myfak!60}

\colorlet{uulm-block2}{uulm-akzent!30}
\colorlet{uulm-block1}{uulm-akzent!40}
\colorlet{uulm-block0}{uulm-akzent!20}

\setbeamercolor{structure}{fg=uulm-myfak}
\setbeamercolor{headbox}{bg=uulm-myfak,fg=white}
\setbeamercolor{alerted text}{fg=uulm-myfak}

\setbeamercolor{lighthead}{fg=uulm-myfak!80!black,bg=white}

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
\setbeamerfont{affiliation}{size=\footnotesize}
\setbeamerfont{subtitle}{size=\footnotesize}
\setbeamerfont{title}{size=\Large}

\ifthenelse{\boolean{alternate}}{
\setbeamercolor{lighthead}{fg=uuakzent!80!black,bg=uuakzent!20!white}
}{}

% Select Fira Font
\ifthenelse{\boolean{firafont}}{
\RequirePackage[sfdefault]{FiraSans}
}{}

% Select MetaPro font
\ifthenelse{\boolean{metaprofont}}{
\ifxetexorluatex
\setboolean{xetexwhelvetica}{false}
\setsansfont[
Mapping=tex-text,Numbers={OldStyle,Proportional},Scale=.96,
BoldFont={MetaPro-Bold},
BoldItalicFont={MetaPro-BoldItalic},
ItalicFont={MetaPro-BookItalic}
]{MetaPro-Book}
\else
\ClassError{uulm-slides}{Option metaprofont requires compilation with XeLaTeX}{}
\fi
}{}

% Select Meta font
\ifthenelse{\boolean{metafont}}{
\ifxetexorluatex
\setboolean{xetexwhelvetica}{false}
\setsansfont[
Mapping=tex-text,Scale=.96,
BoldFont={MetaBold-Roman},
BoldItalicFont={MetaBold-Italic},
ItalicFont={MetaBook-Italic},
SmallCapsFont={MetaBook-Caps}
]{MetaBook-Roman}
\else
\ClassError{uulm-slides}{Option metafont requires compilation with XeLaTeX}{}
\fi
}{}

% no meta font but using xetex -> use Arial to be CD (does also not break UTF-8) 
\ifxetexorluatex
\ifthenelse{\boolean{xetexwhelvetica}}{
\setsansfont[
Ligatures=TeX,
SmallCapsFont={Arial}
]{Arial}
}{}
\fi


% Outer Theme
\setbeamertemplate{footline}{}
\setbeamertemplate{navigation symbols}{}%remove navigation symbols
\setbeamertemplate{headline}{
    \ifnum\insertframenumber>1
		\ifthenelse{\boolean{alternate}}{% use alternate header
			\hskip-2pt
			\hbox{
				\begin{beamercolorbox}[wd=.075\paperwidth,ht=2.75ex,dp=1.5ex,center]{headbox}
				\textbf{\insertframenumber}
				\end{beamercolorbox}
				\hskip-2pt
				\begin{beamercolorbox}[wd=.95\paperwidth,ht=2.75ex,dp=1.5ex,left]{lighthead}
				\hspace*{1.5em}\insertshorttitle{}\hphantom{---}$|$\hphantom{---}\insertshortauthor{}\hphantom{---}$|$\hphantom{---}\insertshortdate
				\end{beamercolorbox}\hspace*{-11pt} % avoid overfull \hbox warning
			}
			\vskip2em
		}{% use normal header
			\vskip 8pt
			\textcolor{uulm-myfak}{\line(1,0){500}}\hspace*{-136pt} % avoid overfull \hbox warning
			\vskip0pt
			\hskip-4pt
			\hbox{
				\begin{beamercolorbox}[wd=.05\paperwidth,ht=2.75ex,dp=1.5ex,center]{headbox}
					\textbf{\insertframenumber}
				\end{beamercolorbox}
				\hskip 5pt

				\begin{beamercolorbox}[wd=.95\paperwidth,ht=2.75ex,dp=1.5ex,left]{lighthead}
					\hspace*{1.5em}\insertshorttitle{} $|$ \insertshortauthor{} $|$ \insertshortdate
				\end{beamercolorbox}\hspace*{-11pt} % avoid overfull \hbox warning
			}
			\vskip2.7em
		}% /if alternate
	\else
		\vskip25pt
    \fi% /header
}

\def\@affiliation{}
\newcommand\affiliation[1]{\def\@affiliation{#1}}

\def\@license{}
\newcommand\license[1]{\def\@license{#1}}

\def\@titlegraphiclicense{}
\newcommand\titlegraphiclicense[1]{\def\@titlegraphiclicense{#1}}

% Inner Theme

\useinnertheme{rectangles}
\setbeamertemplate{title page}{
    \hfuzz=28pt % avoid overfull \hbox warning
	\begin{tikzpicture}[overlay, remember picture, every path/.style={}]
		\ifthenelse{\boolean{vslogo}}{
			\node[xshift=1.08em,yshift=1.97em+.75*\paperheight,anchor=south west,inner sep=0] at (current page.south west) {\resizebox{!}{.0657\paperheight}{\vslogo}};
		}{}
		\node[xshift=-1.67em,yshift=1.67em+.75*\paperheight,anchor=south east,inner sep=0] at (current page.south east) {
			\resizebox{!}{.1243\paperheight}{\ifthenelse{\boolean{pdflogo}}{\pdflogo}{\uulmlogo}}
		};

		\node[minimum width=\paperwidth, text width=\paperwidth, text height=.25*\paperwidth, anchor=south west, inner sep=.7em] at (current page.south west) {
			\hbox{
				\begin{beamercolorbox}[left,wd=.459\paperwidth]{author}
					\usebeamerfont{author}\insertauthor
					\ifthenelse{\equal{\@affiliation}{}}{% no affiliation specified
					}{% include affiliation
						\vskip1pt
						\usebeamerfont{affiliation}\@affiliation
					}

					\vskip5pt
					\insertdate

					\ifthenelse{\equal{\@affiliation}{}}{% no license specified
					}{% include license
						\vskip1pt
						\@license{}
					}
				\end{beamercolorbox}
				\begin{beamercolorbox}[left,wd=.5\paperwidth]{title}
					\usebeamerfont{title}\inserttitle
					\vskip5pt
					\usebeamerfont{subtitle}
					\insertsubtitle
				\end{beamercolorbox}
			}
		};

		\clip ([yshift=.2625*\paperheight] current page.south west) rectangle ++(\paperwidth,.522*\paperheight);
		\node[draw=none, fill=uulm-akzent!60, minimum width=\paperwidth+1pt, minimum height=0.522*\paperheight, anchor=south west, yshift=.2625*\paperheight,xshift=-1pt, inner sep=0] at (current page.south west) {
			\ifthenelse{\equal{\inserttitlegraphic}{}}{% no title graphic specified
				\ClassWarning{uulm-slides}{Please set a custom title graphic}
			}{% include title graphic
				\includegraphics[keepaspectratio,width=\paperwidth+1pt]{\inserttitlegraphic}
			}
		};

		\node[anchor=south west,text=black,font=\tiny,xshift=1em+0.5pt,yshift=1ex-0.5pt] at ([yshift=.25*\paperheight] current page.south west) {\@titlegraphiclicense};
		\node[anchor=south west,text=white,font=\tiny,xshift=1em,yshift=1ex] at ([yshift=.25*\paperheight] current page.south west) {\@titlegraphiclicense};

	\end{tikzpicture}
}

\setbeamersize{sidebar width left=.075\paperwidth}
\setbeamersize{text margin left=.3cm}
\setbeamersize{text margin right=.1\paperwidth}

\setlength\leftmargini{1.5em}
\setlength\leftmarginii{1.5em}
\setlength\leftmarginiii{1.5em}

\setbeamerfont{footnote}{size=\tiny}

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

\newcommand\uulmlogo{\begin{tikzpicture}[y=0.8pt, x=0.8pt, inner sep=0pt, outer sep=0pt]
	\pgftransformscale{.335*\paperwidth/100mm}
	\begin{scope}[cm={{1.25,0.0,0.0,-1.25,(0.0,141.7325)}}]
		\path[fill=black] (152.1000,29.3000) -- (141.0000,29.3000) -- (141.0000,50.2000) .. controls (141.0000,55.7000) and (139.3000,64.4000) .. (131.2000,64.4000) .. controls (124.1000,64.4000) and (124.0000,57.3000) .. (124.0000,52.1000) -- (124.0000,29.3000) -- (112.9000,29.3000) -- (112.9000,56.3000) .. controls (112.9000,65.9000) and (117.3000,73.1000) .. (127.4000,73.1000) .. controls (133.2000,73.1000) and (138.0000,70.4000) .. (141.4000,66.3000) -- (141.6000,66.3000) -- (141.6000,72.1000) -- (152.1000,72.1000) -- (152.1000,29.3000) -- cycle;
		
		\path[fill=black,rounded corners=0.0000cm] (210.5000,7.8000) rectangle (215.7000,72.1000);

		\path[fill=black] (199.2000,11.2000) -- (196.9000,11.2000) -- (196.9000,8.3000) -- (195.6000,8.7000) -- (195.6000,11.1000) -- (193.6000,11.1000) -- (193.6000,12.2000) -- (195.6000,12.2000) -- (195.6000,18.1000) .. controls (195.6000,20.0000) and (195.7000,21.5000) .. (197.9000,21.5000) .. controls (198.5000,21.5000) and (199.1000,21.3000) .. (199.4000,21.2000) -- (199.3000,20.2000) .. controls (198.9000,20.3000) and (198.6000,20.4000) .. (198.1000,20.4000) .. controls (197.1000,20.4000) and (196.7000,19.6000) .. (196.7000,18.7000) -- (196.7000,12.1000) -- (199.0000,12.1000) -- (199.0000,11.2000) -- cycle(185.7000,9.5000) -- (187.2000,9.5000) -- (187.2000,7.8000) -- (185.7000,7.8000) -- (185.7000,9.5000) -- cycle(189.1000,9.5000) -- (190.6000,9.5000) -- (190.6000,7.8000) -- (189.1000,7.8000) -- (189.1000,9.5000) -- cycle(190.5000,16.8000) .. controls (190.5000,17.9000) and (190.4000,20.5000) .. (187.5000,20.5000) .. controls (186.3000,20.5000) and (185.4000,20.0000) .. (185.4000,18.7000) .. controls (185.4000,16.5000) and (188.0000,16.3000) .. (190.2000,16.3000) -- (190.6000,16.3000) -- (190.6000,16.8000) -- cycle(190.6000,21.3000) -- (191.8000,21.3000) .. controls (191.7000,20.6000) and (191.7000,20.0000) .. (191.7000,19.2000) -- (191.7000,14.7000) .. controls (191.7000,12.1000) and (190.6000,10.9000) .. (188.1000,10.9000) .. controls (187.2000,10.9000) and (185.9000,11.2000) .. (185.1000,11.6000) -- (185.1000,12.8000) .. controls (186.0000,12.2000) and (187.0000,12.0000) .. (188.1000,12.0000) .. controls (189.8000,12.0000) and (190.4000,12.9000) .. (190.4000,14.6000) -- (190.4000,15.1000) -- (190.2000,15.1000) .. controls (187.6000,15.1000) and (184.0000,15.3000) .. (184.0000,18.7000) .. controls (184.0000,19.6000) and (184.5000,21.6000) .. (187.3000,21.6000) .. controls (188.6000,21.6000) and (190.0000,20.9000) .. (190.5000,19.7000) -- (190.5000,19.7000) -- (190.5000,21.3000) -- cycle(182.4000,11.2000) -- (180.1000,11.2000) -- (180.1000,8.3000) -- (178.8000,8.7000) -- (178.8000,11.1000) -- (176.8000,11.1000) -- (176.8000,12.2000) -- (178.8000,12.2000) -- (178.8000,18.1000) .. controls (178.8000,20.0000) and (178.9000,21.5000) .. (181.1000,21.5000) .. controls (181.7000,21.5000) and (182.3000,21.3000) .. (182.6000,21.2000) -- (182.5000,20.2000) .. controls (182.1000,20.3000) and (181.8000,20.4000) .. (181.3000,20.4000) .. controls (180.3000,20.4000) and (179.9000,19.6000) .. (179.9000,18.7000) -- (179.9000,12.1000) -- (182.2000,12.1000) -- (182.2000,11.2000) -- cycle(174.7000,6.8000) -- (173.4000,6.8000) -- (173.4000,8.5000) -- (174.7000,8.5000) -- (174.7000,6.8000) -- cycle(173.5000,21.3000) -- (174.8000,21.3000) -- (174.8000,11.2000) -- (173.5000,11.2000) -- (173.5000,21.3000) -- cycle(164.7000,21.1000) .. controls (165.6000,21.5000) and (166.6000,21.6000) .. (167.5000,21.6000) .. controls (169.0000,21.6000) and (171.0000,20.9000) .. (171.0000,18.7000) .. controls (171.0000,15.4000) and (166.0000,15.6000) .. (166.0000,13.7000) .. controls (166.0000,12.4000) and (166.9000,12.0000) .. (168.2000,12.0000) .. controls (168.9000,12.0000) and (169.8000,12.2000) .. (170.4000,12.5000) -- (170.5000,11.4000) .. controls (169.6000,11.1000) and (168.5000,10.9000) .. (168.0000,10.9000) .. controls (166.3000,10.9000) and (164.7000,11.7000) .. (164.7000,13.7000) .. controls (164.7000,16.6000) and (169.6000,16.3000) .. (169.6000,18.7000) .. controls (169.6000,19.9000) and (168.5000,20.5000) .. (167.4000,20.5000) .. controls (166.4000,20.5000) and (165.5000,20.2000) .. (164.8000,19.9000) -- (164.7000,21.1000) -- cycle(158.9000,21.3000) -- (160.2000,21.3000) -- (160.2000,16.3000) .. controls (160.2000,14.5000) and (160.7000,12.2000) .. (162.7000,12.2000) .. controls (163.0000,12.2000) and (163.4000,12.2000) .. (163.6000,12.3000) -- (163.6000,11.0000) .. controls (163.4000,10.9000) and (163.0000,10.9000) .. (162.7000,10.9000) .. controls (161.4000,10.9000) and (160.6000,12.0000) .. (160.1000,13.1000) -- (160.1000,13.1000) -- (160.1000,11.1000) -- (158.8000,11.1000) .. controls (158.9000,11.8000) and (158.9000,12.3000) .. (158.9000,13.4000) -- (158.9000,21.3000) -- cycle(149.4000,15.6000) .. controls (149.4000,13.9000) and (150.5000,12.1000) .. (152.4000,12.1000) .. controls (154.3000,12.1000) and (155.0000,13.9000) .. (155.0000,15.6000) -- (149.4000,15.6000) -- cycle(155.6000,19.8000) .. controls (155.0000,20.2000) and (153.7000,20.6000) .. (152.8000,20.6000) .. controls (150.6000,20.6000) and (149.5000,18.9000) .. (149.5000,16.7000) -- (156.4000,16.7000) -- (156.4000,16.0000) .. controls (156.4000,13.3000) and (155.2000,11.0000) .. (152.4000,11.0000) .. controls (149.8000,11.0000) and (148.1000,13.2000) .. (148.1000,16.3000) .. controls (148.1000,19.3000) and (149.4000,21.6000) .. (152.7000,21.6000) .. controls (153.6000,21.6000) and (154.8000,21.4000) .. (155.6000,21.0000) -- (155.6000,19.8000) -- cycle(146.9000,11.2000) -- (145.6000,11.2000) -- (142.7000,20.0000) -- (142.7000,20.0000) -- (139.9000,11.2000) -- (138.5000,11.2000) -- (141.9000,21.3000) -- (143.4000,21.3000) -- (146.9000,11.2000) -- cycle(136.6000,6.8000) -- (135.3000,6.8000) -- (135.3000,8.5000) -- (136.6000,8.5000) -- (136.6000,6.8000) -- cycle(135.3000,21.3000) -- (136.6000,21.3000) -- (136.6000,11.2000) -- (135.3000,11.2000) -- (135.3000,21.3000) -- cycle(124.1000,21.3000) -- (125.4000,21.3000) -- (125.4000,15.7000) .. controls (125.4000,14.0000) and (126.1000,12.0000) .. (128.4000,12.0000) .. controls (130.1000,12.0000) and (130.8000,13.2000) .. (130.8000,15.1000) -- (130.8000,21.3000) -- (132.1000,21.3000) -- (132.1000,14.8000) .. controls (132.1000,12.6000) and (131.1000,10.9000) .. (128.6000,10.9000) .. controls (126.5000,10.9000) and (125.7000,12.0000) .. (125.3000,13.0000) -- (125.3000,13.0000) -- (125.3000,11.2000) -- (124.1000,11.2000) .. controls (124.2000,12.0000) and (124.2000,12.8000) .. (124.2000,13.6000) -- (124.2000,21.3000) -- cycle(120.9000,11.2000) -- (119.6000,11.2000) -- (119.6000,16.8000) .. controls (119.6000,18.5000) and (118.9000,20.5000) .. (116.6000,20.5000) .. controls (114.9000,20.5000) and (114.2000,19.3000) .. (114.2000,17.4000) -- (114.2000,11.2000) -- (113.0000,11.2000) -- (113.0000,17.7000) .. controls (113.0000,19.9000) and (114.0000,21.6000) .. (116.5000,21.6000) .. controls (118.6000,21.6000) and (119.4000,20.5000) .. (119.8000,19.6000) -- (119.8000,19.6000) -- (119.8000,21.4000) -- (121.0000,21.4000) .. controls (120.9000,20.6000) and (120.9000,19.8000) .. (120.9000,19.0000) -- (120.9000,11.2000) -- cycle;

		\path[fill=black] (198.6000,29.2000) -- (193.3000,29.2000) -- (193.3000,52.9000) .. controls (193.3000,60.0000) and (190.3000,68.5000) .. (180.6000,68.5000) .. controls (173.3000,68.5000) and (170.4000,63.3000) .. (170.4000,55.2000) -- (170.4000,29.2000) -- (165.1000,29.2000) -- (165.1000,56.6000) .. controls (165.1000,66.0000) and (169.1000,73.1000) .. (179.7000,73.1000) .. controls (188.6000,73.1000) and (191.8000,68.3000) .. (193.5000,64.5000) -- (193.7000,64.5000) -- (193.7000,72.0000) -- (198.8000,72.0000) .. controls (198.5000,68.6000) and (198.5000,65.2000) .. (198.5000,61.9000) -- (198.5000,29.2000) -- cycle;

		\path[fill=black] (283.9000,72.1000) -- (283.9000,42.6000) .. controls (283.9000,34.3000) and (279.0000,28.3000) .. (270.4000,28.3000) .. controls (263.7000,28.3000) and (258.7000,32.3000) .. (256.7000,37.4000) -- (256.5000,37.4000) .. controls (255.2000,29.9000) and (249.0000,28.3000) .. (245.2000,28.3000) .. controls (236.1000,28.3000) and (233.6000,33.7000) .. (231.9000,36.6000) -- (231.7000,36.5000) -- (231.7000,29.3000) -- (226.6000,29.3000) .. controls (226.9000,32.7000) and (226.9000,36.1000) .. (226.9000,39.4000) -- (226.9000,72.1000) -- (232.2000,72.1000) -- (232.2000,48.4000) .. controls (232.2000,37.8000) and (237.9000,32.8000) .. (243.7000,32.8000) .. controls (250.5000,32.8000) and (252.7000,37.6000) .. (252.7000,43.6000) -- (252.7000,72.0000) -- (258.0000,72.0000) -- (258.0000,48.4000) .. controls (258.0000,37.8000) and (263.7000,32.8000) .. (269.5000,32.8000) .. controls (276.3000,32.8000) and (278.5000,37.6000) .. (278.5000,43.6000) -- (278.5000,72.0000) -- (283.9000,72.0000) -- cycle;

		\path[fill=black] (32.0000,55.3000) .. controls (32.3000,56.7000) and (32.6000,58.0000) .. (33.0000,59.2000) .. controls (33.0000,59.2000) and (33.0000,59.2000) .. (33.1000,59.2000) .. controls (34.2000,59.2000) and (35.2000,60.1000) .. (35.2000,61.3000) .. controls (35.2000,61.9000) and (34.9000,62.5000) .. (34.4000,62.9000) .. controls (36.0000,66.4000) and (37.8000,68.3000) .. (39.7000,68.3000) .. controls (42.6000,68.3000) and (45.7000,63.3000) .. (47.4000,55.0000) .. controls (45.0000,54.2000) and (42.5000,53.1000) .. (40.0000,51.9000) .. controls (37.2000,53.3000) and (34.6000,54.4000) .. (32.0000,55.3000);

		\path[fill=black] (34.5000,49.1000) .. controls (33.3000,48.4000) and (32.0000,47.6000) .. (30.8000,46.8000) .. controls (31.0000,49.4000) and (31.3000,51.7000) .. (31.7000,53.9000) .. controls (33.8000,53.1000) and (36.0000,52.2000) .. (38.3000,51.2000) .. controls (37.1000,50.5000) and (35.8000,49.8000) .. (34.5000,49.1000);

		\path[fill=black] (45.0000,31.0000) .. controls (46.2000,31.7000) and (47.3000,32.4000) .. (48.5000,33.1000) .. controls (48.3000,30.8000) and (48.0000,28.6000) .. (47.6000,26.6000) .. controls (45.6000,27.3000) and (43.6000,28.1000) .. (41.5000,29.1000) .. controls (42.6000,29.7000) and (43.8000,30.3000) .. (45.0000,31.0000);

		\path[fill=black] (24.8000,25.7000) .. controls (23.8000,25.7000) and (23.0000,25.0000) .. (22.8000,24.1000) .. controls (22.0000,24.0000) and (21.3000,24.0000) .. (20.7000,24.0000) .. controls (18.0000,24.0000) and (16.2000,24.7000) .. (15.4000,26.0000) .. controls (14.0000,28.5000) and (16.7000,33.6000) .. (23.0000,39.2000) .. controls (25.0000,37.5000) and (27.1000,35.9000) .. (29.4000,34.3000) .. controls (29.6000,31.4000) and (30.0000,28.5000) .. (30.5000,25.9000) .. controls (29.1000,25.5000) and (27.8000,25.1000) .. (26.5000,24.8000) .. controls (26.2000,25.4000) and (25.5000,25.7000) .. (24.8000,25.7000);

		\path[fill=black] (41.5000,51.2000) .. controls (43.6000,52.2000) and (45.7000,53.0000) .. (47.6000,53.7000) .. controls (48.0000,51.7000) and (48.3000,49.5000) .. (48.5000,47.1000) .. controls (47.3000,47.9000) and (46.1000,48.6000) .. (44.9000,49.3000) .. controls (43.7000,50.0000) and (42.6000,50.6000) .. (41.5000,51.2000);

		\path[fill=black] (47.3000,25.2000) .. controls (47.0000,23.6000) and (46.6000,22.1000) .. (46.1000,20.7000) .. controls (45.0000,20.6000) and (44.1000,19.7000) .. (44.1000,18.6000) .. controls (44.1000,18.0000) and (44.3000,17.5000) .. (44.7000,17.2000) .. controls (43.2000,14.0000) and (41.4000,12.2000) .. (39.6000,12.2000) .. controls (36.7000,12.2000) and (33.7000,17.0000) .. (32.0000,25.0000) .. controls (34.5000,25.9000) and (37.2000,27.0000) .. (39.8000,28.3000) .. controls (42.4000,27.1000) and (44.9000,26.0000) .. (47.3000,25.2000);

		\path[fill=black] (24.0000,40.1000) .. controls (25.6000,41.4000) and (27.3000,42.8000) .. (29.3000,44.1000) .. controls (29.2000,42.8000) and (29.2000,41.5000) .. (29.2000,40.2000) .. controls (29.2000,38.8000) and (29.2000,37.4000) .. (29.3000,36.0000) .. controls (27.4000,37.4000) and (25.6000,38.8000) .. (24.0000,40.1000);

		\path[fill=black] (38.3000,29.1000) .. controls (36.1000,28.0000) and (33.9000,27.1000) .. (31.7000,26.4000) .. controls (31.3000,28.5000) and (31.0000,30.9000) .. (30.8000,33.4000) .. controls (32.0000,32.6000) and (33.2000,31.9000) .. (34.4000,31.2000) .. controls (35.7000,30.5000) and (37.0000,29.7000) .. (38.3000,29.1000);

		\path[fill=black] (23.0000,41.0000) .. controls (21.9000,42.0000) and (20.8000,43.0000) .. (19.9000,44.0000) .. controls (20.1000,44.3000) and (20.2000,44.7000) .. (20.2000,45.0000) .. controls (20.2000,46.1000) and (19.3000,47.1000) .. (18.1000,47.1000) .. controls (17.9000,47.1000) and (17.6000,47.1000) .. (17.4000,47.0000) .. controls (15.1000,50.1000) and (14.4000,52.7000) .. (15.3000,54.3000) .. controls (16.4000,56.3000) and (20.1000,56.8000) .. (25.3000,55.7000) .. controls (26.9000,55.4000) and (28.6000,54.9000) .. (30.4000,54.3000) .. controls (29.9000,51.6000) and (29.5000,48.7000) .. (29.3000,45.8000) .. controls (27.1000,44.3000) and (25.0000,42.7000) .. (23.0000,41.0000);

		\path[fill=black] (36.9000,45.2000) .. controls (36.9000,45.8000) and (37.9000,46.6000) .. (39.4000,46.8000) .. controls (39.4000,46.8000) and (39.4000,46.8000) .. (39.4000,46.8000) -- (39.4000,43.7000) .. controls (38.2000,43.8000) and (36.9000,44.5000) .. (36.9000,45.2000);

		\path[fill=black] (55.6000,40.1000) .. controls (53.9000,38.7000) and (52.1000,37.2000) .. (50.0000,35.8000) .. controls (50.1000,37.3000) and (50.1000,38.8000) .. (50.1000,40.2000) .. controls (50.1000,41.6000) and (50.1000,43.0000) .. (50.0000,44.4000) .. controls (52.1000,43.0000) and (54.0000,41.5000) .. (55.6000,40.1000);

		\path[fill=black] (56.6000,41.0000) .. controls (54.6000,42.8000) and (52.3000,44.5000) .. (49.9000,46.1000) .. controls (49.7000,48.9000) and (49.4000,51.6000) .. (48.9000,54.1000) .. controls (50.4000,54.6000) and (51.9000,55.0000) .. (53.4000,55.3000) .. controls (53.7000,54.6000) and (54.4000,54.2000) .. (55.2000,54.2000) .. controls (56.2000,54.2000) and (57.1000,54.9000) .. (57.2000,55.9000) .. controls (60.7000,56.2000) and (63.1000,55.5000) .. (64.0000,54.0000) .. controls (65.5000,51.6000) and (62.8000,46.6000) .. (56.6000,41.0000);

		\path[fill=black] (58.8000,57.4000) .. controls (58.2000,57.4000) and (57.7000,57.4000) .. (57.1000,57.3000) .. controls (56.7000,57.9000) and (56.1000,58.4000) .. (55.3000,58.4000) .. controls (54.3000,58.4000) and (53.5000,57.7000) .. (53.3000,56.7000) .. controls (51.8000,56.4000) and (50.3000,56.0000) .. (48.8000,55.5000) .. controls (47.1000,63.6000) and (44.0000,69.7000) .. (39.8000,69.7000) .. controls (37.1000,69.7000) and (34.9000,67.2000) .. (33.2000,63.4000) .. controls (33.2000,63.4000) and (33.2000,63.4000) .. (33.2000,63.4000) .. controls (32.1000,63.4000) and (31.1000,62.5000) .. (31.1000,61.3000) .. controls (31.1000,60.7000) and (31.4000,60.1000) .. (31.8000,59.7000) .. controls (31.4000,58.4000) and (31.1000,57.1000) .. (30.8000,55.7000) .. controls (29.0000,56.3000) and (27.3000,56.7000) .. (25.7000,57.1000) .. controls (23.9000,57.5000) and (22.2000,57.7000) .. (20.7000,57.7000) .. controls (17.5000,57.7000) and (15.2000,56.8000) .. (14.2000,55.1000) .. controls (12.9000,52.8000) and (13.9000,49.6000) .. (16.4000,46.2000) .. controls (16.2000,45.9000) and (16.1000,45.5000) .. (16.1000,45.1000) .. controls (16.1000,44.0000) and (17.0000,43.0000) .. (18.2000,43.0000) .. controls (18.5000,43.0000) and (18.7000,43.1000) .. (19.0000,43.2000) .. controls (19.9000,42.2000) and (21.0000,41.2000) .. (22.1000,40.2000) .. controls (15.9000,34.7000) and (12.3000,29.0000) .. (14.3000,25.4000) .. controls (15.5000,23.3000) and (18.6000,22.4000) .. (23.0000,22.9000) .. controls (23.3000,22.2000) and (24.0000,21.7000) .. (24.9000,21.7000) .. controls (26.0000,21.7000) and (26.9000,22.5000) .. (27.0000,23.6000) .. controls (28.3000,23.9000) and (29.6000,24.3000) .. (30.9000,24.7000) .. controls (32.6000,16.8000) and (35.7000,10.9000) .. (39.8000,10.9000) .. controls (42.3000,10.9000) and (44.5000,13.1000) .. (46.1000,16.7000) .. controls (46.2000,16.7000) and (46.3000,16.7000) .. (46.3000,16.7000) .. controls (47.4000,16.7000) and (48.4000,17.6000) .. (48.4000,18.8000) .. controls (48.4000,19.5000) and (48.0000,20.1000) .. (47.5000,20.5000) .. controls (47.9000,21.9000) and (48.3000,23.4000) .. (48.7000,24.9000) .. controls (50.5000,24.3000) and (52.2000,23.9000) .. (53.8000,23.5000) .. controls (59.7000,22.3000) and (63.8000,23.1000) .. (65.3000,25.6000) .. controls (66.5000,27.8000) and (65.7000,30.7000) .. (63.5000,33.8000) .. controls (63.7000,34.1000) and (63.8000,34.5000) .. (63.8000,35.0000) .. controls (63.8000,36.1000) and (62.9000,37.1000) .. (61.7000,37.1000) .. controls (61.4000,37.1000) and (61.2000,37.0000) .. (61.0000,37.0000) .. controls (60.0000,38.1000) and (58.9000,39.2000) .. (57.7000,40.3000) .. controls (63.8000,45.8000) and (67.4000,51.4000) .. (65.3000,55.0000) .. controls (64.3000,56.5000) and (62.0000,57.4000) .. (58.8000,57.4000)(39.7000,8.6000) .. controls (22.2000,8.6000) and (8.0000,22.8000) .. (8.0000,40.2000) .. controls (8.0000,57.7000) and (22.2000,71.8000) .. (39.6000,71.8000) .. controls (57.0000,71.8000) and (71.2000,57.6000) .. (71.2000,40.2000) .. controls (71.3000,22.8000) and (57.1000,8.6000) .. (39.7000,8.6000);

		\path[fill=black] (56.6000,39.2000) .. controls (57.8000,38.1000) and (58.9000,37.0000) .. (59.9000,35.9000) .. controls (59.7000,35.6000) and (59.6000,35.2000) .. (59.6000,34.8000) .. controls (59.6000,33.7000) and (60.5000,32.7000) .. (61.7000,32.7000) .. controls (61.9000,32.7000) and (62.1000,32.7000) .. (62.3000,32.8000) .. controls (64.2000,29.9000) and (64.8000,27.6000) .. (64.0000,26.1000) .. controls (63.3000,24.8000) and (61.4000,24.1000) .. (58.7000,24.1000) .. controls (57.3000,24.1000) and (55.7000,24.3000) .. (54.0000,24.6000) .. controls (52.4000,24.9000) and (50.7000,25.4000) .. (48.9000,26.0000) .. controls (49.4000,28.5000) and (49.7000,31.2000) .. (49.9000,33.9000) .. controls (52.3000,35.7000) and (54.6000,37.5000) .. (56.6000,39.2000);

		\path[fill=black] (36.5000,40.9000) .. controls (36.5000,41.6000) and (37.9000,42.5000) .. (39.4000,42.7000) -- (39.4000,39.2000) .. controls (37.9000,39.4000) and (36.5000,40.2000) .. (36.5000,40.9000);

		\path[fill=black] (44.9000,40.9000) .. controls (44.9000,41.8000) and (44.0000,42.7000) .. (42.5000,43.2000) .. controls (43.7000,43.6000) and (44.5000,44.4000) .. (44.5000,45.2000) .. controls (44.5000,46.1000) and (43.7000,46.8000) .. (42.4000,47.3000) .. controls (42.2000,47.4000) and (41.4000,47.6000) .. (40.7000,47.6000) .. controls (40.7000,47.6000) and (40.7000,47.6000) .. (40.7000,47.6000) .. controls (40.7000,47.6000) and (40.7000,47.6000) .. (40.7000,47.6000) -- (40.7000,48.7000) .. controls (40.7000,49.0000) and (40.5000,49.3000) .. (40.1000,49.3000) .. controls (39.8000,49.3000) and (39.5000,49.1000) .. (39.5000,48.7000) -- (39.5000,47.6000) .. controls (39.5000,47.6000) and (39.5000,47.6000) .. (39.5000,47.6000) .. controls (39.5000,47.6000) and (39.5000,47.6000) .. (39.5000,47.6000) .. controls (38.8000,47.6000) and (38.0000,47.4000) .. (37.8000,47.3000) .. controls (36.5000,46.9000) and (35.7000,46.1000) .. (35.7000,45.2000) .. controls (35.7000,44.4000) and (36.4000,43.7000) .. (37.7000,43.2000) .. controls (36.0000,42.8000) and (35.0000,41.9000) .. (35.0000,40.9000) .. controls (35.0000,40.0000) and (35.8000,39.2000) .. (37.2000,38.7000) .. controls (35.5000,38.2000) and (34.4000,37.2000) .. (34.4000,36.2000) .. controls (34.4000,35.3000) and (35.1000,34.5000) .. (36.4000,34.0000) .. controls (36.5000,33.7000) and (36.8000,33.4000) .. (37.2000,33.2000) .. controls (37.5000,33.1000) and (37.8000,33.1000) .. (38.1000,33.2000) .. controls (38.4000,33.3000) and (38.6000,33.4000) .. (38.6000,33.7000) .. controls (38.7000,33.9000) and (38.6000,34.2000) .. (38.5000,34.4000) .. controls (38.3000,34.6000) and (38.1000,34.8000) .. (37.8000,34.9000) .. controls (37.6000,35.0000) and (37.4000,35.0000) .. (37.2000,35.0000) .. controls (36.5000,35.4000) and (36.1000,35.9000) .. (36.1000,36.3000) .. controls (36.1000,37.2000) and (37.7000,38.1000) .. (39.4000,38.3000) -- (39.4000,32.0000) .. controls (39.4000,31.6000) and (39.6000,31.4000) .. (39.9000,31.3000) .. controls (40.3000,31.3000) and (40.5000,31.6000) .. (40.5000,32.0000) -- (40.5000,38.3000) .. controls (42.3000,38.1000) and (43.8000,37.2000) .. (43.8000,36.3000) .. controls (43.8000,35.9000) and (43.4000,35.4000) .. (42.7000,35.0000) .. controls (42.5000,35.0000) and (42.3000,35.0000) .. (42.1000,34.9000) .. controls (41.8000,34.8000) and (41.6000,34.6000) .. (41.4000,34.4000) .. controls (41.2000,34.2000) and (41.2000,33.9000) .. (41.2000,33.7000) .. controls (41.3000,33.5000) and (41.5000,33.3000) .. (41.7000,33.2000) .. controls (42.0000,33.1000) and (42.3000,33.1000) .. (42.6000,33.2000) .. controls (43.0000,33.3000) and (43.3000,33.6000) .. (43.4000,34.0000) .. controls (44.6000,34.6000) and (45.4000,35.4000) .. (45.4000,36.2000) .. controls (45.4000,37.3000) and (44.3000,38.2000) .. (42.6000,38.7000) .. controls (44.0000,39.2000) and (44.9000,40.1000) .. (44.9000,40.9000)(44.3000,32.2000) .. controls (42.8000,31.4000) and (41.4000,30.6000) .. (39.9000,29.8000) .. controls (38.3000,30.6000) and (36.7000,31.4000) .. (35.1000,32.4000) .. controls (33.6000,33.3000) and (32.1000,34.2000) .. (30.7000,35.1000) .. controls (30.6000,36.7000) and (30.5000,38.5000) .. (30.5000,40.2000) .. controls (30.5000,41.9000) and (30.5000,43.5000) .. (30.6000,45.1000) .. controls (32.0000,46.0000) and (33.5000,47.0000) .. (35.1000,47.9000) .. controls (36.7000,48.8000) and (38.2000,49.6000) .. (39.8000,50.4000) .. controls (41.2000,49.7000) and (42.7000,48.9000) .. (44.1000,48.1000) .. controls (45.6000,47.2000) and (47.1000,46.3000) .. (48.5000,45.4000) .. controls (48.6000,43.8000) and (48.7000,42.0000) .. (48.7000,40.3000) .. controls (48.7000,38.4000) and (48.6000,36.6000) .. (48.5000,34.9000) .. controls (47.2000,34.0000) and (45.8000,33.1000) .. (44.3000,32.2000);

		\path[fill=black] (40.5000,42.7000) .. controls (42.0000,42.5000) and (43.4000,41.7000) .. (43.4000,40.9000) .. controls (43.4000,40.2000) and (42.0000,39.3000) .. (40.5000,39.1000) -- (40.5000,42.7000) -- cycle;

		\path[fill=black] (40.5000,46.8000) .. controls (40.5000,46.8000) and (40.5000,46.8000) .. (40.5000,46.8000) .. controls (41.7000,46.6000) and (43.0000,45.9000) .. (43.0000,45.2000) .. controls (43.0000,44.5000) and (41.7000,43.8000) .. (40.5000,43.6000) -- (40.5000,46.8000) -- cycle;

		\path[fill=black] (6.0000,26.7000) .. controls (6.3000,26.8000) and (6.6000,26.7000) .. (6.7000,26.4000) .. controls (6.8000,26.1000) and (6.7000,25.8000) .. (6.4000,25.8000) .. controls (6.2000,25.7000) and (5.9000,25.8000) .. (5.8000,26.1000) .. controls (5.7000,26.3000) and (5.8000,26.6000) .. (6.0000,26.7000)(3.5000,33.8000) .. controls (5.2000,34.3000) and (6.7000,33.6000) .. (7.2000,31.8000) .. controls (7.7000,30.1000) and (6.7000,28.7000) .. (5.0000,28.3000) .. controls (3.3000,27.8000) and (1.8000,28.5000) .. (1.3000,30.3000) .. controls (0.8000,32.0000) and (1.8000,33.4000) .. (3.5000,33.8000)(3.7000,33.0000) .. controls (2.5000,32.7000) and (1.6000,31.8000) .. (2.0000,30.5000) .. controls (2.3000,29.2000) and (3.6000,28.9000) .. (4.7000,29.2000) .. controls (5.8000,29.5000) and (6.8000,30.4000) .. (6.4000,31.7000) .. controls (6.1000,33.0000) and (4.8000,33.3000) .. (3.7000,33.0000)(0.8000,39.2000) -- (0.9000,38.2000) .. controls (1.0000,37.0000) and (1.8000,36.1000) .. (3.2000,36.2000) .. controls (4.7000,36.3000) and (5.4000,37.1000) .. (5.3000,38.6000) -- (5.2000,39.5000) -- (0.8000,39.2000) -- cycle(5.9000,40.3000) -- (6.0000,38.6000) .. controls (6.1000,36.7000) and (5.2000,35.4000) .. (3.2000,35.3000) .. controls (1.4000,35.2000) and (0.2000,36.5000) .. (0.1000,38.3000) -- (0.0000,40.0000) -- (5.9000,40.3000) -- cycle(6.6000,46.9000) -- (6.5000,46.1000) -- (1.7000,46.8000) -- (1.7000,46.8000) -- (6.1000,43.5000) -- (6.0000,42.4000) -- (0.1000,43.2000) -- (0.2000,44.0000) -- (4.9000,43.3000) -- (4.9000,43.3000) -- (0.5000,46.5000) -- (0.7000,47.6000) -- (6.6000,46.9000) -- cycle(5.3000,50.6000) -- (6.0000,52.9000) -- (2.8000,52.7000) -- (5.3000,50.6000) -- cycle(8.7000,53.8000) -- (8.4000,53.0000) -- (6.8000,52.9000) -- (5.9000,50.2000) -- (7.1000,49.1000) -- (6.8000,48.2000) -- (2.0000,52.5000) -- (2.3000,53.3000) -- (8.7000,53.8000) -- cycle(6.1000,59.9000) -- (5.7000,59.2000) .. controls (5.3000,58.5000) and (5.4000,58.0000) .. (5.9000,57.7000) .. controls (6.4000,57.4000) and (6.9000,57.7000) .. (7.3000,58.4000) -- (7.6000,59.0000) -- (6.1000,59.9000) -- cycle(11.1000,58.2000) -- (10.7000,57.5000) -- (8.4000,58.8000) -- (8.2000,58.4000) .. controls (8.0000,58.0000) and (7.9000,57.8000) .. (8.2000,57.3000) -- (9.6000,55.5000) -- (9.1000,54.7000) -- (7.6000,56.8000) .. controls (7.4000,57.1000) and (7.3000,57.3000) .. (7.4000,57.6000) -- (7.4000,57.6000) .. controls (7.0000,57.1000) and (6.3000,56.8000) .. (5.6000,57.2000) .. controls (4.4000,57.9000) and (4.7000,59.0000) .. (5.3000,60.0000) -- (5.9000,61.0000) -- (11.1000,58.2000) -- cycle(7.4000,63.5000) -- (8.0000,64.1000) -- (10.6000,62.0000) .. controls (11.5000,61.3000) and (12.3000,61.1000) .. (13.0000,61.9000) .. controls (13.7000,62.7000) and (13.3000,63.5000) .. (12.4000,64.2000) -- (9.8000,66.3000) -- (10.3000,67.0000) -- (13.0000,64.8000) .. controls (14.3000,63.7000) and (14.4000,62.5000) .. (13.5000,61.4000) .. controls (12.6000,60.3000) and (11.4000,60.2000) .. (10.1000,61.3000) -- (7.4000,63.5000) -- cycle(12.2000,68.7000) .. controls (12.4000,69.1000) and (12.7000,69.5000) .. (13.0000,69.8000) .. controls (14.4000,71.0000) and (16.2000,70.9000) .. (17.3000,69.5000) .. controls (18.5000,68.1000) and (18.4000,66.3000) .. (16.9000,65.1000) .. controls (16.6000,64.9000) and (16.2000,64.5000) .. (15.7000,64.4000) -- (15.3000,65.0000) .. controls (15.6000,65.1000) and (16.1000,65.3000) .. (16.5000,65.6000) .. controls (17.4000,66.4000) and (17.6000,67.8000) .. (16.7000,68.8000) .. controls (15.8000,69.8000) and (14.5000,70.0000) .. (13.5000,69.1000) .. controls (13.2000,68.8000) and (12.9000,68.5000) .. (12.8000,68.1000) -- (12.2000,68.7000) -- cycle(20.0000,70.8000) .. controls (20.1000,70.6000) and (20.1000,70.2000) .. (19.9000,70.1000) .. controls (19.7000,69.9000) and (19.4000,70.0000) .. (19.2000,70.3000) .. controls (19.0000,70.5000) and (19.1000,70.8000) .. (19.3000,71.0000) .. controls (19.5000,71.0000) and (19.9000,71.0000) .. (20.0000,70.8000)(26.6000,74.6000) .. controls (27.4000,73.0000) and (27.0000,71.4000) .. (25.3000,70.6000) .. controls (23.7000,69.8000) and (22.2000,70.5000) .. (21.4000,72.2000) .. controls (20.7000,73.8000) and (21.1000,75.4000) .. (22.7000,76.2000) .. controls (24.4000,76.9000) and (25.9000,76.2000) .. (26.6000,74.6000)(25.8000,74.2000) .. controls (25.3000,75.3000) and (24.2000,76.0000) .. (23.1000,75.5000) .. controls (21.9000,75.0000) and (21.8000,73.7000) .. (22.3000,72.6000) .. controls (22.8000,71.5000) and (23.8000,70.8000) .. (25.0000,71.3000) .. controls (26.3000,71.9000) and (26.3000,73.2000) .. (25.8000,74.2000)(31.2000,78.2000) -- (30.2000,77.9000) .. controls (29.0000,77.6000) and (28.3000,76.6000) .. (28.7000,75.2000) .. controls (29.1000,73.7000) and (30.1000,73.3000) .. (31.5000,73.6000) -- (32.4000,73.8000) -- (31.2000,78.2000) -- cycle(33.4000,73.4000) -- (31.7000,73.0000) .. controls (29.8000,72.5000) and (28.4000,73.2000) .. (27.9000,75.1000) .. controls (27.4000,76.9000) and (28.5000,78.3000) .. (30.2000,78.7000) -- (31.9000,79.2000) -- (33.4000,73.4000) -- cycle(39.9000,74.0000) -- (39.0000,74.0000) -- (38.7000,78.9000) -- (38.7000,78.9000) -- (36.3000,73.9000) -- (35.2000,73.8000) -- (34.9000,79.7000) -- (35.7000,79.7000) -- (36.0000,74.9000) -- (36.0000,74.9000) -- (38.3000,79.8000) -- (39.5000,79.9000) -- (39.9000,74.0000) -- cycle(44.9000,73.6000) -- (41.6000,74.0000) -- (41.7000,74.7000) -- (44.2000,74.4000) -- (44.4000,76.3000) -- (42.2000,76.6000) -- (42.3000,77.3000) -- (44.5000,77.0000) -- (44.7000,78.7000) -- (42.2000,79.0000) -- (42.3000,79.7000) -- (45.6000,79.3000) -- (44.9000,73.6000) -- cycle(48.0000,78.9000) .. controls (48.5000,79.0000) and (48.9000,78.9000) .. (49.3000,78.8000) .. controls (51.0000,78.3000) and (52.0000,76.8000) .. (51.5000,75.0000) .. controls (51.0000,73.2000) and (49.4000,72.4000) .. (47.6000,72.9000) .. controls (47.3000,73.0000) and (46.7000,73.2000) .. (46.4000,73.5000) -- (46.7000,74.3000) .. controls (46.9000,74.0000) and (47.4000,73.8000) .. (47.9000,73.7000) .. controls (49.1000,73.4000) and (50.3000,74.0000) .. (50.7000,75.3000) .. controls (51.1000,76.6000) and (50.5000,77.8000) .. (49.2000,78.2000) .. controls (48.8000,78.3000) and (48.4000,78.3000) .. (47.9000,78.2000) -- (48.0000,78.9000) -- cycle(57.8000,72.2000) .. controls (57.0000,70.6000) and (55.5000,69.9000) .. (53.9000,70.7000) .. controls (52.3000,71.5000) and (51.9000,73.1000) .. (52.7000,74.7000) .. controls (53.5000,76.3000) and (55.0000,77.0000) .. (56.6000,76.2000) .. controls (58.2000,75.4000) and (58.5000,73.7000) .. (57.8000,72.2000)(57.0000,72.6000) .. controls (57.5000,73.7000) and (57.4000,75.0000) .. (56.3000,75.5000) .. controls (55.1000,76.1000) and (54.1000,75.3000) .. (53.5000,74.3000) .. controls (53.0000,73.2000) and (53.0000,72.0000) .. (54.2000,71.4000) .. controls (55.4000,70.8000) and (56.4000,71.5000) .. (57.0000,72.6000)(63.5000,71.0000) -- (62.7000,71.6000) .. controls (61.7000,72.3000) and (60.5000,72.2000) .. (59.7000,71.1000) .. controls (58.8000,69.9000) and (59.1000,68.8000) .. (60.3000,68.0000) -- (61.0000,67.5000) -- (63.5000,71.0000) -- cycle(61.2000,66.2000) -- (59.8000,67.2000) .. controls (58.2000,68.3000) and (57.8000,69.9000) .. (59.0000,71.5000) .. controls (60.1000,73.0000) and (61.8000,73.1000) .. (63.3000,72.0000) -- (64.7000,71.0000) -- (61.2000,66.2000) -- cycle(65.0000,66.2000) .. controls (64.8000,66.0000) and (64.5000,66.0000) .. (64.3000,66.2000) .. controls (64.1000,66.4000) and (64.1000,66.7000) .. (64.3000,66.9000) .. controls (64.5000,67.1000) and (64.8000,67.1000) .. (65.0000,66.9000) .. controls (65.1000,66.7000) and (65.2000,66.4000) .. (65.0000,66.2000)(70.2000,60.6000) .. controls (68.8000,59.5000) and (67.1000,59.5000) .. (66.0000,61.0000) .. controls (64.9000,62.4000) and (65.2000,64.0000) .. (66.7000,65.1000) .. controls (68.1000,66.2000) and (69.8000,66.2000) .. (70.9000,64.7000) .. controls (72.0000,63.3000) and (71.6000,61.7000) .. (70.2000,60.6000)(69.7000,61.3000) .. controls (70.6000,62.0000) and (71.1000,63.2000) .. (70.3000,64.3000) .. controls (69.5000,65.3000) and (68.2000,65.2000) .. (67.3000,64.4000) .. controls (66.4000,63.7000) and (65.8000,62.5000) .. (66.7000,61.4000) .. controls (67.5000,60.3000) and (68.7000,60.6000) .. (69.7000,61.3000)(74.8000,56.8000) -- (74.3000,57.7000) .. controls (73.7000,58.8000) and (72.6000,59.2000) .. (71.3000,58.6000) .. controls (70.0000,57.9000) and (69.7000,56.8000) .. (70.4000,55.6000) -- (70.8000,54.8000) -- (74.8000,56.8000) -- cycle(70.6000,53.7000) -- (69.8000,55.2000) .. controls (68.9000,56.9000) and (69.2000,58.5000) .. (71.0000,59.4000) .. controls (72.6000,60.3000) and (74.2000,59.5000) .. (75.0000,58.0000) -- (75.8000,56.5000) -- (70.6000,53.7000) -- cycle(72.6000,47.5000) -- (72.4000,48.3000) -- (77.1000,49.7000) -- (77.1000,49.7000) -- (71.7000,50.9000) -- (71.4000,51.9000) -- (77.1000,53.6000) -- (77.3000,52.8000) -- (72.7000,51.5000) -- (72.7000,51.5000) -- (78.0000,50.3000) -- (78.3000,49.2000) -- (72.6000,47.5000) -- cycle(73.2000,42.4000) -- (72.8000,45.7000) -- (73.5000,45.8000) -- (73.8000,43.3000) -- (75.7000,43.5000) -- (75.5000,45.7000) -- (76.2000,45.8000) -- (76.4000,43.6000) -- (78.1000,43.8000) -- (78.0000,46.3000) -- (78.7000,46.4000) -- (79.1000,43.1000) -- (73.2000,42.4000) -- cycle(73.2000,39.3000) -- (73.2000,40.1000) -- (79.1000,40.0000) -- (79.1000,39.2000) -- (73.2000,39.3000) -- cycle(78.9000,36.9000) .. controls (79.0000,36.5000) and (79.0000,36.0000) .. (79.0000,35.5000) .. controls (78.8000,33.7000) and (77.4000,32.6000) .. (75.6000,32.8000) .. controls (73.7000,33.1000) and (72.7000,34.5000) .. (73.0000,36.3000) .. controls (73.0000,36.6000) and (73.1000,37.2000) .. (73.4000,37.6000) -- (74.2000,37.4000) .. controls (74.0000,37.1000) and (73.8000,36.6000) .. (73.7000,36.2000) .. controls (73.5000,35.0000) and (74.3000,33.9000) .. (75.7000,33.7000) .. controls (77.0000,33.5000) and (78.1000,34.3000) .. (78.3000,35.6000) .. controls (78.4000,36.0000) and (78.3000,36.5000) .. (78.1000,36.9000) -- (78.9000,36.9000) -- cycle(77.8000,30.3000) .. controls (77.8000,29.9000) and (77.8000,29.4000) .. (77.6000,29.0000) .. controls (77.3000,28.0000) and (76.5000,27.3000) .. (75.5000,27.6000) .. controls (73.7000,28.1000) and (74.8000,30.5000) .. (73.5000,30.8000) .. controls (72.8000,31.0000) and (72.4000,30.4000) .. (72.2000,30.0000) .. controls (72.1000,29.6000) and (72.1000,29.1000) .. (72.1000,28.7000) -- (71.3000,28.8000) .. controls (71.3000,29.2000) and (71.3000,29.6000) .. (71.4000,30.0000) .. controls (71.7000,31.1000) and (72.5000,31.9000) .. (73.7000,31.6000) .. controls (75.6000,31.1000) and (74.6000,28.7000) .. (75.7000,28.4000) .. controls (76.3000,28.2000) and (76.6000,28.7000) .. (76.7000,29.2000) .. controls (76.8000,29.6000) and (76.8000,29.9000) .. (76.8000,30.3000) -- (77.8000,30.3000) -- cycle(72.7000,25.6000) .. controls (72.5000,25.7000) and (72.3000,26.0000) .. (72.4000,26.3000) .. controls (72.5000,26.5000) and (72.8000,26.7000) .. (73.1000,26.6000) .. controls (73.4000,26.5000) and (73.5000,26.2000) .. (73.4000,26.0000) .. controls (73.3000,25.6000) and (73.0000,25.5000) .. (72.7000,25.6000)(66.2000,19.4000) -- (66.7000,20.1000) -- (71.0000,17.3000) -- (71.0000,17.3000) -- (67.7000,21.7000) -- (68.1000,22.4000) -- (73.5000,21.3000) -- (73.5000,21.3000) -- (69.2000,24.1000) -- (69.7000,24.8000) -- (74.7000,21.6000) -- (73.9000,20.4000) -- (68.8000,21.5000) -- (71.9000,17.3000) -- (71.1000,16.1000) -- (66.2000,19.4000) -- cycle(63.2000,16.3000) -- (65.5000,18.7000) -- (66.0000,18.2000) -- (64.3000,16.4000) -- (68.0000,12.8000) -- (67.4000,12.2000) -- (63.2000,16.3000) -- cycle(65.4000,10.3000) -- (64.7000,9.8000) -- (62.6000,12.4000) .. controls (61.9000,13.3000) and (61.1000,13.7000) .. (60.3000,13.0000) .. controls (59.4000,12.3000) and (59.6000,11.5000) .. (60.3000,10.6000) -- (62.5000,8.0000) -- (61.8000,7.5000) -- (59.7000,10.2000) .. controls (58.7000,11.5000) and (58.8000,12.7000) .. (59.9000,13.6000) .. controls (61.1000,14.5000) and (62.3000,14.3000) .. (63.3000,13.0000) -- (65.4000,10.3000) -- cycle(53.3000,9.6000) -- (54.1000,10.0000) -- (56.3000,5.3000) -- (57.9000,6.0000) -- (58.2000,5.3000) -- (54.1000,3.4000) -- (53.8000,4.1000) -- (55.5000,4.9000) -- (53.3000,9.6000) -- cycle(51.1000,1.9000) -- (51.9000,2.1000) -- (52.1000,1.3000) -- (51.3000,1.1000) -- (51.1000,1.9000) -- cycle(49.7000,1.5000) -- (50.5000,1.7000) -- (50.7000,0.9000) -- (50.0000,0.7000) -- (49.7000,1.5000) -- cycle(50.7000,6.2000) -- (48.4000,5.5000) -- (50.4000,3.0000) -- (50.7000,6.2000) -- cycle(46.1000,7.1000) -- (47.0000,7.4000) -- (48.0000,6.1000) -- (50.8000,7.0000) -- (51.0000,8.6000) -- (51.9000,8.9000) -- (51.2000,2.5000) -- (50.3000,2.2000) -- (46.1000,7.1000) -- cycle(43.6000,6.9000) -- (44.4000,7.0000) -- (45.1000,1.9000) -- (46.9000,2.1000) -- (47.0000,1.4000) -- (42.5000,0.8000) -- (42.4000,1.5000) -- (44.2000,1.7000) -- (43.6000,6.9000) -- cycle(40.0000,6.6000) -- (40.8000,6.6000) -- (41.0000,0.7000) -- (40.2000,0.7000) -- (40.0000,6.6000) -- cycle(37.6000,0.9000) .. controls (37.2000,0.8000) and (36.7000,0.8000) .. (36.3000,0.8000) .. controls (35.2000,0.9000) and (34.5000,1.5000) .. (34.6000,2.6000) .. controls (34.8000,4.4000) and (37.3000,3.8000) .. (37.4000,5.2000) .. controls (37.5000,5.9000) and (36.8000,6.2000) .. (36.3000,6.3000) .. controls (35.9000,6.3000) and (35.3000,6.2000) .. (35.1000,6.1000) -- (35.1000,6.9000) .. controls (35.5000,7.0000) and (35.9000,7.1000) .. (36.3000,7.0000) .. controls (37.5000,6.9000) and (38.4000,6.3000) .. (38.3000,5.1000) .. controls (38.1000,3.2000) and (35.6000,3.6000) .. (35.5000,2.5000) .. controls (35.4000,1.9000) and (36.0000,1.7000) .. (36.5000,1.6000) .. controls (36.9000,1.6000) and (37.2000,1.6000) .. (37.6000,1.7000) -- (37.6000,0.9000) -- cycle(29.4000,2.8000) -- (30.2000,2.6000) .. controls (31.0000,2.4000) and (31.4000,2.7000) .. (31.6000,3.2000) .. controls (31.7000,3.8000) and (31.4000,4.2000) .. (30.6000,4.4000) -- (29.9000,4.6000) -- (29.4000,2.8000) -- cycle(29.8000,8.0000) -- (30.6000,7.8000) -- (30.0000,5.3000) -- (30.5000,5.2000) .. controls (31.0000,5.1000) and (31.2000,5.0000) .. (31.6000,5.5000) -- (33.0000,7.3000) -- (33.9000,7.1000) -- (32.3000,5.1000) .. controls (32.0000,4.8000) and (31.9000,4.7000) .. (31.6000,4.7000) -- (31.6000,4.7000) .. controls (32.2000,4.4000) and (32.6000,3.8000) .. (32.5000,3.1000) .. controls (32.2000,1.7000) and (31.0000,1.8000) .. (29.9000,2.1000) -- (28.5000,2.4000) -- (29.8000,8.0000) -- cycle(25.1000,9.9000) -- (28.1000,8.6000) -- (27.8000,7.9000) -- (25.5000,8.9000) -- (24.7000,7.1000) -- (26.8000,6.2000) -- (26.5000,5.5000) -- (24.4000,6.4000) -- (23.7000,4.8000) -- (26.0000,3.8000) -- (25.7000,3.1000) -- (22.7000,4.4000) -- (25.1000,9.9000) -- cycle(20.7000,5.4000) -- (20.0000,5.9000) -- (21.2000,11.3000) -- (21.2000,11.3000) -- (16.9000,7.9000) -- (16.1000,8.4000) -- (21.2000,12.2000) -- (22.1000,11.6000) -- (20.7000,5.4000) -- cycle(17.7000,14.8000) -- (18.4000,14.3000) -- (14.6000,9.7000) -- (13.9000,10.2000) -- (17.7000,14.8000) -- cycle(13.0000,19.6000) -- (13.6000,19.0000) -- (10.0000,15.7000) -- (10.0000,15.7000) -- (15.4000,17.0000) -- (16.1000,16.2000) -- (11.7000,12.2000) -- (11.1000,12.8000) -- (14.6000,16.0000) -- (14.6000,16.0000) -- (9.3000,14.7000) -- (8.5000,15.6000) -- (13.0000,19.6000) -- cycle(6.9000,18.0000) -- (6.5000,18.7000) -- (9.4000,20.4000) .. controls (10.4000,21.0000) and (10.9000,21.7000) .. (10.3000,22.6000) .. controls (9.7000,23.5000) and (8.9000,23.4000) .. (7.9000,22.9000) -- (5.0000,21.2000) -- (4.6000,21.9000) -- (7.6000,23.7000) .. controls (9.0000,24.6000) and (10.2000,24.3000) .. (11.0000,23.0000) .. controls (11.7000,21.7000) and (11.4000,20.6000) .. (10.0000,19.7000) -- (6.9000,18.0000) -- cycle;
	\end{scope}
\end{tikzpicture}}%uulmlogo

\newcommand\pdflogo{%
	\IfFileExists{uulm-logo.pdf}{%
	    \includegraphics[width=.335\paperwidth]{uulm-logo}%
	}{%
		\ClassError{uulm-slides}{Place file uulm-logo.pdf in path to use option pdflogo}%
	}%/fileexists
}

\newcommand\vslogo{%
\begin{tikzpicture}[y=0.80pt, x=0.8pt,yscale=-1, inner sep=0pt, outer sep=0pt]
	\pgftransformscale{3em/30mm}
\begin{scope}[cm={{1.25,0.0,0.0,-1.25,(0.0,177.1675)}}]
      \begin{scope}[shift={(99.2129,113.3867)}]
        \path[fill=uulm-in,nonzero rule] (0.0000,0.0000) -- (-28.3470,0.0000) ..
          controls (-28.3470,-28.3470) and (0.0000,-85.0390) .. (0.0000,-85.0390) --
          (28.3470,-85.0390) .. controls (56.6930,-33.0700) and (-15.0650,-50.8970) ..
          (0.0000,0.0000);
      \end{scope}
      \begin{scope}[shift={(155.9053,113.3867)}]
        \path[fill=uulm-in,nonzero rule] (0.0000,0.0000) -- (-28.3460,0.0000) ..
          controls (-46.8860,-48.1530) and (27.7810,-30.4040) .. (0.0010,-85.0390) --
          (14.1740,-85.0390) -- (14.1740,-70.8660) -- (14.1740,-14.1730) .. controls
          (14.1740,-6.3460) and (7.8280,0.0000) .. (0.0000,0.0000);
      \end{scope}
      \begin{scope}[shift={(28.3467,99.2139)}]
        \path[fill=uulm-in,nonzero rule] (0.0000,0.0000) -- (0.0000,-56.6930) ..
          controls (0.0000,-64.5210) and (6.3460,-70.8660) .. (14.1730,-70.8660) --
          (42.5200,-70.8660) .. controls (42.5200,-70.8660) and (14.1730,-13.9800) ..
          (14.1730,14.1730) .. controls (6.3460,14.1730) and (0.0000,7.8270) ..
          (0.0000,0.0000);
      \end{scope}
      \begin{scope}[shift={(99.4272,113.3867)}]
        \path[fill=white,nonzero rule] (0.0000,0.0000) .. controls (-15.0650,-50.8970)
          and (56.6930,-33.0700) .. (28.3470,-85.0390) -- (56.6930,-85.0390) .. controls
          (84.4740,-30.4040) and (9.8070,-48.1530) .. (28.3470,0.0000) --
          (0.0000,0.0000) -- cycle;
      \end{scope}
          \shade[shading=axis,bottom color=uulm-in!60,top color=uulm-in,shading angle=-30] (85.0390,60.2370) .. controls (92.1260,42.5210) and
            (99.2130,28.3460) .. (99.2130,28.3460) -- (99.2130,28.3460) .. controls
            (99.2130,28.3460) and (109.5400,49.0740) .. (117.7260,71.6970) --
            (117.7260,71.6970) .. controls (108.3930,77.9380) and (98.3750,84.2770) ..
            (97.2280,97.7960) -- (97.2280,97.7960) .. controls (94.6300,85.8490) and
            (89.8380,72.2330) .. (85.0390,60.2370);
      \begin{scope}[shift={(42.5195,113.3867)}]
        \path[fill=white,nonzero rule] (0.0000,0.0000) .. controls (0.0000,-28.1530)
          and (28.3470,-85.0390) .. (28.3470,-85.0390) -- (56.6930,-85.0390) .. controls
          (56.6930,-85.0390) and (28.3470,-28.3470) .. (28.3470,0.0000) --
          (0.0000,0.0000) -- cycle;
      \end{scope}
\end{scope}
\end{tikzpicture}%
}

\newcommand\milogo{%
\hspace*{-0.08cm}%
\begin{tikzpicture}[y=0.8pt,x=0.8pt,yscale=-1, inner sep=0pt, outer sep=0pt]
	\pgftransformscale{0.74}
\begin{scope}[cm={{1.25,0.0,0.0,-1.25,(0.0,56.6925)}}]
      \begin{scope}[shift={(19.8301,45.3511)}]
        \path[fill=uulm,nonzero rule] (0.0000,0.0000) -- (12.9580,-12.9570) --
          (-12.9530,-45.3510) .. controls (-20.6340,-37.6230) and (-22.9180,-28.8530) ..
          (-14.3960,-17.9980) -- (0.0000,0.0000) -- cycle;
      \end{scope}
      \begin{scope}[shift={(45.8057,45.3511)}]
        \path[fill=uulm,nonzero rule] (0.0000,0.0000) -- (12.8960,-12.9570) --
          (-13.0210,-45.3510) -- (-25.9760,-32.3940) -- (0.0000,0.0000) -- cycle;
      \end{scope}
      \begin{scope}[shift={(58.7012,29.1504)}]
        \path[fill=uulm,nonzero rule] (0.0000,0.0000) -- (0.0000,-29.1460) --
          (-12.9550,-16.1930) -- (0.0000,0.0000) -- cycle;
      \end{scope}
      \begin{scope}[shift={(60.6406,45.3511)}]
        \path[fill=uulm-in,nonzero rule] (0.0000,0.0000) -- (0.0000,-45.3470) --
          (13.5330,-28.4290) -- (13.5330,-12.9570) .. controls (13.5880,-4.7310) and
          (9.7180,0.1370) .. (0.0000,0.0000);
      \end{scope}
\end{scope}
\end{tikzpicture}
\hspace*{-0.038cm}
}%milogo
