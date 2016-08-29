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
\newif\if@marginal
	\@marginalfalse
\newif\if@draft
	\@draftfalse
\newif\if@article
	\@articlefalse
\newif\if@didactic
	\@didacticfalse
\newif\if@summary
	\@summaryfalse
\newif\if@outline
	\@outlinefalse
\newif\if@paratoc
	\@paratocfalse
\newif\if@longtoc
	\@longtocfalse
\newif\if@precis
	\@precisfalse
\newif\if@british
	\@britishfalse
\newif\if@english
	\@englishfalse
\newif\if@french
	\@frenchfalse

%	Define command-activated switches
\newif\if@paraname
	\@paranametrue
\newif\if@indexparagraphs
	\@indexparagraphstrue

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
%	Options <onecolumn> & <twocolumn> are passed to <memoir> without being redefined
\DeclareOptionX{oneside}{
	\@onesidetrue\@twosidefalse
	\PassOptionsToClass{oneside}{memoir}
}
\DeclareOptionX{twoside}{
	\@twosidetrue\@onesidefalse
	\PassOptionsToClass{twoside}{memoir}
}

%	Define options for <final> & <draft>
\DeclareOptionX{final}{
	\@draftfalse
	\PassOptionsToClass{final}{memoir}
}
\DeclareOptionX{draft}{
	\@drafttrue
	\@marginaltrue
	\@precistrue
	\PassOptionsToClass{draft}{memoir}
}

%	Define option for <marginal> document style
\DeclareOptionX{marginal}{
	\@marginaltrue
}

%	Define options for <precis> document style
\DeclareOptionX{outline}{
	\@outlinetrue
	\@summarytrue
	\@paratoctrue
	\@longtoctrue
}

%	Define options for <precis> document style
\DeclareOptionX{precis}{
	\@summarytrue
	\@precistrue
	\@paratoctrue
	\@longtoctrue
}

