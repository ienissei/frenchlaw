%%
%%   This is file "frenchlaw.cls", which is part of the "frenchlaw" package
%%   Copyright 2009--2018: Fora VERN -- ienissei (at) gmail (dot) com
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
	[2018/08/24 v.0.9. Versatile document class for French law, based on memoir]


% =***======***======***======***======***======***======***======***======***======***=


%	#####	CLASS OPTIONS	#####

%	Load <xkeyval>
\RequirePackage{xkeyval}

%	SWITCHES

%	Page layout
\newif\if@stockaiv
	\@stockaivfalse
\newif\if@stockav
	\@stockavfalse
\newif\if@stockavi
	\@stockavifalse
\newif\if@oneside
	\@onesidefalse
\newif\if@landscape
	\@landscapefalse
\newif\if@marginal
	\@marginalfalse

%	Typefaces
\newif\if@tenpoints
	\@tenpointsfalse
\newif\if@elevenpoints
	\@elevenpointsfalse
\newif\if@twelvepoints
	\@twelvepointsfalse
\newif\if@fourteenpoints
	\@fourteenpointsfalse
\newif\if@sansserif
	\@sansseriffalse

%	Document style
\newif\if@article
	\@articlefalse
\newif\if@didactic
	\@didacticfalse
\newif\if@letter
	\@letterfalse
\newif\if@vitae
	\@vitaefalse
\newif\if@stationery
	\@stationeryfalse

%	Document features
\newif\if@draft
	\@draftfalse
\newif\iflongcv
	\longcvtrue
\newif\if@paraname
	\@paranametrue
\newif\if@precis
	\@precisfalse
\newif\if@outline
	\@outlinefalse
\newif\if@summary
	\@summaryfalse
\newif\if@indexparagraphs
	\@indexparagraphstrue
\newif\if@require@lastpage
	\@require@lastpagefalse

%	Developer features
\newif\if@dev
	\@devfalse
\newif\if@grid
	\@gridfalse

%	LAYOUT OPTIONS

