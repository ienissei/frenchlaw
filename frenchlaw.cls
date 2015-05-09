%%
%%   This is file "frenchlaw.cls", which is part of the "frenchlaw" package
%%   Copyright 2009--2014: Fora VERN -- ienissei (at) gmail (dot) com
%% 
%%   This work may be distributed and/or modified under the conditions of the
%%   LaTeX Project Public License, either version 1.3 of this license or, at your
%%   option, any later version.
%%
%%   The latest version of the license can be found at:
%%      http://www.latex-project.org/lppl.txt
%%   and version 1.3 or later is part of all distributions of LaTeX, 2005/12/01 or later.
%% 
%%   This work has the LPPL maintenance status "author-maintained".
%%   This work consists of the files listed in the README file.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{frenchlaw}%
	[2014/09/30 v.0.9. Versatile document class for French law, based on memoir]

%	#####	CLASS OPTIONS	#####

%	Load <xkeyval>
\RequirePackage{xkeyval}

%	Define new switches for options
\newif\if@stockaiv
	\@stockaivfalse
\newif\if@stockav
	\@stockavfalse
\newif\if@stockavi
	\@stockavifalse
\newif\if@oneside
	\@onesidefalse
\newif\if@tenpoints
	\@tenpointsfalse
\newif\if@twelvepoints
	\@twelvepointsfalse
\newif\if@article
	\@articlefalse
\newif\if@precis
	\@precisfalse
\newif\if@didactic
	\@didacticfalse
\newif\if@marginal
	\@marginalfalse
\newif\if@british
	\@britishfalse
\newif\if@english
	\@englishfalse
\newif\if@french
	\@frenchfalse

%	Define options for paper size <a4paper>, <a5paper> & <a6paper>
\DeclareOptionX{a4paper}{
	\@stockaivtrue
	\@twelvepointstrue\@tenpointsfalse
	\PassOptionsToClass{a4paper,12pt}{memoir}
}
\DeclareOptionX{a5paper}{
	\@stockavtrue
	\@twelvepointstrue\@tenpointsfalse
	\PassOptionsToClass{a5paper,12pt}{memoir}
}
\DeclareOptionX{a6paper}{
	\@stockavitrue
	\@tenpointstrue\@twelvepointsfalse
	\PassOptionsToClass{a6paper,10pt}{memoir}
}

%	Define options for font size <10pt> & <12pt>
\DeclareOptionX{10pt}{
	\@tenpointstrue\@twelvepointsfalse
	\PassOptionsToClass{10pt}{memoir}
}
\DeclareOptionX{12pt}{
	\@twelvepointstrue\@tenpointsfalse
	\PassOptionsToClass{12pt}{memoir}
}

%	Define options for <oneside> & <twoside>
% Options <onecolumn> & <twocolumn> are passed to <memoir> without being redefined
\DeclareOptionX{oneside}{
	\@onesidetrue\@twosidefalse
	\PassOptionsToClass{oneside}{memoir}
}
\DeclareOptionX{twoside}{
	\@twosidetrue\@onesidefalse
	\PassOptionsToClass{twoside}{memoir}
}