%	Define an option to change line spacing
\DeclareOptionX{linespacing}[1.1]{\def\custom@baselinestretch{#1}}

%	Define options for <didactic>, ... document types
%	TODO » Ajouter les formats de documents juridiques
\DeclareOptionX{article}{
	\@articletrue
	\PassOptionsToClass{article}{memoir}
}

%	TODO » Reprendre + documenter
\DeclareOptionX{didactic}{
	\@didactictrue
	\@articletrue
	\@tenpointstrue
	\@twosidefalse
	\PassOptionsToClass{10pt,article,twocolumn,oneside}{memoir}
}
\DeclareOptionX{didactic+}{
	\@didactictrue
	\@articletrue
	\@stockavtrue
	\@tenpointstrue
	\@twosidefalse
	\PassOptionsToClass{a5paper,10pt,article,oneside}{memoir}
}

%	TODO » Utilité des switch de langue ? On utilise languagename partout
%	Define options to change the main language of the document
\DeclareOptionX{british}{
	\@britishtrue
	\@englishfalse
	\@frenchfalse
	\PassOptionsToPackage{british}{babel}
	\PassOptionsToPackage{british}{fmtcount}
	\AtEndOfClass{\main@language{british}}
}
\DeclareOptionX{english}{%	TODO » Remplacer par USenglish? // Créer un alias dans le code de biber pour les langid / hyphenation
	\@englishtrue
	\@frenchfalse
	\@britishfalse
	\PassOptionsToPackage{english}{babel}
	\PassOptionsToPackage{english}{fmtcount}
	\AtEndOfClass{\main@language{english}}
}
\DeclareOptionX{french}{
	\@frenchtrue
	\@englishfalse
	\@britishfalse
	\PassOptionsToPackage{french}{babel}
	\PassOptionsToPackage{french}{fmtcount}
	\AtEndOfClass{\main@language{french}}
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

%	Load the main dependencies: <memoir>, <fixltx2e>, <environ>
\LoadClass{memoir}
\RequirePackage{fixltx2e,environ}

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
	\setlength{\headheight}{3\baselineskip}
	\setlength{\headsep}{\baselineskip}
	\setlength{\uppermargin}{4.5\baselineskip}
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

%	#####	UTILITIES	#####

%	TODO » A documenter
%	Create a command that gobbles all whitespace until the next paragraph
% In another command, call:	\@ifnextchar\par{\@gobblepar}{\relax}
\newcommand{\@gobblepar}[1]{%
	\@ifnextchar\par{\@gobblepar}{\relax}}

%	Create a command that just prints its argument. Some macros \let it to \@gobble
\newcommand{\sanitize}[1]{#1}

%	#####	TYPOGRAPHY	#####

%	Load the relevant fonts and packages for LaTeX and XeLaTeX
\RequirePackage{adforn,mathpazo}% + Biolinum (sans serif)
\ifxetex
	%	Load XeLaTeX fonts: Junicode & Latin Modern (?)
	\RequirePackage{fontspec}
	\defaultfontfeatures{
		Ligatures = {TeX},
		Numbers = {OldStyle},%	TODO » Rendre les OSF conditionnelles (?)
		SmallCapsFeatures = {WordSpace = 1.2, LetterSpace=3.0}}
	%	TODO » Problème des accents > deux caractères sous Junicode (?)
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
					{lmsans10}%	TODO » Changer… pour biolinum?
	\setmonofont[	Extension		= .otf,
					UprightFont		= *-regular,
					ItalicFont		= *-italic,
					Numbers			= Lining,
					Scale			= MatchLowercase ]
					{lmmono10}
	\RequirePackage{microtype}
\else
	\AtEndOfClass{\usepackage[utf8]{inputenc}}
	\RequirePackage[T1]{fontenc}
	\RequirePackage{lmodern,libertine}
	\renewcommand*{\ttdefault}{lmtt}
	\RequirePackage[tracking,letterspace=30]{microtype}
\fi

%	Load language and number packages and fixes
%	TODO » Implémenter {csquotes} et le documenter
\RequirePackage[greek,latin,english,british,french]{babel}
\RequirePackage[autostyle=true]{csquotes}
\DeclareQuoteAlias[american]{english}{british}% Use double quotes in British english
\RequirePackage{fmtcount}% 	TODO » Ou autre?
\RequirePackage{fixltxhyph}

%	TODO » Reprendre les documents pour intégrer le package + Renommer {frenchlaw-typo}
\RequirePackage{typographie}

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
%	\footnotemark[#1]%
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

%	Margin and side notes are set in the widest margin
\if@twoside
	\marginparmargin{outer}
	\sidebarmargin{outer}
\else
	\marginparmargin{left}
	\sidebarmargin{left}
\fi

%	Create a command that forces the same line-spacing in notes as in the main block
% This allows for better vertical alignment, but is not part of standard styles
\newcommand{\notespacing}{\edef\m@m@footnote@spacing{\custom@baselinestretch}}

%	TODO » Ajouter ici les paramètres des listes et floats

%	#####	TITLE PAGES	#####

%	Create a command that changes the style of \maketitle
% Create a \maketitle<name> command and use \titlepagestyle{<name>}
\newcommand{\titlepagestyle}[1]{\def\maketitle{\csname maketitle#1\endcsname}}

%	Redefine \and (by default it uses a tabular and breaks vertical alignment)
\def\and{\par}%\unskip\enskip\emph{\&}\enskip\ignorespaces

%	Create a command for people's first & last names
\newcommand{\name}[2]{#1~\textsc{#2}}
\newcommand{\affiliation}[1]{{\normalsize\unskip~(#1)}}

%	Create a command to switch off and on layout elements
\newcommand{\reset@twocolumns}{%
	\if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi%
}
\newcommand{\restore@twocolumns}{
	\if@restonecol\twocolumn\fi%
}

%	Create a command to set all font sizes to a multiple of \baselineskip
\newcommand{\normalize@fontsize}{%
	\setlength{\parindent}{0em}
	\if@tenpoints
		\renewcommand*{\large}{\fontsize{12}{12}\selectfont}
		\renewcommand*{\Large}{\fontsize{15}{24}\selectfont}
		\renewcommand*{\LARGE}{\fontsize{18}{24}\selectfont}
	\fi
	\if@twelvepoints
		\renewcommand*{\large}{\fontsize{14}{14.5}\selectfont}
		\renewcommand*{\Large}{\fontsize{17}{29}\selectfont}
		\renewcommand*{\LARGE}{\fontsize{20}{29}\selectfont}
	\fi
}

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
\newcommand{\laboratory}[1]{\gdef\@laboratory{#1}}
	\newcommand{\@laboratory}{\@empty}
\newcommand{\subject}[1]{\gdef\@subject{#1}}
	\newcommand{\@subject}{\@empty}
\newcommand{\thesis}[1]{\gdef\@thesis{#1}}
	\newcommand{\@thesis}{\@empty}
\newcommand{\director}[1]{\gdef\@director{\bgroup#1\egroup}}
	\newcommand{\@director}{\@empty}
\newcommand{\jury}[1]{\gdef\@jury{\bgroup#1\egroup}}
	\newcommand{\@jury}{\@empty}
\newcommand{\publisher}[1]{\gdef\@publisher{#1}}
	\newcommand{\@publisher}{\@empty}
\newcommand{\series}[1]{\gdef\@series{#1}}
	\newcommand{\@series}{\@empty}
\newcommand{\address}[1]{\gdef\@address{#1}}
	\newcommand{\@address}{\@empty}
\newcommand{\phone}[1]{\gdef\@phone{#1}}
	\newcommand{\@phone}{\@empty}
%	TODO » Sécuriser les emails si * et éviter qu'ils débordent du cadre (?)
% Non documenté
\newcommand{\email}[1]{\gdef\@email{#1}}
	\newcommand{\@email}{\@empty}

%	TODO » Ajouter un mailto: crypté en UTF-8 (\@ifstar ?), mais uniquement si on crypte l'adresse
\begingroup
	\catcode`\@=\active
	\catcode`\.=\active
	\newcommand{\mailto}{%
		\begingroup
		\catcode`\@=\active
		\catcode`\.=\active
		\gdef@{$\,\langle\,$at$\,\rangle\,$}%
		\gdef.{$\,\langle\,$dot$\,\rangle\,$}%
		\obfuscate
	}
	\newcommand{\obfuscate}[1]{%
		\endgroup
		{\ttfamily#1}%
	}
\endgroup

%	TODO » Ajouter \website et \linkedin (2 args, nom + url ?)
%	TODO » Ajouter une commande pour le copyright + intégrer aux styles

%	Define a default style (esp. for long documents)
\newcommand{\maketitleBook}{%
	% Send out warnings on empty fields
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	% Change the numbering in \frontmatter to \Roman
	\renewcommand{\@memfront}{\@smemfront\pagenumbering{Roman}}
	% Create the \maketitle
	\newcommand{\printtitle}{%
		\normalize@fontsize%
		\centering%	TODO » Tout aligner à gauche pour les livres
		{\large\scshape\@institution\par}
		{\itshape\@series\par}
		\vspace*{8\baselineskip}
		{\LARGE\scshape\csname @title@\languagename\endcsname\par}
		{\Large\scshape\csname @subtitle@\languagename\endcsname\par}
		\vspace{4\baselineskip}
		{\Large\@author\par}
		\vfill
		{\large\@publisher\par}}
	% Begin \frontmatter and print the title page twice
	\frontmatter
	\bgroup
		\pagestyle{empty}%
		\reset@twocolumns%
		\printtitle%
		\restore@twocolumns%
		\cleartooddpage
		\printtitle%
		\cleartooddpage
	\egroup
}

%	Create a style for PhD theses / Dissertations
%	TODO » Adde \lab
\newcommand{\maketitlePhD}{%
	% Send out warnings on empty fields
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	\if\@empty\@institution\relax
		\@latex@warning@no@line{No \noexpand\institution given}\fi
	\if\@empty\@school\relax
		\@latex@warning@no@line{No \noexpand\school given}\fi
	\if\@empty\subject\relax
		\@latex@warning@no@line{No \noexpand\subject given}\fi
	\if\@empty\@author\relax
		\@latex@warning@no@line{No \noexpand\author given}\fi
	\if\@empty\@director\relax
		\@latex@warning@no@line{No \noexpand\director given}\fi
	\if\@empty\@jury\relax
		\@latex@warning@no@line{No \noexpand\jury given}\fi
	% Create the \maketitle
	\newcommand{\printtitle}{%
		\normalize@fontsize%
		\centering%
		{\Large\scshape\@institution\par}
		\vspace{\baselineskip}
		{\large\@school\par\@laboratory\par}
		\vspace{4\baselineskip}
		{\LARGE\csname @title@\languagename\endcsname\par}
		{\Large\csname @subtitle@\languagename\endcsname\par}
		\vspace{4\baselineskip}
		{\large\subjecttext\space\@subject\par}
		\vspace{\baselineskip}
		{\large\datetext\space\@date\space\par}
		\vspace{4\baselineskip}
		{\Large\@author\par}
		\vspace{4\baselineskip}
		{\directortext\par}
		\vspace{\baselineskip}
		{\large\@director\par}
		\vspace{2\baselineskip}
		{\jurytext\par}
		\vspace{\baselineskip}
		{\large\@jury\par}}
	% Begin \frontmatter and print the title page twice, use arabic numbers throughout
	\frontmatter*
	\bgroup
		\pagestyle{empty}
		\reset@twocolumns%
		\printtitle%
		\cleartooddpage
		\restore@twocolumns%
		\printtitle%
		\cleartooddpage\par
	\egroup
	\let\mainmatter=\@smemmain% == \let\mainmater=\mainmatter*
}

%	Create a style for MA / MPhil theses
\newcommand{\maketitleMemoir}{%
	\frontmatter*% Use arabic page numbers throughout
	% Send out warnings on empty fields
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	\if\@empty\@institution\relax
		\@latex@warning@no@line{No \noexpand\institution given}\fi
	\if\@empty\@school\relax
		\@latex@warning@no@line{No \noexpand\school given}\fi
	\if\@empty\@author\relax
		\@latex@warning@no@line{No \noexpand\author given}\fi
	\if\@empty\@director\relax
		\@latex@warning@no@line{No \noexpand\director given}\fi
	% Create the \maketitle
	\newcommand{\printtitle}{%
		\normalize@fontsize%
		\centering%
		{\large\scshape\@institution\par}
		\vspace{\baselineskip}
		{\large\@school\par\@laboratory\par}
		\vspace{6\baselineskip}
		{\LARGE\csname @title@\languagename\endcsname\par}
		{\Large\csname @subtitle@\languagename\endcsname\par}
		\vspace{4\baselineskip}
		{\Large\@author\par}
		\vspace{6\baselineskip}
		{\Large\@thesis\par}
		\vspace{4\baselineskip}
		{\subjecttext\par}
		\vspace{\baselineskip}
		{\large\@director\par}
		\vspace{8\baselineskip}
		{\large\@date\par}}
	% Begin \frontmatter and print the title page twice, use arabic numbers throughout
	\frontmatter*
	\bgroup
		\pagestyle{empty}
		\reset@twocolumns%
		\printtitle%
		\cleartooddpage
		\restore@twocolumns%
		\printtitle%
		\cleartooddpage\par
	\egroup
	\let\mainmatter=\@smemmain% == \let\mainmater=\mainmatter*
}

%	Define a default style for articles and other short documents
\newcommand{\maketitleArticle}{%
	% Send out warnings on empty fields
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	% Print the \maketitle
	\bgroup
		\cleardoublepage%
		\reset@twocolumns%
		\normalize@fontsize%
%		\vspace*{3\baselineskip}
		{\Large\scshape\raggedright\csname @title@\languagename\endcsname\if\@empty\csname @subtitle@\languagename\endcsname\relax\else :\par\vspace{.25\baselineskip}\noindent\csname @subtitle@\languagename\endcsname\vspace{.25\baselineskip}\fi}\par%
		{\if\@empty\@author\else\vspace{\baselineskip}\@author\par%
		 \if\@empty\@email\else\emailname\@email\fi\fi\par}%
		\vspace{2\baselineskip}%
		\restore@twocolumns%
	\egroup
}

%	Define a style for academic papers and others homework
\newcommand{\maketitleAcademic}{%
	% Send out warnings on empty fields
	\if\@empty\@author\relax
		\@latex@warning@no@line{No \noexpand\author given}\fi
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	% Print the \maketitle
	\bgroup
		\cleardoublepage%
		\reset@twocolumns%
		\normalize@fontsize%
		{\Large\scshape\raggedright\csname @title@\languagename\endcsname\if\@empty\csname @subtitle@\languagename\endcsname\relax\else :\par\noindent\csname @subtitle@\languagename\endcsname\fi}\par%
		{\@author~---\space\@date\par}%
		{\if\@empty\@email\else\emailname\@email\fi\par}%
		\vspace{2\baselineskip}%
		\restore@twocolumns%
	\egroup
}

%	Create a style for resumés / CVs
%	TODO » Ajouter un \website et \linkedin, + des pictogrammes + hyperlinks for emails and websites + \pagestyle{frenchletter}
%	TODO » Non documenté
\newcommand{\maketitleCV}{%
	% Send out warnings on empty fields
	\if\@empty\@author\relax
		\@latex@warning@no@line{No \noexpand\author given}\fi
	% Use \parindent = 0 for the whole document
	\setlength{\parindent}{0em}
	% Print the \maketitle
	\bgroup
	\thispagestyle{empty}
	\reset@twocolumns%
	\normalize@fontsize%
	{\large\raggedright\@author}\par%
	\vspace{\baselineskip}%
	\@address\par
	\phonename\@phone\par
	\emailname\@email\par%\href{\@email}{\@email}
	\vspace{\baselineskip}
	\restore@twocolumns%
}

%	Set the default styles to <Book> or <Article>
\if@article\titlepagestyle{Article}\else\titlepagestyle{Book}\fi

%	#####	HEADERS & FOOTERS	#####

%	TODO » Documenté pour les livres, articles, lettres, CVs. Programmer et documenter les docs juridiques

%	Set a style for <book>, <part>, <heading>, <subheading> and <chapter>
\aliaspagestyle{book}{empty}
\aliaspagestyle{part}{plain}
\aliaspagestyle{chapter}{plain}

%	Redefine <plain> so that it takes into accout the <twoside> option
\makepagestyle{plain}
	\makeevenfoot{plain}{\if@twoside\thepage\fi}{\if@oneside\thepage\fi}{}
	\makeoddfoot{plain}{}{\if@oneside\thepage\fi}{\if@twoside\thepage\fi}

%	Create a command that copies \rightmark towards \leftmark if empty
\newcommand{\leftrightmark}{%
	\begingroup\protected@edef\x{\leftmark}%
	\ifx\x\@empty
		\endgroup\rightmark
	\else
		\endgroup\leftmark
	\fi}

%	Define the standard page style for the class
%	TODO » Corriger pour \chapter* et \section* (définir \rightmark) -- difficile, on peut les laisser dans le \fontmatter ou \backmatter (à documenter)
%	TODO » Ajouter le numéro de version et la date \if@draft
%	TODO » Supprimé <generic>, utiliser <frenchlaw> + oneside (sinon impression du titre)
\makepagestyle{frenchlaw}
	\makepsmarks{frenchlaw}{%
		\nouppercaseheads
		\createmark{book}{both}{nonumber}{}{}
		\createmark{part}{both}{nonumber}{}{}
		\createmark{heading}{right}{nonumber}{}{}
		\createmark{subheading}{right}{nonumber}{}{}
		\createmark{chapter}{right}{nonumber}{}{}
		\clearmark{section}
		\createplainmark{toc}{both}{\contentsname}
		\createplainmark{lof}{both}{\listfigurename}
		\createplainmark{lot}{both}{\listtablename}
		\createplainmark{bib}{both}{\bibname}
		\createplainmark{index}{both}{\indexname}
		\createplainmark{glossary}{both}{\glossaryname}
	}
	\makeevenhead{frenchlaw}{}{\itshape\if@article\csname @title@\languagename\endcsname\else\leftrightmark\fi}{}
	\makeoddhead{frenchlaw}{}{\itshape\if@article\@series\else\rightmark\fi}{}
	\makeevenfoot{frenchlaw}{\if@twoside\thepage\fi}{\if@oneside\thepage\fi}{}
	\makeoddfoot{frenchlaw}{}{\if@oneside\thepage\fi}{\if@twoside\thepage\fi}
\pagestyle{frenchlaw}

%	Define a style for letters, memos and resumés
%	TODO » Créer une option CV et \if@CV
%	TODO » Regrouper au style frenchlaw?
%	TODO » Documenter: Compiler deux fois
\makepagestyle{frenchletter}
%	\makeevenhead{frenchletter}{}{\if@CV\MakeLowercase{\scshape\@author~-- \csname @title@\languagename\endcsname\fi}}{}
%	\makeoddhead{frenchletter}{}{\if@CV\MakeLowercase{\scshape\@author~-- \csname @title@\languagename\endcsname\fi}}{}
	\makeevenfoot{frenchletter}{\rightmark}{}{\strut{\ifnum\value{lastpage}>1\relax\thepage\thinspace/\pageref{lastpage}\fi}}
	\makeoddfoot{frenchletter}{\rightmark}{}{\strut{\ifnum\value{lastpage}>1\relax\thepage\thinspace/\pageref{lastpage}\fi}}
	\AtEndDocument{\label{lastpage}}
%	TODO » Appliquer automatiquement sur certains types de docs + Créer les autres formats

%	TODO » A reprendre pour didactic. Utiliser \leftmark et \rightmark en les redéfinissant (?)
\makepagestyle{didactichead}
	\makeheadrule{didactichead}{\textwidth}{.2ex}
	\makeevenhead{didactichead}
		{\textit{\csname @title@\languagename\endcsname}
		 \ifnum\value{division}>0\relax\par\thedivision\afterdivnum\@division\fi%
		 \vspace*{0pt}}
		{}
		{}
	\makeoddhead{didactichead}
		{\textit{\csname @title@\languagename\endcsname}%
		 \ifnum\value{division}>0\relax\par\thedivision\afterdivnum\@division\fi%
		 \vspace*{0pt}}
		{}
		{}
	\makeevenfoot{didactichead}
		{\footnotesize{%
			\@author%
			\ifx\relax\@email\relax\else~(\@email)\fi%
			\ifx\relax\@date\relax\else, \@date.\fi}}
		{}
		{\thepage}
	\makeoddfoot{didactichead}
		{\footnotesize{%
			\@author%
			\ifx\relax\@email\relax\else~(\@email)\fi%
			\ifx\relax\@date\relax\else, \@date.\fi}}
		{}
		{\thepage}
\if@didactic
	\pagestyle{didactichead}
	\aliaspagestyle{chapter}{didactichead}
\fi


%	####	TABLES DES MATIÈRES	####

%	Définir la subdivision maximale pour la numérotation
\maxsecnumdepth{subparagraph}
\maxtocdepth{subparagraph}
\setcounter{tocdepth}{6}

%	Ne pas numéroter les pages des livres et parties (car centrés)
\cftpagenumbersoff{book}
\cftpagenumbersoff{part}


%	Create a command for short table of contents
\newcommand{\shortcontents}[1][0]{%
	\bgroup
		\pagestyle{empty}
		% Reset all necessary commands and remove page numbers
		\renewcommand{\contentsname}{\shortcontentsname}
		\cftpagenumbersoff{heading}
		\cftpagenumbersoff{subheading}
		\cftpagenumbersoff{chapter}
		\setlength{\cftbeforechapterskip}{0pt}
		% Save tocdepth counter
		\newcounter{save@tocdepth}
		\setcounter{save@tocdepth}{\value{tocdepth}}
		\setcounter{tocdepth}{#1}
		% Print the table of contents and restore tocdepth
		\tableofcontents*
		\setcounter{tocdepth}{\value{save@tocdepth}}
		\clearpage
	\egroup
}


%	Créer de nouvelles divisions logiques: <heading> et <subheading>
\newlistentry[part]{heading}{toc}{-1}
\newlistentry[heading]{subheading}{toc}{-1}

%	Créer une commande pour définir la taille des labels
\newlength{\toclabelwidth}
\if@article
	\setlength{\toclabelwidth}{-.3em}
\else
	\settowidth{\toclabelwidth}{\cftchapterfont\space Chapitre\space}
\fi
\newlength{\tocnumwidth}
	\settowidth{\tocnumwidth}{\cftchapterfont\space XXX\space}
\newlength{\toccenterwidth}
	\setlength{\toccenterwidth}{\tocnumwidth}
	\addtolength{\toccenterwidth}{\toclabelwidth}
\newcommand{\toclabelbox}[1]{\makebox[\toclabelwidth]{\hfill#1}}

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
\cftsetindents{book}{\toccenterwidth}{\tocnumwidth}
\cftsetindents{part}{\toccenterwidth}{\tocnumwidth}
\cftsetindents{heading}{0em}{\tocnumwidth}
\cftsetindents{subheading}{0em}{\tocnumwidth}
\cftsetindents{chapter}{0em}{\tocnumwidth}
\cftsetindents{section}{0em}{\tocnumwidth}
\cftsetindents{subsection}{0em}{\tocnumwidth}
\cftsetindents{subsubsection}{\toclabelwidth}{\tocnumwidth}
\cftsetindents{paragraph}{\toclabelwidth}{\tocnumwidth}
\cftsetindents{subparagraph}{\toclabelwidth}{\tocnumwidth}

%	S'assurer que la table des matières termine bien le dernier paragraphe
\AtEndDocument{\addtocontents{toc}{\par}}


%	#####	LOGICAL DIVISIONS	#####

%	Définir le style des livres dans le texte
\renewcommand*{\booktitlefont}{\Huge\scshape}
\renewcommand*{\booknamefont}{\booktitlefont}
\renewcommand*{\booknumfont}{\booktitlefont}
\renewcommand*{\printbooknum}{%
	\booknumfont%
	\if@french
		\ifnum\value{book}=1	\ordinalstring{book}[m]%
	\else						\Roman{book}%
	\fi\fi}
\renewcommand{\beforebookskip}{\null\vspace{\baselinestretch\addto@Huge}%
	\vspace{\if@tenpoints12\baselineskip\fi\if@twelvepoints10\baselineskip\fi}}
\renewcommand{\midbookskip}{\par\vspace{\baselinestretch\addto@Huge}}

%	Définir le style des livres dans la table des matières
\renewcommand*{\cftbookpresnum}{\space}
\renewcommand*{\cftbookaftersnum}{.}
\renewcommand*{\cftbookaftersnumb}{}
\renewcommand*{\cftbookfont}{\large\scshape\hfil}
\renewcommand*{\cftbookpagefont}{\normalsize}
\setlength{\cftbeforebookskip}{2\baselineskip}

%	Définir le style des parties dans le texte
% Babel French gère la numérotation en toutes lettres des parties
\renewcommand*{\thepart}{\Roman{part}}
\renewcommand{\parttitlefont}{\LARGE\scshape}
\renewcommand{\partnamefont}{\parttitlefont}
\renewcommand{\partnumfont}{\parttitlefont}
\renewcommand{\beforepartskip}{\null\vspace{\baselinestretch\addto@LARGE}%
	%	TODO » Si PhD ou Memoir (ou article?)
	\vspace{\baselineskip}%
	%	TODO » Sauf PhD ou Memoir (ou article?)
%	\vspace{\if@tenpoints12\baselineskip\fi\if@twelvepoints10\baselineskip\fi}%
	}
\renewcommand{\midpartskip}{\par\vspace{\baselinestretch\addto@LARGE}}
%	TODO » Seulement si PhD ou Memoir (ou article?), utiliser des options
\renewcommand{\afterpartskip}{\vspace{2\baselineskip}}

%	Définir le style des parties dans la table des matières
\renewcommand*{\cftpartpresnum}{\space}
\renewcommand*{\cftpartaftersnum}{.}
\renewcommand*{\cftpartaftersnumb}{}
\renewcommand*{\cftpartfont}{\large\scshape\hfil}
\renewcommand*{\cftpartpagefont}{\normalsize}
\setlength{\cftbeforepartskip}{\baselineskip}

%	Définir le style des titres dans le texte
\renewcommand{\theheading}{\Roman{heading}}
\newcommand{\headtitlefont}{\Large\scshape\centering}
\newcommand{\headnamefont}{\headtitlefont}
\newcommand{\headnumfont}{\headtitlefont}
\newcommand{\afterheadingnum}{\par\nobreak\vskip\midchapskip}
\newcommand{\printheadingname}{\headnamefont\headingname}
\newcommand{\headingnamenum}{\space}
\newcommand{\printheadingnum}{\headnumfont%
	\if@french
		\ifnum\value{heading}=1	\ordinalstring{heading}[m]%
	\else					\Roman{heading}%
	\fi\fi}
\newcommand{\printheadingtitle}[1]{\headtitlefont#1}

%	Définir le style des titres dans la table des matières
\renewcommand{\cftheadingpresnum}{\space}
\renewcommand{\cftheadingaftersnum}{.}
\renewcommand{\cftheadingaftersnumb}{\mdseries}
\renewcommand{\cftheadingfont}{\large\bfseries}
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
\newcommand{\printsubheadingnum}{\subheadnumfont%
	\if@french
		\ifnum\value{subheading}=1	\ordinalstring{subheading}[m]%
	\else					\Roman{subheading}%
	\fi\fi}
\newcommand{\printsubheadingtitle}[1]{\subheadtitlefont#1}

%	Définir le style des sous-titres dans la table des matières
\renewcommand{\cftsubheadingpresnum}{\space}
\renewcommand{\cftsubheadingaftersnum}{.}
\renewcommand{\cftsubheadingaftersnumb}{\mdseries}
\renewcommand{\cftsubheadingfont}{\normalsize\bfseries}
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
	\ifanappendix					\Alph{chapter}%
	\else\if@french%
		\ifnum\value{chapter}=1		\ordinalstring{chapter}[m]%
		\else						\Roman{chapter}\fi
	\else							\Roman{chapter}%
	\fi\fi}
\renewcommand{\afterchapternum}{~:\par\nobreak\vskip\midchapskip}
\setlength{\beforechapskip}{\baselinestretch\addto@Large}
\addtolength{\beforechapskip}{\baselineskip}
\setlength{\midchapskip}{\baselinestretch\addto@Large}
\setlength{\afterchapskip}{2\baselineskip}}
% Appliquer le style de chapitre généralement (mode normal et mode <article>)
\chapterstyle{frenchlaw}

%	Définir le style des chapitres dans la table des matières
\renewcommand*{\cftchapterpresnum}{\space}
\renewcommand*{\cftchapteraftersnum}{.}
\renewcommand*{\cftchapteraftersnumb}{\mdseries}
\renewcommand{\cftchapterfont}{\bfseries}
\renewcommand*{\cftchapterpagefont}{\normalsize}
\setlength{\cftbeforechapterskip}{\baselineskip}

%	Définir le mode de numérotation des sections et paragraphes
\if@article
	% En mode article, utiliser une numérotation courte (I.A.1.a)
	\renewcommand{\thesection}{\Roman{section}}
	\renewcommand{\thesubsection}{\Alph{subsection}}
	\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
	\renewcommand{\theparagraph}{\alph{paragraph}}
	\renewcommand{\thesubparagraph}{\roman{subparagraph}}
\else
	% En mode normal, utiliser les intitulés classiques
	\renewcommand{\thesection}{\Roman{section}}
	\renewcommand{\thesubsection}{\Roman{subsection}}
	\renewcommand{\thesubsubsection}{\Alph{subsubsection}}
	\renewcommand{\theparagraph}{\arabic{paragraph}}
	\renewcommand{\thesubparagraph}{\alph{subparagraph}}
\fi

%	Replace \vskip with \addvspace at the end of section titles
% Prevents stacking vertical white space when using environments which also add some.
\patchcmd{\@xsect}
	{\vskip\@tempskipa\vskip-\parskip}{\addvspace{\@tempskipa}\addvspace{-\parskip}}
	{}{\typeout{WARNING! Patching \noexpand\@xsect failed!}}

%	Définir la ponctuation après chaque numéro de section et paragraphe
% S'il est défini dans babel, on rajoute le nom donné à la section concernée
% En anglais, les paragraphes suivant les sections ne sont pas indentés
\setsecnumformat{%
	\ifcsname #1name\endcsname\csname #1name\endcsname\space\fi%
	\csname the#1\endcsname.\enskip}

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
\renewcommand*{\cftsectionpresnum}{\space}
\renewcommand*{\cftsectionaftersnum}{.}
\renewcommand*{\cftsectionaftersnumb}{\mdseries}
\renewcommand*{\cftsectionfont}{\bfseries}
\setlength{\cftbeforesectionskip}{\if@longtoc\baselineskip\else0pt\fi}
\renewcommand*{\cftsubsectionpresnum}{\space}
\renewcommand*{\cftsubsectionaftersnum}{.}
\renewcommand*{\cftsubsectionaftersnumb}{\mdseries}
\renewcommand*{\cftsubsectionfont}{\footnotesize\bfseries}
\setlength{\cftbeforesubsectionskip}{\if@longtoc\baselineskip\else0pt\fi}
\renewcommand*{\cftsubsubsectionpresnum}{\space}
\renewcommand*{\cftsubsubsectionaftersnum}{.}
\renewcommand*{\cftsubsubsectionaftersnumb}{\mdseries}
\renewcommand*{\cftsubsubsectionfont}{\footnotesize\bfseries}
\setlength{\cftbeforesubsubsectionskip}{\if@longtoc\baselineskip\else0pt\fi}

%	Définir le style des paragraphes
\setparaheadstyle{\scshape}
\setparaindent{0em}
\setlength{\beforeparaskip}{\baselineskip}
\setlength{\afterparaskip}{\baselineskip}

%	Définir le style des sous-paragraphes
\setsubparaheadstyle{\itshape}
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
	\newcommand{\marginparahead}[1]{\marginpar{\itshape#1}}
	\setparaheadstyle{\marginparahead}
	\setlength{\afterparaskip}{-1em}
	
	% Définir les titres de sous-paragraphes (dans la marge)
	\newcommand{\marginsubparahead}[1]{\marginpar{\itshape#1}}
	\setsubparaheadstyle{\marginsubparahead}
	\setlength{\aftersubparaskip}{-1em}
\fi\fi

%	Définir lz style des paragraphes et sous-paragraphes dans la table des matières
\renewcommand*{\cftparagraphpresnum}{\space}
\renewcommand*{\cftparagraphaftersnum}{.}
\renewcommand*{\cftparagraphaftersnumb}{\mdseries}
\renewcommand*{\cftparagraphfont}{\footnotesize\bfseries}
\setlength{\cftbeforeparagraphskip}{0pt}
\renewcommand*{\cftsubparagraphpresnum}{\space}
\renewcommand*{\cftsubparagraphaftersnum}{.}
\renewcommand*{\cftsubparagraphaftersnumb}{\mdseries}
\renewcommand*{\cftsubparagraphfont}{\footnotesize\bfseries}
\setlength{\cftbeforesubparagraphskip}{0pt}

%	#####	DIVISIONS SPÉCIFIQUES AU DROIT	#####

%	TODO » Sub-para (323-3), article + clause de contrats + documenter

%	Créer un compteur pour les paragraphes (juridiques)
\newcounter{para}
\setcounter{para}{0}

%	Créer les commandes pour paramétrer l'apparence du compteur de paragrpahes
\renewcommand{\thepara}{\arabic{para}}
\newcommand{\paranumsep}{.~}
\newcommand{\parasep}{.\enskip}
\newcommand{\paranumstyle}{\bfseries}
\newcommand{\parastyle}{\normalsize\scshape}

%	Créer des commandes pour paramétrer l'apparence dans la table des matières
\newcommand{\cftparastyle}{}
\newcommand{\cftparanumstyle}{\bfseries}
\newcommand{\cftparaaftersnum}{.\enskip}
\newcommand{\cftparanumsep}{,~}
\newcommand{\cftparaleader}{p.~}
\newcommand{\cftparaafterpnum}{.}
\newcommand{\cftparasep}{\par}

%	Créer un compteur <precis> pour savoir si un \para est le premier de sa section ou non (pour la table des matières)
\newcounter{precis}
\setcounter{precis}{0}
\counterwithin{precis}{book}
\counterwithin{precis}{part}
\counterwithin{precis}{chapter}
\counterwithin{precis}{section}
\counterwithin{precis}{subsection}
\counterwithin{precis}{subsubsection}
\counterwithin{precis}{paragraph}
\counterwithin{precis}{subparagraph}

%	TODO » \if@precis, afficher les \precis{Résumé du paragraphe} (+ retrait de la liste?) @OK \else juste la liste, éventuellement inline (style des PUF) @TODO
%	TODO » Utilité des numéros de page? (imprimer > cf. PUF)
%	TODO » Ajouter une commande manuelle pour insérer le chapitre / section, etc. juste en-dessous du titre (comme pour les labels) (?) + Ajouter autommatiquement à la commande via etoolbox (apptocmd, etc.) -- idem pour les chapitres non numérotés (header et toc)

%	Créer un switch pour imprimer ou non les noms des \para dans le texte
\newcommand{\paragraphnames}{\@paranametrue}
\newcommand{\noparagraphnames}{\@paranamefalse}

%	Créer un switch pour imprimer ou non les \para dans la table des matières
\newcommand{\paratoc}{\@paratoctrue}
\newcommand{\noparatoc}{\@paratocfalse}

%	Créer un switch pour imprimer ou non les \outline dans la table des matières
\newcommand{\summarytoc}{\@summarytrue}
\newcommand{\nosummarytoc}{\@summaryfalse}

%	Créer un switch pour imprimer ou non les \outline dans la table des matières
\newcommand{\outlinetoc}{\@outlinetrue}
\newcommand{\nooutlinetoc}{\@outlinefalse}

%	Créer un switch pour imprimer ou non les \precis dans la table des matières
\newcommand{\precistoc}{\@precistrue}
\newcommand{\noprecistoc}{\@precisfalse}

%	Créer une commande \para pour faire des paragraphes numérotés
\newcommand{\para}[1][]{%
	\refstepcounter{para}%
	\refstepcounter{precis}%
	{\paranumstyle\thepara\ifx\relax#1\relax\label{para:\thepara}\else\label{para:#1}\paranumsep\fi}%
	\if@paraname%
		\if@marginal%
			\marginpar{\parastyle#1}%
		\else%
			{\parastyle#1\parasep}%
	\fi\fi%
	\if@paratoc
		\addtocontents{toc}{%
			\ifnum\value{precis}>1\cftparasep\else%
				\protect\nopagebreak\vskip\baselineskip\par\fi%
			\ifx\relax#1\relax\else
				\protect\noindent%
				{\cftparastyle{\cftparanumstyle\thepara\cftparaaftersnum}
					#1\cftparanumsep\cftparaleader\thepage\cftparaafterpnum}\par\fi}%
	\fi%
	\@ifnextchar\par{\@gobblepar\relax}{\relax}}

%	Créer une commande \precis{} pour indiquer un résumé du paragraphe.
%	TODO » Truver un moyen de supprimer toutes les espaces horizontales / verticales et éventuellement le saut de paragraphe. Placer en début de \para avec des % en fin de ligne, ou en fin de \para (mais tester un \unskip au début du \para)
%	TODO » \@gobble can work but only if the user doesn't add any %
\newcommand{\precis}[1]{%
	\if@precis\bgroup
		\let\footnote\@gobble
		\addtocontents{toc}{%
			\ifx\relax#1\relax\else\noindent#1\par\fi}
	\egroup\fi%
	\@ifnextchar\par{\@gobblepar}{\relax}}

%	Créer un environnement {outline} pour indiquer les passages à copier en ToC.
% On utilise le package {environ} pour récupérer le texte dans l'environnement.
% Utiliser \sanitize[<remplacement>]{<original>} pour retirer les passages problématiques de la ToC. Tester. Sinon utiliser une macro sans argument + \@gobble
\NewEnviron{outline}{%
	\if@outline\bgroup%
		\let\footnote\@gobble%
		\let\sanitize\@gobble%
		\addtocontents{toc}{%
			\ifx\relax\BODY\relax\else%
				\vskip-\lastskip\vskip\baselineskip\BODY\par\fi}%
	\egroup\fi%
	\BODY%
	\@ifnextchar\par{\@gobblepar}{\relax}}

%	Env. {summary} >> avec les {blockquotation}

% \newcommand{\outline}[1]{%
% 	\if@outline
% 		\addtocontents{toc}{\protect\printprecis{%
% 			\ifx\relax#1\relax\else\protect\nopagebreak%
% 			\noindent#1\vspace{\baselineskip}\par\fi}}\fi%
% 	\@ifnextchar\par{\@gobblepar}{\relax}}

%	TODO » Créer une commande unique, type \para[<para>][<précis>], avec un ToC \par implicite si #2 est inexistant, sinon on est obligé de mettre un \precis{} avant toute nouvelle section qui requiert un \par dans la ToC

%	Créer les commandes pour faire référence à un numéro
\newcommand{\infra}[1]{Cf.~\emph{infra} \no\ref{para:#1}}
\newcommand{\supra}[1]{Cf.~\emph{supra} \no\ref{para:#1}}

%	TODO » A déplacer + documenter
%	Créer une commande pour indiquer que le sujet est traité en note
\newcommand{\note}[1]{#1~(\emph{n.})}% dans les index, utiliser: |note

%	TODO » Créer une commande pour des superscripts utilités dans une exégèse
\newcommand{\glose}[1]{\emph{#1).~}\ignorespaces}
\newcommand{\glosemark}[1]{\textsuperscript{\thinspace\emph{#1)}}}


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

%	Définir un environnement <minipage> qui respecte l'alignement vertical
\newenvironment{minipage*}[2][t]
	{\minipage[#1]{#2}}
	{\par\xdef\tpd{\the\prevdepth}\endminipage\par\prevdepth\tpd}

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


%	Définir le style des labels des descriptions
\renewcommand{\descriptionlabel}[1]{\scshape{\hfill#1:}}
\renewcommand{\blockdescriptionlabel}[1]{\scshape{\hfill#1:}}
\newcommand{\summarylabel}[1]{\scshape{\hfill\summaryname:}}
\newcommand{\vitaelabel}[1]{\footnotesize\itshape{\hfill\strut#1:\strut}}

%	TODO » Placer avec les commandes babel +  Défaut == "En résumé"
\newcommand{\summaryname}{Pour l'essentiel}

%	TODO » Revoir les espacements horizontaux des descriptions
%	Modifier l'environnement <description>
\renewenvironment{description}
	{\list{}{\let\makelabel\descriptionlabel
			 \setlength{\leftmargin}{2\parindent}}}
	{\endlist}

%	Modifier l'environnement <blockdescription>
\renewenvironment{blockdescription}%
	{\list{}{\vskip\baselineskip
			 \let\makelabel\blockdescriptionlabel
			 \setlength{\itemsep}{\baselineskip}
			 \setlength{\leftmargin}{2\parindent}}}%
	{\vskip\baselineskip\endlist}

%	Créer un environnement <summmary> pour des conclusions avec un label prédéfini
\NewEnviron{summary}
	{\if@summary\bgroup%
		\let\footnote\@gobble%
		\let\sanitize\@gobble%
		\addtocontents{toc}{%
			\ifx\relax\BODY\relax\else%
				\protect\nopagebreak\vspace{\baselineskip}%
				\textsc{\summaryname}: \BODY\par\fi}%
	\egroup\fi%
	\list{}{\vskip\baselineskip%
			\let\makelabel\summarylabel%
			\setlength{\itemsep}{\baselineskip}%
			\setlength{\leftmargin}{2\parindent}}%
	 \needspace{2\baselineskip}\item\BODY%
	 \vskip\baselineskip\endlist}

%	Créer un environnement <vitae> pour les CV (label dans la marge)
\newenvironment{vitae}
	{\list{}{\let\makelabel\vitaelabel
			 \setlength{\leftmargin}{\z@}
			 \setlength{\labelwidth}{\marginparwidth}}}
	{\endlist}

%	TODO » Appliquer \idemindent si le texte est en français (<quote>, <quotation>)

%	Appliquer à l'environnement quote    
\renewenvironment{quote}%
	{\list{}{\setlength{\itemindent}{\z@}%
			 \setlength{\leftmargin}{\parindent}}%
	 \small\item[]\ignorespaces}
	{\endlist}

%	Appliquer à l'environnement quotation
\renewenvironment{quotation}%
	{\list{}{\setlength{\itemindent}{\parindent}%
			 \setlength{\leftmargin}{\parindent}}%
	 \small\item[]\ignorespaces}
	{\endlist}

%	Définir le style des épigraphes
\epigraphfontsize{\normalsize}
\setlength{\epigraphwidth}{.5\textwidth}
\setlength{\epigraphrule}{0pt}
\setlength{\beforeepigraphskip}{0pt}
\setlength{\afterepigraphskip}{2\baselineskip}
%
%	TODO » Documenter les minipages, utiliser \footnotemark et \footnotetext pour des notes
%	Définir le format de la citation de l'épigraphe
\renewcommand{\@epitext}[1]{%
	\begin{minipage*}{\epigraphwidth}\begin{\textflush}#1\end{\textflush}\end{minipage*}
}

%	Redéfinir le format de la source de l'épigraphe
\renewcommand{\@episource}[1]{%
	\begin{minipage*}{\epigraphwidth}\begin{\sourceflush}---~#1\end{\sourceflush}\end{minipage*}
}

%	Redéfinir la commande des épigraphes simples
\renewcommand{\epigraph}[2]{
	\vspace*{\beforeepigraphskip}
	{\begin{\epigraphflush}
		\epigraphsize
		\@epitext{#1}\par\vspace{\baselineskip}
		\@episource{#2}\par
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
\makeindex[\jobname-law]

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

\newcommand{\indexparagraphs}{\@indexparagraphstrue}
\newcommand{\indexpages}{\@indexparagraphsfalse}

%	Faire en sorte que les index renvoient aux numéros de paragraphes
%	TODO » Define lastpara and save it in .aux. Run twice before indexing. Ou en faire une option activée avec les types de documents...
%\ifnum\value{lastpara}>0
	\if@indexparagraphs
		\renewcommand{\preindexhook}{%
			Les numéros renvoient aux paragraphes et non aux pages.\vspace{2\baselineskip}}
		\newcommand{\paraindex}[1]{\specialindex{\jobname}{para}{#1}}
		\newcommand{\bibindex}[1]{\specialindex{\jobname-bib}{para}{#1}}
		\newcommand{\lawindex}[1]{\specialindex{\jobname-law}{para}{#1}}
		\AtBeginDocument{\let\index\paraindex}
	%\fi
	\else
		\newcommand{\bibindex}[1]{\index{\jobname-bib}{#1}}
		\newcommand{\lawindex}[1]{\index{\jobname-law}{#1}}
\fi

%	#####	CRÉATION DES BIBLIOGRAPHIES (BIBLATEX)	#####

%	Charger <biblatex> avec les options
\usepackage[mincrossrefs=2,autolang=other*,style=frenchlaw,backend=biber,indexing=cite]{biblatex}

%	Indexer automatiquement les noms des auteurs cités
\DeclareIndexNameFormat{default}{%
	\usebibmacro{index:name}{\bibindex}{#1@\textsc{#1}}{#3}{#5}{#7}}
% \DeclareIndexFieldFormat{default}{\lawindex{#1}}

% Problèmes:
%	- Sorting des postnotes (??)
%	  Break au premier non-integer pour le classement.
%	- Ajouter "art." avant. ± les "anc." des prenotes (ou CNap directement).
%	- Pour les types autres que législation, mettre ça dan sli'ndex par auteur
%	  Cf. index:name:title dans biblatex.def
\DeclareIndexFieldFormat{indextitle}{%
	\usebibmacro{index:entry}%
		{\lawindex}
		{\mkbibindexfield{\thefield{indexsorttitle}}{#1}%
		 \mkbibindexsubentry{\thefield{postnote}}{\textbf{\thefield{postnote}}}}}

\renewbibmacro{bibindex}{\ifbibindex{\indexnames{labelname}}{}}
\renewbibmacro{citeindex}{%
	\ifciteindex
		{\indexnames{labelname}%
		 \indexfield{indextitle}}
		{}}

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

%	TODO » Supprimer: Ajouter le \setcounter{page} dans la définition de \title et imprimer le titre.
%	En mode <didactic>, utiliser une nouvelle division logique pour les headers
\newcounter{division}
\def\@division{\relax}
\newcommand{\division}[1]{%
	\clearpage
	\def\@division{#1}%
	\refstepcounter{division}%
	\setcounter{section}{0}
	\if@didactic
		\setcounter{page}{1}%
	\else
		{\Large\scshape\raggedright\thedivision. \@division}
		\par\addvspace{\baselineskip}
	\fi
}
\renewcommand{\thedivision}{\arabic{division}}
\newcommand{\afterdivnum}{.~}



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

%	TODO » Idem pour les annexes > \makeappendix == \appendixpage + \appendix, cf. memoir
%	TODO » Adde une ligne vierge en ToC
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


%	TODO » Ranger. Fleuron pour séparer les sections + harmoniser avec celui utilisé pour la doc

\newcommand{\sectionbreak}[1][\adfast{3}\quad\adfast{3}\quad\adfast{3}]{%
	\needspace{\baselineskip}
	\addvspace{\baselineskip}
	{\noindent\centering#1\par}%
	 \addvspace{\baselineskip}}

\newcommand{\chapterbreak}[1][\adforn{21}\quad\adfast{3}\quad\adforn{49}]{%
	\needspace{\baselineskip}
	\addvspace{\baselineskip}
	{\noindent\centering#1\par}%
	\addvspace{\baselineskip}%
	\if@longtoc\addtocontents{toc}{\vspace{\baselineskip}}\fi}

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

%	TODO » Implémenter <hyperref>
%\RequirePackage{hyperref}% Mais crée des bugs avec les références type \supra

%	TODO » Définir une commande pour les \todo

% Fin