%	Define options for paper size <a4paper>, <a5paper> & <a6paper>
\DeclareOptionX{a4paper}{
	\@stockaivtrue
	\@stockavfalse\@stockavifalse
	\@twelvepointstrue
	\@tenpointsfalse\@elevenpointsfalse\@fourteenpointsfalse
	\PassOptionsToClass{a4paper,12pt}{memoir}
}
\DeclareOptionX{a5paper}{
	\@stockavtrue
	\@stockaivfalse\@stockavifalse
	\@twelvepointstrue
	\@tenpointsfalse\@elevenpointsfalse\@fourteenpointsfalse
	\PassOptionsToClass{a5paper,12pt}{memoir}
}
\DeclareOptionX{a6paper}{
	\@stockavitrue
	\@stockaivfalse\@stockavfalse
	\@tenpointstrue
	\@elevenpointsfalse\@twelvepointsfalse\@fourteenpointsfalse
	\PassOptionsToClass{a6paper,10pt}{memoir}
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

%	Define option for <landscape> format
\DeclareOptionX{landscape}{
	\@landscapetrue
	\PassOptionsToClass{landscape}{memoir}
}

%	Define option for <marginal> layout
\DeclareOptionX{marginal}{
	\@marginaltrue
}

%	TYPOGRAPHY OPTIONS

%	Define options for font sizes <10pt>, <11pt> & <12pt>
\DeclareOptionX{10pt}{
	\@tenpointstrue
	\@elevenpointsfalse\@twelvepointsfalse\@fourteenpointsfalse
	\PassOptionsToClass{10pt}{memoir}
}
\DeclareOptionX{11pt}{
	\@elevenpointstrue
	\@tenpointsfalse\@twelvepointsfalse\@fourteenpointsfalse
	\PassOptionsToClass{11pt}{memoir}
}
\DeclareOptionX{12pt}{
	\@twelvepointstrue
	\@tenpointsfalse\@elevenpointsfalse\@fourteenpointsfalse
	\PassOptionsToClass{12pt}{memoir}
}
\DeclareOptionX{14pt}{
	\@fourteenpointstrue
	\@tenpointsfalse\@elevenpointsfalse\@twelvepointsfalse
	\PassOptionsToClass{14pt}{memoir}
}

\DeclareOptionX{serif}{
	\@sansseriffalse
}

\DeclareOptionX{sans-serif}{
	\@sansseriftrue
}

%	Define an option to change line spacing
\DeclareOptionX{linespacing}[1.1]{\def\custom@baselinestretch{#1}}

%	LANGUAGE OPTIONS

%	Define options to change the main language of the document
\DeclareOptionX{british}{
	\PassOptionsToPackage{british}{babel}
	\PassOptionsToPackage{british}{fmtcount}
	\AtEndOfClass{\main@language{british}}
}
\DeclareOptionX{english}{
	\PassOptionsToPackage{british}{babel}
	\PassOptionsToPackage{british}{fmtcount}
	\AtEndOfClass{\main@language{british}}
}
\DeclareOptionX{french}{
	\PassOptionsToPackage{french}{babel}
	\PassOptionsToPackage{french}{fmtcount}
	\AtEndOfClass{\main@language{french}}
}
%	Define options to load secondary languages
\DeclareOptionX{italian}{\PassOptionsToPackage{italian}{babel}}
\DeclareOptionX{german}{\PassOptionsToPackage{german}{babel}}
\DeclareOptionX{spanish}{\PassOptionsToPackage{spanish}{babel}}

%	STYLE OPTIONS

%	Define option for <article> document style
\DeclareOptionX{article}{
	\@articletrue
	\PassOptionsToClass{article}{memoir}
}

%	Define option for <didactic> document style
\DeclareOptionX{didactic}{
	\@didactictrue
	\@articletrue
	\@tenpointstrue
	\@elevenpointsfalse\@twelvepointsfalse\@fourteenpointsfalse
	\@twosidefalse\@onesidetrue
	\PassOptionsToClass{10pt,oneside,twocolumn,article}{memoir}
}
\DeclareOptionX{didactic+}{
	\@didactictrue
	\@fourteenpointstrue
	\@tenpointsfalse\@elevenpointsfalse\@twelvepointsfalse
	\@twosidefalse\@onesidetrue
	\PassOptionsToClass{14pt,oneside,article}{memoir}
}

%	Define option for <letter> document style
\DeclareOptionX{letter}{
	\@lettertrue
	\@sansseriftrue
	\@stationerytrue
	\@elevenpointstrue
	\@tenpointsfalse\@twelvepointsfalse\@fourteenpointsfalse
	\@twosidefalse\@onesidetrue
	\PassOptionsToClass{11pt,oneside}{memoir}
}

%	Define option for <vitae> document style
\DeclareOptionX{vitae}{
	\@vitaetrue
	\@sansseriftrue
	\@stationerytrue
	\@elevenpointstrue
	\@tenpointsfalse\@twelvepointsfalse\@fourteenpointsfalse
	\@marginaltrue
	\@twosidefalse\@onesidetrue
	\PassOptionsToClass{11pt,oneside}{memoir}
}

%	FEATURE OPTIONS

%	Define options for <final> & <draft>
\DeclareOptionX{draft}{
	\@drafttrue
	\PassOptionsToClass{draft}{memoir}
}
\DeclareOptionX{draft+}{
	\@drafttrue
}
\DeclareOptionX{final}{
	\@draftfalse
	\PassOptionsToClass{final}{memoir}
}

%	Define option <short> for convertible documents
\DeclareOptionX{short}{
	\longcvfalse
}

%	Define options for <outline> & <summary> table of contents
\DeclareOptionX{outline}{
	\@outlinetrue
	\@summarytrue
	\@precistrue
}
\DeclareOptionX{summary}{
	\@summarytrue
	\@precistrue
}

%	Define an option to change indexing (pages or paragraphs)
\newcommand{\set@indexparagraphs}{\@indexparagraphstrue}
\newcommand{\set@indexpages}{\@indexparagraphsfalse}
\DeclareOptionX{index}[paragraphs]{
	\ifcsname set@index#1\endcsname
		\csname set@index#1\endcsname
	\else
		\AtEndDocument{\ClassWarningNoLine{frenchlaw}{%
			Unknown option index=#1, \MessageBreak
			Valid arguments are: "pages", "paragraphs"
			Reverting to default: index=paragraphs}}%
	\fi
}

%	DEVELOPER FEATURES

%	Define <developer> option (see frenchlaw-dev)
\DeclareOptionX{developer}{
	\@devtrue
}

%	Define <grid> option (see frenchlaw-dev)
\DeclareOptionX{vgrid}{
	\@devtrue
	\@gridtrue
}

%	IMPLEMENT OPTIONS, LOAD DEPENDENCIES

%	Pass all undefined options to <memoir>
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{memoir}}

%	Execute and process options
\ExecuteOptionsX{a4paper,twoside,12pt,french,linespacing=1.1}
\ProcessOptionsX\relax

%	Load the main dependencies
\LoadClass{memoir}
\RequirePackage{etoolbox,environ,fmtcount,graphicx,numprint,url,xcolor,xspace}
% \RequirePackage{pdfpages}%	TODO » Pertinence (?)

%	Deactivate incompatible options
% Option <twocolumn> always defeats option <marginal>
\if@marginal\if@twocolumn\@marginalfalse\fi\fi
\if@stockavi\if@elevenpoints\@tenpointstrue\@elevenpointsfalse\fi\fi
\if@stockavi\if@twelvepoints\@tenpointstrue\@twelvepointsfalse\fi\fi
\if@stockavi\if@fourteenpoints\@tenpointstrue\@fourteenpointsfalse\fi\fi

%	Set \baselinestretch to the ratio given in the option
% The value given in the <linespacing> option must be either a number or one of the preset values.
\ifdefstring{\custom@baselinestretch}{simple}
	{\def\baselinestretch{.83}\selectfont}
	{\ifdefstring{\custom@baselinestretch}{median}
		{\def\baselinestretch{1.25}\selectfont}
		{\ifdefstring{\custom@baselinestretch}{double}
			{\def\baselinestretch{1.66}\selectfont}
			{\def\baselinestretch{\custom@baselinestretch}\selectfont}}}


% =***======***======***======***======***======***======***======***======***======***=


%	#####	LANGUAGES	#####

%	TODO » À documenter !!

%	TODO » Suppr. la langue <english> après avoir converti automatiquement via biber
\RequirePackage[greek,latin,english,british,french]{babel}

%	TODO » Implémenter {csquotes} et le documenter
\RequirePackage{frenchlaw-babel}
\RequirePackage{fixltxhyph}

%	LANGUAGE COMMANDS

%	Create quick macros for switching languages
\newcommand{\british}[1]{\foreignlanguage{british}{\emph{#1}}}
\newcommand{\english}[1]{\foreignlanguage{english}{\emph{#1}}}
\newcommand{\french}[1]{\foreignlanguage{french}{\emph{#1}}}

\newcommand{\greek}[1]{\foreignlanguage{greek}{#1}}
\newcommand{\latin}[1]{\foreignlanguage{latin}{\emph{#1}}}

\newcommand{\german}[1]{\foreignlanguage{german}{\emph{#1}}}
\newcommand{\italian}[1]{\foreignlanguage{italian}{\emph{#1}}}
\newcommand{\spanish}[1]{\foreignlanguage{spanish}{\emph{#1}}}


% =***======***======***======***======***======***======***======***======***======***=


%	#####	PAGE LAYOUT	#####

%	Define the size of page headers & footers
\setlength{\headsep}{\baselineskip}
\setlength{\headheight}{2\baselineskip}
\setlength{\footskip}{2\baselineskip}

%	Define the size of the type block depending on the paper size
% The block proportions follow the golden number, as in the medieval method
% Use a narrower type block in letters and other stationery documents
\if@stockaiv
	\if@landscape
		\settypeblocksize{424pt}{*}{1.618}
	\else\if@stationery
		\settypeblocksize{*}{400pt}{1.715}
		\setlength{\headsep}{2\baselineskip}
	\else
		\settypeblocksize{*}{424pt}{1.618}
	\fi\fi
\else\if@stockav
	\if@landscape
		\settypeblocksize{300pt}{*}{1.618}
	\else
		\settypeblocksize{*}{300pt}{1.618}
	\fi
	\if@fourteenpoints
		\setlength{\headheight}{1.5\baselineskip}
	\setlength{\footskip}{\baselineskip}
	\fi
	\setlength{\footskip}{1.5\baselineskip}
\else\if@stockavi
	\if@landscape
		\settypeblocksize{212pt}{*}{1.618}
	\else
		\settypeblocksize{*}{212pt}{1.618}
	\fi
	\setlength{\headsep}{.5\baselineskip}
	\setlength{\footskip}{1.5\baselineskip}
\fi\fi\fi

%	Define the size and proportion of the margins depending on the layout options
\setulmargins{*}{*}{1}
\if@marginal
	\if@twoside
		% Asymmetrical margins, 2:1 ratio with <marginal>
		\setlrmargins{*}{*}{2}
	\else
		% Asymmetrical margins, 2:1 ratio with <marginal>
		% Set margin on the left if <oneside> (inverted)
		\setlrmargins{*}{*}{.5}
	\fi
\else
	\if@twoside
		% Asymmetrical margins, 1.33:1 ratio in normal mode
		\setlrmargins{*}{*}{1.33}
	\else
		% Symmetrical margins, 1:1 ratio in normal mode, with <oneside>
		\setlrmargins{*}{*}{1}
	\fi
\fi

%	Check & fix the layout
\checkandfixthelayout

%	Prevent PDF scaling on print
\ifxetex
	\special{pdf:docview<</ViewerPreferences<</PrintScaling/None>>>>}
\else
	% \ifluatex\RequirePackage{luatex85}\fi
	\pdfcatalog{/ViewerPreferences<</PrintScaling/None>>}
\fi


% =***======***======***======***======***======***======***======***======***======***=


%	#####	TYPOGRAPHY	#####

%	TYPEFACES

%	Load fonts and packages comme to LaTeX and XeLaTeX
\RequirePackage{adforn,mathpazo}

\ifxetex
	%	Load XeLaTeX fonts
	\RequirePackage{fontspec}
	\defaultfontfeatures{
		Ligatures = {TeX},
		Numbers = {OldStyle},
		SmallCapsFeatures = {WordSpace = 1.2, LetterSpace=3.0}}
	\setmainfont[	Extension		= .ttf,
					UprightFont		= *,
					ItalicFont		= *-Italic,
					BoldFont		= *-Bold,
					BoldItalicFont	= *-BoldItalic ]
					{Junicode}
	\setsansfont[	Extension		= .otf,
					UprightFont		= *-Regular,
					ItalicFont		= *-RegularIt,
					BoldFont		= *-Bold,
					Scale			= MatchLowercase ]
					{SourceSansPro}
	\setmonofont[	Extension		= .otf,
					UprightFont		= *-regular,
					ItalicFont		= *-italic,
					Numbers			= Lining,
					Scale			= MatchLowercase ]
					{lmmono10}
	% Create a command for acronyms (adds same inter-letter spacing as with small-caps)
	\newcommand{\acronym}[1]{{\addfontfeatures{LetterSpace=3.0} #1}}
	\RequirePackage{microtype}
\else
	\RequirePackage[utf8]{inputenc}% OLD: \AtEndOfClass{\usepackage[utf8]{inputenc}} (?)
	\RequirePackage[T1]{fontenc}
	\RequirePackage{lmodern}
	\RequirePackage[osf,scale=.85]{sourcesanspro}
	\RequirePackage[osf]{ebgaramond}
	\renewcommand*{\ttdefault}{lmtt}
	\newcommand{\acronym}[1]{#1}
	\RequirePackage[tracking,letterspace=30]{microtype}
\fi

%	FONT SIZE AND LEADING

%	Create dimensions that will be used to calculate vertical compensation
% This provides vertical alignment, as long as headings are one-liners
\newdimen\addto@miniscule
\newdimen\addto@tiny
\newdimen\addto@large
\newdimen\addto@Large
\newdimen\addto@LARGE
\newdimen\addto@huge
\newdimen\addto@Huge
\newdimen\addto@HUGE

%	Define font sizes for <10pt>
\if@tenpoints
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

%	Define font sizes for <11pt>
\else\if@elevenpoints
	\renewcommand*{\scriptsize}{\fontsize{9}{13.6}\selectfont}
	\renewcommand*{\footnotesize}{\fontsize{9}{13.6}\selectfont}
	\renewcommand*{\small}{\fontsize{10}{13.6}\selectfont}
	\renewcommand*{\normalsize}{\fontsize{11}{13.6}\selectfont}
	
	\renewcommand*{\miniscule}{\fontsize{7}{8}\selectfont}
	\renewcommand*{\tiny}{\fontsize{8}{9}\selectfont}
	
	\renewcommand*{\large}{\fontsize{13}{16}\selectfont}
	\renewcommand*{\Large}{\fontsize{16}{19}\selectfont}
	\renewcommand*{\LARGE}{\fontsize{19}{23}\selectfont}
	\renewcommand*{\huge}{\fontsize{23}{28}\selectfont}
	\renewcommand*{\Huge}{\fontsize{28}{34}\selectfont}
	\renewcommand*{\HUGE}{\fontsize{34}{42}\selectfont}
	
	% Define compensations for <11pt>
	\addto@miniscule=5.6pt
	\addto@tiny=4.6pt
	\addto@large=11.2pt
	\addto@Large=8.2pt
	\addto@LARGE=4.2pt
	\addto@huge=12.8pt
	\addto@Huge=6.8pt
	\addto@HUGE=12.4pt

%	Define font sizes for <12pt>
\else\if@twelvepoints
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

%	Define font sizes for <14pt>
\else\if@fourteenpoints
	\renewcommand*{\scriptsize}{\fontsize{10}{17.5}\selectfont}
	\renewcommand*{\footnotesize}{\fontsize{11}{17.5}\selectfont}
	\renewcommand*{\small}{\fontsize{12}{17.5}\selectfont}
	\renewcommand*{\normalsize}{\fontsize{14}{17.5}\selectfont}
	
	\renewcommand*{\miniscule}{\fontsize{8}{10}\selectfont}
	\renewcommand*{\tiny}{\fontsize{9}{11.5}\selectfont}
	
	\renewcommand*{\large}{\fontsize{17}{21.5}\selectfont}
	\renewcommand*{\Large}{\fontsize{20}{25}\selectfont}
	\renewcommand*{\LARGE}{\fontsize{25}{30.5}\selectfont}
	\renewcommand*{\huge}{\fontsize{30}{37}\selectfont}
	\renewcommand*{\Huge}{\fontsize{36}{45}\selectfont}
	\renewcommand*{\HUGE}{\fontsize{48}{60}\selectfont}
	
	% Define compensations for <14pt>
	\addto@miniscule=7.5pt
	\addto@tiny=6pt
	\addto@large=13.5pt
	\addto@Large=10pt
	\addto@LARGE=4.5pt
	\addto@huge=15.5pt
	\addto@Huge=7.5pt
	\addto@HUGE=10pt
\fi\fi\fi\fi

%	Create a command to set all font sizes to a multiple of the standard \baselineskip
\newcommand{\normalize@fontsize}{%
	\if@tenpoints
		\renewcommand*{\miniscule}{\fontsize{6}{12}\selectfont}
		\renewcommand*{\tiny}{\fontsize{7}{12}\selectfont}
		\renewcommand*{\large}{\fontsize{12}{12}\selectfont}
		\renewcommand*{\Large}{\fontsize{15}{24}\selectfont}
		\renewcommand*{\LARGE}{\fontsize{18}{24}\selectfont}
		\renewcommand*{\huge}{\fontsize{22}{24}\selectfont}
		\renewcommand*{\Huge}{\fontsize{27}{36}\selectfont}
		\renewcommand*{\HUGE}{\fontsize{32}{36}\selectfont}
	\else\if@elevenpoints
		\renewcommand*{\miniscule}{\fontsize{7}{13.5}\selectfont}
		\renewcommand*{\tiny}{\fontsize{8}{13.6}\selectfont}
		\renewcommand*{\large}{\fontsize{12}{13.6}\selectfont}
		\renewcommand*{\Large}{\fontsize{15}{27.2}\selectfont}
		\renewcommand*{\LARGE}{\fontsize{18}{27.2}\selectfont}
		\renewcommand*{\huge}{\fontsize{23}{27.2}\selectfont}
		\renewcommand*{\Huge}{\fontsize{28}{40.8}\selectfont}
		\renewcommand*{\HUGE}{\fontsize{34}{40.8}\selectfont}
	\else\if@twelvepoints
		\renewcommand*{\miniscule}{\fontsize{7}{14.5}\selectfont}
		\renewcommand*{\tiny}{\fontsize{8}{14.5}\selectfont}
		\renewcommand*{\large}{\fontsize{14}{14.5}\selectfont}
		\renewcommand*{\Large}{\fontsize{17}{29}\selectfont}
		\renewcommand*{\LARGE}{\fontsize{20}{29}\selectfont}
		\renewcommand*{\huge}{\fontsize{25}{29}\selectfont}
		\renewcommand*{\Huge}{\fontsize{30}{43.5}\selectfont}
		\renewcommand*{\HUGE}{\fontsize{36}{43.5}\selectfont}
	\else\if@fourteenpoints
		\renewcommand*{\miniscule}{\fontsize{8}{17.5}\selectfont}
		\renewcommand*{\tiny}{\fontsize{9}{17.5}\selectfont}
		\renewcommand*{\large}{\fontsize{17}{17.5}\selectfont}
		\renewcommand*{\Large}{\fontsize{20}{35}\selectfont}
		\renewcommand*{\LARGE}{\fontsize{25}{35}\selectfont}
		\renewcommand*{\huge}{\fontsize{30}{35}\selectfont}
		\renewcommand*{\Huge}{\fontsize{36}{52.5}\selectfont}
		\renewcommand*{\HUGE}{\fontsize{48}{52.5}\selectfont}
	\fi\fi\fi\fi}

%	Always use raggedbottom (prevents underfull \vbox warnings)
\raggedbottom
%	Never use double spaces after a period
\frenchspacing

%	PARAGRAPHS

%	Set penalties and demerits
\if@twocolumn
	\widowpenalties=3 300 100 -150 % Discourage widows [Orig. 3 150 0 0]
	\clubpenalties=3 300 100 -150 % Discourage orphans [Orig. 3 150 0 0]
\else
	\widowpenalties=3 20000 1000 -150 % Discourage widows [Orig. 3 150 0 0]
	\clubpenalties=3 20000 1000 -150 % Discourage orphans [Orig. 3 150 0 0]
\fi
\hyphenpenalty=100 % Discourage hyphens [Orig. 50]
\exhyphenpenalty=500 % Discourage hyphens in compound nouns [Orig. 50]
\brokenpenalty=10000 % Discourage hyphens at the end of pages [Orig. 100]
\doublehyphendemerits=1000000 % Discourage consecutive hyphens [Orig. 10000]
\finalhyphendemerits=100000000 % Discourage end of paragraph hyphens [Orig. 5000]

%	Define indentation and vertical spacing of paragraphs
\if@stationery
	% Paragraphs are aligned with the left margin in stationery documents
	\setlength{\parskip}{\baselineskip}
	\setlength{\parindent}{0em}
\else
	% Päragraphs are indented in regular documents
	\setlength{\parskip}{\z@}
	\setlength{\parindent}{1.5em}
\fi

%	Prevent excessively short or long lines at the end of paragraphs
\setlength{\parfillskip}{2ex plus \dimexpr\linewidth-3em}


% =***======***======***======***======***======***======***======***======***======***=


%	####	TABLES OF CONTENTS	####

%	SET UP TABLE OF CONTENTS

%	Define max ToC numbering
\maxtocdepth{subparagraph}
% \setcounter{tocdepth}{6} % TODO » Remove

%	Do not pritn page numbers in ToC for <book> and <part> (centered)
\cftpagenumbersoff{book}
\cftpagenumbersoff{part}

%	Create ToC subdivisions for <heading> and <subheading>
\newlistentry[part]{heading}{toc}{-1}
\newlistentry[heading]{subheading}{toc}{-1}

%	TABLE OF CONTENTS TYPOGRAPhY

%	Define ToC style for \book
\renewcommand*{\cftbookpresnum}{\space}
\renewcommand*{\cftbookaftersnum}{.}
\renewcommand*{\cftbookaftersnumb}{}
\renewcommand*{\cftbookfont}{\large\scshape\hfil}
\renewcommand*{\cftbookpagefont}{\normalsize}
\setlength{\cftbeforebookskip}{2\baselineskip}

%	Define ToC style for \part
\renewcommand*{\cftpartpresnum}{\space}
\renewcommand*{\cftpartaftersnum}{.}
\renewcommand*{\cftpartaftersnumb}{}
\renewcommand*{\cftpartfont}{\large\scshape\hfil}
\renewcommand*{\cftpartpagefont}{\normalsize}
\setlength{\cftbeforepartskip}{\baselineskip}

%	Define ToC style for \heading
\renewcommand{\cftheadingaftersnum}{.}
\renewcommand{\cftheadingaftersnumb}{\mdseries}
\renewcommand{\cftheadingfont}{\large\bfseries}
\renewcommand{\cftheadingleader}{\hfill}
\setlength{\cftbeforeheadingskip}{\baselineskip}

%	Define ToC style for \subheading
\renewcommand{\cftsubheadingaftersnum}{.}
\renewcommand{\cftsubheadingaftersnumb}{\mdseries}
\renewcommand{\cftsubheadingfont}{\normalsize\bfseries}
\renewcommand{\cftsubheadingleader}{\hfill}
\setlength{\cftbeforesubheadingskip}{\baselineskip}

%	Define ToC style for \chapter
\renewcommand*{\cftchapteraftersnum}{.}
\renewcommand*{\cftchapteraftersnumb}{\mdseries}
\renewcommand{\cftchapterfont}{\bfseries}
\renewcommand*{\cftchapterpagefont}{\normalsize}
\setlength{\cftbeforechapterskip}{\baselineskip}

%	Define ToC style for \section
\renewcommand*{\cftsectionaftersnum}{.}
\renewcommand*{\cftsectionaftersnumb}{\mdseries}
\renewcommand*{\cftsectionfont}{\bfseries}
\setlength{\cftbeforesectionskip}{\z@}

%	Define ToC style for \subsection
\renewcommand*{\cftsubsectionaftersnum}{.}
\renewcommand*{\cftsubsectionaftersnumb}{\mdseries}
\renewcommand*{\cftsubsectionfont}{\footnotesize\bfseries}
\setlength{\cftbeforesubsectionskip}{\z@}

%	Define ToC style for \subsubsection
\renewcommand*{\cftsubsubsectionaftersnum}{.}
\renewcommand*{\cftsubsubsectionaftersnumb}{\mdseries}
\renewcommand*{\cftsubsubsectionfont}{\footnotesize\bfseries}
\setlength{\cftbeforesubsubsectionskip}{\z@}

%	Define ToC style for \paragraph
\renewcommand*{\cftparagraphaftersnum}{.}
\renewcommand*{\cftparagraphaftersnumb}{\mdseries}
\renewcommand*{\cftparagraphfont}{\footnotesize\bfseries}
\setlength{\cftbeforeparagraphskip}{\z@}

%	Define ToC style for \subparagraph
\renewcommand*{\cftsubparagraphaftersnum}{.}
\renewcommand*{\cftsubparagraphaftersnumb}{\mdseries}
\renewcommand*{\cftsubparagraphfont}{\footnotesize\bfseries}
\setlength{\cftbeforesubparagraphskip}{\z@}

%	TABLE OF CONTENTS HORIZONTAL SPACING

%	TODO » Hook: Babel loads languages at begin document.
% Créer un switch pour enregistrer, dès les options, la langue principale dans une macro, puis appliquer \if@french\selectlanguage{french} (et le mettre juste après babel)
% Préciser dans la doc que c'est pour l'utiliser dans les macros de la ToC
\selectlanguage{french}

%	Set ToC division labels to the width of “chapter” label
% Create an ad hoc length
\newlength{\toclabelwidth}
	\settowidth{\toclabelwidth}{\cftchapterfont\chaptername\space}
% Create a command that gives ToC labels the proper length
% To be used with babel's \cftXname
\newcommand{\toclabelbox}[1]{\makebox[\toclabelwidth]{\hfill\llap{#1\normalsize\space}}}

%	Define lengths to be used within ToC layout
% Set ToC number to the width of roman numeral 30
\newlength{\tocnumwidth}
	\settowidth{\tocnumwidth}{\cftchapterfont XXX\space}
% Centered headings will take into account the label + number lengths
\newlength{\toccenterwidth}
	\setlength{\toccenterwidth}{\tocnumwidth}
	\addtolength{\toccenterwidth}{\toclabelwidth}

%	Set up ToC components indentation using the previously defined lengths
\cftsetindents{book}{\toccenterwidth}{\tocnumwidth}
\cftsetindents{part}{\toccenterwidth}{\tocnumwidth}
\cftsetindents{heading}{\z@}{\tocnumwidth}
\cftsetindents{subheading}{\z@}{\tocnumwidth}
\cftsetindents{chapter}{\z@}{\tocnumwidth}
\cftsetindents{section}{\z@}{\tocnumwidth}
\cftsetindents{subsection}{\z@}{\tocnumwidth}
\cftsetindents{subsubsection}{\if@article\z@\else\toclabelwidth\fi}{\tocnumwidth}
\cftsetindents{paragraph}{\if@article\z@\else\toclabelwidth\fi}{\tocnumwidth}
\cftsetindents{subparagraph}{\if@article\z@\else\toclabelwidth\fi}{\tocnumwidth}

%	Configure ToC dotted lines
\renewcommand*{\cftdotsep}{2}

%	TABLE OF CONTENTS VERTICAL SPACING

%	Ensure ToC starts on a new page (like a chapter)
\if@article\else
	\pretocmd{\tableofcontents}{\clearforchapter}{}{}
\fi

%	Adjust vertical spacing in ToC and other lists
% Because the first entry (book, part, heading, chapter) adds \baselineskip
\AtBeginDocument{%
	\addtocontents{toc}{\addvspace{-\baselineskip}}%
	\addtocontents{lot}{\addvspace{-\baselineskip}}%
	\addtocontents{lof}{\addvspace{-\baselineskip}}}
% S'assurer que la table des matières termine bien le dernier paragraphe
\AtEndDocument{%
	\addtocontents{toc}{\par}%
	\addtocontents{lot}{\par}%
	\addtocontents{lof}{\par}}

%	ALTERNATE TABLES OF CONTENTS

%	Create a command for short table of contents
\newcommand{\shortcontents}[1][0]{%
	\bgroup
		% Reset all necessary commands and remove page numbers
		\let\contentsname=\shortcontentsname
		\cftpagenumbersoff{heading}
		\cftpagenumbersoff{subheading}
		\cftpagenumbersoff{chapter}
		\setlength{\cftbeforechapterskip}{\baselineskip}
		% Save tocdepth value
		\newcounter{save@tocdepth}
		\setcounter{save@tocdepth}{\value{tocdepth}}
		\setcounter{tocdepth}{#1}
		% Print the table of contents and restore tocdepth
		\tableofcontents*
		\setcounter{tocdepth}{\value{save@tocdepth}}
		\clearpage
	\egroup}

%	TODO » Create minitoc for articles


% =***======***======***======***======***======***======***======***======***======***=


%	#####	HIERARCHICAL DIVISIONS	#####

%	Define max section numbering
\if@vitae
	\maxsecnumdepth{chapter}
\else\if@didactic
	\maxsecnumdepth{section}
\else
	\maxsecnumdepth{subparagraph}
\fi\fi

%	TODO » Vérifier la pertinence de toutes les lignes
%	Réinitialiser les compteurs 
\counterwithin*{part}{book}
\counterwithin*{heading}{book}
\counterwithin*{chapter}{book}
\counterwithin*{chapter}{part}
\counterwithin*{chapter}{heading}
\counterwithin*{chapter}{subheading}
\counterwithin*{section}{chapter}
\counterwithin*{paragraph}{chapter}
\counterwithin*{paragraph}{section}

%	Définir le style des livres dans le texte
\renewcommand*{\booktitlefont}{\Huge\scshape}
\renewcommand*{\booknamefont}{\booktitlefont}
\renewcommand*{\booknumfont}{\booktitlefont}
\renewcommand*{\printbooknum}{%
	\booknumfont%
	\ifdefstring{\languagename}{french}
		{\ifnum\value{book}=1	\ordinalstring{book}[m]%
		 \else					\Roman{book}\fi}
		{\Roman{book}}}
\renewcommand{\beforebookskip}{\null\vspace{\baselinestretch\addto@Huge}%
	\vspace{\if@tenpoints 12\baselineskip\else 10\baselineskip\fi}}
\renewcommand{\midbookskip}{\par\vspace{\baselinestretch\addto@Huge}}

%	Définir le style des parties dans le texte
% Babel French gère la numérotation en toutes lettres des parties
\renewcommand*{\thepart}{\Roman{part}}
\renewcommand*{\parttitlefont}{\LARGE\scshape}
\renewcommand*{\partnamefont}{\parttitlefont}
\renewcommand*{\partnumfont}{\parttitlefont}
\renewcommand{\beforepartskip}{\null\vspace{\baselinestretch\addto@LARGE}%
	%	TODO » Si PhD ou Memoir (ou article?)
	\vspace{\baselineskip}%
	%	TODO » Sauf PhD ou Memoir (ou article?) + Add: if@elevenpoints
%	\vspace{\if@tenpoints12\baselineskip\fi\if@twelvepoints10\baselineskip\fi}%
	}
\renewcommand{\midpartskip}{\par\vspace{\baselinestretch\addto@LARGE}}
%	TODO » Seulement si PhD ou Memoir (ou article?), utiliser des options
\renewcommand{\afterpartskip}{\vspace{2\baselineskip}}
% Test can be printed after the part title, on the same page
\nopartblankpage

%	TODO » Seconde partie et Titre second == créer un switch manuel \onlytwoparts \onlytwoheadings à insérer dans le .tex

% \newcounter{lastpart@I}
% \newcounter{lastpart@II}
% \newcounter{lastpart@III}
% \newcounter{lastpart@IV}
% \newcounter{lastpart@V}
% \newcounter{lastpart@VI}
% \newcounter{lastpart@VII}
% \newcounter{lastpart@VIII}
% \newcounter{lastpart@IX}
% \newcounter{lastpart@X}
% \renewcommand{\printpartnum}{%
% 	% If last part > 2, write it in the .aux file for numbrring purposes
% 	\ifnum\value{part}>2%
% 		\immediate\write\@auxout%
%     		{\string\setcounter{lastpart@\thebook}{\the\c@part}}
%     \fi}

 %	TODO » Coder proprement \printpartname. Supprimer les modifs de babel (option?)
 % Utiliser le test:
%  \ifnum\value{part}=2
% 	\ifnum\value{part}<\value{lastpart@\thebook}
% 		Définir l'ordinal == Deuxième%
% 	\else
% 		Définir l'ordinal ==  Seconde%
% \fi\fi
% Puis imprimer le numéro ordinal et le \partname

%	Définir le style des titres dans le texte
\renewcommand{\theheading}{\Roman{heading}}
\newcommand{\headtitlefont}{\Large\scshape\centering}
\newcommand{\headnamefont}{\headtitlefont}
\newcommand{\headnumfont}{\headtitlefont}
\newcommand{\afterheadingnum}{\par\nobreak\vskip\midchapskip}
\newcommand{\printheadingname}{\headnamefont\headingname}
\newcommand{\headingnamenum}{\space}
\newcommand{\printheadingnum}{%
	\headnumfont%
	\ifdefstring{\languagename}{french}
		{\ifnum\value{heading}=1	\ordinalstring{heading}[m]%
		 \else						\Roman{heading}\fi}
		{\Roman{heading}}}
\newcommand{\printheadingtitle}[1]{\headtitlefont#1}

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
		\clearforchapter
		\thispagestyle{chapter}
		\@schapter{#1}
		\chaptermark{#1}
		\phantomsection
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
\newcommand{\printsubheadingnum}{%
	\subheadnumfont%
	\ifdefstring{\languagename}{french}
		{\ifnum\value{subheading}=1		\ordinalstring{subheading}[m]%
		 \else							\Roman{subheading}\fi}
		{\Roman{subheading}}}
\newcommand{\printsubheadingtitle}[1]{\subheadtitlefont#1}

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
		\clearforchapter
		\thispagestyle{chapter}
		\@schapter{#1}
		\chaptermark{#1}
		\phantomsection
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
		\else\ifdefstring{\languagename}{french}
			{\ifnum\value{chapter}=1	\ordinalstring{chapter}[m]%
			 \else						\Roman{chapter}\fi}
			{\Roman{chapter}}\fi}
	\renewcommand{\afterchapternum}{:\par\nobreak\vskip\midchapskip}
	\setlength{\beforechapskip}{\baselinestretch\addto@Large}
	\addtolength{\beforechapskip}{\baselineskip}
	\setlength{\midchapskip}{\baselinestretch\addto@Large}
	\setlength{\afterchapskip}{2\baselineskip}
}
%	Define additional elements for <article>-style chapters (new page, reduce spacing)
\newcommand{\chapterblock}{%
	\setlength{\afterchapskip}{\baselineskip}}
% Appliquer le style de chapitre généralement (mode normal et mode <article>)
\chapterstyle{frenchlaw}

%	TODO » Clean-up. Ajouter un hook dans la commande \@chapter
% Utilisé par \xchapter (pour simuler un chapitre du \frontmatter, i.e. avec toutes les informations sauf le numéro du chapitre)

% \patchcmd{\@chapter}
%   {\ifm@m@And}
%   {\if@special@chapter\m@m@Andfalse\fi%
%    \ifm@m@And}
%   {}
%   {\typeout{WARNING! Patching \noexpand\@chapter failed!}}

% \newcommand{\xchapter}[1][\@empty]{% Remplacer par \ifx\relax#1\relax (?)
% 	\def\tmpch@ptoc{#1}% Capture first optional argument (ToC-name)
% 	\@ifnextchar[{\@xchapter}{\@xchapter[]}}
% \def\@xchapter[#1]#2#3{%
% 	\@special@chaptertrue
% 	\def\ch@phead{% If #1 (header-name) undefined, use #3 (regular title)
% 		\ifx\relax#1\relax#3\else#1\fi}
% 	\def\ch@ptoc{%
% 		#2\ifx\relax#2\relax\else\ifx\relax#3\relax\else\cftchapteraftersnum\cftchapteraftersnumb~\fi\fi#3}% If both #2 and #3 are defined, add ToC separators between them
% 	\if\@empty\tmpch@ptoc\relax\else\def\ch@ptoc{\tmpch@ptoc}\fi
% 	\def\ch@pname{%
% 		\ifx\relax#2\relax\else#2\afterxchapternum\fi#3}
% 	\chapter[\ch@ptoc][\ch@phead]{\ch@pname}
% 	\markboth{\ch@phead}{\ch@phead}
% 	% Increase, then decrease chapter counter (to reset all sub-counters)
% 	\refstepcounter{chapter}
% 	\addtocounter{chapter}{-1}
% 	\@special@chapterfalse
% }

\renewcommand{\chapter}{%
	\if@article\par\@nameuse{chapterblock}\else
		\clearforchapter
		\thispagestyle{chapter}
		\global\@topnum\z@
	\fi
	\m@mindentafterchapter
	\@ifstar{\xchapter}{\@m@mchapter}}
\newcommand{\xchapter}[1][]{%
	\def\ch@pprefix{#1}% Capture first optional argument (title-prefix)
	\@ifnextchar[{\@xchapter}{\@xchapter[]}}
\def\@xchapter[#1]#2{%
	\@schapter{\if\relax\ch@pprefix\relax\else\ch@pprefix\afterchapternum\fi#2}
	\chaptermark{\if\relax#1\relax#2\else#1\fi}
	\phantomsection
	\addcontentsline{toc}{chapter}{%
		\if\relax\ch@pprefix\relax\else\ch@pprefix\cftchapteraftersnum\cftchapteraftersnumb~\fi#2}
	% Increase, then decrease chapter counter (to reset all sub-counters)
	\addtocounter{chapter}{-1}
	\refstepcounter{chapter}}
\newcommand{\fakechapter}[2][]{%
	\clearforchapter
	\thispagestyle{chapter}
	\@schapter{\if\relax#1\relax\else#1\afterchapternum\fi#2}
	\chaptermark{#1}
	\phantomsection
	\addtocontents{toc}{\vspace{\baselineskip}}
	\addcontentsline{toc}{section}{\if\relax#1\relax\else#1\cftchapteraftersnum\cftchapteraftersnumb~\fi#2}}

%	Définir le mode de numérotation des sections et paragraphes
%	TODO » Créer un subsubparagraph > \@greek (pour tout le monde)
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
% Ne pas ajouter d'espace si <article>, car il n'y a pas de préfix
\setsecnumformat{%
	\ifcsname #1name\endcsname\csname #1name\endcsname\if@article\else\space\fi\fi%
	\csname the#1\endcsname.\enskip}

%	Définir le style des sections
\setsecheadstyle{\large\scshape\raggedright}	
\setlength{\beforesecskip}{\baselinestretch\addto@large}
\setlength{\aftersecskip}{\baselineskip}
\if@twocolumn
	% En mode <twocolumn>, ne pas rajouter un second saut de ligne
	\addtolength{\beforesecskip}{\z@}
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

%	Définir le style des paragraphes
% Vérifier l'indentation, notamment didactic+
\setparaheadstyle{\scshape}
\setparaindent{0em}
\setlength{\beforeparaskip}{\baselineskip}
\setlength{\afterparaskip}{\baselineskip}

%	Définir le style des sous-paragraphes
% Vérifier l'indentation, notamment didactic+
\setsubparaheadstyle{\itshape}
\setsubparaindent{0em}
\setlength{\beforesubparaskip}{\baselineskip}
\setlength{\aftersubparaskip}{\baselineskip}

\if@twocolumn
	% En mode <twocolumn>, ils sont insérés dans le corps du texte (inline)
	\setparaheadstyle{\scshape\raggedright\addperiod}
	\setlength{\afterparaskip}{0em}
	% Idem pour les sous-paragraphes (inline)
	\setsubparaheadstyle{\itshape\raggedright\addperiod}
	\setlength{\aftersubparaskip}{0em}
\else\if@marginal
	% En mode <marginal>, ils sont placés dans une note marginale
	\newcommand{\marginparahead}[1]{\marginpar{\itshape#1\if@vitae:\fi}}
	\setparaheadstyle{\marginparahead}
	\setlength{\afterparaskip}{0em}
	% Idem pour les sous-paragraphes (dans la marge)
	\newcommand{\marginsubparahead}[1]{\marginpar{\itshape#1\if@vitae:\fi}}
	\setsubparaheadstyle{\marginsubparahead}
	\setlength{\aftersubparaskip}{0em}
\fi\fi


% =***======***======***======***======***======***======***======***======***======***=


%	#####	LOGICAL DIVISIONS	#####

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
\newcommand{\cftparastyle}{\llap}
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

%	Créer un switch pour afficher les noms des paragraphes ou non
\newcommand{\paragraphnames}{\@paranametrue}
\newcommand{\noparagraphnames}{\@paranamefalse}

%	Créer un switch pour imprimer ou non les \para dans la table des matières
\newcommand{\precis}{\@precistrue}
\newcommand{\noprecis}{\@precisfalse}

%	Créer un switch pour imprimer ou non les \outline dans la table des matières
\newcommand{\outlinetoc}{\@outlinetrue}
\newcommand{\nooutlinetoc}{\@outlinefalse}

%	Créer un switch pour imprimer ou non les \outline dans la table des matières
\newcommand{\summarytoc}{\@summarytrue}
\newcommand{\nosummarytoc}{\@summaryfalse}

%	TODO » Utilité des numéros de page? (imprimer > cf. PUF)
%	TODO » Ajouter une commande manuelle pour insérer le chapitre / section, etc. juste en-dessous du titre (comme pour les labels) (?) + Ajouter autommatiquement à la commande via etoolbox (apptocmd, etc.) -- idem pour les chapitres non numérotés (header et toc)

%	Créer une commande \para pour faire des paragraphes numérotés
%	TODO » Supprimer le \precis, et utiliser plutôt \chapterprecis et \precistoctext (memoir)
\newcommand{\para}[1][]{%
	\refstepcounter{para}%
	\refstepcounter{precis}%
	\def\@currentlabel{\thepara}%
	{\paranumstyle\thepara\if\relax#1\relax\label{para:\thepara}\else\label{para:#1}\paranumsep\fi}%
	\if@paraname%
		\if@marginal%
			\marginpar{\parastyle#1}%
		\else%
			{\parastyle#1\parasep}%
	\fi\fi%
	\if@precis
		\addtocontents{toc}{%
			\ifnum\value{precis}>1\vskip-\lastskip\cftparasep\else%
				\vskip\baselineskip\par\fi%
			% TODO » \ifx...\fi désactivé TMP (pour vérifier les \para innommés)
			%% Et suppr. le \ifx...\fi interne
			%\ifx\relax#1\relax\else
				\protect\noindent%
				{\cftparastyle{\cftparanumstyle\thepara\cftparaaftersnum}
					\if\relax#1\relax\else#1\cftparanumsep\fi\cftparaleader\thepage\cftparaafterpnum}\vskip\baselineskip\par%\fi
			}%
	\fi%
	\@ifnextchar\par{\@gobblepar\relax}{\relax}}


% =***======***======***======***======***======***======***======***======***======***=


%	#####	PAGE NOTES	#####

%	FOOTNOTES

%	Set footnotes at the bottom of the page
\setfootnoterule[\vfill]{\z@}{\z@}{\z@}
%	Force vertical alignment with a \strut height (.7\baselineskip) for all footnotes
\setlength{\footnotesep}{.7\baselineskip}

%	Set footnote marks to hang on the left
\setlength{\footmarkwidth}{2em}
\setlength{\footmarksep}{0em}
%	Set footnote marks on the baseline (instead of superscript)
\footmarkstyle{#1.\kern.5em}

%	Reset footnote counter at every chapter
\counterwithout*{footnote}{chapter}
%	Create a command to reset the footnote counter on every page.
\RequirePackage{perpage}
\newcommand{\footnotebypage}
	{\MakePerPage{footnote}}

%	Create the \symbolfootnote macro (for thanks, etc.)
\newcommand{\symbolfootnote}[2][2]{%
	\begingroup%
	\renewcommand{\thefootnote}{\fnsymbol{footnote}}%
	\footnotetext[#1]{#2}%
	\endgroup%
}

%	MARGIN NOTES

%	Set margin notes width based on the actual margin width
\newlength{\marginwidth}
\setlength{\marginwidth}{\dimexpr\stockwidth-\textwidth\relax}
\if@marginal
	\setmarginnotes{.05\marginwidth}{.5\marginwidth}{\z@}
\else\if@twoside
	\setmarginnotes{.05\marginwidth}{.4\marginwidth}{\z@}
\else
	\setmarginnotes{.05\marginwidth}{.35\marginwidth}{\z@}
\fi\fi

%	Margin and side notes are set in the widest margin
\if@twoside
	\marginparmargin{outer}
	\sidebarmargin{outer}
\else
	\marginparmargin{left}
	\sidebarmargin{left}
\fi

%	Style margin notes (\marginpar)
% Make sure the first and last line of the note are \strut height for vertical alignment
\let\old@marginpar=\marginpar
\renewcommand{\marginpar}[1]{%
	\old@marginpar[\raggedleft\footnotesize\strut#1\strut]{\raggedright\footnotesize\strut#1\strut}}

%	Set the style for side paragraphs (\sidebar)
\setsidebars{\marginparsep}{\marginparwidth}{\baselineskip}{\z@}{\footnotesize}{\textheight}


% =***======***======***======***======***======***======***======***======***======***=


%	##### LIST ENVIRONMENTS	#####

%	SET DEFAULT LIST SPACING

%	Set all vertical space to mutliples of \baselineskip
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
\setlength{\itemsepi}{\parskip}
\setlength{\itemsepii}{\parskip}
\setlength{\itemsepiii}{\z@}

%	Set horizontal space to multiples of \parindent
\setlength{\listparindent}{\parindent}
\setlength{\everylistparindent}{\listparindent}
%\setlength{\labelsep}{.5em}
\setlength{\leftmargin}{\z@}
\setlength{\rightmargin}{\z@}
\setlength{\leftmargini}{\if@twocolumn 1em \else 1.5em \fi}
\setlength{\leftmarginii}{\if@twocolumn 1em \else 1.5em \fi}
\setlength{\leftmarginiii}{\if@twocolumn 1em \else 1.5em \fi}
\setlength{\leftmarginiv}{\if@twocolumn 1em \else 1.5em \fi}
\setlength{\leftmarginv}{\if@twocolumn 1em \else 1.5em \fi}
\setlength{\leftmarginvi}{\if@twocolumn 1em \else 1.5em \fi}

%	BLOCK QUOTATIONS

%	Specific settings for <quote> environement  
\renewenvironment{quote}[1][]%
	{\list{}{\setlength{\itemindent}{\z@}%
			 \setlength{\leftmargin}{\parindent}}%
	 \small\item[]\ignorespaces%
	 \if\relax#1\relax\else\selectlanguage{british}\itshape\fi}
	{\endlist}

%	Specific settings for <quotation> environement  
\renewenvironment{quotation}[1][]%
	{\list{}{\setlength{\itemindent}{\parindent}%
			 \setlength{\leftmargin}{\parindent}}%
	 \small\item[]\ignorespaces%
	 \if\relax#1\relax\else\selectlanguage{british}\itshape\fi}
	{\endlist}

%	EPIGRAPHS

%	Define epigraph style for <memoir> class
\epigraphfontsize{\normalsize}
\setlength{\epigraphwidth}{.6\textwidth}
\setlength{\epigraphrule}{\z@}
\setlength{\beforeepigraphskip}{\z@}
\setlength{\afterepigraphskip}{2\baselineskip}

%	Redefine epigraph text format
\renewcommand{\@epitext}[1]{%
	\begin{minipage*}{\epigraphwidth}#1\end{minipage*}}
%	Redefine epigraph source format
\renewcommand{\@episource}[1]{%
	\begin{minipage*}{\epigraphwidth}%
		\begin{\sourceflush}---~#1\end{\sourceflush}%
	\end{minipage*}}

%	Redefine the command that prints epigraphs
\renewcommand{\epigraph}[2]{
	\vspace{\beforeepigraphskip}
	{\begin{\epigraphflush}
		\epigraphsize
		\@epitext{#1}\par%
		\if\relax#2\relax\else
			\vspace{\baselineskip}
			\@episource{#2}\par
		\fi
		\ifdim\epigraphrule>\z@ \@epirule\fi%
	\end{\epigraphflush}}
	\vspace{\afterepigraphskip}}

%	Redefine the <epigraphs> environment (multiple epigraphs)
\renewenvironment{epigraphs}
	{\list{}{%
	 \vspace{\beforeepigraphskip}}}%
	{\begin{\epigraphflush}%
		\vspace{-\baselineskip}% Remove the line added after the last epigraph
	 	\ifdim\epigraphrule>\z@ \@epirule\fi%
	 \end{\epigraphflush}
	 \vspace{\afterepigraphskip}\endlist}
%	Use \qitem{<text>}{<source>} for each epigraph
\renewcommand{\qitem}[2]{%
	\item[]{%
		\setlength{\epigraphrule}{\z@}
		\setlength{\beforeepigraphskip}{\z@}
		\setlength{\afterepigraphskip}{\z@}
		\epigraph{#1}{#2}
		\vspace{\baselineskip}}}

%	Define an environment for full-page dedications, based on epigraphs
\newenvironment{dedication}
	{\clearpage
	 \vspace*{\z@}\vfill%
	 \thispagestyle{empty}
	 \begin{\epigraphflush}%
	 \begin{minipage}{\epigraphwidth}%
	 \setlength{\parskip}{\baselineskip}%
	 \epigraphsize\raggedleft}
	{\end{minipage}%
	 \end{\epigraphflush}%
	 \vfill\vfill\clearpage}

%	LISTS

%	Define <enumerate> style
\renewcommand{\labelenumii}{\itshape\theenumii).}
\renewcommand{\labelenumiii}{\textit{\theenumiii}.}
\renewcommand{\theenumiv}{\@greek\c@enumiv}

%	Define <description> style
\newcommand{\descriptionlabelstyle}{\scshape}
\renewcommand{\descriptionlabel}[1]{{\descriptionlabelstyle #1:\enspace}}
\renewcommand{\blockdescriptionlabel}[1]{{\descriptionlabelstyle #1:\enspace}}

%	Renew <description> environment
\renewenvironment{description}
	{\addvspace{\baselineskip}
	 \list{}{\let\makelabel\descriptionlabel
			 \setlength{\labelwidth}{\parindent}
			 \setlength{\leftmargin}{\parindent}}}
	{\endlist%
	 \addvspace{\baselineskip}}

%	Renew <blockdescription> environment
\renewenvironment{blockdescription}%
	{\addvspace{\baselineskip}
	 \list{}{\let\makelabel\blockdescriptionlabel
	 		 \setlength{\parsep}{\baselineskip}
			 \setlength{\labelwidth}{\parindent}
			 \setlength{\leftmargin}{\parindent}}}%
	{\endlist%
	 \addvspace{\baselineskip}}


% =***======***======***======***======***======***======***======***======***======***=


%	#####	BOXES & MINIPAGES	#####

%	MINIPAGES

%	Refefine the <minipage> environment for vertical alignment
% Thanks @ egreg <http://tex.stackexchange.com/a/34982/10119>
\newenvironment{minipage*}[2][l]
	{\ifx#1r\hfill\fi%
	 \ifx#1c\centering\fi%
	 \noindent\minipage[t]{#2}}
	{\par\xdef\tpd{\the\prevdepth}\endminipage%
	 \setlength{\parfillskip}{0ex plus \dimexpr\linewidth-3em}%
	 \par\prevdepth\tpd%
	 \ignorespacesafterend}

%	FRAMED BOXES

%	Create customization macros
\newcommand{\showcasetitle}[1]{{\showcasetitlestyle #1:}\par}
\newcommand{\showcasetitlestyle}{\bfseries}
\newcommand{\showcasestyle}{\sffamily}
\newcommand{\framerulecolor}{gray}

%	Environment for a box with vertical line along the left side
\newsavebox{\fmbox}
\newenvironment{showcase}[1][]
	{\addvspace{\baselineskip}%
	 \noindent\begin{lrbox}{\fmbox}%
	 \begin{minipage}[t]{\dimexpr\linewidth-1.5em\relax}%
	 \showcasestyle%
	 \if\relax#1\relax\else\showcasetitle{#1}\fi}
	{\par\xdef\tpd{\the\prevdepth}%
	 \end{minipage}%
	 \end{lrbox}%
	 \setlength{\parfillskip}{0ex plus \dimexpr\linewidth-3em}%
	 {\color{\framerulecolor}\vrule width .2em}\hfill%
	 \usebox{\fmbox}%
	 \par\prevdepth\tpd%
	 \addvspace{\baselineskip}}

%	MULTIPLE COLUMNS

%	Load Package, enforce vertical alignment, harmonize column sep width
\RequirePackage{multicol}
\setlength{\multicolsep}{\baselineskip}
\setlength{\columnsep}{1em}

%	Apply the same typography settings as for the <twocolumn> option
\let\old@multicols=\multicols
\let\old@endmulticols=\endmulticols
\renewcommand{\multicols}{\@twocolumntrue\old@multicols}
\renewcommand{\endmulticols}{\@twocolumnfalse\old@endmulticols}


% =***======***======***======***======***======***======***======***======***======***=


%	#####	TABLES & FIGURES	#####

%	TABULARS

%	Define the height of tabular elements via <booktabs>
\setlength{\aboverulesep}{.5\baselineskip}
\setlength{\belowrulesep}{.5\baselineskip}
\setlength{\abovetopsep}{\z@}
\setlength{\belowbottomsep}{\z@}

%	Define the style of <tabulars> (center, vertical align)
\let\old@tabular=\tabular
\let\old@endtabular=\endtabular
\renewenvironment{tabular}[2][t]
	{\noindent\old@tabular[#1]{#2}\toprule}
	{\bottomrule\old@endtabular}

%	FLOATS

%	Force floats at the bottom of the page or on a dedicated page
% Enforces vertical grid at a minimal cost
\setfloatlocations{figure}{bp}
\setfloatlocations{table}{bp}

%	Set the default psecing around floats
\setlength{\floatsep}{\z@}
\setlength{\textfloatsep}{\baselineskip}
\setlength{\intextsep}{\baselineskip}
\setlength{\dblfloatsep}{\baselineskip}
\setlength{\dbltextfloatsep}{\baselineskip}

%	Set the default baseline within floats
\edef\m@m@float@spacing{\custom@baselinestretch}

%	Set floats to the center of the textblock
\setfloatadjustment{figure}{\centering}
\setfloatadjustment{table}{\centering}

%	Define float caption style
\changecaptionwidth\captionwidth{.8\columnwidth}
\setlength{\abovecaptionskip}{.5\baselineskip}
\setlength{\belowcaptionskip}{.5\baselineskip}
\hangcaption

%	Number flaots for the whole document instead of per chapter
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
% And within the \mainmatter
\renewcommand\@memmain@floats{
	\counterwithout{figure}{chapter}
	\counterwithout{table}{chapter}}

%	Défine List of Table settings
\cftsetindents{table}{0em}{1.5em}
\renewcommand*{\cfttablepresnum}{\space}
\renewcommand*{\cfttableaftersnum}{.}
\renewcommand*{\cfttableaftersnumb}{\mdseries}
\renewcommand{\cfttablefont}{\bfseries}
\renewcommand*{\cfttablepagefont}{\normalsize}
\setlength{\cftbeforetableskip}{\z@}

%	Define List of Figures settings
\cftsetindents{figure}{0em}{1.5em}
\renewcommand*{\cftfigurepresnum}{\space}
\renewcommand*{\cftfigureaftersnum}{.}
\renewcommand*{\cftfigureaftersnumb}{\mdseries}
\renewcommand{\cftfigurefont}{\bfseries}
\renewcommand*{\cftfigurepagefont}{\normalsize}
\setlength{\cftbeforefigureskip}{\z@}

%	Do not insert extra vertical space in List of... commands
\renewcommand*{\insertchapterspace}{%
  \addtocontents{lof}{\protect\addvspace{\z@}}%
  \addtocontents{lot}{\protect\addvspace{\z@}}}


% =***======***======***======***======***======***======***======***======***======***=


%	#####	HELPER MACROS	#####

%	Provide a list of greek numbers for counters
\def\@greek#1{%
	\ifcase#1\or\ensuremath{\alpha}\or\ensuremath{\beta}\or\ensuremath{\gamma}\or\ensuremath{\delta}\or\ensuremath{\varepsilon}\or\ensuremath{\zeta}\or\ensuremath{\eta}\or\ensuremath{\theta}\or\ensuremath{\iota}\or\ensuremath{\kappa}\or\ensuremath{\lambda}\or\ensuremath{\mu}\or\ensuremath{\nu}\or\ensuremath{\xi}\or\ensuremath{ o}\or\ensuremath{\pi}\or\ensuremath{\varrho}\or\ensuremath{\sigma}\or\ensuremath{\tau}\or\ensuremath{\upsilon}\or\ensuremath{\phi}\or\ensuremath{\chi}\or\ensuremath{\psi}\or\ensuremath{\omega}\else\@ctrerr\fi}
\def\@Greek#1{%
	\ifcase#1\or\ensuremath{\Alpha}\or\ensuremath{\Beta}\or\ensuremath{\Gamma}\or\ensuremath{\Delta}\or\ensuremath{\Epsilon}\or\ensuremath{\Zeta}\or\ensuremath{\Eta}\or\ensuremath{\Theta}\or\ensuremath{\Iota}\or\ensuremath{\Kappa}\or\ensuremath{\Lambda}\or\ensuremath{\Mu}\or\ensuremath{\Nu}\or\ensuremath{\Xi}\or\ensuremath{\Omicron}\or\ensuremath{\Pi}\or\ensuremath{\Rho}\or\ensuremath{\Sigma}\or\ensuremath{\Tau}\or\ensuremath{\Upsilon}\or\ensuremath{\Phi}\or\ensuremath{\Chi}\or\ensuremath{\Psi}\or\ensuremath{\Omega}\else\@ctrerr\fi}

%	Create a command that sets a length to the greater of two values
% Set length #1 to the value of #2, but only if #2 is greater than #1
\newcommand{\setmaxlength}[2]{%
	\ifdim\dimexpr#2>\dimexpr#1
		\global\setlength{#1}{#2}%
	\fi}

%	Command that gobbles all whitespace until the next paragraph
% Usage:	\@ifnextchar\par{\@gobblepar}{\relax}
\newcommand{\@gobblepar}[1]{%
	\@ifnextchar\par{\@gobblepar}{\relax}}

%	Command that prints its own argument. Some macros \let it to \@gobble
% Usage:	In .tex file, use \sanitize to silence a macro in certain contexts, e.g. ToC
\newcommand{\sanitize}[1]{#1}


% =***======***======***======***======***======***======***======***======***======***=


%	#####	TITLE PAGES	#####

%	Create a command that changes the style of \maketitle
% Create a \maketitle<name> command and use \titlepagestyle{<name>}
\newcommand{\titlepagestyle}[1]{\def\maketitle{\csname maketitle#1\endcsname}}

%	Redefine \and (by default it uses a tabular and breaks vertical alignment)
\def\and{\par}%\unskip\enskip\emph{\&}\enskip\ignorespaces

%	Create a command for people's first & last names
\newcommand{\name}[2]{#1~\bsc{#2}}% TODO » Revoir...
\newcommand{\affiliation}[1]{{\normalsize\unskip~(#1)}}

%	Create a command to switch off and on layout elements
\newcommand{\reset@twocolumns}{%
	\if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi%
}
\newcommand{\restore@twocolumns}{
	\if@restonecol\twocolumn\fi%
}

%	Define new meta-data macros
%	Document Info
%	TODO » Replacer les \@empty par des \relax (dans la déf. des macros)
%	Tester tous les champs (gros bordel entre relax et empty)
% The \title and \subtitle fields can be given in several languages, e.g. for abstracts
\renewcommand{\title}[2][\languagename]{\expandafter\gdef\csname @title@#1\endcsname{#2}}
	\expandafter\gdef\csname @title@\languagename\endcsname{\@empty}
\newcommand{\subtitle}[2][\languagename]{\expandafter\gdef\csname @subtitle@#1\endcsname{#2}}
	\expandafter\gdef\csname @subtitle@\languagename\endcsname{\@empty}
\newcommand{\subject}[1]{\gdef\@subject{#1}}
	\newcommand{\@subject}{\@empty}
\newcommand{\lecture}[1]{\gdef\@lecture{\bgroup#1\egroup}}
	\newcommand{\@lecture}{\@empty}
\newcommand{\seminar}[1]{\gdef\@seminar{\bgroup#1\egroup}}
	\newcommand{\@seminar}{\@empty}
%	Affiliation Info
\newcommand{\institution}[1]{\gdef\@institution{#1}}
	\newcommand{\@institution}{\@empty}
\newcommand{\school}[1]{\gdef\@school{#1}}
	\newcommand{\@school}{\@empty}
\newcommand{\laboratory}[1]{\gdef\@laboratory{#1}}
	\newcommand{\@laboratory}{\@empty}
%	TODO » Revoir
%	Utilisé pour les lettres
%	Permettre d'insérer plusieurs logos, e.g. en haut de page (commande incrémentale)
\newcommand{\logo}[2][]{\gdef\@logo{#2}}
	\newcommand{\@logo}{\@empty}
%	Volume Info
\newcommand{\volume}[1]{\gdef\@volume{#1}}% TODO » Sert pour les thèses en plusieurs volumes
	\newcommand{\@volume}{\@empty}
%	Thesis Info
\newcommand{\thesis}[1]{\gdef\@thesis{#1}}% TODO » Sert pour les masters
	\newcommand{\@thesis}{\@empty}
% \newcommand{\director}[1]{\gdef\@director{\bgroup#1\egroup}}
% 	\newcommand{\@director}{\@empty}
\def\@advisors{\relax}
\def\@jury{\relax}
\newcommand{\advisor}{\@ifstar{\s@advisor}{\@advisor}}
	\newcommand{\@advisor}[4][]{\appto\@advisors{\bgroup#2 \bsc{#3}, #4\egroup\par}}
	\newcommand{\s@advisor}[4][]{%
		\appto\@advisors{\bgroup#2 \bsc{#3}, #4\egroup\par}%
		\appto\@jury{\bgroup#1#2 \bsc{#3}, #4\egroup\par}}
\newcommand{\referee}[4][]{\appto\@jury{\bgroup#1#2 \bsc{#3}, #4~(rapporteur)\egroup\par}}
\newcommand{\president}[4][]{\appto\@jury{\bgroup#1#2 \bsc{#3}, #4~(président)\egroup\par}}
\newcommand{\examiner}[4][]{\appto\@jury{\bgroup#1#2 \bsc{#3}, #4\egroup\par}}
\newcommand{\@thesisadvisors}{\@advisors}
\newcommand{\@jurymembers}{\@jury}
%	Publication Info
\newcommand{\publisher}[1]{\gdef\@publisher{#1}}
	\newcommand{\@publisher}{\@empty}
\newcommand{\series}[1]{\gdef\@series{#1}}
	\newcommand{\@series}{\@empty}
%	Licensing Info
\newcommand{\licensing}[1]{\long\gdef\@licensing{#1}}
	\newcommand{\@licensing}{\@empty}
\newcommand{\printcopyright}{%
	\if\@empty\@licensing\relax\else
		\cleartoverso\vspace*{25\baselineskip}%
		\bgroup\parindent=\z@\@licensing\egroup\fi}
%	Author Info
\newcommand{\address}[1]{\gdef\@address{#1}}
	\newcommand{\@address}{\@empty}
\newcommand{\location}[1]{\gdef\@location{#1}}
	\newcommand{\@location}{\@empty}
\newcommand{\phone}[1]{\gdef\@phone{#1}}
	\newcommand{\@phone}{\relax}
\newcommand{\fax}[1]{\gdef\@fax{#1}}
	\newcommand{\@fax}{\relax}
% TODO » Sécuriser les emails si * et éviter qu'ils débordent du cadre (?)
\newcommand{\email}[1]{\gdef\@email{#1}}
	\newcommand{\@email}{\relax}
\newcommand{\signature}[1]{\gdef\@signature{#1}}
	\newcommand{\@signature}{\@empty}
%	Letter Data
\newcommand{\recipient}[1]{\gdef\@recipient{#1}}
	\newcommand{\@recipient}{\@empty}
\newcommand{\addressee}[1]{\gdef\@addressee{#1}}
	\newcommand{\@addressee}{\@empty}
\newcommand{\ourRef}[1]{\gdef\@ourRef{#1}}
	\newcommand{\@ourRef}{\@empty}
\newcommand{\yourRef}[1]{\gdef\@yourRef{#1}}
	\newcommand{\@yourRef}{\@empty}
\newcommand{\enclosed}[1]{\gdef\@enclosed{#1}}
	\newcommand{\@enclosed}{\relax}
\newcommand{\cc}[1]{\gdef\@cc{#1}}
	\newcommand{\@cc}{\relax}

%	TODO » Ajouter un mailto: crypté en UTF-8 (\@ifstar ?), mais uniquement si on crypte l'adresse
% \newcommand{\mailto}{%
% 	\begingroup
% 	\catcode`\@=\active
% 	\catcode`\.=\active
% 	\gdef@{$\,\langle\,$at$\,\rangle\,$}%
% 	\gdef.{$\,\langle\,$dot$\,\rangle\,$}%
% 	\obfuscate
% }
% \newcommand{\obfuscate}[1]{%
% 	\endgroup
% 	{\ttfamily#1}%
% }

%	Create a command for the signature block in letters and other documents
% The optional argument inserts some text right before the signature. If there are multiple signatures and the header is not used for all of them, leave whitespace in the argument. 
\newcommand{\makesignature}[1][\@empty]{
	\hfill%
	\begin{minipage}[t]{.4\textwidth}
	\centering%
	\if\@empty#1\else#1\par\vspace{2\baselineskip}\fi
	\if\@empty\@signature\relax\par\addvspace{\baselineskip}\else
		\raisebox{-2\baselineskip}[\z@][\z@]{%
			\includegraphics[width=\textwidth,height=4\baselineskip,keepaspectratio]{\@signature}}\\
	\fi
	\@author
	\end{minipage}}

%	TODO » Ajouter avec les clausiers
% \newcommand{\nondisclosure}{%
% 	\if\@empty\@clause@NDA\relax\else{\nondisclosurestyle\@clause@NDA}\fi}

%	TODO » Ajouter \website et \linkedin (2 args, nom + url ?)
%	TODO » Ajouter une commande pour le copyright + intégrer aux styles

%	TODO » Tout reprendre
% Créer une commande \createtitepage{name}{code} et \createcoverpage{name}{code}
% Elles définissent: \printtitleName et \printcoverpageName
% Appeler ces commandes avec \titlepagestyle{name} et \coverpagestyle{name}
% Et modèles prédéfinis:
%	\long\def\printitleDidactic % dont redéfinition du fontmatter et mainmatter (* auto)
%	\long\def\printcoverDidactic % -- ou \let\printcover=\printitile
%	Et inclure tous les éléments de présentation de la page
%	E.g. pour didactic, le titre comme un article (sans saut de ligne avan tl'auteur) et la couverture sur une page distincte
% Puis \maketitle générique

%	Define a default style (esp. for long documents)
\newcommand{\maketitleBook}{%
	% Send out warnings on empty fields
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	% Change the numbering in \frontmatter to \Roman
	\renewcommand{\@memfront}{\@smemfront\pagenumbering{Roman}}
	% Create the \maketitle
	\long\def\printtitle{%
		\setlength{\parindent}{0em}
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
		\cleartorecto
		\printtitle%
		\printcopyright%
		\cleartorecto
	\egroup
}

%	Create a style for PhD theses / Dissertations
%	TODO » Adde labo + COMUE + Logos
%	TODO » Éventuellement, créer des compteurs avec le nombre de lignes blanches possibles, et incrémenter de 1 pour chaque champ vide (ou réduire pour chaque champ renseigné), pour calculer automatiquement le nombre de lignes à sauter
%	TODO » Vérifier si un \vfill pour les membres du jury peut fonctionner
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
	\if\@empty\@advisors\relax
		\@latex@warning@no@line{No \noexpand\advisor given}\fi
	\if\@empty\@jury\relax
		\@latex@warning@no@line{No \noexpand\examiner, \noexpand\referee or \noexpand\president given}\fi
	% Create the \maketitle
	\long\def\printtitle{%
		\pagestyle{empty}
		\setlength{\parindent}{0em}
		\normalize@fontsize%
		\bgroup
		\centering%
		\vspace*{-2\baselineskip}
		\if@draft
			\vspace{5\baselineskip}
		\else
			{\Large\scshape\@institution\par}
			\vspace{\baselineskip}
			{\large\scshape\@school\par}
			\vspace{\baselineskip}
			{\large\@laboratory\par}
			\vspace{3\baselineskip}
			\if\@empty\@subject\relax\else
				{\large\subjecttext\space\@subject\par}
		\fi\fi
		\vspace{3\baselineskip}
		{\LARGE\csname @title@\languagename\endcsname\par}
		{\Large\csname @subtitle@\languagename\endcsname\par}
		\if\@empty\@volume\relax
			\vspace{4\baselineskip}
			{\Large\@author\par}
			\vspace{4\baselineskip}
			\if\@empty\@advisors\relax\else
				{\large\advisortext\par
				 \vspace{\baselineskip}
				 \@advisors\par}
			\fi
			\vspace{3\baselineskip}
		\else
			\vspace{2\baselineskip}
			{\Large\@author\par}
			\vspace{3\baselineskip}
			% Check if \@volume starts with a digit
			% Thanks @ egreg <http://tex.stackexchange.com/a/50131/10119>
			{\large\ifnum0<0\@volume\relax\volumetext\space\RN{\@volume}\else\@volume\fi\par}
			\vspace{3\baselineskip}
			\if\@empty\@advisors\relax\else
				{\large\advisortext\par}
				\vspace{\baselineskip}
				{\large\@advisors\par}
			\fi
			\vspace{2\baselineskip}
		\fi
		{\large\if@draft\drafttext\else\datetext\fi\space\@date\space\par}
		\vspace{3\baselineskip}
		\egroup
		\if@draft\else
			{\large\jurytext\par}
			\vspace{\baselineskip}
			{\@jurymembers\par}
		\fi}
	% Begin \frontmatter and print the title page twice, use arabic numbers throughout
	\frontmatter*
	\bgroup
	\reset@twocolumns%
	\setlrmargins{*}{*}{1}
	\checkandfixthelayout
	\cleartorecto
	\printtitle%
	\cleartorecto
	\restore@twocolumns\par
	\egroup
	\let\mainmatter=\@smemmain% == \let\mainmater=\mainmatter*
}

%	Create a style for MA / MPhil theses
\newcommand{\maketitleMemoir}{%
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
	\long\def\printtitle{%
		\setlength{\parindent}{0em}
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
		\cleartorecto
		\printtitle%
		\restore@twocolumns%
		\cleartorecto\par
	\egroup
	\let\mainmatter=\@smemmain% == \let\mainmater=\mainmatter*
}

%	Define a default style for lecture notes, handbooks, etx.
%	TODO » Adde un switch selon qu'on a rajouté article ou pas -- Et supprimer l'article automatique dans didactic(+)
\newcommand{\maketitleDidactic}{%
	% Send out warnings on empty fields
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	% Create the title page
	\long\def\printtitle{
		\reset@twocolumns%
		\raggedright%
		\setlength{\parindent}{0em}
		\normalize@fontsize%
		\vspace*{2\baselineskip}
		{\Large\scshape\csname @title@\languagename\endcsname\par}%
		 \vspace{\baselineskip}%
		{\if\@empty\csname @subtitle@\languagename\endcsname\relax\else
		 \large\csname @subtitle@\languagename\endcsname\par\fi}%
		{\if\@empty\@lecture
			\vspace{\baselineskip}
			\if\@empty\@author\else\@author\par%
			\if\relax\@email\relax\else\emailname:~\@email\par\fi\fi
		 \else
			\vspace{\baselineskip}
			\lecturename:~\@lecture\par
			\if\relax\@email\relax\else\emailname:~\@email\par\fi\par
			\if\@empty\@seminar\else\seminarname:~\@seminar\par\fi\fi}%
		\vspace{\baselineskip}
		{\schoolyearname:~\@date\par}}
	% Print the title page
	\if@article
		\bgroup
			\printtitle\par%
		\egroup
	\else
		\frontmatter
		\bgroup
			\pagestyle{empty}
			\reset@twocolumns%
			\printtitle%
			\restore@twocolumns%
			\cleartorecto\par
		\egroup
		\mainmatter
	\fi
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
		\raggedright%
		\setlength{\parindent}{0em}
		\normalize@fontsize%
		% Imposer une valeur (même \z@) pour maintenir l'alignement vertical:
		\vspace*{0em}% Orig. = 3\baselineskip
		{\Large\scshape\csname @title@\languagename\endcsname}\par%
		\if\@empty\csname @subtitle@\languagename\endcsname\relax\else%
			{\large \noindent\csname @subtitle@\languagename\endcsname}\fi\par%
		\vspace{\baselineskip}
		{\if\@empty\@author\else\@author%
		 \if\@empty\@institution\else, \@institution\fi%
		 \if\relax\@email\relax\else~(\@email)\fi\fi
		 % Revoir le --- (inutile si on laisse les auteurs vides)
		 \if\@empty\@date\else~--- \@date\fi\par}%
		\vspace{2\baselineskip}% TODO » Faire une longueur absorbable s'il y a un skip ensuite
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
		\raggedright%
		\setlength{\parindent}{0em}
		\normalize@fontsize%
		\vspace*{0em}
		{\Large\scshape\csname @title@\languagename\endcsname\if\@empty\csname @subtitle@\languagename\endcsname\relax\else :\par\noindent\csname @subtitle@\languagename\endcsname\fi}\par%
		{\@author~---\space\@date\par}%
		{\if\relax\@email\relax\else\emailname:~\@email\fi\par}%
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
	\setlength{\parskip}{\baselineskip}
	% Print the \maketitle
	\bgroup
	\reset@twocolumns%
	\normalize@fontsize%
	\raggedright%
	\vspace*{-2\baselineskip}
	{\Large\@author}\\%
	\begin{minipage*}{.5\linewidth}
		\raggedright%
		\@address\par
		\if\relax\@fax\relax
			\@email%
			\if\relax\@email\relax\else\if\relax\@phone\relax\else\ / \fi\fi%
			\@phone\par
		\else
			\if\relax\@email\relax\else\emailname:~\@email\fi
			\if\relax\@phone\relax\else\phonename:~\@phone\fi\par
			\faxname:~\@fax\par
		\fi
	\end{minipage*}\par
	\restore@twocolumns%
	\egroup
}

%	Create a style for letters
%	TODO » Internationaliser les textes
\newcommand{\maketitleLetter}{
	\if\@empty\@address\relax
		\@latex@warning@no@line{No \noexpand\address given}\fi
	\if\@empty\@recipient\relax
		\@latex@warning@no@line{No \noexpand\recipient given}\fi
	\if\@empty\@location\relax
		\@latex@warning@no@line{No \noexpand\location given}
	\fi
	\setlength{\parindent}{0em}
	\setlength{\parskip}{\baselineskip}
	\clearpage
	\if\@empty\@logo\relax\else\includegraphics[width=.3\textwidth]{\@logo}\fi\par
	\begin{minipage*}{.5\linewidth}
		\raggedright%
		\@author\par
		\@address\par
		\if\relax\@fax\relax
			\@email%
			\if\relax\@email\relax\else\if\relax\@phone\relax\else\ / \fi\fi%
			\@phone\par
		\else
			\if\relax\@email\relax\else\emailname:~\@email\fi
			\if\relax\@phone\relax\else\phonename:~\@phone\fi\par
			\faxname:~\@fax\par
		\fi
	\end{minipage*}%
	\hfill
	\begin{minipage*}{.4\linewidth}
		\raggedright%
		\if\@empty\@recipient\relax\else\@recipient\fi\par
		\if\@empty\@addressee\relax\else\@addressee\fi\par
		\vspace{\baselineskip}
		\if\@empty\@location\relax\else\@location, \fi \dateprefix\@date
	\end{minipage*}
	\vspace*{\baselineskip}
	\if\@empty\@subject\relax\else\textsc{\subjectname}: \@subject\fi\par
	\if\@empty\@ourRef\relax\else N./Réf.~: \@ourRef\fi\par
	\if\@empty\@yourRef\relax\else V./Réf~: \@yourRef\fi\par
	\vspace{\baselineskip}
}

%	Créate a command for the closing remarks in a letter
%	TODO » Prévoir de pouvoir personnaliser la hauteur de la signature, idéalement pour qu'elle empiète un peu sur le texte (ou dans \makesignature)
\newcommand{\closing}{
	\addvspace{\baselineskip}
	\if\relax\@cc\relax\else%
		\ccname:\hfill%
		\begin{minipage*}{.85\linewidth}\@cc\end{minipage*}%
	\fi\par
	\addvspace{2\baselineskip}
	\makesignature\par
	\if\relax\@enclosed\relax\else%
		\addvspace{2\baselineskip}
		\enclname:\hfill%
		\begin{minipage*}{.85\linewidth}\@enclosed\end{minipage*}
	\fi\par
	% TODO » Ajouter avec les clausiers
	% \nondisclosure
}

%	Set the default title page styles
\titlepagestyle{Book}
\if@article\titlepagestyle{Article}\fi
\if@vitae\titlepagestyle{CV}\fi
\if@letter\titlepagestyle{Letter}\fi
\if@didactic\titlepagestyle{Didactic}\fi
 
%	#####	HEADERS & FOOTERS	#####

%	TODO » Documenté pour les livres, articles, lettres, CVs. Programmer et documenter les docs juridiques

%	Set a style for <book>, <part>, <heading>, <subheading> and <chapter>
\aliaspagestyle{book}{empty}
\aliaspagestyle{part}{plain}
\aliaspagestyle{chapter}{plain}

%	Create a command that uses \rightmark instead of \leftmark if empty
\newcommand{\leftrightmark}{%
	\begingroup\protected@edef\x{\leftmark}%
	\ifx\@empty\x\relax% NE PAS MODIFIER (ou intelligemment, tester en book, twoside)
		\endgroup\rightmark
	\else
		\endgroup\leftmark
	\fi}
\def\clearleftmark{\let\leftmark\@empty}
\def\clearrightmark{\let\rightmark\@empty}

%	Redefine <plain> so that it takes into accout the <twoside> option
\makepagestyle{plain}
	\makeevenfoot{plain}{\if@twoside\thepage\fi}{\if@oneside\thepage\fi}{}
	\makeoddfoot{plain}{}{\if@oneside\thepage\fi}{\if@twoside\thepage\fi}

%	Define the standard page style for the class
%	TODO » Corriger pour \chapter* et \section* (définir \rightmark) -- difficile, on peut les laisser dans le \fontmatter ou \backmatter (à documenter)
%	TODO » Ajouter le numéro de version et la date \if@draft
%	TODO » Supprimé <generic>, utiliser <frenchlaw> + oneside (sinon impression du titre)
\makepagestyle{frenchlaw}
	\makepsmarks{frenchlaw}{%
		\nouppercaseheads
		\createmark{book}{both}{nonumber}{}{}
		\createmark{part}{both}{nonumber}{}{}
		\createmark{chapter}{right}{nonumber}{}{}
		\createplainmark{toc}{right}{\contentsname}
		\createplainmark{lof}{right}{\listfigurename}
		\createplainmark{lot}{right}{\listtablename}
		\createplainmark{bib}{right}{\bibname}
		\createplainmark{index}{right}{\indexname}
		\createplainmark{glossary}{right}{\glossaryname}
		\clearmark{section}
	}
	\makeevenhead{frenchlaw}
		{}
		{\if@article\itshape\csname @title@\languagename\endcsname%
		 \else\itshape\leftrightmark\fi}
		{}
	\makeoddhead{frenchlaw}
		{}
		{\if@article\itshape\@series%
		 \else\itshape\rightmark\fi}
		{}
	\makeevenfoot{frenchlaw}
		{\if@twoside\thepage\fi}
		{\if@oneside\thepage\fi}
		{}
	\makeoddfoot{frenchlaw}
		{}
		{\if@oneside\thepage\fi}
		{\if@twoside\thepage\fi}

%	Define a style for letters, memos and resumés
%	TODO » Regrouper au style frenchlaw?
%	TODO » Documenter: Compiler deux fois
\makepagestyle{letterhead}
	\makeevenhead{letterhead}
		{}
		{\ifnum\value{page}>1%
		 \if@vitae\MakeLowercase{\scshape\@author~-- \cvname}\fi\fi}
		{}
	\makeoddhead{letterhead}
		{}
		{\ifnum\value{page}>1%
		 \if@vitae\MakeLowercase{\scshape\@author~-- \cvname}\fi\fi}
		{}
	\makeevenfoot{letterhead}
		{}
		{\ifnum\value{lastpage}>1\relax%
		 \scshape\pagename\space\thepage\space\pageofname\space\thelastpage\fi}
		{}
	\makeoddfoot{letterhead}
		{}
		{\ifnum\value{lastpage}>1\relax%
		 \scshape\pagename\space\thepage\space\pageofname\space\thelastpage\fi}
		{}

%	TODO » A reprendre pour didactic. Utiliser \leftmark et \rightmark en les redéfinissant (?) -- Tester avec des éléments manquats (email, etc.). Utiliser \relax plutôt que \@empty comme test (également en pages de titre)
\makepagestyle{didactichead}
	\makeheadrule{didactichead}{\textwidth}{.2ex}
	\makeevenhead{didactichead}
		{\textit{\csname @title@\languagename\endcsname%
		 \if\@empty\csname @subtitle@\languagename\endcsname\@empty\else: \csname @subtitle@\languagename\endcsname\fi}%
		 \vspace*{\z@}}
		{}
		{}
	\makeoddhead{didactichead}
		{\textit{\csname @title@\languagename\endcsname%
		 \if\@empty\csname @subtitle@\languagename\endcsname\@empty\else: \csname @subtitle@\languagename\endcsname\fi}%
		 \vspace*{\z@}}
		{}
		{}
	\makeevenfoot{didactichead}
		{\footnotesize{%
			\@author%
			\if\relax\@email\relax\else~(\@email)\fi, %
			\@date.}}
		{}
		{\ifnum\value{lastpage}>1\relax\thepage\fi}
	\makeoddfoot{didactichead}
		{\footnotesize{%
			\@author%
			\if\relax\@email\relax\else~(\@email)\fi, %
			\@date.}}
		{}
		{\ifnum\value{lastpage}>1\relax\thepage\fi}

%	Set Default header styles
\pagestyle{frenchlaw}
%
%\if@letter\pagestyle{letterhead}\fi

\if@vitae\pagestyle{letterhead}\@require@lastpagetrue\fi
\if@letter\pagestyle{letterhead}\@require@lastpagetrue\fi
\if@didactic
	\pagestyle{didactichead}
	\aliaspagestyle{chapter}{didactichead}
\fi

\AtEndDocument{%
	\if@require@lastpage\ifnum\value{page}>1\ifnum\value{lastpage}=0\relax%
		\ClassWarningNoLine{frenchlaw}{Please rerun LaTeX on file: \MessageBreak \jobname.tex \MessageBreak to get correct page numbering}%
	\fi\fi\fi}

%	TODO » Placer avec les commandes babel +  Défaut == "En résumé"
\newcommand{\summaryname}{Pour l'essentiel}
\newcommand{\summarylabel}[1]{\scshape{\hfill\summaryname:}}

%	Créer un environnement <summmary> pour des conclusions avec un label prédéfini
\NewEnviron{summary}
	{\if@summary\bgroup%
		\let\footnote\@gobble%
		\let\sanitize\@gobble%
		\addtocontents{toc}{%
			\if\relax\BODY\relax\else%
				\vskip-\lastskip\vskip\baselineskip%
				\textsc{\summaryname}: \BODY\vskip\baselineskip\par\fi}%
	\egroup\fi%
	\list{}{\vskip\baselineskip%
			\let\makelabel\summarylabel%
			\setlength{\itemsep}{\baselineskip}%
			\setlength{\leftmargin}{2\parindent}}%
	 \item\BODY% + \needspace{2\baselineskip} (?) [Semble inutile]
	 \vskip\baselineskip\endlist}

\newcommand{\vitaelabel}[1]{\footnotesize\itshape{\hfill\strut#1:\strut}}

%	Créer un environnement <vitae> pour les CV (label dans la marge)
\newenvironment{vitae}
	{\list{}{\let\makelabel\vitaelabel
			 \setlength{\leftmargin}{\z@}
			 \setlength{\labelwidth}{\marginparwidth}}}
	{\endlist}

%	Créer une commande pour calculer automatiquement l'âge (vitae)
% \agecalc{dd}{mm}{yyyy}
\newcounter{calculate@age}
\newcommand{\agecalc}[3]{%
	\setcounter{calculate@age}{\the\year}%
	\addtocounter{calculate@age}{-#3}%
	\ifnum\the\month < #2\relax\addtocounter{calculate@age}{-1}\fi%
	\ifnum\the\month = #2\relax
		\ifnum\the\day < #1\relax\addtocounter{calculate@age}{-1}\fi\fi%
	\arabic{calculate@age}~\agename}


%	TPDP » Remonter dans la section languages / babel
%	TODO » Vérifier \bsc, \frquote, \frenchdate, etc. et les mapper sur les commandes normales (cf. doc babel french)

% Load {csquotes} and implement styles for foreign language quotations
\RequirePackage[autostyle=true]{csquotes}
\DeclareQuoteAlias[american]{english}{british}% Use double quotes in British english
\DeclareQuoteStyle[american]{english}% verified
	{\textquotedblleft\em}{\em\kern.1em\textquotedblright}[0.05em]
	{\textquoteleft}{\textquoteright}
\DeclareQuoteStyle{latin}
  {\mkfrenchopenquote{\guillemotleft}\em}
  {\em\mkfrenchclosequote{\guillemotright}}
  {\textquotedblleft}
  {\textquotedblright}


% TODO » Renommer + PLacer avec la section de la doc sur les helper macros + abréviations
\RequirePackage{typographie}


%	Créer les commandes pour faire référence à un numéro
\newcommand{\infra}{\@ifstar{\s@infra}{\@infra}}
\newcommand{\supra}{\@ifstar{\s@supra}{\@supra}}

\newcommand{\@infra}[1]{\emph{infra} \no\ref{para:#1}}
\newcommand{\s@infra}[1]{\emph{infra} \nos\ref{para:#1}~s.}
\newcommand{\@supra}[1]{\emph{supra} \no\ref{para:#1}}
\newcommand{\s@supra}[1]{\emph{supra} \nos\ref{para:#1}~s.}

%	TODO » Créer une commande \precis{} pour indiquer un résumé du paragraphe. Revoir celui de <memoir>
% TODO » Ou imprimer tous les \para + \paraname à la suite dans la ToC, en forme de précis.

%	Créer un environnement {outline} pour indiquer les passages à copier en ToC.
% On utilise le package {environ} pour récupérer le texte dans l'environnement.
% Utiliser \sanitize[<remplacement>]{<original>} pour retirer les passages problématiques de la ToC. Tester. Sinon utiliser une macro sans argument + \@gobble
%	TODO » Documenter \sanitize
\NewEnviron{outline}{%
	\if@outline\bgroup%
		\let\footnote\@gobble%
		\let\sanitize\@gobble%
		\setcounter{precis}{0}
		\addtocontents{toc}{%
			\if\relax\BODY\relax\else%
				\vskip-\lastskip\vskip\baselineskip\BODY\vskip\baselineskip\par\fi}%
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

%	TODO » A déplacer + documenter
%	Créer une commande pour indiquer que le sujet est traité en note
\newcommand{\note}[1]{#1~(\emph{n.})}% dans les index, utiliser: |note

%	TODO » Créer une commande pour des superscripts utilités dans une exégèse
\newcommand{\glose}[1]{\emph{#1).~}\ignorespaces}
\newcommand{\glosemark}[1]{\textsuperscript{\thinspace\emph{#1)}}}



%	#####	CRÉATION DES INDEX ET GLOSSAIRES	#####

%	Préparer les index
\xindyindex
\makeindex
\makeindex[\jobname-bib]
\makeindex[\jobname-law]


%	Use the same styling for letter groups with xindy and makeindex
\newcommand{\lettergroup}[1]{{\centering#1\par}\nopagebreak}

%	Définir le style des index
\setlength{\indexcolsep}{1em}
\renewcommand{\indexspace}{\par\vspace{\baselineskip}\relax}
\renewcommand{\@idxitem}{\par\goodbreak\hangindent 1em}
\renewcommand{\subitem}{\par\hangindent 2em \hspace*{1em}}
\renewcommand{\subsubitem}{\par\hangindent 3em \hspace*{2em}}

%	Appliquer à l'environnement des index
% + Exlude indixes from short ToC
\renewenvironment{theindex}{%
	\clearforchapter
	\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\ifonecolindex
		\onecolumn
		\@schapter{\indexname}
		\preindexhook
	\else
		\setlength{\columnseprule}{\indexrule}%
		\setlength{\columnsep}{\indexcolsep}%
		\twocolumn[\@makeschapterhead{\indexname}\preindexhook]%
	\fi
	\indexmark
	\ifnoindexintoc\else
		\phantomsection
		\addcontentsline{toc}{section}{\indexname}%
	\fi
	\thispagestyle{chapter}% indextitlepagestyle
	\setlength{\parindent}{0em}
	\sloppy
	\let\item\@idxitem}%
	{\if@restonecol\onecolumn\else\twocolumn\fi}

%	Appliquer à l'environnement des glossaires
% + Exlude glossaries from short ToC
\renewenvironment{theglossary}{%
	\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\ifonecolglossary
		\onecolumn
		\@schapter{\glossaryname}
		\preglossaryhook
	\else
		\setlength{\columnseprule}{\glossaryrule}
		\setlength{\columnsep}{\glossarycolsep}
		\twocolumn[\@makeschapterhead{\glossaryname}\preglossaryhook]%
	\fi
	\glossarymark
	\ifnoglossaryintoc\else
		\phantomsection
		\addcontentsline{toc}{section}{\glossaryname}
	\fi
	\thispagestyle{chapter}
	\setlength{\parindent}{0em}
	\sloppy
	\begintheglossaryhook}%
	{\atendtheglossaryhook\if@restonecol\onecolumn\else\twocolumn\fi}

%	Faire en sorte que les index renvoient aux numéros de paragraphes
%	TODO » Define lastpara and save it in .aux. Run twice before indexing. Ou en faire une option activée avec les types de documents...
%\ifnum\value{lastpara}>0
	\if@indexparagraphs
		\renewcommand{\preindexhook}{%
			Les numéros renvoient aux paragraphes et non aux pages.\par\vspace{2\baselineskip}}
		\newcommand{\paraindex}[1]{\specialindex{\jobname}{para}{#1}}
		\newcommand{\bibindex}[1]{\specialindex{\jobname-bib}{para}{#1}}
		\newcommand{\lawindex}[1]{\specialindex{\jobname-law}{para}{#1}}
		\newcommand{\refindex}[1]{\specialindex{\jobname-ref}{para}{#1}}
		\AtBeginDocument{\let\index\paraindex}
	\else
		\newcommand{\bibindex}[1]{\index{\jobname-bib}{#1}}
		\newcommand{\lawindex}[1]{\index{\jobname-law}{#1}}
		\newcommand{\refindex}[1]{\index{\jobname-ref}{#1}}
	\fi
%\fi

%	#####	CRÉATION DES BIBLIOGRAPHIES (BIBLATEX)	#####

%	Create macros in case we want to use package <publist> (in CV style)
% Prévoir de charger le style <frenchlaw> dans les listes de publications des CV
% Ou le mettre par défaut et virer le switchç
\newcommand*{\publistbasestyle}{frenchlaw}

%	Charger <biblatex> avec les options
\RequirePackage[
	style=frenchlaw,
	\if@article
		useshortauthor=false,
	\fi
	\if@vitae
		bibstyle=publist,
		marginyear=false,% TODO » True
		% TODO » Avec la versio 2019
		% plnumbered=reset,
	\fi
	backend=biber,
	indexing=cite,
    hyperref=auto,
	% citereset=chapter,
	mincrossrefs=2,
	autolang=other*]{biblatex}

% BibLaTeX specific penalties
\setcounter{abbrvpenalty}{9000}% Discourage line breaking within abbreviations [Orig. 100]

%	Exclude bibliographies from the short table of contents
% Do no automatically print subbibliographies in the ToC (use "subbibintoc" heading for that purpose)
\defbibheading{bibliography}[\bibname]{%
	\clearforchapter
	\thispagestyle{chapter}
	\@schapter{#1}
	\chaptermark{#1}
    \ifmemoirbibintoc
		{\phantomsection
		 \addcontentsline{toc}{section}{#1}}
		{}}
\defbibheading{biblist}[\biblistname]{%
	\clearforchapter
	\thispagestyle{chapter}
	\@schapter{#1}
	\chaptermark{#1}
	\ifmemoirbibintoc
		{\phantomsection
		 \addcontentsline{toc}{section}{#1}}
		{}}
\defbibheading{subbibliography}[\refname]{%
	\bgroup
	\normalize@fontsize
	\section*{#1}
	\egroup}%


%	TODO » Sortir tout ce qu'on peut du \if@vitae -- créer un .bbx exprès qui charge publist et modifie ce qu'il faut
%	+ Documenter l'option {short} et le switch \iflongcv à utiliser dans le corps du CV pour délimiter les deux versions du document
\if@vitae
	%	Use bibliography headings that fit the rest of the CV
	\defbibheading{bibliography}[\refname]{\section*{#1}}
	\defbibheading{subbibliography}[\refname]{\paragraph*{#1}}

	\plauthorname{Vern}% [Flora]{Vern} (mais bug)

	% Use own style for book reviews
	\DeclareBibliographyAlias{review}{article}
	% Reset article pagination to default (print page range)
	\DeclareFieldFormat[article,commentary,review]{pages}{%
		\mkpageprefix[bookpagination]{#1}}

	%	Number CV items by section and in reverse order
	% Count total number of entries in each refsection
	% Thanks @ Audrey <https://tex.stackexchange.com/a/22770/10119>
	\AtDataInput{%
		\csnumgdef{entrycount:\therefsection}{%
			\csuse{entrycount:\therefsection}+1}}
	% Print the labelnumber as the total number of entries in the current refsection, minus the actual labelnumber, plus one
	\DeclareFieldFormat{labelnumber}{\mkbibdesc{#1}}    
	\renewcommand*{\mkbibdesc}[1]{%
		\number\numexpr\csuse{entrycount:\therefsection}+1-#1\relax}

	% Print the publication {year} in the margin if it is different from the previouw entry, subsidiarily, print the {eventyear} or the {pubstate}.
	%	TODO » \if@marginyear plante si on n'est pas en mode CV, sans doute car undefined => créer le switch (?)
	\renewbibmacro*{marginyear}{%
		%\if@marginyear
			\iffieldundef{year}
				{\ifthenelse{	\iffieldundef{eventyear} \OR
								\iffieldequals{eventyear}{\bbx@lasthash} }
					{\ifthenelse{	\iffieldundef{pubstate} \OR
									\iffieldequals{pubstate}{\bbx@lasthash} }
						{}
						{\marginpar{\nopunct\vitaelabel{\printfield{pubstate}}}%
						 \savefield{pubstate}{\bbx@lasthash}}}
					{\marginpar{\nopunct\vitaelabel{\printfield{eventyear}}}%
					 \savefield{eventyear}{\bbx@lasthash}}}
				{\iffieldequals{year}{\bbx@lasthash}
					{}
					{\marginpar{\nopunct\vitaelabel{\printfield{year}}}%
					 \savefield{year}{\bbx@lasthash}}}%
		%\fi%
		}

	% Do not print the label year, since it is in the margin already
	\renewbibmacro*{year+labelyear}{}
\fi

% Problèmes:
%	- Sorting des postnotes (??)
%	  Break au premier non-integer pour le classement.
%	- Ajouter "art." avant. ± les "anc." des prenotes (ou CNap directement).
%	- Pour les types autres que législation, mettre ça dans l'index par auteur
%	  Cf. index:name:title dans biblatex.def
% \DeclareIndexFieldFormat{indextitle}{%
% 	\usebibmacro{index:entry}%
% 		{\lawindex}
% 		{\mkbibindexfield{\thefield{indexsorttitle}}{#1}%
% 		 \mkbibindexsubentry{\thefield{postnote}}{\textbf{\thefield{postnote}}}}}
% \DeclareIndexFieldFormat{indextitle}{%
% 	\usebibmacro{index:entry}%
% 		{\lawindex}
% 		{%\mkbibindexfield{\thefield{labelname}!}{\thefield{labelname}}%
% 		 \mkbibindexsubentry{\thefield{indexsorttitle}}{#1}%
% 		 \mkbibindexsubentry{\thefield{postnote}}{\textbf{\thefield{postnote}}}}}

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
	\phantomsection
	\addcontentsline{toc}{chapter}{\protect\numberline{\thedivision}#1}
	{\Large\scshape\raggedright\thedivision. \@division}
	 \par\addvspace{\baselineskip}
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
	 \reset@twocolumns
	 \if\relax#1\relax\else\selectlanguage{#1}\vspace{\baselineskip}\fi
	 \if@article
		{\noindent\scshape\raggedright\abstractname:\space}
	 \else
		\setlength{\parindent}{0em}
		\normalize@fontsize
		{\noindent\large\scshape\raggedright\csname @title@\languagename\endcsname:\space
		 \csname @subtitle@\languagename\endcsname}\par
		\setlength{\parindent}{1.5em}
		\vspace{\baselineskip}
	 \fi}
	{\if@article\vspace{2\baselineskip}\fi%
	 \restore@twocolumns\egroup}

%	Créer une commande <keywords>, qui peut être utilisée dans le résumé
\newcommand{\keywords}[2][]{%
	\bgroup
	\reset@twocolumns
	\if\relax#1\relax\else\selectlanguage{#1}\fi
	\setlength{\parindent}{0em}
	\normalize@fontsize
	\addvspace{\baselineskip}
	{\noindent\scshape\raggedright\keywordsname:\enskip}{#2}\par%
	\vspace{\baselineskip}
	\restore@twocolumns\egroup}



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

%	Create a command that prints abbreviations
\newlength{\abbreviationwidth}
\newlength{\this@abbreviationwidth}
\newenvironment{abbreviations}
	{\list{}{\setmaxlength{\labelwidth}{\abbreviationwidth}%
			 \setmaxlength{\labelwidth}{\shortjournalwidth}%
			 \setlength{\leftmargin}{\labelwidth}%
			 \setlength{\labelsep}{\biblabelsep}%
			 \addtolength{\leftmargin}{\labelsep}%
			 \setlength{\itemsep}{\bibitemsep}%
			 \setlength{\parsep}{\bibparsep}%
			 \raggedright%
			 \renewcommand*{\makelabel}[1]{##1\hss}}}
	{\endlist}

\def\@shorthandlist{}
% Adde un moyen de vérifier si \@shorthandlist est vide (tout en le laissant vide, car il ne peut contenir que des \item )
\def\printabbreviations{%
		\clearforchapter
		\thispagestyle{chapter}
		\@schapter{\listabbreviationname}
		\chaptermark{\listabbreviationname}
		\ifmemoirbibintoc
			{\phantomsection
			 \addcontentsline{toc}{section}{\listabbreviationname}}
			{}
		\begin{abbreviations}
			\@shorthandlist
		\end{abbreviations}}
\newcommand{\abbreviation}[2]{%
	\appto\@shorthandlist{\item[#1]{#2}}%
	\settowidth{\this@abbreviationwidth}{#1}%
	\setmaxlength{\abbreviationwidth}{\this@abbreviationwidth}}
\newcommand{\bibabbreviation}[1]{%
	\appto\@shorthandlist{\item[\citeshorttitle{#1}]{\citetitle{#1}}}%
	\settowidth{\this@abbreviationwidth}{\citeshorttitle{#1}}%
	\setmaxlength{\abbreviationwidth}{\this@abbreviationwidth}}


%	Définir les éléments du <frontmatter>
% Ajouter un \addtocontents{toc}{\vspace{\baselineskip}} pour ajouter de l'espace avant le corps du texte
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
% Ajouter un \addtocontents{toc}{\vspace{\baselineskip}} pour ajouter de l'espace avant les bilios
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

%	TODO » Adde un moyen de choisir entre la page de garde et une couv. perso
% Ou deux commandes: \makefrontcover et \makefancycover
\newcommand{\makefrontcover}{%
	\cleartorecto
	\setlrmargins{*}{*}{1}
	\checkandfixthelayout
	\thispagestyle{empty}
	\printtitle}

\newcommand{\makebackcover}[1]{%
	\cleartorecto\cleartoverso
	\setlrmargins{*}{*}{1}
	\checkandfixthelayout
	\thispagestyle{empty}
	\include{#1}}

\newcommand{\makespine}[1]{%
	\cleartorecto
	\setlrmargins{*}{*}{1}
	\checkandfixthelayout
	\thispagestyle{empty}
	\bgroup
	\centering%
	\rotatebox{90}{%
		\parbox[t]{\textheight}{%
		\Large%
		\hfill%
		\csname @title@\languagename\endcsname:\space%
		\csname @subtitle@\languagename\endcsname%
		\if\@empty\@volume\relax\else
			\Large\enspace\textbullet\enspace\volumetext\space\RN{\@volume}
		\fi
		\hfill%
		\Large\@author}}\par
	\egroup}


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
	\addvspace{\baselineskip}}


%	Create a command for alternative emphasis of text (Bold ± Color).
\DeclareTextFontCommand{\headline}{\bfseries\color{\@headlinecolor}}
% Create color specification commands
\newcommand{\headlinecolor}[1]{\gdef\@headlinecolor{#1}}
	\newcommand{\@headlinecolor}{black}% E.g. "black", "darkgray"

%	TODO » Créer un mode couleur => pour les didactic + éventuellement dans le CV (healine), les environnements showcase, etc. -- ou même pour les titres de section (sans serif + gras / couleur == tester sur la documentation)

%	#####	GESTION DU MODE DRAFT	#####

% TODO » Requires two runs of LaTeX in order to place the marks correctly.
\RequirePackage{marginnote}

%	TODO » On utilise \ifdraftdoc (de memoir) pour exclure le \if@draft (version pré-inale du manuscrit, qui ne doit pas avoir de coquilles)
%	==> Créer deux options:
%		[draft] == afficher les motifs colorées + les marques dans la marge.
%		[draft+] == afficher la version consolidée + les marques dans la marge.
%	TODO » Ajouter toutes les modifs à une liste de todo, e.g. Ajouter: --- p. X (auteur)
\renewcommand{\added}[2][]{%
	\if@draft
		\marginnote
			[\raggedright\textcolor{teal}{\small #1 $\bigoplus$}]
			{\raggedleft\textcolor{teal}{\small #1 $\bigoplus$}}\fi%
	\ifdraftdoc\textcolor{teal}{#2}\else#2\fi}

\renewcommand{\changed}[3][]{%
	\if@draft
		\marginnote
			[\raggedright\textcolor{cyan}{\small #1 $\Leftrightarrow$}]
			{\raggedleft\textcolor{cyan}{\small #1 $\Leftrightarrow$}}\fi%
	\ifdraftdoc\textcolor{cyan}{#3}\else#3\fi}

\renewcommand{\deleted}[2][]{%
	\if@draft
		\marginnote
			[\raggedright\textcolor{purple}{\small #1 $/\kern-1ex/$}]
			{\raggedleft\textcolor{purple}{\small #1 $/\kern-1ex/$}}\fi%
	\ifdraftdoc
		\textcolor{purple}{\kern-.25ex$/$\kern-.4ex #2$/$\kern-.25ex}%
		\else\ifvmode\else\unskip\fi\fi}

\newcommand{\todo}[2][]{%
	\if@draft
		\marginnote
			[\raggedright\textcolor{violet}{\small #1 $\bigodot$}]
			{\raggedleft\textcolor{violet}{\small #1 $\bigodot$}}\fi%
	\ifdraftdoc
		\ifvmode\else\unskip\fi~\textcolor{violet}{$\bigodot$\kern1ex#2}%
		\else\ifvmode\else\unskip\fi\fi}

%	TODO » A reprendre
%	Si on est en mode <draft>, afficher le cadre et marquer les overfull hbox
\if@draft
	% Imprimer une marque pour les lignes qui dépassent du cadre
	\overfullrule=5pt
	% \RequirePackage{showframe}
	% \showtrimson
	%	Imprimer les indexes
	% \let\old@index=\index
	% \AtBeginDocument{\renewcommand{\index}[1]{\marginpar{\color{orange}{#1}}\old@index{#1}}}
\fi

%	TODO » Préparer des environnements avec tcolorbox pour les fiches pédagogiques
%	TODO » Documenter les jeux de notes de bas de page +/- fin de document pour les éditions critiques

\def\point{\addvspace{\baselineskip}\noindent\textrightarrow\enspace\textbf}

%	TODO » Rechercher toutes les "color" pour en faire une liste dans la documentation (et éventuellement harmoniser + créer une otiion black/color)

%	TODO » Implémenter <hyperref>
%\RequirePackage{hyperref}% Mais crée des bugs avec les références type \supra

%	TODO » Vérifier tous les warnings et les résoudre
%	<fmtcount> trouve un \ordinal déjà défini > par qui / inverser l'ordre ou désactiver?
%	Fontshape `TU/OrnementsADF/m/n` undefined ==> Tester quel emploi de adforn provoque le warning -- peut-être en utilisant la commande par nom complet (cf. la doc du package)?
%	Option <english> à remplacer par <british> partout
%	Fichier de langue latine pour biblatex (?)

%	TODO » Définir une commande pour les \todo
%	TODO » Ajouter un environnement pour les projets avec timing (cf. lettre de motivation / avancement ATER Lyon)

\if@dev
	\RequirePackage{frenchlaw-dev}
\fi


%	Configure LzTeX & friends logos
\RequirePackage{metalogo}
\if@sansserif
	\renewcommand{\familydefault}{\sfdefault}
	\setlogokern{Xe}{-.03em}
	\setlogokern{La}{-.1em}
	\setlogokern{aT}{-.04em}
\else
	\setlogokern{Xe}{-.3ex}
	\setlogokern{eT}{-.35ex}
	\setlogokern{eL}{-.25ex}
	\setlogokern{La}{-.65ex}
	\setlogokern{aT}{-.25ex}
	\setlogokern{Te}{-.35ex}
	\setlogokern{eX}{-.25ex}
	\setLaTeXa{\raisebox{.25em}{\scshape a}}
	\setlogodrop{.25em}
\fi

%	Create the frenchlaw logo
\newcommand{\frenchlaw}{%
	\if@sansserif
		{\itshape F\kern-.2ex rench}%
		 L\kern-.4ex%
		 \raisebox{.25em}{\scshape a}\kern-.1ex%
		 W%
	\else\ifxetex
			{\itshape F\kern-.2ex rench}%
			 L\kern-.7ex%
			 \raisebox{.25em}{\scshape a}\kern-.3ex%
			 W%
		\else
			{\itshape French\kern.1ex}%
			 L\kern-.65ex%
			 \raisebox{.2em}{\scshape a}\kern-.3ex%
			 W%
	\fi\fi\xspace}



% Adde: If file exists!

\IfFileExists{frenchlaw.cnf}
	{\input{frenchlaw.cnf}}
	{}




%%   End of class Frenchlaw