%	Define an option to change line spacing
\DeclareOptionX{linespacing}[1.1]{\def\custom@baselinestretch{#1}}

%	Define options for <article>, <marginal> & <precis> document styles
\DeclareOptionX{article}{
	\@articletrue
	\PassOptionsToClass{article}{memoir}
}
\DeclareOptionX{marginal}{
	\@marginaltrue
}
\DeclareOptionX{precis}{
	\@precistrue
}

%	Define options for <didactic>, ... document types
%	TODO » Ajouter les formats de documents juridiques
\DeclareOptionX{didactic}{
	\@didactictrue
	\@articletrue
	\@tenpointstrue
	\PassOptionsToClass{10pt,article,twocolumn,oneside}{memoir}
}

%	Define options to change the main language of the document
%	TODO » english est une option "legacy", mais plus pratique...
\DeclareOptionX{british}{%
	\@britishtrue
	\@englishfalse
	\@frenchfalse
	\PassOptionsToPackage{british}{babel}%	TODO » Remplacer par UKenglish
	\PassOptionsToPackage{british}{fmtcount}%	TODO » Remplacer par UKenglish
	\AtBeginDocument{\main@language{british}}
}
\DeclareOptionX{english}{%
	\@englishtrue
	\@frenchfalse
	\@britishfalse
	\PassOptionsToPackage{english}{babel}%	TODO » Remplacer par USenglish
	\PassOptionsToPackage{english}{fmtcount}%	TODO » Remplacer par USenglish
	\AtBeginDocument{\main@language{english}}
}
\DeclareOptionX{french}{%
	\@frenchtrue
	\@englishfalse
	\@britishfalse
	\PassOptionsToPackage{french}{babel}
	\PassOptionsToPackage{french}{fmtcount}
	\AtBeginDocument{\main@language{french}}
}
%	Define options to load secondary languages
\DeclareOptionX{italian}{\PassOptionsToPackage{italian}{babel}}
\DeclareOptionX{german}{\PassOptionsToPackage{german}{babel}}
\DeclareOptionX{spanish}{\PassOptionsToPackage{spanish}{babel}}

%	Pass all undefined options to <memoir>
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{memoir}}

%	Execute and process options
\ExecuteOptionsX{a4paper,12pt,french,linespacing=1.1}
\ProcessOptionsX\relax

%	Load the main dependencies: <memoir>, <fixltx2e>
\LoadClass{memoir}
\RequirePackage{fixltx2e}

%	Deactivate incompatible options
% Option <twocolumn> always defeats option <marginal>
\if@marginal\if@twocolumn\@marginalfalse\fi\fi

%	Set \baselinestretch to the ratio given in the option
\def\baselinestretch{\custom@baselinestretch}\selectfont

%	#####	PAGE LAYOUT	#####

%	Define the size of the type bloc depending on the paper size
% The bloc proportions follow the golden number, as in the medieval method
\if@stockaiv
	\settypeblocksize{*}{424pt}{1.618}% 43 lines size 12pt, 52 lines size 10pt
\fi
\if@stockav
	\settypeblocksize{*}{300pt}{1.618}% 31 lines size 12pt, 37 lines size 10pt
\fi
\if@stockavi
	\settypeblocksize{*}{212pt}{1.618}% 22 lines size 12pt, 26 lines size 10pt
\fi

%	Define the size and proportion of the margins depending on the layout options
% Margins are significantly smaller than the typographic tradition requires
\setulmargins{*}{*}{1}
\if@marginal
	\if@twoside
		% Asymmetrical margins, 2:1 ratio with <marginal>
		\setlrmargins{*}{*}{2}
	\else
		% Asymmetrical margins, 2:1 ratio with <marginal>, inverted if <oneside>
		\setlrmargins{*}{*}{.5}
	\fi
\else
	\if@twoside
		% Asymmetrical margins, 1.5:1 ratio in normal mode
		\setlrmargins{*}{*}{1.5}
	\else
		% Symmetrical margins, 1:1 ratio in normal mode, with <oneside>
		\setlrmargins{*}{*}{1}
	\fi
\fi

%	Define the size of page headers & footers
\setlength{\headsep}{\baselineskip}
\setlength{\headheight}{2\baselineskip}
\setlength{\footskip}{2\baselineskip}
%	TODO » Utilité du \setheaderspaces. Vérifier la doc de <memoir>
%\setheaderspaces{*}{\baselineskip}{*}

%	Use larger headers & footers with <didactic>
\if@didactic
	% Rééquilibrer les marges & espacements en conséquence
	\setlength{\headheight}{3\baselineskip}
	\setlength{\footskip}{2\baselineskip}
\fi

%	Use smaller footers in <a5> and <a5> if text is set to <12pt>
%	TODO » Vérifier la mise en page en a5 et a6
\if@twelvepoints
	\if@stockav
		\setlength{\footskip}{1.5\baselineskip}
	\fi
	\if@stockavi
		\setlength{\footskip}{1.25\baselineskip}
	\fi
\fi

%	Check & fix the layout
%	TODO » Charger un hook pour les modifier avant \checkandfixthelayout
\checkandfixthelayout

%	#####	TYPOGRAPHY	#####

%	Load the relevant fonts and packages for LaTeX and XeLaTeX
\ifxetex
	%	Load XeLaTeX fonts (Junicode & Latin Modern)
	\RequirePackage{fontspec,xltxtra}
	\RequirePackage{mathpazo}
	\defaultfontfeatures{
		Ligatures = {TeX},
		Numbers = {OldStyle},%	TODO » Rendre les OSF conditionnelles
		SmallCapsFeatures = {WordSpace = 1.2, LetterSpace=3.0}}
	%	TODO » Problème des accents qui apparaissent comme deux caractères sous Junicode
	\setmainfont[	Extension		= .ttf,
					UprightFont		= *,
					ItalicFont		= *-Italic,
					BoldFont		= *-Bold,
					BoldItalicFont	= *-BoldItalic ]
					{Junicode}
	\setsansfont[	Extension		= .otf,
					UprightFont		= *-regular,
					ItalicFont		= *-oblique,
					BoldFont		= *-bold,
					BoldItalicFont	= *-boldoblique,
					Scale			= MatchLowercase ]
					{lmsans10}
	\setmonofont[	Extension		= .otf,
					UprightFont		= *-regular,
					ItalicFont		= *-italic,
					Numbers			= Lining,
					Scale			= MatchLowercase ]
					{lmmono10}
	\RequirePackage{microtype}
\else
	%	Load LaTeX fonts (Libertine & Latin Modern)
	\RequirePackage[utf8]{inputenc}
	\RequirePackage{mathpazo,libertine}
	\RequirePackage[T1]{fontenc}
	\RequirePackage[tracking,letterspace=30]{microtype}
\fi

%	Load language and number packages and fixes
%	TODO » Implémenter {csquotes} et le documenter
\RequirePackage{csquotes}
%	TODO » english est une option "legacy", mais plus pratique...
\RequirePackage[greek,latin,english,british,french]{babel}
\RequirePackage{fmtcount}
\RequirePackage{fixltxhyph}

%	#####	FONT SIZE AND LEADING	#####

%	Create dimensions that will be used to calculate vertical compensation
% This provides vertical alignment to pages, as long as headings are one-liners
\newdimen\addto@miniscule
\newdimen\addto@tiny
\newdimen\addto@large
\newdimen\addto@Large
\newdimen\addto@LARGE
\newdimen\addto@huge
\newdimen\addto@Huge
\newdimen\addto@HUGE

%	Define font sizes and compensations for <10pt>
\if@tenpoints
	% Define font sizes for <10pt>
	\renewcommand*{\scriptsize}{\fontsize{8}{12}\selectfont}
	\renewcommand*{\footnotesize}{\fontsize{8}{12}\selectfont}
	\renewcommand*{\small}{\fontsize{9}{12}\selectfont}
	\renewcommand*{\normalsize}{\fontsize{10}{12}\selectfont}
	
	\renewcommand*{\miniscule}{\fontsize{6}{8}\selectfont}
	\renewcommand*{\tiny}{\fontsize{7}{9}\selectfont}
	
	\renewcommand*{\large}{\fontsize{12}{15}\selectfont}
	\renewcommand*{\Large}{\fontsize{15}{18}\selectfont}
	\renewcommand*{\LARGE}{\fontsize{18}{22}\selectfont}
	\renewcommand*{\huge}{\fontsize{22}{27}\selectfont}
	\renewcommand*{\Huge}{\fontsize{27}{32}\selectfont}
	\renewcommand*{\HUGE}{\fontsize{32}{37}\selectfont}
	
	% Define compensations for <10pt>
	\addto@miniscule=4pt
	\addto@tiny=3pt
	\addto@large=9pt
	\addto@Large=6pt
	\addto@LARGE=2pt
	\addto@huge=9pt
	\addto@Huge=4pt
	\addto@HUGE=11pt
\else
%	Define font sizes and compensations for <12pt>
\if@twelvepoints
	% Define font sizes for <12pt>
	\renewcommand*{\scriptsize}{\fontsize{9}{14.5}\selectfont}
	\renewcommand*{\footnotesize}{\fontsize{10}{14.5}\selectfont}
	\renewcommand*{\small}{\fontsize{11}{14.5}\selectfont}
	\renewcommand*{\normalsize}{\fontsize{12}{14.5}\selectfont}
	
	\renewcommand*{\miniscule}{\fontsize{7}{8.5}\selectfont}
	\renewcommand*{\tiny}{\fontsize{8}{9.5}\selectfont}
	
	\renewcommand*{\large}{\fontsize{14}{18}\selectfont}
	\renewcommand*{\Large}{\fontsize{17}{22}\selectfont}
	\renewcommand*{\LARGE}{\fontsize{20}{25}\selectfont}
	\renewcommand*{\huge}{\fontsize{25}{30}\selectfont}
	\renewcommand*{\Huge}{\fontsize{30}{37}\selectfont}
	\renewcommand*{\HUGE}{\fontsize{36}{45}\selectfont}
	
	% Define compensations for <12pt>
	\addto@miniscule=6pt
	\addto@tiny=7pt
	\addto@large=11pt
	\addto@Large=7pt
	\addto@LARGE=4pt
	\addto@huge=13.5pt
	\addto@Huge=6.5pt
	\addto@HUGE=13pt
\fi\fi

%	#####	TYPESETTING RULES	#####

%	Set penalties and demerits
%	TODO » Pénalités (à tester et modifier, surtout aux formats non-A4)
\if@twocolumn
	\widowpenalties=3 300 100 -150 % Discourage widows [Orig. 150]
	\clubpenalties=3 300 100 -150 % Discourage orphans [Orig. 150]
\else
	\widowpenalties=3 20000 1000 -150 % Discourage widows [Orig. 150]
	\clubpenalties=3 20000 1000 -150 % Discourage orphans [Orig. 150]
\fi
\hyphenpenalty=100 % Discourage hyphens [Orig. 50]
\doublehyphendemerits=1000000 % Discourage consecutive hyphens [Orig. 10000]
\finalhyphendemerits=100000000 % Discourage hyphens at the end of paragraphs [Orig. 5000]
\exhyphenpenalty=500 % Discourage hyphens in compound nouns [Orig. 50]
\brokenpenalty=10000 % Discourage hyphens at the end of pages [Orig. 100]

%\linepenalty=10% Discourage the creation of new lines within paragraphs
%\interlinepenalty=100 % Discourage page breaks within paragraphs
%\interlinepenalties <number> <numbers 1...n>

%\pretolerance=100% Set acceptable \badness for a line without hyphens
%\tolerance=200% Set acceptable \badness for a line with hyphens

%\adjdemerits=10000% Discourage consecutive lines over \badness level

%\floatingpenalty = 300% Discourage page breaks within floats
%\interfootnotelinepenalty=100 % Discourage page breaks in footnotes

%\@beginparpenalty=-50% Penalty for page breaks before lists
%\@endparpenalty=-50% Penalty for page breaks after lists
%\@itempenalty=-50% Penalty for page breaks after items in lists

%	Style paragraphs
% Force vertical alignment
\setlength{\parskip}{0pt}
% Set indentation length
\setlength{\parindent}{1.5em}
% Prevent overly short or long lines at the end of paragraphs
\setlength{\parfillskip}{2ex plus \dimexpr\linewidth-2\parindent}
% Never use double spaces, even in English
\frenchspacing

%	Style footnotes
% Set footnote mark to hang on the left
\setlength{\footmarkwidth}{2em}
\setlength{\footmarksep}{0em}
% Set footnote marks on the baseline (instead of superscript)
\footmarkstyle{#1.\kern.5em}
% Set a shorter \parindent in footnotes
\setlength{\footparindent}{1em}
% Set footnotes at the bottom of the page
\setfootnoterule[\vfill]{0pt}{0pt}{0pt}
% Force vertical alignment with a \strut height (.7\baselineskip) for all footnotes
\setlength{\footnotesep}{.7\baselineskip}

%	Create the \symbolfootnote macro (e.g. thanks)
% The symbol can be chosen via the regular optional argument
% A \par at the end of the note will create an additional line before the next footnote
\newcommand{\symbolfootnote}[2][2]{%
	\begingroup%
	\renewcommand{\thefootnote}{\fnsymbol{footnote}}%
	\footnotetext[#1]{#2}%
	\endgroup%
}

%	Create a counter that resets the footnote counter on each page
% By default, the counter is reset with every new chapter
\newcommand{\resetfootnotes}{
	\usepackage{perpage}
	\MakePerPage{footnote}}

%	Style margin notes (\marginpar)
% Use a ragged-right, smaller sized text
% Make sure the first and last line of the note are \strut height for vertical alignment
\let\old@marginpar=\marginpar
\renewcommand{\marginpar}[1]{%
	\old@marginpar[\raggedleft\footnotesize\strut#1\strut]{\raggedright\footnotesize\strut#1\strut}}
%	Set the width based on the actual margin width
\newlength{\marginwidth}
\setlength{\marginwidth}{\dimexpr\stockwidth-\textwidth\relax}
\if@marginal
	\setmarginnotes{.07\marginwidth}{.45\marginwidth}{0pt}
\else\if@twoside
	\setmarginnotes{.07\marginwidth}{.40\marginwidth}{0pt}
\else
	\setmarginnotes{.05\marginwidth}{.35\marginwidth}{0pt}
\fi\fi

%	Define a style for side paragraphs (\sidebar)
\setsidebars{\marginparsep}{\marginparwidth}{\baselineskip}{0pt}{\footnotesize}{\textheight}

%	Margin and side notes are set in the widest margin with option <marginal>
\if@marginal\if@twoside
	\marginparmargin{outer}
	\sidebarmargin{outer}
\else
	\marginparmargin{left}
	\sidebarmargin{left}
\fi\fi

%	Create a command that forces the same line-spacing in notes as in the main block
% This allows for better vertical alignment, but is not part of standard styles
\newcommand{\notespacing}{\edef\m@m@footnote@spacing{\custom@baselinestretch}}

%	TODO » Ajouter ici les paramètres des listes et floats

%	#####	TITLE PAGES	#####

%	Define new meta-data macros
% The \title and \subtitle fields can be given in several languages, e.g. for abstracts
\renewcommand{\title}[2][\languagename]{\expandafter\gdef\csname @title@#1\endcsname{#2}}
	\expandafter\gdef\csname @title@\languagename\endcsname{\@empty}
\newcommand{\subtitle}[2][\languagename]{\expandafter\gdef\csname @subtitle@#1\endcsname{#2}}
	\expandafter\gdef\csname @subtitle@\languagename\endcsname{\@empty}
\newcommand{\institution}[1]{\gdef\@institution{#1}}
	\newcommand{\@institution}{\@empty}
\newcommand{\school}[1]{\gdef\@school{#1}}
	\newcommand{\@school}{\@empty}
\newcommand{\subject}[1]{\gdef\@subject{#1}}
	\newcommand{\@subject}{\@empty}
\newcommand{\director}[1]{\gdef\@director{\bgroup\def\and{\par}#1\egroup}}
	\newcommand{\@director}{\@empty}
\newcommand{\jury}[1]{\gdef\@jury{\bgroup\def\and{\par}#1\egroup}}
	\newcommand{\@jury}{\@empty}
\newcommand{\publisher}[1]{\gdef\@publisher{#1}}
	\newcommand{\@publisher}{\@empty}
\newcommand{\series}[1]{\gdef\@series{#1}}
	\newcommand{\@series}{\@empty}
\newcommand{\address}[1]{\gdef\@address{#1}}
	\newcommand{\@address}{\@empty}
\newcommand{\phone}[1]{\gdef\@phone{#1}}
	\newcommand{\@phone}{\@empty}
%	TODO » Nécessaire? utilisé pour les mémoires (prendre \series pour <didactic>)
% Non documenté
\newcommand{\type}[1]{\gdef\@type{#1}}
	\newcommand{\@type}{\@empty}
%	TODO » Sécuriser les emails si * et éviter qu'ils débordent du cadre (?)
\newcommand{\email}[1]{\gdef\@email{#1}}
	\newcommand{\@email}{\@empty}
%	TODO » Ajouter \website et \linkedin (2 args, nom + url ?)

%	TODO » Automatiser une macro pour les noms (\textsc) et la documenter

%	End documentation

%	Redéfinir la commande \and, qui crée par défaut un tableau
\def\and{\unskip\enskip\emph{\&}\enskip\ignorespaces}

%	Créer une commande pour changer le style
\newcommand{\titlepagestyle}[1]{\def\maketitle{\csname maketitle#1\endcsname}}

%	TODO » Corriger toutes les tailles des polices (si 10 pt et si 12 pt)
%	TODO » Revoir le \@restonecoltrue (switch plus propre?)

%	Définir un style générique pour les articles, mémos, etc.
\newcommand{\maketitleArticle}{%
	\bgroup%
	\if@twocolumn\@restonecoltrue\onecolumn
	\else\@restonecolfalse
	\fi
	% Redéfinir les hauteurs de lignes pour éviter les problèmes d'alignement
	\renewcommand*{\Large}{\fontsize{17}{29}\selectfont}
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	\clearpage
	\noindent{\Large\scshape\raggedright\csname @title@\languagename\endcsname\if\@empty\csname @subtitle@\languagename\endcsname\relax\else :\par\noindent\csname @subtitle@\languagename\endcsname\fi}\par%
	\noindent{\@author%
		\if\@empty\@institution\relax\else~(\emph{\@institution%
		\if\@empty\@school\relax\else, \@school\fi})\fi%
		~---\space\@date\par}%
	\vspace{2\baselineskip}%
	\if@restonecol\twocolumn\fi\egroup%
}

\newcommand{\maketitleSyllabus}{%
	\bgroup%
	\if@twocolumn\@restonecoltrue\onecolumn
	\else\@restonecolfalse
	\fi
	% Redéfinir les hauteurs de lignes pour éviter les problèmes d'alignement
	\renewcommand*{\Large}{\fontsize{17}{29}\selectfont}
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	\clearpage
	\vspace*{3\baselineskip}
	\noindent{\Large\scshape\raggedright\csname @title@\languagename\endcsname}\par
	\noindent{\large\scshape\raggedright\csname @subtitle@\languagename\endcsname}\par
	\noindent{\@author%
		\if\@empty\@institution\relax\else~(\emph{\@institution%
		\if\@empty\@school\relax\else, \@school\fi})\fi}\par
	\noindent{Contact: \@email}\par
	\if@restonecol\twocolumn\fi\egroup%
}

\newcommand{\maketitleBook}{%
	\frontmatter
	\thispagestyle{empty}
	\bgroup
	\if@twocolumn\@restonecoltrue\onecolumn
	\else\@restonecolfalse
	\fi%
	\centering%
	% Redéfinir les hauteurs de lignes pour éviter les problèmes d'alignement
	\renewcommand*{\large}{\fontsize{14}{14.5}\selectfont}
	\renewcommand*{\Large}{\fontsize{17}{29}\selectfont}
	\renewcommand*{\LARGE}{\fontsize{20}{29}\selectfont}
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	\vspace*{0pt}
	{\large\scshape\@institution\par}% Add series?
	\vspace*{8\baselineskip}
	{\LARGE\scshape\csname @title@\languagename\endcsname\par}
	{\Large\scshape\csname @subtitle@\languagename\endcsname\par}
	\vspace{3\baselineskip}
	{\Large\@author\par}
	\vspace{24\baselineskip}
	{\large\@publisher\par}
	\if@restonecol\twocolumn\fi\egroup%
	\cleardoublepage
}

%	Définir le style d'une page de titre pour un mémoire de recherche
\newcommand{\maketitleMemoir}{%
	\frontmatter*% Pagination en chiffres arabes
	\thispagestyle{empty}
	\bgroup
	\if@twocolumn\@restonecoltrue\onecolumn
	\else\@restonecolfalse
	\fi%
	\centering%
	% Redéfinir les hauteurs de lignes pour éviter les problèmes d'alignement
	\renewcommand*{\large}{\fontsize{14}{14.5}\selectfont}
	\renewcommand*{\Large}{\fontsize{17}{29}\selectfont}
	\renewcommand*{\LARGE}{\fontsize{20}{29}\selectfont}
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	\if\@empty\@institution\relax
		\@latex@warning@no@line{No \noexpand\institution given}\fi
	\if\@empty\@school\relax
		\@latex@warning@no@line{No \noexpand\school given}\fi
	\if\@empty\@director\relax
		\@latex@warning@no@line{No \noexpand\director given}\fi
	\vspace*{0pt}
	{\large\scshape\@institution\par}
	\vspace{\baselineskip}
	{\large\@school\par}
	\vspace{8\baselineskip}
	{\LARGE\csname @title@\languagename\endcsname\par}
	{\Large\csname @subtitle@\languagename\endcsname\par}
	\vspace{3\baselineskip}
	{\Large\@author\par}
	\vspace{8\baselineskip}
	{\Large\@type\par}
	\vspace{3\baselineskip}
	{Sous la direction de:\par}
	\vspace{\baselineskip}
	{\large\@director\par}
	\vspace{6\baselineskip}
	{\large\@date\par}
	\if@restonecol\twocolumn\fi\egroup%
	\cleardoublepage
	\let\mainmatter=\@smemmain% Pagination continue via \mainmatter* (redéfinition)
}

%	Définir le style d'une page de titre pour une thèse de doctorat
\newcommand{\maketitlePhD}{%
	\frontmatter*% Pagination en chiffres arabes
	\thispagestyle{empty}
	\bgroup
	\if@twocolumn\@restonecoltrue\onecolumn
	\else\@restonecolfalse
	\fi%
	\centering%
	% Redéfinir les hauteurs de lignes pour éviter les problèmes d'alignement
	\renewcommand*{\large}{\fontsize{14}{14.5}\selectfont}
	\renewcommand*{\Large}{\fontsize{17}{29}\selectfont}
	\renewcommand*{\LARGE}{\fontsize{20}{29}\selectfont}
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	\if\@empty\@institution\relax
		\@latex@warning@no@line{No \noexpand\institution given}\fi
	\if\@empty\@school\relax
		\@latex@warning@no@line{No \noexpand\school given}\fi
	\if\@empty\subject\relax
		\@latex@warning@no@line{No \noexpand\subject given}\fi
	\if\@empty\@director\relax
		\@latex@warning@no@line{No \noexpand\director given}\fi
	\if\@empty\@jury\relax
		\@latex@warning@no@line{No \noexpand\jury given}\fi
	\vspace*{0pt}
	{\Large\scshape\@institution\par}
	\vspace{\baselineskip}
	{\large\@school\par}
	\vspace{6\baselineskip}
	{\LARGE\csname @title@\languagename\endcsname\par}
	{\Large\csname @subtitle@\languagename\endcsname\par}
	\vspace{6\baselineskip}
	{\large Thèse pour le doctorat en \@subject\par}
	\vspace{\baselineskip}
	{\large présentée et soutenue publiquement le \@date\space par}\par
	{\Large\@author\par}
	\vspace{6\baselineskip}
	{Sous la direction de:\par}
	\vspace{\baselineskip}
	{\large\@director\par}
	\vspace{\baselineskip}
	{Membres du jury:\par}
	\vspace{\baselineskip}
	{\large\@jury\par}
	\if@restonecol\twocolumn\fi\egroup\cleardoublepage
	\let\mainmatter=\@smemmain% Pagination continue via \mainmatter* (redéfinition)
}

%	Définir un style pour les CV
\newcommand{\maketitleCV}{%
	\pagestyle{letterhead}
	\thispagestyle{empty}
	\setlength{\parindent}{0em}
	%	TODO » Déplacer dans le style <letterhead> + charger automatiquement en option
	\def\rightmark{\MakeLowercase{\scshape\@author~-- \csname @title@\languagename\endcsname}}
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	\bgroup
	\if@twocolumn\@restonecoltrue\onecolumn
	\else\@restonecolfalse
	\fi%
	% Redéfinir les hauteurs de lignes pour éviter les problèmes d'alignement
	\renewcommand*{\large}{\fontsize{14}{14.5}\selectfont}
	{\large\raggedright\@author}\par%
	\vspace{\baselineskip}%
	\begin{flushleft}
		\@address
	\end{flushleft}
	\vspace{-2\baselineskip}
	\begin{flushright}
		\setlength{\fboxrule}{0pt}
		\@phone\par\@email%\href{\@email}{\@email}
	\end{flushright}
	\par
	\vspace{\baselineskip}
	\if@restonecol\twocolumn\fi\egroup%
}

%	Sélectionner la page de titre par défaut selon les options du document
\if@article\titlepagestyle{Article}\else\titlepagestyle{Book}\fi

%	#####	ENTÊTES ET PIEDS DE PAGES	#####

%	Définir le style des <book> et <part>
\aliaspagestyle{book}{empty}
\aliaspagestyle{part}{empty}

%	Définir le style des <heading> et <subheading> et <chapter>
\aliaspagestyle{chapter}{plain}

%	Redéfinir le style <plain> pour tenir compte du mode <twoside>
\makepagestyle{plain}
	\makeevenfoot{plain}{\if@twoside\thepage\fi}{\if@oneside\thepage\fi}{}
	\makeoddfoot{plain}{}{\if@oneside\thepage\fi}{\if@twoside\thepage\fi}

%	TODO » Tester en mode article (afficher la section s'il y en a une)
%	TODO » Corriger pour \chapter* et \section* (définir \rightmark) -- difficile, on peut les laisser dans le \fontmatter ou \backmatter (à documenter)
%	Définir le format des pages pour les documents normaux
\makepagestyle{frenchlaw}
	\makepsmarks{frenchlaw}{%
		\nouppercaseheads
		\createmark{chapter}{right}{nonumber}{}{}
		\clearmark{section}
		\createplainmark{toc}{right}{\contentsname}
		\createplainmark{lof}{right}{\listfigurename}
		\createplainmark{lot}{right}{\listtablename}
		\createplainmark{bib}{right}{\bibname}
		\createplainmark{index}{right}{\indexname}
		\createplainmark{glossary}{right}{\glossaryname}
	}
	\makeevenhead{frenchlaw}{}{\scshape\csname @title@\languagename\endcsname}{}
	\makeoddhead{frenchlaw}{}{\itshape\rightmark}{}
	\makeevenfoot{frenchlaw}{\if@twoside\thepage\fi}{\if@oneside\thepage\fi}{}
	\makeoddfoot{frenchlaw}{}{\if@oneside\thepage\fi}{\if@twoside\thepage\fi}
\pagestyle{frenchlaw}

%	Définir le format des pages pour les lettres, CV, etc.
\makepagestyle{letterhead}
	\makeevenhead{letterhead}{}{}{}
	\makeoddhead{letterhead}{}{}{}
	\makeevenfoot{letterhead}{\rightmark}{}{\strut{\ifnum\value{lastpage}>1\relax\thepage\thinspace/\pageref{lastpage}\fi}}
	\makeoddfoot{letterhead}{\rightmark}{}{\strut{\ifnum\value{lastpage}>1\relax\thepage\thinspace/\pageref{lastpage}\fi}}
	\AtEndDocument{\label{lastpage}}

%	TODO » A revoir et à documenter + Créer les styles des autres formats

%	Créer des en-têtes et pieds de page vides (utilisés en fin de classe)
% Utiliser \leftmark et \rightmark en les redéfinissant (?)
\def\leftheader{}
\def\rightheader{}
%	Définir le style des pages en mode <didactic>
\makepagestyle{didactichead}
	\makeheadrule{didactichead}{\textwidth}{.2ex}
	\makeevenhead{didactichead}
		{\leftheader\vspace*{0pt}}
		{}
		{\rightheader\vspace*{0pt}}
	\makeoddhead{didactichead}
		{\leftheader\vspace*{0pt}}
		{}
		{\rightheader\vspace*{0pt}}
	\makeevenfoot{didactichead}{}{\thepage}{}
	\makeoddfoot{didactichead}{}{\thepage}{}
\if@didactic
	\pagestyle{didactichead}
	\aliaspagestyle{chapter}{didactichead}
\fi

%	Créer un style de header pour les documents génériques
\makepagestyle{generic}
	\makeevenhead{generic}{\itshape\@series}{}{}
	\makeoddhead{generic}{\itshape\@series}{}{}
	\makeevenfoot{generic}{\if@twoside\thepage\fi}{\if@oneside\thepage\fi}{}
	\makeoddfoot{generic}{}{\if@oneside\thepage\fi}{\if@twoside\thepage\fi}

%	#####	STYLE ET ALIGNEMENT VERTICAL DES DIVISIONS LOGIQUES	#####

%	Définir la subdivision maximale pour la numérotation
\if@article
	\maxsecnumdepth{paragraph}
	\maxtocdepth{paragraph}
\else
	\maxsecnumdepth{subparagraph}
	\maxtocdepth{subparagraph}
\fi

%	Créer de nouvelles divisions logiques: <heading> et <subheading>
\newlistentry[part]{heading}{toc}{0}
\newlistentry[heading]{subheading}{toc}{0}

%	TODO » Vérifier la pertinence de toutes les lignes
%	Réinitialiser les compteurs 
\counterwithin*{part}{book}
\counterwithin*{heading}{book}
\counterwithin*{chapter}{book}
\counterwithin*{chapter}{part}
\counterwithin*{chapter}{heading}
\counterwithin*{chapter}{subheading}
\counterwithin*{section}{chapter}
\counterwithin*{subsection}{section}

%	Définir l'espacement des différentes divisions dans la table des matières
\renewcommand*{\cftdotsep}{2}
\cftsetindents{book}{0em}{2em}
\cftsetindents{part}{0em}{2em}
\cftsetindents{heading}{0em}{2em}
\cftsetindents{subheading}{0em}{2em}
\cftsetindents{chapter}{0em}{2em}
\cftsetindents{section}{1.5em}{2em}
\cftsetindents{subsection}{3em}{1.5em}
\cftsetindents{subsubsection}{4.5em}{1.5em}
\cftsetindents{paragraph}{6em}{1.5em}
\cftsetindents{subparagraph}{7.5em}{1.5em}

%	Définir le style des livres dans le texte
\renewcommand*{\booktitlefont}{\LARGE\scshape}
\renewcommand*{\booknamefont}{\booktitlefont}
\renewcommand*{\booknumfont}{\booktitlefont}
\renewcommand*{\printbooknum}{%
	\booknumfont%
	\if@french
		\ifnum\value{book}=1	\ordinalstring{book}[m]%
		\else					\Roman{book}\fi
	\else						\Roman{book}%
	\fi}
\renewcommand{\beforebookskip}{\null\vspace{\baselinestretch\addto@LARGE}%
	\vspace{\if@tenpoints12\baselineskip\fi\if@twelvepoints10\baselineskip\fi}}
\renewcommand{\midbookskip}{\par\vspace{\baselinestretch\addto@LARGE}}

%	Définir le style des livres dans la table des matières
\renewcommand*{\cftbookpresnum}{\space}
\renewcommand*{\cftbookaftersnum}{.}
\renewcommand*{\cftbookaftersnumb}{\space}
\renewcommand*{\cftbookfont}{\large\bfseries\scshape}
\renewcommand*{\cftbookpagefont}{\normalsize}
\newcommand*{\cftafterbooktitle}{}
\setlength{\cftbeforebookskip}{2\baselineskip}
	
%	Définir le style des parties dans le texte
% Babel French gère la numérotation en toutes lettres des parties
\renewcommand*{\thepart}{\Roman{part}}
\renewcommand{\parttitlefont}{\Large}
\renewcommand{\partnamefont}{\parttitlefont}
\renewcommand{\partnumfont}{\parttitlefont}
\renewcommand{\beforepartskip}{\null\vspace{\baselinestretch\addto@Large}%
	\vspace{\if@tenpoints12\baselineskip\fi\if@twelvepoints10\baselineskip\fi}}
\renewcommand{\midpartskip}{\par\vspace{\baselinestretch\addto@Large}}

%	Définir le style des parties dans la table des matières
\renewcommand*{\cftpartpresnum}{\space}
\renewcommand*{\cftpartaftersnum}{.}
\renewcommand*{\cftpartaftersnumb}{\space}
\renewcommand*{\cftpartfont}{\large\bfseries}
\renewcommand*{\cftpartpagefont}{\normalsize}
\newcommand*{\cftafterparttitle}{}
\setlength{\cftbeforepartskip}{\baselineskip}

%	Définir le style des titres dans le texte
\renewcommand{\theheading}{\Roman{heading}}
\newcommand{\headtitlefont}{\Large\scshape\centering}
\newcommand{\headnamefont}{\headtitlefont}
\newcommand{\headnumfont}{\headtitlefont}
\newcommand{\afterheadingnum}{\par\nobreak\vskip\midchapskip}
\newcommand{\printheadingname}{\headnamefont\headingname}
\newcommand{\headingnamenum}{\space}
\newcommand{\printheadingnum}{\headnumfont\if@french\ordinalstring{heading}[m]\else\theheading\fi}
\newcommand{\printheadingtitle}[1]{\headtitlefont#1}

%	Définir le style des titres dans la table des matières
\renewcommand{\cftheadingfont}{\large\scshape}
\renewcommand{\cftheadingpresnum}{\space}
\renewcommand{\cftheadingaftersnum}{.}
\renewcommand{\cftheadingaftersnumb}{\space}
\renewcommand{\cftheadingleader}{\hfill}
\setlength{\cftbeforeheadingskip}{\baselineskip}

%	Créer la commande pour les titres (semblables à des chapitres)
\newcommand{\heading}[1]{
	\begingroup
		\if@article\cleardoublepage\fi
		\stepcounter{heading}
		\renewcommand{\printchaptertitle}{%
			\printheadingname%
			\headingnamenum\printheadingnum%
			\afterheadingnum%
			\printheadingtitle%
		}
		\chapter*{#1}
		\addcontentsline{toc}{heading}{\protect\numberline{\theheading}#1}
	\endgroup
}

%	Définir le style des sous-titres dans le texte
\renewcommand{\thesubheading}{\Roman{subheading}}
\newcommand{\subheadtitlefont}{\Large\centering}
\newcommand{\subheadnamefont}{\subheadtitlefont}
\newcommand{\subheadnumfont}{\subheadtitlefont}
\newcommand{\aftersubheadingnum}{\par\nobreak\vskip\midchapskip}
\newcommand{\printsubheadingname}{\subheadnamefont\subheadingname}
\newcommand{\subheadingnamenum}{\space}
\newcommand{\printsubheadingnum}{\subheadnumfont\if@french\ordinalstring{subheading}[m]\else\thesubheading\fi}
\newcommand{\printsubheadingtitle}[1]{\subheadtitlefont#1}

%	Définir le style des sous-titres dans la table des matières
\renewcommand{\cftsubheadingfont}{\large}
\renewcommand{\cftsubheadingpresnum}{\space}
\renewcommand{\cftsubheadingaftersnum}{.}
\renewcommand{\cftsubheadingaftersnumb}{\space}
\renewcommand{\cftsubheadingleader}{\hfill}
\setlength{\cftbeforesubheadingskip}{\baselineskip}

%	Créer la commande des sous-titres (semblables à des chapitres)
\newcommand{\subheading}[1]{
	\begingroup
		\if@article\cleardoublepage\fi
		\stepcounter{subheading}
		\renewcommand{\printchaptertitle}{%
			\printsubheadingname%
			\subheadingnamenum\printsubheadingnum%
			\aftersubheadingnum%
			\printsubheadingtitle%
		}
		\chapter*{#1}
		\addcontentsline{toc}{subheading}{\protect\numberline{\thesubheading}#1}
	\endgroup
}

%	Définir le style des chapitres dans le texte
% Créer un style, pour pouvoir l'appliquer au mode <article>
\makechapterstyle{frenchlaw}{
\renewcommand{\thechapter}{\Roman{chapter}}
\renewcommand{\chaptitlefont}{\Large\scshape\raggedright}
\renewcommand{\chapnamefont}{\chaptitlefont}
\renewcommand{\chapnumfont}{\chaptitlefont}
\renewcommand{\chapternamenum}{\space}
\renewcommand{\printchapternum}{%
	\chapnumfont%
	\if@french%
		\ifnum\value{chapter}=1		\ordinalstring{chapter}[m]%
		\else						\Roman{chapter}\fi
	\else							\Roman{chapter}%
	\fi}
\renewcommand{\afterchapternum}{~:\par\nobreak\vskip\midchapskip}
\setlength{\beforechapskip}{\baselinestretch\addto@Large}
\addtolength{\beforechapskip}{\baselineskip}
\setlength{\midchapskip}{\baselinestretch\addto@Large}
\setlength{\afterchapskip}{2\baselineskip}}
% Appliquer le style de chapitre généralement (mode normal et mode <article>)
\chapterstyle{frenchlaw}

%	Définir le style des chapitres dans la table des matières
\renewcommand*{\cftchapterpresnum}{\space}
\renewcommand*{\cftchapteraftersnum}{~:}
\renewcommand*{\cftchapteraftersnumb}{\space}
\renewcommand*{\cftchapterpagefont}{\normalsize}
\setlength{\cftbeforechapterskip}{\baselineskip}

%	Définir le mode de numérotation des sections et paragraphes
\if@article
	% En mode article, utiliser une numérotation courte (I.A.1.a)
	\renewcommand{\thesection}{\Roman{section}}
	\renewcommand{\thesubsection}{\Alph{subsection}}
	\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
	\renewcommand{\theparagraph}{\alph{paragraph}}
\else
	% En mode normal, utiliser les intitulés classiques
	\renewcommand{\thesection}{\Roman{section}}
	\renewcommand{\thesubsection}{\arabic{subsection}}
	\renewcommand{\thesubsubsection}{\Alph{subsubsection}}
	\renewcommand{\theparagraph}{\arabic{paragraph}}
	\renewcommand{\thesubparagraph}{\alph{subparagraph}}
\fi

%	Définir la ponctuation après chaque numéro de section et paragraphe
% S'il est défini dans babel, on rajoute le nom donné à la section concernée
% En anglais, les paragraphes suivant les sections ne sont pas indentés
\setsecnumformat{%
	\ifcsname #1name\endcsname\csname #1name\endcsname\fi%
	\space\csname the#1\endcsname.\enskip}

%	Définir le style des sections
\setsecheadstyle{\large\scshape\raggedright}	
\setlength{\beforesecskip}{\baselinestretch\addto@large}
\setlength{\aftersecskip}{\baselineskip}
\if@twocolumn
	% En mode <twocolumn>, ne pas rajouter un second saut de ligne
	\addtolength{\beforesecskip}{0pt}
\else
	% En mode <onecolumn>, sauter une deuxième ligne avant la section
	\addtolength{\beforesecskip}{\baselineskip}
\fi

%	Définit le style des sous-sections
\setsubsecheadstyle{\scshape\raggedright}
\setlength{\beforesubsecskip}{\baselineskip}
\setlength{\aftersubsecskip}{\baselineskip}

%	Définir le style des sous-sous-sections
\setsubsubsecheadstyle{\itshape\raggedright}
\setlength{\beforesubsubsecskip}{\baselineskip}
\setlength{\aftersubsubsecskip}{\baselineskip}

%	Définir le style des sections et sous-sections dans la table des matières
\renewcommand*{\cftsectionaftersnum}{.}
\setlength{\cftbeforesectionskip}{0pt}
\renewcommand*{\cftsubsectionaftersnum}{.}
\setlength{\cftbeforesubsectionskip}{0pt}
\renewcommand*{\cftsubsubsectionaftersnum}{.}
\setlength{\cftbeforesubsubsectionskip}{0pt}

%	Définir le style des paragraphes
\setparaheadstyle{\scshape\raggedright}
\setparaindent{0em}
\setlength{\beforeparaskip}{\baselineskip}
\setlength{\afterparaskip}{\baselineskip}

%	Définir le style des sous-paragraphes
\setsubparaheadstyle{\itshape\raggedright}
\setsubparaindent{0em}
\setlength{\beforesubparaskip}{\baselineskip}
\setlength{\aftersubparaskip}{\baselineskip}

\if@twocolumn
	% En mode <twocolumn>, ils sont insérés dans le corps du texte (inline)
	\setparaheadstyle{\scshape\raggedright\addperiod}
	\setlength{\afterparaskip}{-1em}
	\setsubparaheadstyle{\itshape\raggedright\addperiod}
	\setlength{\aftersubparaskip}{-1em}
\else\if@marginal
	% En mode <marginal>, ils sont placés dans une note marginale
	\newcommand{\marginparahead}[1]{\marginpar{\normalsize\scshape#1}}
	\setparaheadstyle{\marginparahead}
	\setlength{\afterparaskip}{-1em}
	
	% Définir les titres de sous-paragraphes (dans la marge)
	\newcommand{\marginsubparahead}[1]{\marginpar{\normalsize\itshape#1}}
	\setsubparaheadstyle{\marginsubparahead}
	\setlength{\aftersubparaskip}{-1em}
\fi\fi

%	Définir lz stylz des paragraphes et sous-paragraphes dans la table des matières
\renewcommand*{\cftparagraphaftersnum}{.}
\setlength{\cftbeforeparagraphskip}{0pt}
\renewcommand*{\cftsubparagraphaftersnum}{.}
\setlength{\cftbeforesubparagraphskip}{0pt}

%	#####	COMMANDES SPÉCIFIQUES AU DROIT	#####

%	Créer un compteur pour les paragraphes (juridiques)
\newcounter{paragraphic}\setcounter{paragraphic}{0}

%	Créer les commandes pour paramétrer l'apparence du compteur de paragrpahes
\renewcommand{\theparagraphic}{\arabic{paragraphic}}
\newcommand{\afterparagraphicnum}{.}
\newcommand{\afterparagraphictitle}{.}
\newcommand{\afterparagraphic}{\enskip}
\newcommand{\paragraphicnumfont}{\bfseries}
\newcommand{\paragraphictitlefont}{\scshape}

%	TODO » Vérifier le compteur <precisno> et ajouter les <heading> et <subheading>
%	Créer un compteur <precisno> pour afficher les paragraphes dans la table des matières
\newcounter{precisno}\setcounter{precisno}{0}
\counterwithin{precisno}{book}% Utilité?
\counterwithin{precisno}{part}
\counterwithin{precisno}{chapter}
\counterwithin{precisno}{section}
\counterwithin{precisno}{subsection}
\counterwithin{precisno}{subsubsection}
\counterwithin{precisno}{paragraph}

%	Créer des commandes pour paramétrer l'apparence dans la table des matières
\newlength{\cftprecisskip}
\setlength{\cftprecisskip}{.25\linewidth}
\newcommand{\cftprecisstyle}{\normalsize}
\newcommand{\cftprecissep}{---~}% Ou, e.g. \par\noindent
\newcommand{\cftprecisnumfont}{}
\newcommand{\cftprecistitlefont}{\itshape}
\newcommand{\cftafterprecisnum}{}
\newcommand{\cftbeforeprecistitle}{.~}
\newcommand{\cftafterprecis}{, p.~\thepage.}

%	Créer une commande \para pour faire des paragraphes numérotés
\newcommand{\para}[1][\@empty]{%
	\refstepcounter{paragraphic}%
	{\paragraphicnumfont\theparagraphic\afterparagraphicnum}%
	{\paragraphictitlefont%
	\if@precis\ifx#1\@empty%
		\else\if@marginal\marginpar{\normalsize\scshape#1}%
		\else~#1\afterparagraphictitle\fi\fi\fi}%
	\afterparagraphic%
	\ifx#1\@empty\label{para:\arabic{paragraphic}}\else\label{para:#1}\fi%
	\if@precis%
		\addtocontents{toc}{%
			\setlength{\leftskip}{\cftprecisskip}\relax%
			\setlength{\rightskip}{\@tocrmarg}\relax%
			{\cftprecisstyle%
			\ifnum\value{precisno}>0 \cftprecissep\else\par\noindent\fi%
			{\cftprecisnumfont\theparagraphic\cftafterprecisnum}%
			{\cftprecistitlefont\ifx#1\@empty\else\cftbeforeprecistitle#1\fi}%
			\cftafterprecis}}%
	\fi%
	\refstepcounter{precisno}}

%	Créer les commandes pour faire référence à un numéro
\newcommand{\infra}[1]{Cf.~\emph{infra} \no\ref{para:#1}}
\newcommand{\supra}[1]{Cf.~\emph{supra} \no\ref{para:#1}}

%	Créer une commande pour indiquer que le sujet est traité en note
\newcommand{\note}[1]{#1~(\emph{n.})}% dans les index, utiliser: |note

%	TODO » A déplacer
%	S'assurer que la table des matières termine bien le dernier paragraphe
\AtEndDocument{\addtocontents{toc}{\par}}

%	#####	DÉFINITIONS RELATIVES AUX FLOATS	#####

%	Numéroter les <floats> pour le document entier et non par chapitre
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

%	Idem pour le <mainmatter> (puisque <memoir> y change explicitement la numérotation)
\renewcommand\@memmain@floats{
	\counterwithout{figure}{chapter}
	\counterwithout{table}{chapter}}

%	Définir l'alignement des <floats> (centré)
\setfloatadjustment{figure}{\centering}
\setfloatadjustment{table}{\centering}

%	Définir l'affichage des figures et tableaux dans la table des matières
\cftsetindents{figure}{0em}{1.5em}
\cftsetindents{table}{0em}{1.5em}

%	Définir la hauteurs des séparateurs verticaux
\setlength{\floatsep}{0pt}
\setlength{\textfloatsep}{\baselineskip}
\setlength{\intextsep}{\baselineskip}
\setlength{\dblfloatsep}{\baselineskip}
\setlength{\dbltextfloatsep}{\baselineskip}

%	Définir la hauteur des éléments du tableau via <booktabs>
\setlength{\aboverulesep}{.5\baselineskip}
\setlength{\belowrulesep}{.5\baselineskip}
\setlength{\abovetopsep}{0pt}
\setlength{\belowbottomsep}{0pt}

%	Forcer les <floats> à se placer en bas de page ou sur une page dédiée
% Suppose qu'il y ait peu de floats, mais les aligne verticalement à moindre coût
\setfloatlocations{figure}{bp}
\setfloatlocations{table}{bp}

%	Définir le style des <tabular> (centrés, alignement vertical)
\let\old@tabular=\tabular
\let\old@endtabular=\endtabular
\renewenvironment{tabular}[2][t]
	{\old@tabular[#1]{#2}\toprule}
	{\bottomrule\old@endtabular}

%	Définir le style de la légende
\changecaptionwidth\captionwidth{.8\columnwidth}
\setlength{\abovecaptionskip}{.5\baselineskip}
\setlength{\belowcaptionskip}{.5\baselineskip}
\hangcaption

%	Redéfinir les <minipage> pour les aligner verticalement
\let\old@minipage=\minipage
\let\old@endminipage=\endminipage
\renewenvironment{minipage}[2][t]
	{\old@minipage[#1]{#2}}
	{\par\xdef\tpd{\the\prevdepth}\old@endminipage\par\prevdepth\tpd}

%	Définir un environnement <minipage*> avec la définition originele
% Rompt l'alignement vertical, mais ne crée pas de paragraphe supplémentaire...
\newenvironment{minipage*}[2][t]
	{\old@minipage[#1]{#2}}
	{\old@endminipage}

%	#####	DÉFINITIONS RELATIVES AUX LISTES	#####

%	Supprimer les espaces verticaux dans les listes pour assurer l'alignement vertical
\newcommand*{\frenchlawlists}{
	\setlength{\listparindent}{\parindent}
	\setlength{\everylistparindent}{\listparindent}
	\setlength{\parskip}{\z@}
	\setlength{\partopsep}{\z@}
	\setlength{\parsep}{\z@}
	\setlength{\parsepi}{\parskip}
	\setlength{\parsepii}{\parskip}
	\setlength{\topsep}{\z@}
	\setlength{\topsepi}{\z@}
	\setlength{\topsepii}{\z@}
	\setlength{\topsepiii}{\z@}
	\setlength{\itemindent}{\z@}
	\setlength{\itemsepi}{\parsepi}
	\setlength{\itemsepii}{\parsepii}
	\setlength{\itemsepiii}{\topsepiii}
	%\setlength{\labelsep}{.5em}
	\setlength{\leftmargin}{\z@}
	\setlength{\rightmargin}{\z@}
	\setlength{\leftmargini}{\if@twocolumn 1em \else 1.5em \fi}
	\setlength{\leftmarginii}{\if@twocolumn 1em \else 1.5em \fi}
	\setlength{\leftmarginiii}{\if@twocolumn 1em \else 1.5em \fi}
	\setlength{\leftmarginiv}{\if@twocolumn 1em \else 1.5em \fi}
	\setlength{\leftmarginv}{\if@twocolumn 1em \else 1.5em \fi}
	\setlength{\leftmarginvi}{\if@twocolumn 1em \else 1.5em \fi}}
\frenchlawlists

%	TODO » Enumerate numbering
% Enumerate > 1. a) i. A.

%	TODO » Revoir les espacements horizontaux des descriptions
%	Modifier l'environnement <description>
\renewenvironment{description}
	{\list	{}
		{\vskip\baselineskip
		\let\makelabel\descriptionlabel
		\setlength{\itemsep}{\baselineskip}
		\setlength{\leftmargin}{2\parindent}}}
	{\vskip\baselineskip\endlist}

%	Modifier l'environnement <blockdescription>
\renewenvironment{blockdescription}%
	{\list	{}
		{\vskip\baselineskip
		\let\makelabel\blockdescriptionlabel
		\setlength{\leftmargin}{2\parindent}}}%
	{\vskip\baselineskip\endlist}

%	Créer l'environnement <vitae> pour les CV (label dans la marge)
\newenvironment{vitae}
  {\list	{}
    {\let\makelabel\vitaelabel
     \setlength{\leftmargin}{\z@}
     \setlength{\labelwidth}{\marginparwidth}}}
  {\endlist}

%	Définir le style des labels des descriptions
\renewcommand{\descriptionlabel}[1]{\scshape{\hfill#1:}}
\renewcommand{\blockdescriptionlabel}[1]{\scshape{\hfill#1:}}
\newcommand{\vitaelabel}[1]{\footnotesize\itshape{\hfill\strut#1:\strut}}

%	TODO » Appliquer \idemindent si le texte est en français (<quote>, <quotation>)

%	Appliquer à l'environnement quote    
\renewenvironment{quote}%
	{\list	{}
		{\vskip\baselineskip
		 \setlength{\itemindent}{\z@}}%
		\small\item[]}
	{\vskip\baselineskip\endlist}

%	Appliquer à l'environnement quotation
\renewenvironment{quotation}%
	{\list	{}
		{\vskip\baselineskip
		 \setlength{\itemindent}{\parindent}}%
		\small\item[]}
	{\vskip\baselineskip\endlist}

%	Définir le style des épigraphes
\epigraphfontsize{\normalsize}
\setlength{\epigraphwidth}{.5\textwidth}
\setlength{\epigraphrule}{0pt}
\setlength{\beforeepigraphskip}{0pt}
\setlength{\afterepigraphskip}{\baselineskip}
%
%	TODO » Documenter les minipages, utiliser \footnotemark et \footnotetext pour des notes
%	Définir le format de la citation de l'épigraphe
\renewcommand{\@epitext}[1]{%
	\begin{minipage}{\epigraphwidth}\begin{\textflush}#1\end{\textflush}\end{minipage}
}

%	Redéfinir le format de la source de l'épigraphe
\renewcommand{\@episource}[1]{%
	\begin{minipage}{\epigraphwidth}\begin{\sourceflush}---~#1\end{\sourceflush}\end{minipage}
}

%	Redéfinir la commande des épigraphes simples
\renewcommand{\epigraph}[2]{
	\vspace*{\beforeepigraphskip}
	{\begin{\epigraphflush}
		\epigraphsize
		\@epitext{#1}\par\vspace{.5\baselineskip}
		\@episource{#2}\par\vspace{.5\baselineskip}
	\end{\epigraphflush}}
	\vspace*{\afterepigraphskip}}

%	Redéfinir les commandes des épigraphes multiples

%	Appliquer à l'environnement <epigraphs>
\renewenvironment{epigraphs}{%
	\list	{}
		{\vspace*{\beforeepigraphskip}}}%
	{\vspace*{\afterepigraphskip}\endlist}

%	Redéfinir les commandes des épigraphes multiples
% Redéfinir \qitem (ajout d'un espace entre deux épigraphes successifs)
\renewcommand{\qitem}[2]{%
	\item[]{%
	\begin{\epigraphflush}
		\epigraphsize
		\@epitext{#1}\par\vspace{.5\baselineskip}%
		\@episource{#2}\par\vspace{2.5\baselineskip}
	\end{\epigraphflush}}}

%	#####	CRÉATION DES INDEX ET GLOSSAIRES	#####

%	Préparer les index
\makeindex
\makeindex[\jobname-bib]

%	Définir le style des index
\setlength{\indexcolsep}{1em}
\renewcommand{\indexspace}{\par\vspace{\baselineskip}\relax}
\renewcommand{\@idxitem}{\par\goodbreak\hangindent 40\p@}
\renewcommand{\subitem}{\par\hangindent 40\p@ \hspace*{10\p@}}
\renewcommand{\subsubitem}{\par\hangindent 40\p@ \hspace*{20\p@}}

%	Appliquer à l'environnement des index
\renewenvironment{theindex}{%
	\clearforchapter
	\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\ifonecolindex
		\onecolumn
		\chapter*{\indexname}
		\preindexhook
	\else
		\setlength{\columnseprule}{\indexrule}%
		\setlength{\columnsep}{\indexcolsep}%
		\twocolumn[\@makeschapterhead{\indexname}\preindexhook]%
	\fi
	\indexmark
	\ifnoindexintoc\else
		\phantomsection
		\addcontentsline{toc}{chapter}{\indexname}%
	\fi
	\thispagestyle{indextitlepagestyle}
	\sloppy
	\let\item\@idxitem}%
	{\if@restonecol\onecolumn\else\twocolumn\fi}

%	Appliquer à l'environnement des glossaires
\renewenvironment{theglossary}{%
	\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\ifonecolglossary
		\onecolumn
		\chapter*{\glossaryname}
		\preglossaryhook
	\else
		\setlength{\columnseprule}{\glossaryrule}
		\setlength{\columnsep}{\glossarycolsep}
		\twocolumn[\@makeschapterhead{\glossaryname}\preglossaryhook]%
	\fi
	\glossarymark
	\ifnoglossaryintoc\else
		\phantomsection
		\addcontentsline{toc}{chapter}{\glossaryname}
	\fi
	\thispagestyle{chapter}
	\sloppy
	\begintheglossaryhook}%
	{\atendtheglossaryhook\if@restonecol\onecolumn\else\twocolumn\fi}

%	Faire en sorte que les index renvoient aux numéros de paragraphes
\renewcommand{\preindexhook}{Les numéros renvoient aux paragraphes et non aux pages.\vspace{2\baselineskip}}
\renewcommand{\index}[1]{\specialindex{\jobname}{paragraphic}{#1}}
%\renewcommand{\index}[1]{\index}[\jobname]{#1} % Pour un renvoi aux pages
\newcommand{\bibindex}[1]{\specialindex{\jobname-bib}{paragraphic}{#1}}
%\newcommand{\bibindex}[1]{\index}[\jobname-bib]{#1} % Pour un renvoi aux pages

%	#####	CRÉATION DES BIBLIOGRAPHIES (BIBLATEX)	#####

%	Charger <biblatex> avec les options
\usepackage[mincrossrefs=2,autolang=other*,style=frenchlaw,backend=biber,indexing=cite]{biblatex}

%	Définir les raccourcis de citation
\def\citep{\unskip~\parencite}
\def\citet{\textcite}

%	Indexer automatiquement les noms des auteurs cités
\DeclareIndexNameFormat{default}{%
	\usebibmacro{index:name}{\bibindex}{#1@\textsc{#1}}{#3}{#5}{#7}}
\DeclareIndexFieldFormat{default}{}
\renewbibmacro{bibindex}{\ifbibindex{\indexnames{labelname}}{}}
\renewbibmacro{citeindex}{\ifciteindex{\indexnames{labelname}}{}}

%	#####	CRÉATION DU SYSTÈME D'ABRÉVIATIONS (BIBLATEX)	#####

%	La liste des abréviations utilise une catégorie spéciale de la bibliographie
\DeclareBibliographyCategory{abbrv}

%	Définir les commandes pour ajouter des abréviations à la liste (#1 = citekeys).
\newcommand{\addtoshorthands}[1]{\nocite{#1}\addtocategory{abbrv}{#1}}
\newcommand{\shorthandslist}[1]{%
	\AtBeginDocument{\nocite{#1}\addtocategory{abbrv}{#1}}%
}

%	TODO » Nécessaire? Ne peut-on pas juste changer le style par défaut plutôt que de modifier la commande juste pour ça?
%	Redéfinir l'environnement imprimant la liste des abréviations
\defbibenvironment{shorthands}
	{\list{\printfield[citeshorthand]{shorthand}}{%
	\labelwidth\shorthandwidth
	\labelsep\biblabelsep
	\leftmargin\labelwidth
	\advance\leftmargin\labelsep
	\itemsep\bibitemsep
	\parsep\bibparsep
	\def\makelabel##1{##1\hss}}}
	{\endlist}
	{\item}

%	TODO » Revoir + déplacer
%	En mode <didactic>, utiliser une nouvelle division logique pour les headers
\newcounter{division}
\newcommand{\division}[2][\@empty]{%
	\clearpage
	\def\@division{#1}%
	\refstepcounter{division}%
	\setcounter{section}{0}
	\setcounter{page}{1}
	\noindent{\large\textsc{\hfill--- #2 ---\hfill}}%
}
	\newcommand{\@division}{\relax}

%	Pour le mode <didactic>, créer automatiquement un header adapté
\if@didactic
	\renewcommand{\leftheader}{%
		{\if\@type\relax\else\@type%
			\ifnum\thedivision > 0~\no\thedivision\fi
			\if\@division\relax\else~(\@division)\fi
			\par
		\fi
		 \Large\textsc{\csname @title@\languagename\endcsname}}}
	\renewcommand{\rightheader}{%
		\@author
		\if\relax\@email\relax\else\par\@email\fi}
\fi



%	TODO » Exception en mode article: imprimer Résumé et le texte dans une minipage inspirée de quotation
%	TODO » Pour les thèses, imprimer en bas le nom et l'adresse du laboratoire / école
%	TODO » Même principe pour générer une liste de vitæ pour un ouvrage collectif + pour le copyright (mais \vfill)
%	Reprendre l'environnement pour les résumés
% L'environnement est automatiquement renvoyé en page suivante s'il est trop long
% L'argument optionnel est celui de la langue (par défaut, celle du texte)
\renewenvironment{abstract}[1][]
	{\bgroup
	 \if@twocolumn\@restonecoltrue\onecolumn
	 \else\@restonecolfalse
	 \fi%
	 \if\relax#1\relax\else\selectlanguage{#1}\fi
	 \renewcommand*{\Large}{\fontsize{17}{29}\selectfont}
	 \vspace*{\baselineskip}
	 \noindent{\Large\scshape\raggedright\abstractname\par}%
	 \vspace*{\afterchapskip}
	 \vspace*{-\baselineskip}
	 {\noindent\scshape\raggedright\csname @title@\languagename\endcsname\if\@empty\csname @subtitle@\languagename\endcsname\relax\else:\space\csname @subtitle@\languagename\endcsname\fi\par}%
	 \vspace{\baselineskip}}
	{\if@restonecol\twocolumn\fi\egroup}

%	Créer une commande <keywords>, qui peut être utilisée dans le résumé
\newcommand{\keywords}[1]{%
	\par\vspace{\baselineskip}
	{\noindent\raggedright\scshape\keywordsname:\enskip}#1}



% \newcommand{\summary}[3][\vfill]{\gdef\@summary@french{#2}\gdef\@summary@english{#3}\gdef\@summary@vspace{#1}}
% \newcommand{\keywords}[2]{\gdef\@keywords@french{#1}\gdef\@keywords@english{#2}}
% \newcommand{\printsummaries}{%
% \bgroup%
% % language
% \vspace*{\beforechapskip}
% \noindent{\Large\scshape\raggedright\abstractname\par}%
% \vspace*{\afterchapskip}
% \@summary@french\par%
% \vspace{\baselineskip}
% \noindent{\scshape\raggedright\keywordsname:\enskip}\@keywords@french\par%
% \@summary@vspace
% % language
% \vspace*{\beforechapskip}
% \noindent{\Large\scshape\raggedright\abstractname\par}%
% \vspace*{\afterchapskip}
% \@summary@english\par%
% \vspace{\baselineskip}
% \noindent{\scshape\raggedright\keywordsname:\enskip}\@keywords@english\par%
% \egroup%
% }


%	Définir les éléments du <frontmatter>
\newcommand{\makefrontmatter}{
	%\maketitle
	% Abstract / Keywords (FR+EN), Dedication, Acknowledgements / Foreword
	
	\cleardoublepage
	{\raggedbottom\tableofcontents*}\clearmark{toc}
	
	% Table of lists, table of figures
	% Acronyms / Abreviations
	\cleardoublepage
	\printshorthands
	\mainmatter
}

%	Définir les éléments du <backmatter>
\newcommand{\makebackmatter}{
	\backmatter
	\setlength{\emergencystretch}{2em}
	
	% \renewcommand{\indexname}{Index des sources}
	% \printindex[idx-jur]
	
	\cleardoublepage
	\renewcommand{\indexname}{Index des noms cités}
	{\raggedbottom\printindex[\jobname-bib]}
	
	\cleardoublepage
	\renewcommand{\indexname}{Index des matières}
	{\raggedbottom\printindex}
	
	\cleardoublepage
	\printbibliography[notcategory=abbrv]
%	TODO å Utiliser les variables suivantes:
	% \printbibliography[title=Manuels,
		% nottype=book,nottype=collection,nottype=proceedings,nottype=inbook,nottype=thesis, nottype=article,nottype=incollection,nottype=inproceedings]
	%\printbibliography[title=Ouvrages,
		% nottype=reference,nottype=article,nottype=incollection,nottype=inproceedings]
	% \printbibliography[title=Articles,
		% nottype=book,nottype=collection,nottype=proceedings,nottype=reference,nottype=inbook,nottype=thesis]
}

%	#####	GESTION DU MODE DRAFT	#####

%	TODO » A reprendre
%	Si on est en mode <draft>, afficher le cadre et marquer les overfull hbox
\ifdraftdoc
	%\usepackage{showframe}
	%	Imprimer les marques de changement de la classe Memoir
	% Les commandes sont: \added{} \deleted{} \changed{}
	\changemarks
	%	Imprimer les labels
	\let\old@label\label
	\renewcommand{\label}[1]{\marginpar{#1}\old@label{#1}}
	%	Imprimer les indexes
	\let\old@index\index
	\renewcommand{\index}[1]{\llap{\raisebox{1.8ex}[0em]{\color{orange}{\tiny#1}}}\old@index{#1}}
\fi

%	TODO » Pour les notes
\usepackage{xcolor}

%	TODO » Reprendre les documents pour intégrer le package + Renommer {frenchlaw-typo}
\RequirePackage{typographie}

%	TODO » Implémenter <hyperref>
%\RequirePackage{hyperref}% Mais crée des bugs avec les références type \supra

%	TODO » Définir une commande pour les \todo

% Fin