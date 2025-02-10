%
%   This is file "frenchlaw.cls", which is part of the "frenchlaw" package
%   Copyright 2009--2025: Fora VERN -- ienissei (at) gmail (dot) com
% 
%   This work may be distributed and/or modified under the conditions of the
%   LaTeX Project Public License, either version 1.3 of this license or, at your
%   option, any later version.
%
%   The latest version of the license can be found at:
%      http://www.latex-project.org/lppl.txt
%   and version 1.3 or later is part of all distributions of LaTeX, 2005/12/01 or later.
% 
%   This work has the LPPL maintenance status "author-maintained".
%   This work consists of the files listed in the README file.
%

%	The associated documentation file <frenchlaw-cls.tex> was produced from this code by simply stripping the double percent signs at the beginning of lines, transforming the code into a LaTeX file.

%% \begin{noprint}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{frenchlaw}%
	[2018/08/24 v.0.9. Versatile document class for French law, based on memoir]
%% \end{noprint}


% =***======***======***======***======***======***======***======***======***======***=

% ##### CLASS OPTIONS #####

%% \chapter{Options de la classe \frenchlaw}

%% La classe \frenchlaw~(\file{frenchlaw.cls}) a été conçue avec de nombreuses options qui permettent de paramétrer l'apparence générale et les fonctionnalités du document. La classe charge le package |xkeyval|, qui pourra être utilisé pour développer de nouvelles options. Pour sélectionner plusieurs options, il suffit de les séparer d'une virgule. En cas d'options mutuellement exclusives, seule la dernière sera prise en compte.

%% \begin{noprint}
%	Load <xkeyval>
\RequirePackage{xkeyval}
%% \end{noprint}

% TODO > Déplacer les styles spécifiques (hors classic / modern), type textbook, écoles docotrales, éditeurs, etc. vers des fichiers .sty, chargés à un endroit de la doc qui les décrit tous = chapterstyle, parastyle, head/foot, maketitle
% TODO > Option textbook qui utilise le style de paragraphe textbook + créer un chapterstyle pour textbook (quid du sérif ou sans pour les titres?), avec des couleurs et fleurons ou points pour les titres princumaux, voire de l'encre en marge ---  \parinddent normal et \parskip=\z@, même avec l'option modern --- et décider pour le style classic / modern, ou faire des variantes pour les deux.

% TODO » Voir si on supprime didactic ± renommer en <lecture>

% TODO » Commandes pour les articles + clause de contrats (praticiens) --- même principe que \para et \usbpara, mais documentées ailleurs

%% \begin{noprint}
%	Create the switches required for all options
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
\newif\if@marginalia
	\@marginaliafalse
%% \end{noprint}

%% \begin{noprint}
%	Typefaces
\newif\if@tenpoints
	\@tenpointsfalse
\newif\if@elevenpoints
	\@elevenpointsfalse
\newif\if@twelvepoints
	\@twelvepointsfalse
\newif\if@fourteenpoints
	\@fourteenpointsfalse
\newif\if@modern
	\@modernfalse
\newif\if@sansserif
	\@sansseriffalse
\newif\if@simplespacing
	\@simplespacingfalse
%% \end{noprint}

%% \begin{noprint}
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
%% \end{noprint}

%% \begin{noprint}
%	Document features
\newif\if@draft
	\@draftfalse
\newif\iflong
	\longtrue
\newif\if@colour
	\@colourfalse
\newif\if@colourall
	\@colourallfalse
\newif\if@paraname
	\@paranametrue
\newif\if@precis
	\@precisfalse
\newif\if@subprecis % This switch is not currently associated with a class option
	\@subprecisfalse
\newif\if@outline
	\@outlinefalse
\newif\if@summary
	\@summaryfalse
\newif\if@indexparagraphs
	\@indexparagraphstrue
\newif\if@require@lastpage
	\@require@lastpagefalse
%% \end{noprint}

%% \begin{noprint}
%	Developer features
\newif\if@dev
	\@devfalse
\newif\if@grid
	\@gridfalse
%% \end{noprint}

%% \begin{noprint}
%	Language settings
\newif\if@british
	\@britishfalse
\newif\if@english
	\@englishfalse
\newif\if@french
	\@frenchfalse
%% \end{noprint}


% ===== Page Layout =====

%% \section{Format de la page}

%% Les options qui suivent permettent de définir la taille du papier et l'apparence générale de la composition typographique. La plupart sont similaires dans leur principe à leur équivalent de la classe |memoir|, mais leurs effets ont été étendus.

%% \describe[a4paper]{%
%%	\option{a4paper}{Option de classe utilisée pour composer sur une feuille \texttt{a4}~(par défaut).}, 
%%	\option{a5paper}{Option de classe utilisée pour composer sur une feuille \texttt{a5}.}, 
%%	\option{a6paper}{Option de classe utilisée pour composer sur une feuille \texttt{a6}.}}
%% Dimensions de la feuille de papier. Contrairement aux options éponymes de la classe |memoir|, la taille du texte, les marges et le bloc de texte sont redéfinis automatiquement par ces options de manière à optimiser la mise en pages pour toutes les tailles de papier. Pour s'adapter à la page, la police d'écriture par défaut sera de |12pt| avec |a4paper|, de |11pt| avec |a5paper| et de |10pt| avec |a6paper|.

%% \begin{developer}
%% Il est possible de vérifier quelle option a été chargée et d'en modifier le comportement grâce aux opérateurs: \cs{if@stockaiv}{Opérateur conditionnel attaché à l'option |a4paper|.}, \cs{if@stockav}{Opérateur conditionnel attaché à l'option |a5paper|.} et \cs{if@stockavi}{Opérateur conditionnel attaché à l'option |a6paper|.}.
%% \end{developer}

%% \begin{noprint}
%	Define options for paper sizes <a4paper>, <a5paper> & <a6paper>
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
	\PassOptionsToClass{a5paper,11pt}{memoir}
}
\DeclareOptionX{a6paper}{
	\@stockavitrue
	\@stockaivfalse\@stockavfalse
	\@tenpointstrue
	\@elevenpointsfalse\@twelvepointsfalse\@fourteenpointsfalse
	\PassOptionsToClass{a6paper,10pt}{memoir}
}
%% \end{noprint}

%% \describe[twoside]{%
%%	\option{oneside}{Option de classe utilisée pour composer en recto simple: marges identiques à gauche et à droite.}, 
%%	\option{twoside}{Option de classe utilisée pour composer en recto-verso: marges différentes le long de la reliure et sur le bord opposé~(par défaut).}}
%% Préparer le document pour une impression en recto simple~(marges identiques) ou, par défaut, en recto-verso~(marges différentes le long de la reliure et sur le bord opposé).

%% \begin{developer}
%% Il est possible de vérifier quelle option a été chargée et d'en modifier le comportement grâce aux opérateurs: \cs{if@oneside}{Opérateur conditionnel attaché à l'option |oneside|.} et \cs{if@twoside}{Opérateur conditionnel attaché à l'option |twoside|.}.
%% \end{developer}

%% \begin{noprint}
%	Define options for <oneside> & <twoside>
\DeclareOptionX{oneside}{
	\@onesidetrue\@twosidefalse
	\PassOptionsToClass{oneside}{memoir}
}
\DeclareOptionX{twoside}{
	\@twosidetrue\@onesidefalse
	\PassOptionsToClass{twoside}{memoir}
}
%% \end{noprint}

%% \describe[onecolumn]{%
%%	\option{onecolumn}{Option utilisée pour composer le texte en une seule colonne~(par défaut).}, 
%%	\option{twocolumn}{Option utilisée pour composer le texte en deux colonnes.}}
%% Composition de la page en une ou deux colonnes. Cette option est simplement transmise à la classe |memoir| qui la gère intégralement. La présentation en deux colonnes n'est pas recommandée avec les petites tailles de papier, pour des raisons d'esthétique. Au format |A4|, il est préférable d'utiliser une police de |10pt|. L'option |twocolumn| désactive automatiquement |marginal|.

%% \begin{developer}
%% Il est possible de vérifier quelle option a été chargée et d'en modifier le comportement grâce aux opérateurs: \cs{if@onecolumn}{Opérateur conditionnel attaché à l'option |onecolumn|.} et \cs{if@twocolumn}{Opérateur conditionnel attaché à l'option |twocolumn|.}.
%% \end{developer}

%% \describe[false]{%
%%	\option{landscape}{Option de classe utilisée pour composer au format paysage.}}
%% Cette option permet de composer la page au format paysage, également dit \emph{à l'italienne}. Elle est simplement adaptée de la classe |memoir|.

%% \begin{developer}
%% Il est possible de modifier le comportement de l'option grâce à l'opérateur \cs{if@landscape}{Opérateur conditionnel attaché à l'option |landscape|.}.
%% \end{developer}

%% \begin{noprint}
%	Define option for <landscape> format
\DeclareOptionX{landscape}{
	\@landscapetrue
	\PassOptionsToClass{landscape}{memoir}
}
%% \end{noprint}

%% \describe[false]{%
%%	\option{marginalia}{Option de classe permettant d'augmenter la taille des marges extérieures et d'y imprimer les titres de certaines subdivisions secondaires.}}
%% L'option |marginal| permet d'augmenter la taille de l'une des marges latérales: à droite pour les documents en mode |oneside| et en alternance en mode |twoside|. La marge est alors utilisée pour imprimer notamment les titres des subdivisions secondaires~(|\paragraph|, |\subparagraph| et |\para|). Elle est désactivée par l'option |twocolumn| avec laquelle elle est incompatible.

%% \begin{developer}
%% Il est possible de modifier le comportement de l'option grâce à l'opérateur \cs{if@marginalia}{Opérateur conditionnel attaché à l'option |marginalia|.}.
%% \end{developer}

%% \begin{noprint}
%	Define option for <marginalia> layout
\DeclareOptionX{marginalia}{
	\@marginaliatrue
}
%% \end{noprint}


% ===== Typography =====

%% \section{Paramètres typographiques}

%% Les options suivantes permettent de configurer la manière dont le texte sera composé: sa taille, sa forme et l'interligne à utiliser. Ces éléments sont essentiels pour la composition de la page et sont donc chargés au niveau des options de classe. Pour modifier la police d'écriture elle-même, voir \todo{Réf. à la section concernée}.

%% \describe[12pt]{%
%%	\option{10pt}{Option de classe permettant de composer en \safeverb[\optioncolor]{10pt}~(par défaut en \safeverb[\optioncolor]{a6paper}).}, 
%%	\option{11pt}{Option de classe permettant de composer en \safeverb[\optioncolor]{11pt}~(par défaut en \safeverb[\optioncolor]{a5paper}).}, 
%%	\option{12pt}{Option de classe permettant de composer en \safeverb[\optioncolor]{12pt}~(par défaut en \safeverb[\optioncolor]{a4paper}).}, 
%%	\option{14pt}{Option de classe permettant de composer en \safeverb[\optioncolor]{14pt}.}}
%% Taille de la police utilisée pour le corps du texte. Celle-ci est de |12pt| par défaut avec |a4paper|. Pour les autres tailles de papier, la police est de |11pt| avec |a5paper| et |10pt| avec |a6paper|.

%% \begin{developer}
%% Il est possible de vérifier quelle option a été chargée et d'en modifier le comportement grâce aux quatre opérateurs suivants: \cs{if@tenpoints}{Opérateur conditionnel attaché à l'option |10pt|.}, \cs{if@elevenpoints}{Opérateur conditionnel attaché à l'option |11pt|.}, \cs{if@twelvepoints}{Opérateur conditionnel attaché à l'option |12pt|.} et \cs{if@fourteenpoints}{Opérateur conditionnel attaché à l'option |14pt|.}.
%% \end{developer}

%% \begin{noprint}
%	Define options for font sizes <10pt>, <11pt>, <12pt> and <14pt>
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
%% \end{noprint}

%% \describe[classic]{%
%%	\option{classic}{Option de classe utilisée pour composer un document respectant les canons de l'imprimerie traditionnelle: police d'écriture à empattements, paragraphes en retrait.}, 
%%	\option{modern}{Option de classe utilisée pour composer un document dans un style contemporain adapté à un usage mixte imprimé et numérique: police sans-serif de contraste et saut de ligne entre les paragraphes.}}
%%	\option{modernsans}{Option de classe utilisée pour composer un document dans un style contemporain adapté à un usage principalement numérique: tout le document est composé dans une police sans-serif, avec des sauts de lignes entre les paragraphes.}
%% L'option |classic|~(par défaut) est utilisée pour composer un document respectant les canons de l'imprimerie traditionnelle: police d'écriture à empattements, paragraphes en retrait. L'option |modern| embrasse les standards contemporains adaptés à un usage mixte imprimé et numérique. Une police sans-serif est utilisée pour contraster la police à empattements, notamment dans les titres; les paragraphes sont séparés par des sauts de ligne plutôt que par un retrait. L'option |modernsans| reprend les mêmes caractéristiques, mais elle utilise une police sans-serif pour la totalité du texte.

%% \begin{developer}
%% Il est possible de modifier le comportement des deux options grâce aux l'opérateur \cs{if@modern}{Opérateur conditionnel attaché aux options |modern| et \latin{a~contrario} |classic|.}.
%% \end{developer}

%% \begin{noprint}
%	Define options for classic (print) and modern (web + print) styles
\DeclareOptionX{classic}{
	\@modernfalse
}
\DeclareOptionX{modern}{
	\@moderntrue
}
\DeclareOptionX{modernsans}{
	\@moderntrue
	\@sansseriftrue
}
%% \end{noprint}

%% \describe[serif]{%
%%	\option{serif}{Option de classe utilisée pour composer avec une police à empattements.},
%%	\option{sans-serif}{Option de classe utilisée pour composer avec une police sans empattements.}}
%% Une police d'écriture avec empattements~(|serif|) est utilisée pour les documents rédigés, alors qu'une police plus épurée~(|sans-serif|) est employée pour la correspondance.

%% \begin{developer}
%% Il est possible de modifier le comportement des deux options grâce à l'opérateur \cs{if@sansserif}{Opérateur conditionnel attaché aux options |sans-serif| et \latin{a~contrario} |serif|.}.
%% \end{developer}

%% \begin{noprint}
%	Define options for serif or sans font
\DeclareOptionX{serif}{
	\@sansseriffalse
}
\DeclareOptionX{sans-serif}{
	\@sansseriftrue
	\@moderntrue
}
%% \end{noprint}

%% \describe[default]{%
%%	\option{linespacing}[simple, default, median, double]{Option permettant de définir l'interligne du document à partir de valeurs standard fréquemment exigées pour les manuscrits: interligne simple~(\texttt{12/13,8pt}), interligne médian (\texttt{12/18pt}), interligne double~(\texttt{12/24pt}). Outre ces options, l'interligne utilisé par défaut optimise la lisibilité~(\texttt{12/16,5pt}).}}
%% L'option |linespacing| permet de d'ajuster l'interligne par rapport aux valeurs standard en redéfinissant la valeur de |\baselinestretch|. L'option permet de modifier l'interligne pour l'une des valeurs prédéfinies suivantes:
%% \begin{itemize}
%% \item Interligne par défaut (ratio de 1,375 ou \texttt{12pt/16,5pt})
%% \item Interligne simple (espacement minimal sans chevauchements, ou \texttt{12pt/13,8pt})
%% \item Interligne médian (une fois et demie le corps du texte, ou \texttt{12pt/18pt})
%% \item Interligne double (soit l'équivalent d'un saut de ligne, ou \texttt{12pt/24pt})
%% \end{itemize}

%% \begin{developer}
%% L'interligne est défini par la macro \cs{custom@baselinestretch}{Macro interne contenant la valeur de |\baselinestretch| choisie dans les options de classe.}\arg{value}. Pour chaque option, cette cette définition est contenue dans les macros suivantes: \cs{set@defaultspacing}{Macro interne stockant la valeur à donner à |\baselinestretch| lors que l'interligne |default| est sélectionné dans les options de classe.}, \cs{set@medianspacing}{Macro interne stockant la valeur à donner à |\baselinestretch| lors que l'interligne |median| est sélectionné dans les options de classe.}, \cs{set@simplespacing}{Macro interne stockant la valeur à donner à |\baselinestretch| lors que l'interligne |simple| est sélectionné dans les options de classe.} et \cs{set@doublespacing}{Macro interne stockant la valeur à donner à |\baselinestretch| lors que l'interligne |double| est sélectionné dans les options de classe.}. On applique ensuite la valeur de |\custom@baselinestretch| correspondant à l'option sélectionnée. Il est possible de créer une nouvelle option |linespacing=<opt-name>| avec le code:\par
%% \vspace{-\baselineskip}
%% \begin{macro}
%%	\newcommand{\set@<opt-name>spacing}{%
%%	  \def\custom@baselinestretch{<value>}}
%% \end{macro}\par
%% \vspace{-\baselineskip}
%% \noindent En outre, la composition du texte en interligne simple étant susceptible requérir des ajustements, l'opérateur conditionnel \cs{if@simplespacing}{Opérateur conditionnel attaché à l'option |linespacing=single|.} a également été créé.
%% \end{developer}

%% \begin{noprint}
%	Define an option to change line spacing
% Note: The value of \custom@baselinestretch is calculated based on the standard linespread (also used by memoir) which is 1,25. This number is factored in order to reach the desired linespacing.
\newcommand{\set@defaultspacing}{\def\custom@baselinestretch{1.1}}%	12/16,5pt
\newcommand{\set@medianspacing}{\def\custom@baselinestretch{1.2}}%	12/18pt
\newcommand{\set@simplespacing}{%
	\@simplespacingtrue
	\def\custom@baselinestretch{.92}}%	12/13.8pt
\newcommand{\set@doublespacing}{\def\custom@baselinestretch{1.6}}%	12/24pt
\DeclareOptionX{linespacing}[default]{
	% Select linespacing command or print an error message
	\ifcsname set@#1spacing\endcsname
		\csname set@#1spacing\endcsname
	\else
		\AtEndDocument{\ClassWarning{frenchlaw}{%
			Unknown option linespacing=#1, \MessageBreak
			Valid arguments are: "default", "simple", "median" \MessageBreak
			and "double". Reverting to default}}%
	\fi
}
%% \end{noprint}


% ===== Document Styles =====

%% \section{Formats de documents}

%% La classe \frenchlaw prévoit différents formats de documents adaptés aux écrits universitaires, à la correspondance, etc. Ceux-ci chargent automatiquement les options nécessaires pour assurer la cohérence typographique du document et son adaptation optimale aux besoins de l'utilisateur. Il est donc, en principe, inutile d'utiliser les options ci-dessus lorsqu'on utilise un modèle, sauf pour en modifier le comportement. Auquel cas, les différentes options doivent être chargées après le modèle.

%% \frenchlaw est configurée par défaut pour des documents universitaires ou des rapports d'une certaine longueur, pouvant s'apparenter à des monographies. D'autres formats sont disponibles grâce aux options ci-dessous.

%% \describe[false]{%
%%	\option{article}{Option de classe utilisée pour composer des articles.}}
%% Cette option est adaptée à la production de textes courts, comme les articles, les notes de jurisprudence ou les dissertations. Elle charge l'option |oneside|, qui est souvent choisie pour ce type de document.

%% \begin{developer}
%% Il est possible de modifier le comportement de l'option grâce à l'opérateur \cs{if@article}{Opérateur conditionnel attaché à l'option |article|.}.
%% \end{developer} 

%% \begin{noprint}
%	Define option for <article> document style
\DeclareOptionX{article}{
	\@articletrue
	\@twosidefalse\@onesidetrue
	\PassOptionsToClass{oneside,article}{memoir}
}
%% \end{noprint}

%% \describe[false]{%
%%	\option{didactic}{Option de classe utilisée pour produire des supports de cours.},
%%	\option{didactic+}{Option de classe similaire à \safeverb[\optioncolor]{didactic}, mais composée en \safeverb[\optioncolor]{14pt}, pour faciliter la lecture depuis un pupitre.}}
%% L'option |didactic| propose notamment des en-têtes et pages de garde, adaptés aux documents pédagogiques; elle charge également les options |oneside| et |article|. La variante |didactic+| permet de générer un document adapté à la lecture depuis un pupitre, avec l'option |14pt|, est notamment adapté pour les cours magistraux ou les interventions lors de colloques.

%% \begin{developer}
%% Il est possible d'en modifier le comportement grâce à l'opérateur \cs{if@didactic}{Opérateur conditionnel attaché aux options |didactic| et |didactic+|.}.
%% \end{developer}

%% \begin{noprint}
%	Define options for <didactic> & <didactic+> document style
\DeclareOptionX{didactic}{
	\@didactictrue
	\@twelvepointstrue
	\@tenpointsfalse\@elevenpointsfalse\@fourteenpointsfalse
	\@twosidefalse\@onesidetrue
	\PassOptionsToClass{10pt,oneside,article}{memoir}
}
\DeclareOptionX{didactic+}{
	\@didactictrue
	\@fourteenpointstrue
	\@tenpointsfalse\@elevenpointsfalse\@twelvepointsfalse
	\@twosidefalse\@onesidetrue
	\PassOptionsToClass{14pt,oneside,article}{memoir}
}
%% \end{noprint}

%% \describe[false]{%
%%	\option{letter}{Option de classe utilisée pour la composition de correspondance.}}
%% Cette option automatise la mise en page des lettres et documents de correspondance. Elle charge les options |article|, |oneside|, |11pt| et |sans-serif|. Pour accompagner un \latin{curriculum vitæ}, il convient de rajouter manuellement l'option |marginal|.

%% \begin{developer}
%% Il est possible d'en modifier le comportement grâce à l'opérateur \cs{if@letter}{Opérateur conditionnel attaché à l'option |letter|.} attaché spécifiquement à cette option, ou à l'opérateur \cs{if@stationery}{Opérateur conditionnel attaché à l'option |stationery|.} qui s'applique à également aux autres documents de correspondance.
%% \end{developer}

%% \begin{noprint}
%	Define option for <letter> document style
\DeclareOptionX{letter}{
	\@lettertrue
	\@articletrue
	\@sansseriftrue
	\@stationerytrue
	\@elevenpointstrue
	\@tenpointsfalse\@twelvepointsfalse\@fourteenpointsfalse
	\@twosidefalse\@onesidetrue
	\PassOptionsToClass{11pt,oneside,article}{memoir}
}
%% \end{noprint}

%% \describe[false]{%
%%	\option{vitae}{Option de classe utilisée pour composer un \latin{curriculum vitæ}.}}
%% Cette option automatise la production de \latin{curriculum vitæ}. Tout comme |letter|, elle charge les options |article|, |oneside|, |11pt| et |sans-serif|. Le CV est également composé avec l'option |marginal|, qui permet ici d'inscrire les dates dans la marge.

%% \begin{developer}
%% Il est possible d'en modifier le comportement grâce à l'opérateur \cs{if@vitae}{Opérateur conditionnel attaché à l'option |vitae|.} attaché spécifiquement à cette option, ou à l'opérateur \cs{if@stationery}{Opérateur conditionnel attaché à l'option |stationery|.} qui s'applique à également aux autres documents de correspondance.
%% \end{developer}

%% \begin{noprint}
%	Define option for <vitae> document style
\DeclareOptionX{vitae}{
	\@vitaetrue
	\@articletrue
	\@marginaliatrue
	\@sansseriftrue
	\@stationerytrue
	\@elevenpointstrue
	\@tenpointsfalse\@twelvepointsfalse\@fourteenpointsfalse
	\@twosidefalse\@onesidetrue
	\PassOptionsToClass{11pt,oneside,article}{memoir}
}
%% \end{noprint}


% ===== Special Features =====

%% \section{Fonctionnalités additionnelles}

%% La classe \frenchlaw comporte un certain nombre d'options qui modifient la présentation du document ou certaines de ses fonctionnalités, quel que soit le modèle de base utilisé. Ces options peuvent donc être utilisées en toutes circonstances pour paramétrer la classe~(bibliographies, index) ou pour réaliser plusieurs versions d'un même document~(brouillons, versions abrégées ou augmentées, etc.).

%% \describe[final]{%
%%	\option{draft}{Option utilisée pour composer en mode brouillon.},
%%	\option{draft+}{Option utilisée pour imprimer les annotations de correction, tout en visualisant la version définitive du manuscrit.},
%%	\option{final}{Option utilisée pour composer le document en version définitive.}}
%% Lorsqu'un document est compilé en mode |draft|, les annotations de l'auteur et les informations de compilation apparaissent sur le |.pdf| pour faciliter la correction. Cette option a généralement pour effet de désactiver certains packages. Elle modifie la présentation des pages.\par
%% L'option |draft+| produit un document dont le corps est identique à la version définitive. Elle ajoute uniquement des marqueurs dans les marges pour une ultime relecture.\par
%% L'option |final|, activée par défaut, produit un document dépourvu de toutes annotations.

%% \begin{developer}
%% Il est possible de vérifier quelle option a été chargée et d'en modifier le comportement grâce aux opérateurs suivants: \cs{ifdraftdoc}{Opérateur conditionnel attaché à l'option |draft|.}, qui est repris à la classe |memoir| pour l'option |draft| et \cs{if@draft}{Opérateur conditionnel attaché aux options |draft| et |draft+|.}, spécifique à la classe \frenchlaw, qui s'applique aux options |draft| et |draft+|.
%% \end{developer}

%% \begin{noprint}
%	Define options for <draft>, <draft+> & <final>
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
%% \end{noprint}

%% \describe[false]{%
%%	\option{short}{Option utilisée pour composer la version abrégée d'un document.}}
%% Cette option permet de produire la version courte d'un document de longueur modulable en insérant les balises: |\iflong...\fi|. Sur l'utilisation de cette option, voir \todo{Réf. section.}. \frenchlaw compose par défaut la version longue, qui n'est donc pas présentée comme une option séparée.

%% \begin{developer}
%% Il est possible d'en modifier le comportement grâce à l'opérateur \cs{iflong}{Opérateur conditionnel attaché à l'option |short|.}. Le choix, peu intuitif en apparence, de cette dénomination tient à la nécessité de pouvoir utiliser l'opérateur conditionnel en cours de document: il n'était pas souhaitable qu'il contienne le signe @, et il est beaucoup plus logique dans le corps du texte d'insérer |\iflong...\fi| pour marquer le texte qui n'apparaîtra que dans la forme longue~(par défaut) et sera donc omis si l'option |short| est utilisée.
%% \end{developer}

%% \begin{noprint}
%	Define option <short> for convertible documents
\DeclareOptionX{short}{
	\longfalse
}
%% \end{noprint}

%% \describe[false]{%
%%	\option{color|colour}{Option utilisée pour utiliser un peu de couleur lors de la composition du document.} (ou) 
%%	\option{colorall|colourall}{Option utilisée pour utiliser beaucoup de couleur lors de la composition du document.}}
%% Ces options permettent de produire un document en couleurs. On notera que les graphies anglaise et américaine sont acceptées. L'option |colour| ne met en couleurs que les éléments essentiels, alors que |colourall| est plus généreuse. La configuration fine du comportement de ces deux options est expliquée \emph{infra} en p.~\pageref{Couleurs}.

%% \begin{noprint}
%	Define option <color|colour> for lightly coloured documents
\DeclareOptionX{color}{
	\@colourtrue
}
\DeclareOptionX{colour}{
	\@colourtrue
}
%	Define option <colorall|colourall> for heavily coloured documents
\DeclareOptionX{colorall}{
	\@colouralltrue
}
\DeclareOptionX{colourall}{
	\@colouralltrue
}
%% \end{noprint}

%% \describe[false]{%
%%	\option{precis}{Option utilisée pour composer les numéros et titres des paragraphes coulés dans la table des matières.},
%%	\option{summary}{Option utilisée pour composer des éléments indiqués dans l'environnement \texttt{summary} dans la table des matières.}, 
%%	\option{outline}{Option utilisée pour composer des éléments présents dans l'environnement \texttt{outline} dans la table des matières.}}
%% Ces options permettent d'imprimer des éléments supplémentaires dans la table des matières, principalement dans le but de générer un document donnant une vision d'ensemble du manuscrit. Les numéros et les noms des paragraphes sont ajoutés à la table, ainsi que le texte placé dans des environnements spéciaux. Sur ces deux options, voir \todo{Renvoyer à la page de la doc.}.

%% \begin{developer}
%% Il est possible de vérifier quelle option a été chargée et d'en modifier le comportement grâce aux opérateurs: \cs{if@precis}{Opérateur conditionnel attaché à l'option |precis|.}, \cs{if@outline}{Opérateur conditionnel attaché à l'option |outline|.}, \cs{if@summary}{Opérateur conditionnel attaché à l'option |summary|.}.
%% \end{developer}

%% \begin{noprint}
%	Define options for <precis>, summary> & <outline> table of contents
\DeclareOptionX{precis}{
	\@precistrue
}
\DeclareOptionX{summary}{
	\@summarytrue
	\@precistrue
}
\DeclareOptionX{outline}{
	\@outlinetrue
	\@summarytrue
	\@precistrue
}
%% \end{noprint}

%% \describe[frenchlaw]{%
%%	\option{biblatex-style}[style-name]{Option utilisée choisir le style de bibliographies à utiliser.}}
%% Cette option permet de configurer le style utilisé par |biblatex| pour composer les bibliographies. Par défaut, le style associé à la classe \frenchlaw est utilisé, mais il est possible d'en choisir un autre pour s'adapter au style exigé par certains organismes ou éditeurs.

%% \begin{developer}
%% Le nom du style sélectionné est passé dans la macro interne \cs{set@biblatexstyle}{acro interne stockant le nom du style |biblatex sélectionné|.}.
%% \end{developer}

%% \begin{noprint}
\DeclareOptionX{biblatex-style}[frenchlaw]{
	\def\set@biblatexstyle{#1}
}
%% \end{noprint}

%% \describe[paragraphs]{%
%%	\option{index}[paragraphs, pages]{Option utilisée choisir si les index renvoient aux numéros de paragraphes ou de pages.}}
%% Cette option permet de configurer la manière dont les index sont présentés, en choisissant s'ils renvoient aux numéros de paragraphes~(par défaut, comme il est d'usage en droit) ou aux numéros de pages.

%% \begin{developer}
%% La méthode d'indexation est sélectionnée au moyen des opérateurs \cs{if@indexparagraphs}{Opérateur conditionnel attaché à l'option |index=paragraphs|.} et \cs{if@indexpages}{Opérateur conditionnel attaché à l'option |index=pages|.}. Ceux-ci sont activés au niveau de l'option par l'intermédiaire des macros \cs{set@indexparagraphs}{Macro interne activant l'opérateur conditionnel |\if@indexparagraphs|.} et \cs{set@indexpages}{Macro interne activant l'opérateur conditionnel |\if@indexpages|.}. Le système est construit pour permettre la création de nouvelles méthodes d'indexation, pourvu qu'elles soient construites sur une syntaxe similaire~(recours à |\csname|). Ainsi pour une option |<method>| avec le code suivant:\par
%% \vspace{-\baselineskip}
%% \begin{macro}
%%	\newif\if@index<method>
%%	\newcommand{\set@index<method>}{\@index<method>true}
%% \end{macro}
%% \end{developer}

%% \begin{noprint}
%	Define an option to change indexing (pages or paragraphs)
\newcommand{\set@indexparagraphs}{\@indexparagraphstrue}
\newcommand{\set@indexpages}{\@indexparagraphsfalse}
\DeclareOptionX{index}[paragraphs]{
	\ifcsname set@index#1\endcsname
		\csname set@index#1\endcsname
	\else
		\AtEndDocument{\ClassWarningNoLine{frenchlaw}{%
			Unknown option index=#1, \MessageBreak
			Valid arguments are: "pages", "paragraphs" \MessageBreak
			Reverting to default: index=paragraphs}}%
	\fi
}
%% \end{noprint}


% ===== Developer Features =====

%% \section{Fonctionnalités développeur}

%% La classe \frenchlaw contenant sa propre documentation, elle dispose également de quelques options destinées à composer celle-ci. Ces dernières ne seront probablement d'aucune utilité aux utilisateurs, aux pour documenter un package modifiant cette classe.

%% \describe[false]{%
%%	\option{developer}{Option utilisée pour composer cette documentation.}}
%% L'option |developer| est employée pour rédiger cette documentation. Elle ne devrait en principe pas être utile pour la rédaction juridique.

%% \begin{developer}
%% Il est possible d'en modifier le comportement grâce à l'opérateur \cs{if@dev}{Opérateur conditionnel attaché à l'option |developer|.}.
%% \end{developer}

%% \begin{noprint}
%	Define <developer> option (see frenchlaw-dev)
\DeclareOptionX{developer}{
	\@devtrue
}
%% \end{noprint}

%% \describe[false]{%
%%	\option{vgrid}{Option utilisée pour imprimer une grille typographique et vérifier l'alignement vertical des lignes sur la page.}}
%% L'option |vgrid| permet d'imprimer une grille typographique pour vérifier l'alignement vertical des lignes sur la page. Elle a servi a programmer la classe \frenchlaw.

%% \begin{developer}
%% Il est possible d'en modifier le comportement grâce à l'opérateur \cs{if@grid}{Opérateur conditionnel attaché à l'option |vgrid|.}.
%% \end{developer}

%% \begin{noprint}
%	Define <grid> option (see frenchlaw-dev)
\DeclareOptionX{vgrid}{
	\@devtrue
	\@gridtrue
}
%% \end{noprint}


% ===== Language Settings =====

%% \section{Sélection des langues}

%% \describe[french]{%
%%	\option{british}{Option de classe permettant de définir l'anglais britannique comme langue principale du document.},
%%	\option{english}{Option de classe permettant de définir l'anglais américain comme langue principale du document.},
%%	\option{french}{Option de classe permettant de définir le français comme langue principale du document.}}
%% Les langues |french|, |british| et |english|~(respectivement anglais britannique et américain) sont chargées automatiquement par \frenchlaw. L'option permet de désigner la langue principale du document parmi celles-ci, pour le package |babel| et tous les autres packages qui en dépendent.

%% \begin{developer}
%% Il est possible de vérifier quelle langue principale a été chargée et de modifier certains comportements en fonction de celle-ci grâce aux opérateurs suivants: \cs{if@french}{Opérateur conditionnel attaché à l'option |french|.}, \cs{if@british}{Opérateur conditionnel attaché à l'option |british|.} et \cs{if@english}{Opérateur conditionnel attaché à l'option |english|.}.
%% \end{developer}

%% \begin{noprint}
%	Define options to change the main language of the document
% See babel doc= main=french (to make the declaratino explicit instead of by order of languages) == could make it possible to pass whatever is given as an option as main=X, and allow people to arbitrarily load any language... provided that there are fallbacks for when no word exists // or that supported languages are documented
\DeclareOptionX{british}{
	\@britishtrue\@englishfalse\@frenchfalse
	\PassOptionsToPackage{british}{babel}
	\PassOptionsToPackage{british}{fmtcount}
	\AtBeginDocument{\main@language{british}}
}
\DeclareOptionX{english}{
	\@britishfalse\@englishtrue\@frenchfalse
	\PassOptionsToPackage{english}{babel}
	\PassOptionsToPackage{english}{fmtcount}
	\AtBeginDocument{\main@language{english}}
}
\DeclareOptionX{french}{
	\@britishfalse\@englishfalse\@frenchtrue
	\PassOptionsToPackage{french}{babel}
	\PassOptionsToPackage{french}{fmtcount}
	\AtBeginDocument{\main@language{french}}
}
%% \end{noprint}

%% \describe{%
%%	\option{german}{Option de classe permettant de définir l'allemand comme langue secondaire du document.},
%%	\option{italian}{Option de classe permettant de définir l'italien comme langue secondaire du document.},
%%	\option{spanish}{Option de classe permettant de définir l'espagnol comme langue secondaire du document.}}
%% Plusieurs langues peuvent être chargées en supplément, pour être utilisées comme langues secondaires. Seules les langues qui sont mentionnées ici sont prises en charge à ce jour. Il est à noter que les langues |greek| et |latin|, dont l'emploi est fréquent en droit, sont chargées automatiquement et n'ont pas besoin de l'être à nouveau.

%% \begin{noprint}
%	Define options to load secondary languages
\DeclareOptionX{italian}{\PassOptionsToPackage{italian}{babel}}
\DeclareOptionX{german}{\PassOptionsToPackage{german}{babel}}
\DeclareOptionX{spanish}{\PassOptionsToPackage{spanish}{babel}}
%% \end{noprint}


% =***======***======***======***======***======***======***======***======***======***=

% ===== Execute Options, Load Dependencies =====

%% \section{Dépendances}

%% La classe \frenchlaw requiert le format \LaTeXe. Elle est basée sur la classe |memoir| qu'elle charge juste après lui avoir transmis toutes les options qui en relèvent et désactivé les options incompatibles entre elles. Il est donc possible d'ajouter n'importe quelle option reconnue par |memoir| directement dans les options de classe.

%% \begin{noprint}
%	Pass all undefined options to <memoir>
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{memoir}}
%	Execute défault options and process provided options
\ExecuteOptionsX{%
	a4paper,twoside,12pt,french,%
	linespacing=default,%
	biblatex-style=frenchlaw}
\ProcessOptionsX\relax
%	Load {memoir} class
\LoadClass{memoir}
%	Deactivate incompatible options
% Option <twocolumn> always defeats option <marginalia>
\if@marginalia\if@twocolumn\@marginaliafalse\fi\fi
\if@stockavi\if@elevenpoints\@tenpointstrue\@elevenpointsfalse\fi\fi
\if@stockavi\if@twelvepoints\@tenpointstrue\@twelvepointsfalse\fi\fi
\if@stockavi\if@fourteenpoints\@tenpointstrue\@fourteenpointsfalse\fi\fi
%	Apply baselinestretch selection
% This has to be done early in the class for grid typesetting to work
\def\baselinestretch{\custom@baselinestretch}\selectfont
%% \end{noprint}

%% Les dépendances principales de la classe \frenchlaw, à l'exclusion de celles qui sont utilisées avec l'option |developer|, sont les suivantes:

%% \bgroup
%% \renewcommand{\descriptionlabelstyle}{\ttfamily\packagecolor}
%% \renewcommand{\descriptionlabelpunct}{\enspace}
%% \setlength{\descriptionlabelwidth}{.25\linewidth}
%% \begin{description}
%% 	\item[memoir] Classe versatile pour les humanités et sciences sociales.\\

%% 	\item[babel] Gestion des langues.
%% 	\item[biblatex] Gestion des bibliographies.
%% 	\item[booktabs] Gestion des tableaux.
%% 	\item[csquotes] Gestion des citations.
%% 	\item[environ] Stockage du contenu d'un environnement dans une macro.
%% 	\item[etoolbox] Outils de programmation.
%% 	\item[fixltxhyph] Corrige un bug affectant la césure de certains mots.
%% 	\item[fmtcount] Manipulation des nombres.
%% 	\item[fontenc] Gestion des types d'encodage de polies par \LaTeX.
%% 	\item[fontspec] Gestion des polices d'écriture par \XeLaTeX.
%% 	\item[graphicx] Inclusion de graphiques.
%% 	\item[ifxetex] Tester le moteur utilisé.
%% 	\item[ifthen] Tests conditionnels.
%% 	\item[inputenc] Gestion des types d'encodage de documents par \LaTeX.
%% 	\item[marginnote] Jeu de notes marginales flottantes.
%% 	\item[metalogo] Personnalisation des logos de la famille \TeX.
%% 	\item[microtype] Raffinements typographiques.
%% 	\item[multicol]	Gestion d'environnements en deux colonnes.
%% 	\item[numprint] Formatage des nombres cardinaux.
%% 	\item[perpage] Numérotation des notes de bas de page.
%% 	\item[ragged2e] Meilleure composition du texte non justifié.
%% 	\item[xcolor] Gestion des couleurs.
%% 	\item[xkeyval] Gestion d'options sous la forme |<key>=<value>|.
%% 	\item[xspace] Utilisation d'espaces contextuelles dans les macros.
%% 	\item[xstring] Manipulation de chaînes de caractères.
%% 	\item[xurl] Génération d'adresses URL.\\

%% 	\item[adforn] Police d'écriture pour les fleurons.
%% 	\item[ebgaramond] Police d'écriture serif sous \LaTeX.
%% 	\item[lmodern] Police d'écriture à chasse fixe sous \LaTeX.
%% 	\item[mathpazo] Police d'écriture pour les mathématiques.
%% 	\item[pifont] Police d'écriture pour les symboles.
%% 	\item[sourcesanspro] Police d'écriture sans-serif sous \LaTeX.
%% \end{description}
%% \egroup

%% \begin{noprint}
%	Load generic dependencies
% More specific packages are loaded when they are actually required.
\RequirePackage{etoolbox,environ,fmtcount,graphicx,numprint,ragged2e,xurl,xcolor,xspace}
%% \end{noprint}

%% \begin{noprint}
%	Load {babel}
% TODO » Ici (deux fois) et dans l'option de classe: utiliser american (en ajoutant que english == american) et suppr. la langue <english> après avoir converti automatiquement les bibliographies via biber (au cas où)
% TODO » Vérifier \bsc, \frquote, \frenchdate, etc. et les mapper sur les commandes normales (cf. doc babel french)
% TODO > Vérifier les modalités de chargement des langues (technique la plus récente / préconisée). Vu "main=french" lors du chargement du package.
\RequirePackage[greek,latin,english,british,french]{babel}
%	Set main language right away
% Required by some macros inside the class
\if@french
	\selectlanguage{french}
\else\if@british
	\selectlanguage{british}
\else\if@english
	\selectlanguage{english}
\fi\fi\fi
%	Load helper packages
\RequirePackage{frenchlaw-babel}
\RequirePackage{fixltxhyph}
%% \end{noprint}

%% \begin{noprint}
%	Load {csquotes} and implement styles for foreign language quotations
% TODO » Check English language quotes
\RequirePackage[autostyle=true]{csquotes}
%\DeclareQuoteAlias[american]{english}{british}% Use double quotes in British english
\DeclareQuoteStyle[american]{english}% verified
	{\textquotedblleft}{\kern.1em\textquotedblright}[0.05em]
	{\textquoteleft}{\textquoteright}
\DeclareQuoteStyle{latin}
  {\mkfrenchopenquote{\guillemotleft}\em}
  {\em\mkfrenchclosequote{\guillemotright}}
  {\textquotedblleft}
  {\textquotedblright}
%% \end{noprint}

%% \begin{noprint}
% TODO > Renommer / déplacer le contenu avec babel (?)
\RequirePackage{typographie}
%	Never use double spaces after a period
\frenchspacing
%% \end{noprint}

% TODO > Dans la mesure du possible, regrouper toutes les dépendances ici
% TODO > Ajouter: \RequirePackage{pdfpages}% (?)
%	Utilisation: \includepdf{}
%	Options à l'utilisation:
%	pages=-
%	pagecommand={\thispagestyle{frenchlaw}}

% Pour affiner la recherche de langue, utiliser la technique présentée ici avec le package iflang et un test pour toutes les variantes: https://tex.stackexchange.com/a/174206


% =***======***======***======***======***======***======***======***======***======***=

%	##### COMPOSITION #####

%% \chapter{Composition typographique}

%% La classe \frenchlaw est configurée pour optimiser le confort de lecture, notamment dans le cas des documents |A4|. Pour cela, elle s'inspire des techniques traditionnelles de conception des pages et implémente, dans la mesure du possible, une composition sur grille verticale. Les différents choix typographiques sont exposés dans ce chapitre, mais ne sont pas destinés à être modifiés, sauf par des mains expertes.


% ===== Page Layout =====

%% \section{Construction des pages}

%% La page est composée de marges et d'un bloc typographique, sur lequel est composé le corps du texte. Suivant les règles de conception héritée de l'époque médiévale, \frenchlaw donne à ce bloc de texte un ratio hauteur / largeur équivalent au nombre d'or, soit~1,618. Pour aérer la page sans en réduire trop le volume, les documents composés avec les options |letter| et |vitae| utilisent un bloc de texte un peu plus fin, qui n'a donc pas exactement les mêmes proportions. Le ratio est alors de 1,715.

%% La largeur du texte a, elle-même, été choisie de manière à limiter la taille des lignes de manière à ce que chacune puissent accueillir environ 90 caractères~(pour une page |A4|), afin de faciliter la lecture. Ce nombre devrait être plus réduit~-- autour de 80 caractères~---, mais une telle exigence est peu compatible avec la composition sur ce format de papier.

%% Les marges, quant à elles, sont asymétriques, dans le respect de la tradition médiévale. Pour tous les documents recto-verso~(|twoside|), la marge extérieure est de 33\,\% plus grande que la marge située près de la reliure. Le ratio est volontairement réduit par rapport au canon classique afin de ne pas choquer les lecteurs contemporains, mais permet d'aérer la lecture et d'insérer des annotations imprimées ou manuscrites. La proportion est accentuée en mode |marginal|, dans lequel la marge extérieure~(|twoside|) ou la marge de gauche~(|oneside|) est deux fois plus grande que l'autre. Les documents en recto simple~(|oneside|) conservent des marges symétriques, comme le commande leur usage.

%% Les différentes options permettant de modifier les marges n'ont aucune incidence sur la largeur ou la hauteur du bloc typographique, garantissant ainsi que les modifications apportées à la mise en pages ne modifient pas le nombre de pages ni la répartition du texte sur celles-ci, à moins que l'on opte pour les options |letter| et |vitae|.

%% Pour les volumes comportant un grand nombre de pages, les imprimeurs de qualité ajoutent une petite marge supplémentaire dont les dimensions sont fonction du nombre de pages, de l'épaisseur du papier et du type de reliure envisagé. Cette marge de reliure~(\british{binding correction}) peut anticipée sous \LaTeX. La documentation de la classe |memoir| explique comment modifier la construction de la page, et mentionne à cet effet les reliures.

%% \begin{noprint}
%	Define the size of page headers & footers
\setlength{\headsep}{\baselineskip}
\setlength{\headheight}{2\baselineskip}
\setlength{\footskip}{2\baselineskip}

%	Define the size of the type block depending on the paper size
% The block proportions follow the golden number, as in the medieval method
% The class uses a narrower type block in letters and other stationery documents
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
\if@marginalia
	\if@twoside
		% Asymmetrical margins, 2:1 ratio with <marginalia>
		\setlrmargins{*}{*}{2}
	\else
		% Asymmetrical margins, 2:1 ratio with <marginalia>
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
%% \end{noprint}


%	===== Typefaces =====

%% \section{Choix des polices d'écriture}

%% Par défaut, la classe \frenchlaw utilise les polices d'écriture suivantes, qui sont toutes disponibles dans \TeX live:

%% \begin{description}
%% 	\item[Serif] EB Garamond (\LaTeX) et Junicode (\XeLaTeX).
%% 	\item[Sans-serif] Source Sans Pro.
%% 	\item[Chasse-fixe] Latin Modern Mono.
%% \end{description}

%% La police d'écriture ADF Ornaments~(|adforn|) est également employée pour les pictogrammes, aux côtés d'une variante de Palatino~(|mathpazo|) pour les expressions mathématiques. Ces polices d'écriture peuvent être utilisées librement.

%% \begin{noprint}
% Don't send warnings for certain missing characters
\tracinglostchars=1
%% \end{noprint}

%% \begin{noprint}
%	Load fonts and packages common to LaTeX and XeLaTeX
\RequirePackage{adforn,mathpazo}
\ifxetex
	%	Load XeLaTeX fonts
	\RequirePackage[quiet]{fontspec}
	\RequirePackage{microtype}
	%	Font choices for XeLaTeX
	\defaultfontfeatures{
		Ligatures = {TeX},
		Numbers = {OldStyle},
		SmallCapsFeatures = {WordSpace = 1.2, LetterSpace=2.0}}
	\setmainfont[	Extension		= .ttf,
					UprightFont		= *-Regular,
					ItalicFont		= *-Italic,
					BoldFont		= *-Bold,
					BoldItalicFont	= *-BoldItalic,
					StylisticSet	= {9} ]
				{Junicode}
	\setsansfont[	Extension		= .otf,
					UprightFont		= *-Regular,
					ItalicFont		= *-RegularIt,
					BoldFont		= *-Bold,
					Scale			= MatchLowercase ]
				{SourceSansPro}
	% TODO: Vérifier la police sans sérif (taille par rapport au texte Junicode / sans sérif) --- Corrigé manuellement dans le .cnf pour Concourse
	\setmonofont[	Extension		= .otf,
					UprightFont		= *-regular,
					ItalicFont		= *-italic,
					Numbers			= Lining,
					Scale			= MatchLowercase ]
				{lmmono10}
	% Create a hook to load caps-only font features on an as-needed basis
	% Redefine to \addfontfeatures{...}
	% TODO > Déplacer avec les helper macros et documenter + Documenter \Rn, \RN et \Rnfont (pris à Biblatex) pour convertir un nombre arabe en nombre romain
	\newcommand\allcapsfeatures{}
	% Create a command for acronyms (adds same inter-letter spacing as with small-caps)
	% TODO > Déplacer avec les helper macros et documenter avec équiv. LaTex
	\newcommand{\acronym}[1]{{\addfontfeatures{LetterSpace=3.0} #1}}
\else
	%	Load LaTeX fonts
	\RequirePackage[utf8]{inputenc}% OLD: \AtEndOfClass{\usepackage[utf8]{inputenc}} (?)
	\RequirePackage[T1]{fontenc}
	\RequirePackage{lmodern}
	\RequirePackage[osf,scale=.85]{sourcesanspro}
	\RequirePackage[osf]{ebgaramond}
%	\RequirePackage{junicode}% TODO > Bugs for some reason
	\RequirePackage[tracking,letterspace=30]{microtype}
	%	Font choices for LaTeX
	\renewcommand*{\ttdefault}{lmtt}
	% Create a command for acronyms (matches the XeLaTeX command but doing nothing)
	% TODO > Déplacer avec les helper macros
	\newcommand{\acronym}[1]{#1}
\fi
%% \end{noprint}

%% Les polices d'écriture sont gérées de manière très différente selon le moteur utilisé. \LaTeX\ impose d'utiliser des polices préparées spécialement sous un format spécial. En pratique, cela signifie que l'on est très limité dans le choix des polices, qui sont alors chargées comme des |packages|. L'utilisation de \XeLaTeX\ est très recommandée pour les documents de langue française, car ce moteur assure une bien meilleure gestion des caractères accentués, des textes multilingues et des polices d'écriture. Il est ainsi possible, avec ce moteur, de choisir n'importe quelle police installée sur l'ordinateur ou dans le même dossier que le document |.tex|, à condition de tâtonner un peu pour deviner sous quel nom l'invoquer. La documentation du package |fontspec| fournit toutes les informations utiles à cet égard. Des exemples sont également donnés dans le fichier |frenchlaw.cnf|, qui permet à l'utilisateur de modifier les paramètres de la classe\todo{Référence au paragraphe qui en parle}.

%% Sans entrer dans la~(longue et délicate) question du choix d'une police d'écriture, on notera quelques points essentiels. Sous \XeLaTeX, il est recommandé d'installer une police \emph{OpenType}~(OTF), car ce format permet d'incorporer dans un seul fichier un grand nombre d'options et de subtilités typographiques, comme des formes alternatives pour certains caractères, des chiffres alignés sur les caractères bas-de-casse~(12345) ou de vraies petites-capitales. Le package |fontspec| gère parfaitement ces options qui peuvent être activées ou désactivées en cours de document.

%% Par ailleurs, dans le choix d'une police d'écriture, on pourra dire sans trop exagérer qu'il faut impérativement éviter les polices disponibles par défaut sur l'ordinateur, qui sont soit produites par les marchands de d'ordinateurs, soit de pâles reproductions des dessins de grands typographes dont des versions de bien meilleure facture sont disponibles ailleurs. Il existe un certain nombre d'excellentes polices d'écriture disponibles gratuitement sous licence libre~(OFL)~-- celles que nous avons choisies en font partie~--, et un nombre plus important encore de polices d'écriture commerciales de grande qualité~(compter au moins une centaine d'euros) produites par des typographes travaillant auprès de fonderies sérieuses. À titre d'exemple, le \emph{Garamond} famélique et terne que l'on trouve sur tous la plupart des ordinateurs est très largement surpassé par d'autres Garamond, tant libres que commerciaux.


% ===== Font Size & Leading =====

%% \section{Choix d'une échelle typographique}

%% L'échelle typographique désigne un ensemble de tailles de police d'écriture, lesquelles seront ensuite utilisées dans les documents. On décide ainsi plus exactement de la proportion qu'il faut donner entre les plus petits caractères~(pour les notes, par exemple) et les plus grands~(dans les titres) pour que la progression soit harmonieuse.

%% En typographique classique, l'échelle est déterminée de manière pratiquement mathématique, en multipliant par deux la taille de police à intervalles réguliers. Cette méthode était paradoxalement surtout utilisée par des typographes qui composaient exclusivement en |10pt| ou |12pt|, à l'exception de quelques titres, parce qu'il fallait autrement posséder, en quantité suffisante, autant de jeux de caractères que de tailles de polices. En s'émancipant de la règle d'or de la construction des échelles typographiques, la classe \frenchlaw cherche tout simplement à obtenir une certaine harmonie visuelle dans l'enchaînement des subdivisions que l'on rencontre en droit.

%% \begin{noprint}
%	Create dimensions that will be used to calculate vertical compensation
% This provides vertical alignment, as long as headings are one-liners
% See below in documentation
\newdimen\addto@miniscule
\newdimen\addto@tiny
\newdimen\addto@large
\newdimen\addto@Large
\newdimen\addto@LARGE
\newdimen\addto@huge
\newdimen\addto@Huge
\newdimen\addto@HUGE
%% \end{noprint}

%% \frenchlaw est configurée pour composer des textes de |10pt|, |11pt|, |12pt| ou |14pt| selon l'option choisie. À cet effet, la classe définit quatre échelles typographiques différentes et l'interlignage correspondant, selon le corps de texte principal. Ces valeurs sont résumées dans le tableau ci-après~(\textsc{Tableau}~\ref{tab:Fontsizes}).
%% \begin{table}
%% \begin{tabular}{lcccc}
%%	Option de classe:& ~~~~~|10pt|~~~~~ & ~~~~~|11pt|~~~~~ & ~~~~~|12pt|~~~~~ & ~~~~~|14pt|~~~~~ \\
%%	\midrule
%%	|\miniscule|	& \texttt{6\,/\,8} & \texttt{7\,/\,8} & \texttt{7\,/\,8.5} & \texttt{8\,/\,10} \\
%%	|\tiny|			& \texttt{7\,/\,9} & \texttt{8\,/\,9} & \texttt{8\,/\,9.5} & \texttt{9\,/\,11.5} \\
%%	|\scriptsize|	& \texttt{8\,/\,12} & \texttt{9\,/\,13.6} & \texttt{9\,/\,14.5} & \texttt{10\,/\,17.5} \\
%%	|\footnotesize|	& \texttt{8\,/\,12} & \texttt{9\,/\,13.6} & \texttt{10\,/\,14.5} & \texttt{11\,/\,17.5} \\
%%	|\small|		& \texttt{9\,/\,12} & \texttt{10\,/\,13.6} & \texttt{11\,/\,14.5} & \texttt{12\,/\,17.5} \\
%%	|\normalsize|	& \texttt{10\,/\,12} & \texttt{11\,/\,13.6} & \texttt{12\,/\,14.5} & \texttt{14\,/\,17.5} \\
%%	|\large|		& \texttt{12\,/\,15} & \texttt{13\,/\,16} & \texttt{14\,/\,18} & \texttt{17\,/\,21.5} \\
%%	|\Large|		& \texttt{15\,/\,18} & \texttt{16\,/\,19} & \texttt{17\,/\,22} & \texttt{20\,/\,25} \\
%%	|\LARGE|		& \texttt{18\,/\,22} & \texttt{19\,/\,23} & \texttt{20\,/\,25} & \texttt{25\,/\,30.5} \\
%%	|\huge|			& \texttt{22\,/\,27} & \texttt{23\,/\,28} & \texttt{25\,/\,30} & \texttt{30.37} \\
%%	|\Huge|			& \texttt{27\,/\,32} & \texttt{28\,/\,34} & \texttt{30\,/\,37} & \texttt{36\,/\,45} \\
%%	|\HUGE|			& \texttt{32\,/\,37} & \texttt{34\,/\,42} & \texttt{36\,/\,45} & \texttt{48\,/\,60} \\
%% \end{tabular}
%% \caption{Corps de texte et interlignage, exprimés en \texttt{pt}.}
%% \label{tab:Fontsizes}
%% \end{table}

%% \begin{noprint}
%	Define font sizes for <10pt>
\if@tenpoints
	\renewcommand*{\scriptsize}{\fontsize{8}{\if@simplespacing 10\else 12\fi}\selectfont}
	\renewcommand*{\footnotesize}{\fontsize{8}{\if@simplespacing 10\else 12\fi}\selectfont}
	\renewcommand*{\small}{\fontsize{9}{\if@simplespacing 10\else 12\fi}\selectfont}
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
%% \end{noprint}

%% \begin{noprint}
%	Define font sizes for <11pt>
\else\if@elevenpoints
	\renewcommand*{\scriptsize}{\fontsize{9}{\if@simplespacing 11\else 13.6\fi}\selectfont}
	\renewcommand*{\footnotesize}{\fontsize{9}{\if@simplespacing 11\else 13.6\fi}\selectfont}
	\renewcommand*{\small}{\fontsize{10}{\if@simplespacing 11\else 13.6\fi}\selectfont}
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
%% \end{noprint}

%% \begin{noprint}
%	Define font sizes for <12pt>
\else\if@twelvepoints
	\renewcommand*{\scriptsize}{\fontsize{9}{\if@simplespacing 12\else 14.5\fi}\selectfont}
	\renewcommand*{\footnotesize}{\fontsize{10}{\if@simplespacing 12\else 14.5\fi}\selectfont}
	\renewcommand*{\small}{\fontsize{11}{\if@simplespacing 12\else 14.5\fi}\selectfont}
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
%% \end{noprint}

%% \begin{noprint}
%	Define font sizes for <14pt>
\else\if@fourteenpoints
	\renewcommand*{\scriptsize}{\fontsize{10}{\if@simplespacing 14\else 17.5\fi}\selectfont}
	\renewcommand*{\footnotesize}{\fontsize{11}{\if@simplespacing 14\else 17.5\fi}\selectfont}
	\renewcommand*{\small}{\fontsize{12}{\if@simplespacing 14\else 17.5\fi}\selectfont}
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
%% \end{noprint}


%	===== Grid Typesetting =====

%% \section{Composition sur la grille typographique}

%% \label{Composition-Grille} La composition typographique traditionnelle est réalisée par alignement sur une grille verticale qui correspondait aux lignes de caractères en plomb. D'une page à l'autre, les lignes commencent exactement au même endroit, de sorte que si l'on regarde les deux côtés de la feuille par transparence, les lignes du recto et du verso se confondent. Cela permet d'éviter l'effet très désagréable, surtout sur des papiers très fins, consistant à voir transparaître le gris de la page suivante.

%% Les logiciels de la famille \TeX\ ont été pensés pour l'écriture mathématique qui suppose des équations, des schémas ou des figures qui rendent assez inharmonieuse la composition classique \enquote{sur la grille}. Il fallait, dans ce contexte, permettre un peu de flexibilité dans l'espacement vertical des éléments de la page, et même des lignes du texte, pour ne pas créer trop de blancs. La plupart des moteurs conservent cette particularité.

%% Une solution aussi radicale n'est toutefois pas requise pour le droit, et \frenchlaw essaie de trouver un équilibre raisonnable entre respecter \emph{pour l'essentiel} le système traditionnel de composition sur la grille, et autoriser des entorses à cette règle chaque fois qu'elle produirait des résultats franchement sous-optimaux. Les éléments qui rompent l'alignement vertical sont, par ailleurs et chaque fois que cela est possible, placés en bas de page pour minimiser la gêne visuelle que cela pourrait causer au lecteur. Ce prélude permet d'expliquer les choix techniques qui ont été faits dans le code.

%% En plus d'établir une échelle typographique, la classe garantit autant que faire se peut le respect d'une grille verticale, ce qui signifie que l'espacement des lignes doit rester le même~-- ou un multiple de l'espacement standard~-- peu importe la taille des caractères. Cela peut se vérifier avec l'option |vgrid|. Toutefois, dans le souci de trouver un équilibre harmonieux, il est également nécessaire de pouvoir déroger à ce principe: si l'on pense à un titre de chapitre s'étalant sur deux lignes, il sera souvent très laid d'espacer excessivement ces deux lignes dans le seul but de retomber sur la grille verticale.

%% Dans l'échelle établie ci-dessus, les titres des subdivisions, comme les chapitres ou les sections, seront composés dans un corps plus gros, ce qui rompra l'alignement vertical sur la grille: la hauteur des caractères et de leur interlignage n'est pas un multiple de la hauteur des lignes composées en corps normal. \frenchlaw s'applique ensuite à atténuer cet effet. La solution qui a été retenue ici consiste à associer à chaque taille de caractères un interligne confortable et agréable à lire, tout en prévoyant deux mécanismes pour forcer l'alignement sur la grille, avec plus ou moins de subtilité.

%% Le premier mécanisme utilisé consiste à ajouter un espace vertical qui affecte seulement la première ligne de texte dans un corps donné. Pour les titres de chapitres ou de sections, par exemple, cela est en principe suffisant~-- pourvu, du moins, que les auteurs sachent rester brefs. Comme seule la première ligne est affectée, un titre trop long restera agréable à lire, mais rompra l'alignement vertical sur la grille, ce qui est sans doute un moindre délit typographique.

%% Cela est réalisé en stockant dans une macro l'ajustement nécessaire à chaque corps de texte pour retomber sur la grille: ce dernier pourra ensuite être ajouté au compte-gouttes, comme un espace vertical, de manière à n'affecter que la première ligne du texte composé dans ce corps.

%% \begin{developer}
%% Les dimensions internes ainsi créées, et dont la valeur dépend du corps de texte choisi en option de classe, peuvent être utilisées par les développeurs:

%% \noindent
%%	\dim{addto@miniscule}{Dimension à ajouter au texte composé en corps \safeverb{miniscule}.} pour le corps \safeverb{miniscule};\\
%%	\dim{addto@tiny}{Dimension à ajouter au texte composé en corps \safeverb{tiny}.} pour le corps \safeverb{tiny};\\
%%	\dim{addto@large}{Dimension à ajouter au texte composé en corps \safeverb{large}.} pour le corps \safeverb{large};\\
%%	\dim{addto@Large}{Dimension à ajouter au texte composé en corps \safeverb{Large}.} pour le corps \safeverb{Large};\\
%%	\dim{addto@LARGE}{Dimension à ajouter au texte composé en corps \safeverb{LARGE}.} pour le corps \safeverb{LARGE};\\
%%	\dim{addto@huge}{Dimension à ajouter au texte composé en corps \safeverb{huge}.} pour le corps \safeverb{huge};\\
%%	\dim{addto@Huge}{Dimension à ajouter au texte composé en corps \safeverb{Huge}.} pour le corps \safeverb{Huge};\\
%%	\dim{addto@HUGE}{Dimension à ajouter au texte composé en corps \safeverb{HUGE}.} pour le corps \safeverb{HUGE}.
%% \end{developer}

%% On notera que les corps |\scriptsize|, |\footnotesize| et |\small| ne sont pas concernés par ces ajustements: leur interligne est calqué sur celui du corps standard, de manière à ce que les légendes ou les notes de bas de page ne rompent pas systématiquement l'alignement vertical. Cela est d'autant moins gênant que ce sont des tailles de texte assez proches du corps normal. On remarquera toutefois que les notes de bas de page ont ainsi un aspect plus aéré que le corps du texte, ce qui en facilite la lecture.

%% Avec ce système, la grille d'alignement vertical est rompue: \primo lorsque le texte d'un titre de subdivision hiérarchique s'étend sur plusieurs lignes; \secundo  lorsque deux divisions se suivent sans texte intermédiaire, ce qui se produit par exemple lorsqu'un |\chapter| est immédiatement suivi d'une nouvelle |\section|. La rupture de la grille verticale permet toutefois d'éviter le résultat disgracieux que l'on obtiendrait en imposant à toutes les tailles de texte le même interlignage.

%% Le second mécanisme est volontairement dépourvu de toute subtilité: il impose un strict respect de la grille typographique, quel que soit le nombre de lignes. Il consiste simplement à donner à toutes les tailles de texte un interlignage multiple de celui retenu pour le corps principal. Son utilisation est, en principe, réservée aux développeurs.

%% \begin{developer}
%% Ce mécanisme a été créé dans l'idée qu'il pourrait être employé localement, à l'intérieur d'un groupe (|\begingroup ... \endgroup| ou |{...}|) au sein duquel il est important de préserver la grille verticale, par exemple pour une page de garde. Pour cette raison, il utilise volontairement la commande interne \cs{normalize@fontsize}{Macro interne forçant l'alignement sur la grille de tous les corps de texte. Il est fortement recommandé de ne l'utiliser que localement.}, qui s'utilise comme suit:\par
%% \vspace{-\baselineskip}
%% \begin{macro}
%% {\normalize@fontsize Texte à aligner sur la grille}% ou:
%% \bgroup\normalize@fontsize Texte à aligner sur la grille\egroup
%% \end{macro}
%% \end{developer}

%% \begin{noprint}
%	Create a command to set all font sizes to a multiple of the standard \baselineskip
% This facilitates@ grid-typesetting and should be used locally, within a group.
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
		\renewcommand*{\miniscule}{\fontsize{7}{13.6}\selectfont}
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
%% \end{noprint}

%% La composition sur une grille typographique interdit à \LaTeX\ d'insérer des espaces verticaux flexibles~(\british{glue}) pour adapter le contenu à la taille de la page. La commande |\raggedbottom| est donc utilisée dans la classe \frenchlaw pour éviter les messages d'erreur liés à l'existence de pages incomplètement remplies (|Underfull \vbox|). Ce système donne de bons résultats, en particulier si l'on insère des notes de bas de page~(|\footnote|) qui sont, quant à elles, propulsées en bas de page et comblent les vides résiduels.

%% \begin{noprint}
%	Always use raggedbottom (prevents underfull \vbox warnings)
\raggedbottom
%% \end{noprint}

%% Quelques autres commandes et mécanismes sont susceptibles de rompre l'alignement vertical sur la page en cours. On notera notamment l'espacement d'un demi interligne inséré avant les chapitres dans la table des matières~(\pageref{grid:cftbeforechapterskip}).\todo{Et autres?}


% ===== Paragraph Typosetting =====

%% \section{Composition des paragraphes}

%% \LaTeX\ permet de limiter ou d'interdire la survenance de certaines imperfections typographiques grâce à un système de pénalités. \frenchlaw a été paramétrée pour donner de bons résultats sans générer trop d'avertissements. Il s'agit, en particulier, de pénaliser les lignes veuves et orphelines, esseulées respectivement en début ou en fin de page, ainsi que les coupures de mots sur des lignes consécutives ou en fin de page. Pour modifier les paramètres retenus, les utilisateurs pourront se référer à la documentation générale de \LaTeX.

%% \begin{noprint}
%	Set penalties and demerits
\if@twocolumn
	\widowpenalties=3 300 100 -150 % Discourage widows [Orig. 3 150 0 0]
	\clubpenalties=3 300 100 -150 % Discourage orphans [Orig. 3 150 0 0]
\else
	\widowpenalties=3 20000 1000 -150 % Discourage widows [Orig. 3 150 0 0]
	\clubpenalties=3 20000 1000 -150 % Discourage orphans [Orig. 3 150 0 0]
\fi
\lefthyphenmin=3 % Discourage hyphenation in the first three letters of a word (orig. 2)
\righthyphenmin=3 % Discourage hyphenation in the last three letters of a word (orig. 3)
\hyphenpenalty=100 % Discourage hyphens [Orig. 50]
\exhyphenpenalty=500 % Discourage hyphens in compound nouns [Orig. 50]
\brokenpenalty=10000 % Discourage hyphens at the end of pages [Orig. 100]
\doublehyphendemerits=1000000 % Discourage consecutive hyphens [Orig. 10000]
\finalhyphendemerits=100000000 % Discourage end of paragraph hyphens [Orig. 5000]
%% \end{noprint}

%% En principe, le texte est composé en alinéas, de sorte qu'aucun espacement vertical n'est ajouté entre les paragraphes. Par exception, pour tous les documents de correspondance~(options |letter| et |vitae|) et ceux rédigés selon les codes modernes, notamment pour écran~(option |modern|), les paragraphes sont séparés par un saut de ligne plutôt que par un alinéa.

%% \begin{noprint}
%	Define indentation and vertical spacing of paragraphs
\if@stationery
	% Paragraphs are aligned with the left margin in stationery documents
	\setlength{\parskip}{\baselineskip}
	\setlength{\parindent}{\z@}
\else\if@modern
	% Paragraphs are aligned with the left margin in modern-style documents
	\setlength{\parskip}{\baselineskip}
	\setlength{\parindent}{\z@}
\else
	% Päragraphs are indented in regular documents
	\setlength{\parskip}{\z@}
	\setlength{\parindent}{1.5em}
\fi\fi
%% \end{noprint}

%% Il sera parfois utile de modifier ces paramètres directement dans le préambule en modifiant les longueurs de \dim{parskip}{Espace entre les paragraphes~(\LaTeX).} et de \dim{parindent}{Décalage de la première ligne, notamment pour former un aliéna~(\LaTeX).}:

%% \begin{macro}
%% % Pour un texte en alinéas :
%% \setlength{\parskip}{0pt}% Pas d'espace entre les paragraphes
%% \setlength{\parindent}{1.5em}% Première ligne en alinéa
%%  
%% % Pour un texte avec des sauts de lignes :
%% \setlength{\parskip}{\baselineskip}% Espace entre les paragraphes
%% \setlength{\parindent}{0em}% Pas de mise en alinéa
%% \end{macro}

%% Enfin, en typographie soignée, on évite de placer à la fin d'un paragraphe une ligne comportant seulement quelques lettres ou, inversement, une ligne occupant toute la largeur du texte, susceptible d'entraîner une confusion entre les paragraphes. Pour cela, \frenchlaw impose à \LaTeX\ de ne pas terminer un paragraphe par un ou des mots mesurant moins de deux fois la largeur de l'alinéa~(ce qui évite les lignes trop courtes), et de toujours laisser un espace mesurant environ deux caractères libres en fin de paragraphe~(ce qui évite de confondre les paragraphes).

%% \begin{noprint}
%	Prevent excessively short or long lines at the end of paragraphs
\setlength{\parfillskip}{2ex plus \dimexpr\linewidth-3em}
%% \end{noprint}

%% \begin{developer}
%% Il est possible de modifier ce comportement en redéfinissant les dimensions minimale et maximale de la |glue| \dim{parfillskip}{Espace flexible (|glue|) inséré en fin de paragraphe~(\LaTeX).}, qui est paramétrée comme suit:\par
%% \vspace{-\baselineskip}
%% \begin{macro}
%% \setlength{\parfillskip}{2ex plus \dimexpr\linewidth -3em}
%% \end{macro}
%% \end{developer}


% ===== Colours =====

%% \section{Couleurs}\label{Couleurs}

%% La classe \frenchlaw permet de colorer automatiquement certains éléments du document grâce à l'option |colour|. Celle-ci fonctionne, en principe, avec des jeux de couleurs prédéfinis, mais l'utilisateur peut, d'une part, choisir ses propres couleurs pour les appliquer et, d'autre part, modifier la couleur de tel ou tel élément en particulier.

%% \begin{noprint}
%	Create commands for setting a new colour scheme
% Associate an HTML Hex colour code to a name (developer side)
\newcommand{\setcolourscheme}[3]{%
	\expandafter\gdef\csname setmaincolour@#1\endcsname{\color[HTML]{#2}}%
	\expandafter\gdef\csname setsubcolour@#1\endcsname{\color[HTML]{#3}}}
% Define \maincolour and \subcolour using the colour name (user side)
\newcommand{\setcolours}[1]{%
	\gdef\maincolour{\csname setmaincolour@#1\endcsname}%
	\gdef\subcolour{\csname setsubcolour@#1\endcsname}}
%% \end{noprint}

%% \begin{developer}
%% Un jeu de couleurs peut être créé avec la commande \cs{setcolourscheme}{Commande permettant d'associer un nom à un jeu de couleurs à utiliser dans le document.}, qui permet d'associer un nom à deux couleurs: la première sera considérée comme principale; l'autre est une couleur de contraste, en principe plus claire.\par
%% \vspace{-\baselineskip}
%% \begin{macro}
%% \setcolourscheme{<name>}{<hex colour code>}{<hex colour code>}
%% \end{macro}
%% \end{developer}

%	TODO > Change contrasting colour to something else
%% \begin{noprint}
\setcolourscheme{red}{990000}{D89899}
\setcolourscheme{blue}{4682B4}{9CC3E4}
\setcolours{red}
%% \end{noprint}

%% \frenchlaw définit deux jeux de couleurs: |red|, basé sur \emph{Crimson Red}, et |blue|, qui utilise \emph{Steel Blue}. La commande \cs{setcolours}{Commande permettant de définir les couleurs principale et secondaire du document.}\arg{name} a pour effet de définir, selon les préférences de l'utilisateur, la couleur principale du document~(\cs{maincolour}{Commande permettant d'appliquer la couleur principale du document.}), ainsi que la couleur secondaire de celui-ci~(\cs{subcolour}{Commande permettant d'appliquer la couleur de contraste du document.}):\todo{Cf. liste dans le code.}

%% \noindent\bgroup\setcolours{red}|\setcolours{red} | donne: \hfill {\maincolour\ttfamily\space\textbackslash maincolour} \hfill {\subcolour\ttfamily\textbackslash subcolour}\egroup

%% \noindent\bgroup\setcolours{blue}|\setcolours{blue}| donne: \hfill {\maincolour\ttfamily\textbackslash maincolour} \hfill {\subcolour\ttfamily\textbackslash subcolour}\egroup

%% Les différents éléments susceptibles d'être mis en couleurs par la classe sans autre forme de modification de la part de l'utilisateur sont indiqués dans la suite de la documentation. Pour mémoire, toutefois, une liste de toutes les commandes permettant de configurer la couleur de ces éléments est présentée dans le \textsc{Tableau}~\ref{tab:Colouring}). De manière générale~-- et ce principe connaît des variations dans les différents styles proposés~-- l'option |colour|, qui correspond en réalité à \safeverb[\optioncolor]{colour=some}, se contente de mettre en couleurs quelques éléments peu susceptibles de gêner la lecture, dans le seul but d'attirer légèrement le regard vers tel ou tel élément, à la manière d'une discrète enluminure. L'option \safeverb[\optioncolor]{colour=all} permet de composer en couleurs un plus grand nombre d'éléments du texte, généralement en conjonction avec l'option |modern|. L'imprimerie traditionnelle utilise, en effet, très peu les couleurs~-- plus chères~-- qui se sont démocratisées dans les ouvrages en même temps que leur usage sur les écrans. Ces choix en sont la traduction.

%% \begin{table}
%% \begin{tabular}{lll}
%% 	\cs{bookcolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de livres~(\safeverb[\macrocolor]{\book}) sont composés.} & \cs{partcolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de parties~(\safeverb[\macrocolor]{\part}) sont composés.} & \cs{headingcolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de titres~(\safeverb[\macrocolor]{\heading}) sont composés.}\\
%% 	\cs{subheadingcolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de sous-titres~(\safeverb[\macrocolor]{\subheading}) sont composés.} & \cs{chaptercolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de chapitres~(\safeverb[\macrocolor]{\chapter}) sont composés.} & \cs{sectioncolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de sections~(\safeverb[\macrocolor]{\section}) sont composés.}\\
%% 	\cs{subsectioncolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de sous-sections~(\safeverb[\macrocolor]{\subsection}) sont composés.} & \cs{subsubsectioncolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de sous-sous-sections~(\safeverb[\macrocolor]{\subsbusection}) sont composés.} & \cs{paragraphcolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de paragraphes~(\safeverb[\macrocolor]{\paragraph}) sont composés.}\\
%% 	\cs{subparagraphcolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de sous-paragraphes~(\safeverb[\macrocolor]{\sunparagraph}) sont composés.} & \cs{paracolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés des numéros~(\safeverb[\macrocolor]{\para}) sont composés.} & \cs{paranumcolour}{Macro précisant dans quels contexte et de quelle couleur les numéros~(\safeverb[\macrocolor]{\para}) sont composés.}\\
%%	\cs{subparacolour}{Macro précisant dans quels contexte et de quelle couleur les intitulés de sous-numéros~(\safeverb[\macrocolor]{\subpara}) sont composés.} & \cs{subparanumcolour}{Macro précisant dans quels contexte et de quelle couleur les sous-numéros \safeverb[\macrocolor]{\subpara} sont composés.} & \cs{marginaliacolour}{Macro précisant dans quels contexte et de quelle couleur le trait sous les intitulés des divisions hiérarchiques inférieures avec l'option \safeverb[\optioncolor]{marginalia} est composés.}\\
%%	\cs{vitaecolour}{Macro précisant dans quels contexte et de quelle couleur le trait marquant chaque nouvelle section avec l'option \safeverb[\optioncolor]{vitae} est composés.} & & \\
%% \end{tabular}
%% \caption{Macros utilisées pour la mise en couleurs.}
%% \label{tab:Colouring}
%% \end{table}

% TODO > Pour l'option couleur: documenter les commandes \Xcolor de tous les items à colorer, et les définir par défaut comme étant \maincolor (ou \subcolor), pour n'avoir à définir qu'une ou deux couleurs (contraste, e.g. pour des tranches de pages, encadrés, etc.)
% Dans chaque cas, écrire: type \if@color\maincolor\fi (donc noir si l'option n'est pas sélectionnée) --- ou pour les subdivisions: if@colorall\maincolor\fi (ou un truc du genre)


% =***======***======***======***======***======***======***======***======***======***=
%% \part{Structure du document}
% =***======***======***======***======***======***======***======***======***======***=


% =***======***======***======***======***======***======***======***======***======***=

%	#####	DOCUMENT DIVISIONS	#####

%% \chapter{Divisions du document}

%% Une fois passé le préambule, il convient de structurer le document au moyen de subdivisions hiérarchiques (parties, chapitres, sections, etc.) ou tout simplement logiques (pages liminaires, numéros de paragraphes, annexes). \LaTeX\ permet d'automatiser les deux processus en utilisant des compteurs~(\emph{counters}) incrémentés à chaque changement de subdivision, ce qui permet d'obtenir une numérotation continue sans effort. On distinguera les divisions hiérarchiques classiques des divisions seulement logiques, souvent propres aux juristes.


%	===== Hierarchical Divisions (Sectioning) =====

%% \section{Divisions hiérarchiques}

% TODO > Créer des niveaux supplémentaires de subdivision (\subsubparagraph, \point, \subpoint, \subsubpoint) et leur trouver une numérotation == i., alpha/grec, bullet et un quatrième + les reporter dans la ToC pour leur donner un style (ou omettre?) + tout documenter (noms des subdivisions existantes, tableau avec la numérotation, etc.). --- Cf. classe memoir, mais pour les niveaux ToC 6 à 10
% \newcommand{\section}{%
%   \sechook%
%   \@startsection{section}{1}%  level 1
%       {\secindent}%            heading indent
%       {\beforesecskip}%        skip before the heading
%       {\aftersecskip}%         skip after the heading
%       {\normalfont\secheadstyle}} % font

% TODO » Pour afficher Livre second et Seconde partie, autoriser la modification manuelle du nom de la partie, comme ce qui a été fait pour le chapitre liinaire 
% Tout mettre dans une commande \partnum qui sera utilisée par babel plutôt que de mettre du code dedans

%% La division du document en chapitres, sections, paragraphes, et autres subdivisions institue une hiérarchie entre divers éléments; la section se trouve ainsi dans le chapitre, qui se trouve dans le titre, lui-même situé dans la partie.

%% Ces subdivisions hiérarchiques existent par défaut sous \LaTeX, mais sont en nombre insuffisant pour les juristes qui les multiplient volontiers. \frenchlaw commence par créer toutes les commandes nécessaires pour utiliser des titres et sous-titres dans le document et définir, par la même occasion, leur positionnement dans la hiérarchie des titres~-- étape nécessaire en vue de la création ultérieure de tables des matières.

%% \begin{noprint}
%	Create ToC subdivisions for <heading> and <subheading>
\newlistentry[part]{heading}{toc}{-1}
\newlistentry[heading]{subheading}{toc}{-1}
%% \end{noprint}

% TODO > Starred version sans tout recopier? (heading et subheading)
%% \begin{noprint}
%	Create a macro for instering headings (built on \chapter)
% Note: There is no starred version of this command, as it did not seem very useful to have one.
\newcommand{\heading}[2][]{
	\begingroup
		\if@article\else\cleardoublepage\fi
		\stepcounter{heading}
		\renewcommand{\printchaptertitle}{%
			\printheadingname%
			\headingnamenum\printheadingnum%
			\afterheadingnum%
			\printheadingtitle%
		}
		\clearforchapter
		\thispagestyle{chapter}
		\@schapter{#2}
		\chaptermark{#2}
		\phantomsection
		\addcontentsline{toc}{heading}{\protect\numberline{\theheading}#2}
	\endgroup
}
%% \end{noprint}

%% \begin{noprint}
%	Create a macro for instering subheadings (built on \chapter)
% Note: There is no starred version of this command, as it did not seem very useful to have one.
\newcommand{\subheading}[2][]{
	\begingroup
		\if@article\else\cleardoublepage\fi
		\stepcounter{subheading}
		\renewcommand{\printchaptertitle}{%
			\printsubheadingname%
			\subheadingnamenum\printsubheadingnum%
			\aftersubheadingnum%
			\printsubheadingtitle%
		}
		\clearforchapter
		\thispagestyle{chapter}
		\@schapter{#2}
		\chaptermark{#2}
		\phantomsection
		\addcontentsline{toc}{subheading}{\protect\numberline{\thesubheading}#2}
	\endgroup
}
%% \end{noprint}

%% La classe \frenchlaw définit ensuite le style de chaque niveau de subdivision en utilisant les méthodes de la classe |memoir|. Le style |frenchlaw-classic| est créé et appliqué par défaut. Il est adapté à tous les documents composés dans un style classique, avec des polices d'écriture à empattements, comme les thèses et certaines monographies classiques. Un autre style de chapitre, dénommé |frenchlaw-modern| est utilisé avec l'option |modern|; il utilise une police sans-serif pour les titres. La plupart des niveaux de subdivision sont composés en petites ou grandes capitales, en jouant sur le contraste entre les deux casses pour un même corps.

%% \begin{noprint}
%	Create new generic style
\makechapterstyle{frenchlaw-classic}{

	%	Style <book> titles
	\renewcommand*{\thebook}{\Roman{book}}
	\renewcommand*{\booktitlefont}{\huge\bookcolour\scshape}
	\renewcommand*{\booknamefont}{\booktitlefont}
	\renewcommand*{\booknumfont}{\booktitlefont}
	\renewcommand*{\printbooknum}{%
		\booknumfont%
		\ifdefstring{\languagename}{french}
			{\ifnum\value{book}=1	\ordinalstring{book}[m]%
			 \else					\thebook\fi}
			{\thebook}}
	\renewcommand{\beforebookskip}{%
		\null\vspace{\baselinestretch\addto@huge}%
		\vspace{\if@tenpoints 12\baselineskip\else 10\baselineskip\fi}}
	\renewcommand{\midbookskip}{\par\vspace{\baselinestretch\addto@huge}}

	%	Style <part> titles
	\renewcommand*{\thepart}{\Roman{part}}
	\renewcommand*{\parttitlefont}{\LARGE\partcolour\scshape}
	\renewcommand*{\partnamefont}{\parttitlefont}
	\renewcommand*{\partnumfont}{\parttitlefont}
	\renewcommand{\printpartname}{\partnamefont\Ordinalstring{part}[f]\space\partname}
	\renewcommand{\printpartnum}{}
	\renewcommand{\beforepartskip}{%
		\null\vspace{\baselinestretch\addto@LARGE}\vspace{\baselineskip}}
	\renewcommand{\midpartskip}{%
		\par\vspace{\baselinestretch\addto@LARGE}}
	\renewcommand{\afterpartskip}{\vspace{2\baselineskip}}
	% \nopartblankpage

	%	Style <heading> titles
	\renewcommand{\theheading}{\Roman{heading}}
	\newcommand{\headtitlefont}{\centering\Large\headingcolour\scshape}
	\newcommand{\headnamefont}{\headtitlefont}
	\newcommand{\headnumfont}{\headtitlefont}
	\newcommand{\afterheadingnum}{\par\nobreak\vskip\midchapskip}
	\newcommand{\headingnamenum}{\space}
	\newcommand{\printheadingnum}{%
		\headnumfont%
		\ifdefstring{\languagename}{french}
			{\ifnum\value{heading}=1	\ordinalstring{heading}[m]%
			 \else						\theheading\fi}
			{\theheading}}
	\newcommand{\printheadingname}{\headnamefont\headingname}
	\newcommand{\printheadingtitle}[1]{\headtitlefont ##1}

	%	Style <subheading> titles
	\renewcommand{\thesubheading}{\Roman{subheading}}
	\newcommand{\subheadtitlefont}{\centering\Large\subheadingcolour\scshape}
	\newcommand{\subheadnamefont}{\subheadtitlefont}
	\newcommand{\subheadnumfont}{\subheadtitlefont}
	\newcommand{\aftersubheadingnum}{\par\nobreak\vskip\midchapskip}
	\newcommand{\subheadingnamenum}{\space}
	\newcommand{\printsubheadingnum}{%
		\subheadnumfont%
		\ifdefstring{\languagename}{french}
			{\ifnum\value{subheading}=1		\ordinalstring{subheading}[m]%
			 \else							\thesubheading\fi}
			{\thesubheading}}
	\newcommand{\printsubheadingname}{\subheadnamefont\subheadingname}
	\newcommand{\printsubheadingtitle}[1]{\subheadtitlefont ##1}

	%	Style <chapter> titles
	\renewcommand{\thechapter}{\Roman{chapter}}
	\renewcommand{\chaptitlefont}{\raggedright\Large\chaptercolour\scshape}
	\renewcommand{\chapnamefont}{\chaptitlefont}
	\renewcommand{\chapnumfont}{\chaptitlefont}
	\renewcommand{\chapternamenum}{\space}
	\renewcommand{\printchapternum}{%
		\chapnumfont%
		\ifanappendix					\Alph{chapter}%
		\else\ifdefstring{\languagename}{french}
			{\ifnum\value{chapter}=1	\ordinalstring{chapter}[m]%
			 \else						\thechapter\fi}
			{\thechapter}\fi}
	\renewcommand{\@chapapp}{\chapnamefont\chaptername}
	\renewcommand{\afterchapternum}{\par\nobreak\vskip\midchapskip}
	\setlength{\beforechapskip}{\baselinestretch\addto@Large}
	\addtolength{\beforechapskip}{\baselineskip}
	\setlength{\midchapskip}{\baselinestretch\addto@Large}
	\setlength{\afterchapskip}{2\baselineskip}
	%	Define additional elements for <article>-style chapters (reduce spacing)
	\newcommand{\chapterblock}{%
		\setlength{\afterchapskip}{\baselineskip}}

}
\chapterstyle{frenchlaw-classic}
%% \end{noprint}

%% \begin{noprint}
%	Create a sectionning style for option <modern>, based on the standard one
\makechapterstyle{frenchlaw-modern}{

	%	Style <book> titles with option <modern>
	\renewcommand*{\booktitlefont}{\huge\bookcolour\sffamily\scshape}
	\renewcommand*{\printbookname}{\booknamefont\MakeLowercase\bookname}
	\renewcommand*{\printbooktitle}[1]{\booktitlefont\MakeUppercase{##1}}
	\renewcommand*{\printbooknum}{%
		\booknumfont%
		\ifdefstring{\languagename}{french}
			{\ifnum\value{book}=1	\ordinalstring{book}[m]%
			 \else					\MakeLowercase{\thebook}\fi}
			{\MakeLowercase{\thebook}}}
	\renewcommand{\beforebookskip}{%
		\null\vspace{\baselinestretch\addto@huge}%
		\vspace{\if@tenpoints 12\baselineskip\else 10\baselineskip\fi}}
	\renewcommand{\midbookskip}{\par\vspace{\baselinestretch\addto@huge}}

	%	Style <part> titles with option <modern>
	\renewcommand*{\parttitlefont}{\LARGE\partcolour\sffamily\scshape}
	\renewcommand{\printpartname}{\partnamefont\ordinalstring{part}[f]\space\partname}
	\renewcommand{\printparttitle}[1]{\parttitlefont\MakeUppercase{##1}}
	\renewcommand{\beforepartskip}{%
		\null\vspace{\baselinestretch\addto@LARGE}\vspace{\baselineskip}}
	\renewcommand{\midpartskip}{%
		\par\vspace{\baselinestretch\addto@LARGE}}

	%	Style <heading> titles with option <modern>
	\renewcommand{\headtitlefont}{\centering\Large\headingcolour\sffamily\scshape}
	\renewcommand{\printheadingname}{\headnamefont\MakeLowercase\headingname}
	\renewcommand{\printheadingtitle}[1]{\headtitlefont\MakeUppercase{##1}}
	\renewcommand{\printheadingnum}{%
		\headnumfont%
		\ifdefstring{\languagename}{french}
			{\ifnum\value{heading}=1	\ordinalstring{heading}[m]%
			 \else						\MakeLowercase{\theheading}\fi}
			{\MakeLowercase{\theheading}}}

	%	Style <subheading> titles with option <modern>
	\renewcommand{\subheadtitlefont}{\centering\Large\subheadingcolour\sffamily\scshape}
	\renewcommand{\printsubheadingname}{\subheadnamefont\MakeLowercase\subheadingname}
	\renewcommand{\printsubheadingtitle}[1]{\subheadtitlefont\MakeUppercase{##1}}
	\renewcommand{\printsubheadingnum}{%
		\subheadnumfont%
		\ifdefstring{\languagename}{french}
			{\ifnum\value{subheading}=1		\ordinalstring{subheading}[m]%
			 \else							\MakeLowercase{\thesubheading}\fi}
			{\MakeLowercase{\thesubheading}}}

	%	Style <chapter> titles with option <modern>
	% In <memoir> chapters must be entirely redefined for each style
	\renewcommand{\chaptitlefont}{\raggedright\Large\chaptercolour\sffamily\scshape}
	\renewcommand{\chapnamefont}{\chaptitlefont}
	\renewcommand{\chapnumfont}{\chaptitlefont}
	\renewcommand{\chapternamenum}{\space}
	\renewcommand{\printchapternum}{%
		\chapnumfont%
		\ifanappendix					\Alph{chapter}%
		\else\ifdefstring{\languagename}{french}
			{\ifnum\value{chapter}=1	\ordinalstring{chapter}[m]%
			 \else						\MakeLowercase{\thechapter}\fi}
			{\MakeLowercase{\thechapter}}\fi}
	\renewcommand{\@chapapp}{\chapnamefont\MakeLowercase\chaptername}
	\renewcommand{\printchaptertitle}[1]{\chaptitlefont\MakeUppercase{##1}}
	\renewcommand{\afterchapternum}{\par\nobreak\vskip\midchapskip}
	\setlength{\beforechapskip}{\baselinestretch\addto@Large}
	\addtolength{\beforechapskip}{\baselineskip}
	\setlength{\midchapskip}{\baselinestretch\addto@Large}
	\setlength{\afterchapskip}{2\baselineskip}
	%	Define additional elements for <article>-style chapters (reduce spacing)
	\renewcommand{\chapterblock}{%
		\setlength{\afterchapskip}{\baselineskip}}

}
\if@modern\chapterstyle{frenchlaw-modern}\fi
%% \end{noprint}

%% La composition des nombreuses subdivisions correspondant aux sections, sous-sections et paragraphes\todo{adde les suivantes ici} ne dépend pas du système de styles, mais exclusivement des options choisies au début du document. Ces commandes, héritées des classes standard, sont beaucoup plus faciles à modifier par l'utilisateur. Dans la configuration proposée par \frenchlaw, on notera en particulier de subtiles différences dans l'utilisation des petites-capitales entre les documents classiques~(avec empattements), qui conservent la casse des intitulés de sections, et l'option |modern| qui compose les titres de sections entièrement en petites-capitales. L'option |marginal|, quant à elle insère les titres de plusieurs niveaux de subdivision directement dans la marge, comme dans certains ouvrages anciens. L'option |vitae| bénéficie également d'une attention particulière: les sections y sont indiquées par un trait coloré placé dans la marge.

%% \begin{noprint}
%	Style punctuation in section and paragraph headings
% When babel defines a name for the section / paragraph level in question, it should be printed before the number, unless option <article> is used.
\setsecnumformat{%
	\if@article\else\ifcsname #1name\endcsname\csname #1name\endcsname\space\fi\fi%
	\csname the#1\endcsname.\enskip}
%% \end{noprint}

%% \begin{noprint}
%	Replace \vskip with \addvspace at the end of section and paragraph headings
% Prevents stacking vertical white space when using environments which also add some.
\patchcmd{\@xsect}
	{\vskip\@tempskipa\vskip-\parskip}
	{\addvspace{\@tempskipa}\addvspace{-\parskip}}
	{}
	{\@latex@warning@no@line{Failed to patch \noexpand\@xsect.}}
%% \end{noprint}

%% \begin{noprint}
%	Style <section> and <paragraph> titles and numbering
\if@article
	% Wirh option <article>, simlify numbering to I.A.1.a
	\renewcommand{\thesection}{\Roman{section}}
	\renewcommand{\thesubsection}{\Alph{subsection}}
	\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
	\renewcommand{\theparagraph}{\alph{paragraph}}
	\renewcommand{\thesubparagraph}{\roman{subparagraph}}
\else
	% Without option <article>, use standard French numbering
	\renewcommand{\thesection}{\Roman{section}}
	\renewcommand{\thesubsection}{\Roman{subsection}}
	\renewcommand{\thesubsubsection}{\Alph{subsubsection}}
	\renewcommand{\theparagraph}{\arabic{paragraph}}
	\renewcommand{\thesubparagraph}{\alph{subparagraph}}
\fi
%% \end{noprint}

%% \begin{noprint}
%	Style <section> headings
% Create a helper macro for styling elements specific to <vitae>
\newcommand{\sechead@vitae}{%
	\strut\marginpar{\vitaecolour\raisebox{.5ex}{\rule{2cm}{.5ex}}}}
% Set section heading styles
\setsecheadstyle{\raggedright\large\scshape\if@vitae\sechead@vitae\fi}
\if@modern
	\setsecheadstyle{%
		\raggedright\large\sectioncolour\sffamily\if@vitae\sechead@vitae\fi%
		\scshape\MakeUppercase}
\fi
\setlength{\beforesecskip}{\baselinestretch\addto@large}
% Skip two lines before a new section, except in <twocolumn> mode
\if@twocolumn\addtolength{\beforesecskip}{\z@}
	\else\addtolength{\beforesecskip}{\baselineskip}\fi
% Skip one line after a new section
\setlength{\aftersecskip}{\baselineskip}
%% \end{noprint}

%% \begin{noprint}
%	Style <subsection> headings
\setsubsecheadstyle{\raggedright\scshape}
\if@modern
	\setsubsecheadstyle{%
		\raggedright\subsectioncolour\sffamily\scshape\MakeUppercase}
\fi
\setlength{\beforesubsecskip}{\baselineskip}
\addtolength{\beforesubsecskip}{\z@}
\setlength{\aftersubsecskip}{\baselineskip}
%% \end{noprint}

%% \begin{noprint}
%	Style <subsubsection> headings
\setsubsubsecheadstyle{\raggedright\scshape}
\if@modern
	\setsubsubsecheadstyle{%
		\raggedright\subsubsectioncolour\sffamily\scshape\allcapsfeatures\MakeLowercase}
\fi
\setlength{\beforesubsubsecskip}{\baselineskip}
\setlength{\aftersubsubsecskip}{\baselineskip}
%% \end{noprint}

%% \begin{noprint}
%	Style <paragraph> headings
% TODO > Adde \needspace{3\baselineskip} somewhere?
\setparaheadstyle{\raggedright\itshape}
\setparaindent{\z@}
\setlength{\beforeparaskip}{\baselineskip}
\setlength{\afterparaskip}{\baselineskip}
\if@modern\setparaheadstyle{\paragraphcolour\raggedright\sffamily\itshape}\fi
% With option <marginalia>, paragraph headings are set in the margin
\newcommand{\marginparastyle}{%
	\if@modern\paragraphcolour\sffamily\allcapsfeatures\fi%
	\if@vitae\itshape\else\scshape\fi}
\if@marginalia
	\newcommand{\marginparahead}[1]{%
		\marginpar{%
			\marginparastyle
			\if@vitae#1%
			\else
				\marginaliacolour\raisebox{\baselineskip}{\rule{2.75cm}{.2ex}}\par
				\vskip-\baselineskip#1\par
				\raisebox{.5em}{\rule{2.75cm}{.2ex}}\fi}}
	\setparaheadstyle{\marginparahead}
	\setlength{\afterparaskip}{\z@}
\fi
%% \end{noprint}

%% \begin{noprint}
%	Style <subparagraph> headings
% TODO > Adde \needspace{3\baselineskip} somewhere?
\setsubparaheadstyle{\raggedright\itshape}
\setsubparaindent{\z@}
\setlength{\beforesubparaskip}{\baselineskip}
\setlength{\aftersubparaskip}{\baselineskip}
% With option <marginalia>, subparagraph headings are set in the margin
\if@modern\setsubparaheadstyle{\subparagraphcolour\raggedright\sffamily\itshape}\fi
\newcommand{\marginsubparastyle}{%
	\if@modern\subparagraphcolour\allcapsfeatures\fi%
	\if@vitae\itshape\else\scshape\fi}
\if@marginalia
	\newcommand{\marginsubparahead}[1]{%
		\marginpar{%
			\marginsubparastyle
			\if@vitae#1~:
			\else
				\marginaliacolour#1\par
				\raisebox{.5em}{\rule{2.75cm}{.2ex}}\fi}}
	\setsubparaheadstyle{\marginsubparahead}
	\setlength{\aftersubparaskip}{\z@}
	% TODO » Modifier le style pour inclire des small-caps + sans-sérif afin de différencier les niveaux. --- Ajouter les subdivisions inférieures --- Voir si on les met dans la marge ou si elles passent en inline
\fi
%% \end{noprint}

%% Il est possible de créer de nouveaux styles de chapitres~(et de subdivisions en général) en utilisant les commandes de la classe |memoir|, à la documentation de laquelle le lecteur est renvoyé.

%% Les subdivisions disponibles dans la classe \frenchlaw sont les suivantes: \cs{book}{Commande permettant d'insérer une subdivision hiérarchique pour les livres.}, \cs{part}{Commande permettant d'insérer une subdivision hiérarchique pour les parties, à l'intérieur des livres éventuels d'un ouvrage.}, \cs{heading}{Commande permettant d'insérer une subdivision hiérarchique pour les titres, à l'intérieur des parties d'un ouvrage.}, \cs{subheading}{Commande permettant d'insérer une subdivision hiérarchique pour les sous-titres, à l'intérieur des titres d'un ouvrage.}, \cs{chapter}{Commande permettant d'insérer une subdivision hiérarchique pour les chapitres, à l'intérieur des parties ou des (sous-)titres d'un ouvrage.}, \cs{section}{Commande permettant d'insérer une subdivision hiérarchique pour les sections, à l'intérieur des chapitres éventuels d'un ouvrage.}\footnote{L'alignement vertical du texte sur la page est sera modifié si une \texttt{\textbackslash section} est placée immédiatement à la suite d'un chapitre, sans aucun texte introductif.}, \cs{subsection}{Commande permettant d'insérer une subdivision hiérarchique pour les sous-sections, à l'intérieur des sections d'un ouvrage.}, \cs{subsubsection}{Commande permettant d'insérer une subdivision hiérarchique pour les sous-sous-sections, à l'intérieur des sous-sections d'un ouvrage.}, \cs{paragraph}{Commande permettant d'insérer une subdivision hiérarchique pour les paragraphes, généralement à l'intérieur des sous-sous-sections d'un ouvrage.}, \cs{subparagraph}{Commande permettant d'insérer une subdivision hiérarchique pour les sous-paragraphes, à l'intérieur des paragraphes d'un ouvrage.}. \todo{\Adde les subdivisions supplémentaires.} Les commandes correspondantes peuvent être employées ainsi:

%% \begin{macro}
%% \book{<title>}% Livre
%% \part{<title>}% Partie
%% \heading[<short-title>]{<title>}% Titre
%% \subheading[<short-title>]{<title>}% Sous-titre
%% \chapter[<toc-title>][<head-title>]{<title>}% Chapitre
%% \section[<toc-title>][<head-title>]{<title>}% Section
%% \subsection[<toc-title>][<head-title>]{<title>}% Sous-section
%% \subsubsection[<toc-title>][<head-title>]{<title>}% Sous-sous-section
%% \paragraph[<toc-title>][<head-title>]{<title>}% Paragraphe
%% \subparagraph[<toc-title>][<head-title>]{<title>}% Sous-paragraphe
%% \end{macro}

%% L'argument obligatoire \arg{title} contient le titre de la subdivision dont il s'agit. Le premier argument optionnel \opt{toc-title} permet d'indiquer un titre différent~-- par exemple, plus court~-- à utiliser dans la table des matières. Quant au second argument optionnel, \opt{head-title}, il permet s'il y a lieu, de préciser un titre différent à utiliser dans l'en-tête de la page. Pour les commandes |\heading| et |\subheading|, l'argument \opt{short-title} est utilisé à la fois dans la table des matières et dans les en-têtes.

%% Certaines subdivisions existent également sous une forme étoilée, qui n'est alors pas numérotée ni~(en principe) intégrée automatiquement à la table des matières. Ces commandes sont les suivantes:

%% \begin{macro}
%% \chapter*[<short-title>]{<title>}% Chapitre
%% \section*{<title>}% Section
%% \subsection*{<title>}% Sous-section
%% \subsubsection*{<title>}% Sous-sous-section
%% \paragraph*{<title>}% Paragrpahe
%% \paragraph*{<title>}% Sous-paragraphe
%% \end{macro}

%% La classe \frenchlaw modifie ce comportement pour ajouter automatiquement à la table des matières les chapitres créés avec |\chapter*|, afin d'épargner à l'utilisateur la nécessité de réaliser manuellement cet ajout à chaque fois. Il est toutefois recommandé de n'utiliser cette commande étoilée que dans des contextes bien particuliers. Il pourra être utile d'en comparer les effets avec la commande |\fakechapter|, présentée et comparée ci-dessous.

%% \begin{noprint}
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
	\@schapter{\if\ch@pprefix\relax\else\ch@pprefix\afterchapternum\fi#2}
	\chaptermark{\if#1\relax#2\else#1\fi}
	\phantomsection
	\addcontentsline{toc}{chapter}{%
		\if\ch@pprefix\relax\else\ch@pprefix\cftchapteraftersnum\cftchapteraftersnumb~\fi#2}
	% Increase, then decrease chapter counter (to reset all sub-counters)
	\addtocounter{chapter}{-1}
	\refstepcounter{chapter}}
%% \end{noprint}

%% \frenchlaw crée, en outre, la commande \cs{fakechapter}{Commande permettant d'insérer un chapitre non numéroté, susceptible de comporter n'importe quelle chaîne de caractères en lieu et place du texte \enquote{Chapitre \emph{n}}, et présenté dans la table des matières comme une section.}, qui mérite une explication. Elle permet de créer un chapitre non numéroté, mais elle comporte deux particularités: \glose{1} il est possible d'insérer un texte en lieu et place du numéro de chapitre; \glose{2} ce chapitre est renseigné dans la table des matières comme s'il s'agissait d'une section. Cette commande est particulièrement utile pour les chapitres non numérotés que l'on trouve en tout début ou en fin d'ouvrage, par exemple une préface, une liste d'abréviations, une bibliographie ou un index. Lorsque plusieurs chapitres non numérotés se suivent~-- ce qui est fréquent~--, la commande |\fakechapter| produit un résultat visuellement plus harmonieux dans la table des matières.

%% \begin{macro}
%% \fakechapter{<title>}
%% \fakechapter[<chapter-type>]{<title>}
%% \end{macro}

%% On pourra, par exemple, utiliser la commande |\fakechapter{Introduction}| pour créer un chapitre non numéroté du même nom, lequel apparaîtra dans la table des matières au même niveau et avec la même apparence que les sections. L'argument optionnel peut être employé, par exemple, dans |\fakechapter[Chapitre liminaire]{<Titre du chapitre>}|. Cela permettra de remplacer \enquote{Chapitre N} par le texte de l'argument optionnel dans le corps du texte. Ce chapitre est toujours inséré dans la table des matières au même niveau que les sections, l'argument optionnel remplaçant ici \enquote{Section N}.

%% On notera la différence entre cette commande et le traditionnel |\chapter*{<titre>}|, qui ne reproduit pas d'argument optionnel en lieu et place du numéro de chapitre et qui crée une entrée dans la table des matières au même noveau que les chapitres,. La différence est palpable, par exemple, lorsque le style de table des matières prévoit des sauts de lignes avant les chapitres, ce qui peut rendre inesthétiques les chapitres liminaires ou conclusifs lorsqu'ils sont nombreux.

%% \begin{noprint}
%	Create a command for insertinf a "fake" chapter
% TODO » Revoir: Marche bien avec le style de ToC de la thèse, mais pas avec les ToC plus classiques (indentation des sections, ce chapitre en étant une pour la ToC), ni s'il y a des sections dnas le fake chapter.
% Peut-être déf. comme une chapitre, mais utiliser les styles de texte des chapitres, en plaçant #1 et #2 dans le corps du texte (avec les styles correspondants, ou d'uatres)
% Rendre adaptables à d'autres styles de ToC
\newcommand{\fakechapter}[2][]{%
	\clearforchapter
	\thispagestyle{chapter}
	\@schapter{\if\relax#1\relax\else\if@modern\MakeLowercase{#1}\else#1\fi\afterchapternum\fi#2}
	\chaptermark{#1}
	\phantomsection
	\addcontentsline{toc}{section}{\unskip\hspace{\cftchapterindent}\if\relax#1\relax\else#1\cftchapteraftersnum\cftchapteraftersnumb~\fi#2}}
%% \end{noprint}

%% Une fois insérées dans le document, les différentes subdivisions hiérarchiques sont numérotées différemment, selon que l'on se trouve dans un document long ou que l'on utilise l'option |article|. Le tableau suivant indique le niveau de chaque subdivision dans la table des matières, qui pourra être utile aux développeurs, ainsi que son mode de numérotation en fonction de l'option sélectionnée~(\textsc{Tableau}~\ref{tab:Sectionning}).
%% \begin{table}
%% \begin{tabular}{p{.25\textwidth}p{.05\textwidth}p{.45\textwidth}p{.125\textwidth}}
%% Subdivision & Niv. & Monographies, thèses & Articles \\
%% \midrule
%% |\book| & -2 & Livre premier, Livre II, etc. & \\
%% |\part| & -1 & Première partie, Deuxième partie, etc. & \\
%% |\heading| & -1 & Titre premier, Titre II, etc. & \\
%% |\subheading| & -1 & Sous-titre premier, Sous-titre II, etc. & \\
%% |\chapter| & 0 & Chapitre premier, Chapitre II, etc. & \\
%% |\section| & 1 & Section~I, Section~II, etc. & I, II, etc. \\
%% |\subsection| & 2 & §~I, §~II, etc. & A, B, etc. \\
%% |\subsubsection| & 3 & A, B, etc. & 1, 2, etc. \\
%% |\paragraph| & 4 & 1, 2, etc. & a, b, etc. \\
%% |\subparagraph| & 5 & a, b, etc. & \emph{i}, \emph{ii}, etc. \\
%% \end{tabular}%
%% \caption{Numérotation des différentes subdivisions.}
%% \label{tab:Sectionning}
%% \end{table}

%% \begin{developer}
%% D'une manière générale, le passage au chapitre suivant réinitialise la numérotation de toutes les subdivisions inférieures au chapitre, et ainsi de suite pour toutes les subdivisions hiérarchiques. La classe |memoir| permet de paramétrer facilement cela grâce aux commandes \cs{counterwithin}{Réinitialiser le compteur donné dans le premier argument à chaque fois que le compteur indiqué dans le second argument est incrémenté} et \cs{counterwithout}{Ne pas réinitialiser le compteur donné dans le premier argument lorsque le compteur indiqué dans le second argument est incrémenté} reprises à la classe |memoir|.
%% \end{developer}

%% \begin{noprint}
%	Reinitialise relevant counters
\counterwithin*{part}{book}
\counterwithin*{heading}{book}
\counterwithin*{chapter}{book}
\counterwithin*{chapter}{part}
\counterwithin*{chapter}{heading}
\counterwithin*{chapter}{subheading}
\counterwithin*{section}{chapter}
\counterwithin*{paragraph}{chapter}
\counterwithin*{paragraph}{section}
%% \end{noprint}

%% La classe |memoir| permet, par ailleurs, grâce à la commande \cs{maxsecnumdepth}{Macro permettant de définir le dernier niveau de subdivision hiérarchique à être numéroté.} de choisir jusqu'à quel niveau les subdivisions du document doivent porter une numérotation apparente sans avoir à modifier le reste du code. Ce paramètre est configuré différemment selon les options sélectionnées, et s'utilise comme suit:

%% \begin{macro}
%% \maxsecnumdepth{<counter>}% Par défaut: subparagraph
%% \end{macro}

%% \begin{noprint}
%	Define max section numbering
% TODO » Modifier lors de l'ajout de nouveaux niveaux de subdivision
\if@vitae
	\maxsecnumdepth{chapter}
\else\if@didactic
	\maxsecnumdepth{section}
\else
	\maxsecnumdepth{subparagraph}
\fi\fi
%% \end{noprint}

%% Les subdivisions hiérarchiques seront composées en couleurs avec la combinaison des options |modern| et |colourall| dans le corps du texte. Certains styles peuvent comporter des variations plus complexes. Il est possible de modifier la couleur de certaines subdivisions seulement~-- par exemple, si l'on veut repasser en noir en-deçà d'un certain niveau~-- grâce aux commandes |\Xcolour|, où |X| peut être remplacé par le nom de la subdivision en question. On pourra ainsi redéfinir, par exemple, la commande pour les chapitres, grâce au code suivant:

%% \begin{macro}
%% \renewcommand{\chaptercolour}{}% Chapitres toujours en noir.
%% \end{macro}

%% \begin{noprint}
\newcommand{\bookcolour}{\if@modern\if@colourall\maincolour\fi\fi}
\newcommand{\partcolour}{\if@modern\if@colourall\maincolour\fi\fi}
\newcommand{\headingcolour}{\if@modern\if@colourall\maincolour\fi\fi}
\newcommand{\subheadingcolour}{\if@modern\if@colourall\maincolour\fi\fi}
\newcommand{\chaptercolour}{\if@modern\if@colourall\maincolour\fi\fi}
\newcommand{\sectioncolour}{\if@modern\if@colourall\maincolour\fi\fi}
\newcommand{\subsectioncolour}{\if@modern\if@colourall\maincolour\fi\fi}
\newcommand{\subsubsectioncolour}{\if@modern\if@colourall\maincolour\fi\fi}
\newcommand{\paragraphcolour}{\if@modern\if@colourall\maincolour\fi\fi}
\newcommand{\subparagraphcolour}{\if@modern\if@colourall\maincolour\fi\fi}
%% \end{noprint}

%% Avec l'option |marginalia|, qui crée de grandes marges pour y insérer les titres des paragraphes, le trait placé sous le titre~-- qui ne risque pas de gêner la lecture~-- sera mis en couleurs simplement avec l'option |colour|. Ce comportement peut également être modifié en redéfinissant la commande |\marginaliacolour|.

%% \begin{noprint}
\newcommand{\marginaliacolour}{\if@colour\maincolour\fi}
%% \end{noprint}


%	===== Logical Divisions (Continuous) =====

%% \section{Divisions logiques}

%% Outre les divisions hiérarchiques qui structurent le \emph{texte}, il existe également~-- et particulièrement dans l'écriture juridique~-- des divisions logiques qui structurent le \emph{document} en son entier. Dans une monographie, on distinguera, par exemple, les pages liminaires qui sont souvent numérotées en chiffres romains, ou encore les sections finales dont les chapitres ne sont généralement pas numérotés. En droit, il est également d'usage de numéroter les paragraphes tout au long de l'ouvrage, pour structurer le passage d'une idée à une autre, sans pourtant créer de hiérarchie entre les différents numéros. La pratique est identique à celle consistant à numéroter les clauses d'un contrat ou les paragraphes d'une décision de justice.

%% \subsection{Structure d'ensemble de l'ouvrage}

%% Quant aux divisions logiques que l'on trouve dans les monographies et les thèses, elles sont intégralement reprises à la classe |memoir| qui les définit comme suit:

%% \begin{macro}
%% \frontmatter % Pages liminaires
%% \mainmatter % Corps de l'ouvrage
%% \appendix % Annexes de l'ouvrage
%% \backmatter % Pages terminales
%% \end{macro}

%% La déclaration \cs{frontmatter}{Déclaration indiquant la partie liminaire d'une monographie.} délimite la partie liminaire de l'ouvrage qui comporte généralement une préface ou un avant propos, un sommaire, une table d'abréviations,~etc. Ces chapitres ou sections ne sont pas numérotés et les pages sont généralement numérotées en chiffres romains minuscules. Dans certains types d'ouvrages, comme les mémoires et les thèses, la numérotation doit être continue, ce qui peut être obtenu avec la version étoilée |\frontmatter*|. Dans tous les cas, cette déclaration est incluse juste après les pages de garde dans tous les types de documents configurés par \frenchlaw.

%% La déclaration \cs{mainmatter}{Déclaration indiquant la partie centrale d'un document.} met fin aux dérogations instaurées pour les pages liminaires; les subdivisions hiérarchiques sont désormais numérotées normalement et la numérotation des pages, qui est remise à zéro, se fait en chiffres arabes. Pour les mémoires et thèses, \frenchlaw fait en sorte que la numérotation des pages ne soit pas affectée par l'usage de cette commande. La déclaration est également incluse juste après le titre des documents autres que les monographies.

%% Les annexes, s'il y en a, doivent être intégrées au corps de l'ouvrage grâce à la déclaration \cs{appendix}{Déclaration indiquant le passage aux annexes à l'intérieur du corps de l'ouvrage.}, qui modifie la dénomination et la numérotation des chapitres, lesquels deviendront par exemple une \enquote{Annexe A}. Il est également possible de faire précéder ces annexes d'une page reprenant le style d'une partie~(|part|) grâce à la commande \cs{appendixpage}{Commande permettant d'insérer une page annonçant les annexes.}.

%% Enfin, le \cs{backmatter}{Déclaration indiquant la partie terminale d'une monographie.} contient toutes les sections terminales de l'ouvrage, parmi lesquelles on compte, le plus souvent, les bibliographies, les index et la table des matières. Ces sections ne sont pas numérotées.

%% Dans l'optique de la rédaction d'une monographie ou d'une thèse, il faudra donc anticiper ces divisions logiques, puis insérer les divisions hiérarchiques au sein de cette structure au moment de la rédaction. Ces éléments pourront être approfondis en lisant la documentation de la classe |memoir|.

%% \subsection{Structuration du texte par numéros}

%% Dans l'écriture juridique, le propos est généralement structuré en numérotant les paragraphes afin de pouvoir s'y référer ensuite, mais aussi dans un style plus ancien, pour offrir au lecteur une table des matières augmentée d'un précis composé de tous ces numéros de paragraphes et de leurs intitulés.

%% Il n'est pas évident de trouver une dénomination adéquate à ces numéros: les lettres accentuées ne sont pas autorisées dans les noms de commandes~(\british{exit} donc la dénomination évidente), l'abréviation |\no| est déjà utilisée dans des extensions vitales pour composer l'abréviation \emph{\no}, alors que |\paragraph| désigne, dans toutes les versions de \LaTeX, un niveau de division hiérarchique. Les numéros \enquote{de paragraphes} utilisés par les juristes ne sont, à la vérité, pas des \emph{alinéas} non plus, dans la mesure où un numéro peut contenir plusieurs paragraphes typographiques pourvu qu'ils participent d'une même idée ou démonstration.

%% Vu la fréquence et la quantité de numéros que l'on utilise, ne serait-ce que dans un article de doctrine, il fallait, en outre, une commande courte et facile à mémoriser. Le choix qui fut arrêté, à l'usage, est celui de la commande \cs{para}{Commande permettant de numéroter les paragraphes de texte.}, qui renvoie adéquatement à l'idée de paragraphe coulé. La commande s'emploie comme suit:

%% \begin{macro}
%% \para % ou:
%% \para[<Intitulé du numéro>]
%% \end{macro}

%% La commande |\para|, utilisée en début de paragraphe, permet de passer au numéro suivant. La première fois que la commande est utilisée dans le document, elle imprimera donc le chiffre |1| et incrémentera le compteur \cnt{para}{Compteur associé à la division logique |\para|.}, de sorte que l'emploi suivant de la commande imprimera le chiffre |2|,~etc. Cela signifie donc que, si l'on ajoute un numéro en cours de rédaction, tous les numéros seront modifiés en conséquence. La commande peut recevoir un argument contenant l'intitulé du paragraphe. Il s'agit ici d'un argument \emph{optionnel}, placé entre [crochets], parce que certains numéros, comme les annonces de plan, n'ont pas forcément besoin de titre. Il s'agit toutefois d'un argument qu'il est vivement recommandé de remplir chaque fois que cela fait sens, car il permettra notamment de faire référence au bon paragraphe en dépit des évolutions de la numérotation.

%% Une seconde commande, dénommée \cs{subpara}{Commande permettant de sous-numéroter les paragraphes de texte.}, utilise la même syntaxe et permet de créer un sous-numéro de paragraphe. Si l'on se trouve dans le \para numéro |37|, la première commande |\subpara| créera un |37-1|; la seconde produira le |37-2|, et ainsi de suite jusqu'à la prochaine commande |\para| qui remettra le compteur \cnt{subpara}{Compteur associé à la division logique |\subpara|.} à zéro.

%% \begin{macro}
%% \subpara % ou:
%% \subpara[<Intitulé du numéro>]
%% \end{macro}

%% \begin{noprint}
%	Create counters to be associated with \para and \subpara
\newcounter{para}
\setcounter{para}{0}
\newcounter{subpara}[para]% Within counter <para>
\setcounter{subpara}{0}
%% \end{noprint}

%% En principe, le titre du paragraphe coulé est composé à côté du numéro de celui-ci. Il est parfois souhaitable que ce ne soit pas le cas. La commande \cs{noparanames}{Commande permettant de ne pas afficher les titres des paragraphes coulés.} permet de désactiver l'impression des titres des paragraphes, alors que \cs{paranames}{Commande permettant d'afficher les titres des paragraphes coulés (par défaut).} permet de la réactiver.

%% \begin{noprint}
%	Create a switch that displays paragrapg names or not
\newcommand{\paranames}{\@paranametrue}
\newcommand{\noparanames}{\@paranamefalse}
%%	\end{noprint}

%% La mise en forme des numéros de paragraphes est réalisée au moyen de styles prédéfinis, auxquels l'utilisateur pourra ajouter sa griffe. La commande \cs{makeparastyle}{Commande permettant de créer un nouveau style pour les numéros de paragraphes |\para| et |\subpara|.} permet de définir un nouveau style de paragraphe, alors que la commande \cs{parastyle}{Commande permettant de sélectionner un style pour les numéros de paragraphes |\para| et |\subpara|.}

%% \begin{noprint}
%	Create the commands that define and apply paragraph styles
\newcommand{\makeparastyle}[2]{\expandafter\gdef\csname @parastyle@#1\endcsname{#2}}
\newcommand{\parastyle}[1]{\csname @parastyle@#1\endcsname}
%%	\end{noprint}

%% Pour définir et sélectionner un nouveau style de numéros, il suffit de redéfinir, à l'intérieur de |\makeparastyle|, tout les paramètres que l'on souhaite modifier parmi la liste suivante. Les sous-numéros utilisent exactement la même syntaxe, à laquelle on ajoute seulement le préfixe |sub|~(\texttt{...subpara...}). Dans l'exemple ci-dessous, les paramètres les plus susceptibles d'être modifiés sont indiqués par |<...>|:

%% \begin{macro}
%% \makeparastyle{<nom du style>}{ % Création du style
%%  % Pour la commande \para
%%   % Mode de numérotation (ici, chiffres arabes):
%%   \renewcommand{\thepara}{\arabic{para}}
%%   % Espace à insérer avant chaque paragraphe:
%%   \renewcommand{\paraskip}{<...>}
%%   % Ponctuation et espace après le titre associé au numéro:
%%   \renewcommand{\parasep}{<...>}
%%   % Ponctuation et espace après le numéro:
%%   \renewcommand{\paranumsep}{<...>}
%%   % Couleur du titre (ici, les couleurs par défaut):
%%   \renewcommand{\paracolour}{\if@colourall\maincolour\fi}
%%   % Couleur du numéro (ici, les couleurs par défaut):
%%   \renewcommand{\paranumcolour}{\if@colourall\paracolour\fi}
%%   % Style du titre (ajouter par exemple \bfseries ou \scshape):
%%   \renewcommand{\paratitlestyle}[1]{<...>#1}
%%   % Style du numéro (idem):
%%   \renewcommand{\paranumstyle}[1]{<...>#1}
%% }
%% \end{macro}
%%  % Utiliser les mêmes commandes en remplaçant par "subpara" pour les \subpara

%%	\begin{noprint}
%	Define basic styling macros for the \para and \subpara commands
% Styling commands for \para
\newcommand{\paraskip}{}
\newcommand{\parasep}{}
\newcommand{\paranumsep}{}
\newcommand{\paracolour}{}
\newcommand{\paranumcolour}{}
\newcommand{\paratitlestyle}[1]{#1}
\newcommand{\paranumstyle}[1]{#1}

% Styling commands for \subpara
\newcommand{\subparaskip}{}
\newcommand{\subparasep}{}
\newcommand{\subparanumsep}{}
\newcommand{\subparanumdash}{}
\newcommand{\subparacolour}{}
\newcommand{\subparanumcolour}{}
\newcommand{\subparatitlestyle}[1]{#1}
\newcommand{\subparanumstyle}[1]{#1}
%% \end{noprint}

% TODO > Indexer / documenter chacune des commandes ci-dessus

%% Pour sélectionner un style de paragraphe, il est nécessaire de l'indiquer au moyen de la commande \cs{parastyle}{Commande permettant de sélectionner un style pour les numéros de paragraphes |\para| et |\subpara|.}. Plusieurs styles sont déjà définis par \frenchlaw. Le style |default|, chargé automatiquement, compose, sans originalité, les numéros et titres de paragraphes en petites capitales~(|classic|) ou en gras (|modern|). Le style |textbook| compose les numéros de paragraphe en gros dans la marge.

%% \begin{macro}
	%% \parastyle{<nom du style>} % Sélection du style
%% \end{macro}

% TODO > Créer d'autres styles de numéros

%% Le style |default|, chargé automatiquement, compose très classiquement les numéros de paragraphe et sous-paragraphe en gras. Le titre coulé des paragraphes est composé, selon les autres options choisies, en petites-capitales si le corps du texte utilise une police avec serif~(|classic|), en gras pour les compositions sans-serif~(|modern|) ou en italiques dans les marges~(|marginalia|).

%%	\begin{noprint}
%	Define generic \para and \subapara styles
\makeparastyle{default}{%
	% Styling commands for \para
	\renewcommand{\thepara}{\arabic{para}}
	\renewcommand{\paraskip}{\relax}
	\renewcommand{\parasep}{.\enskip}
	\renewcommand{\paranumsep}{.~}
	\renewcommand{\paracolour}{\if@colourall\maincolour\fi}
	\renewcommand{\paranumcolour}{\if@colourall\paracolour\fi}
	\renewcommand{\paratitlestyle}[1]{%
		\if@marginalia\footnotesize\itshape\else%
		\if@modern\sffamily\bfseries\else\scshape\fi\fi##1}
	\renewcommand{\paranumstyle}[1]{\if@modern\sffamily\fi\bfseries##1}

	% Styling commands for \subpara
	\renewcommand{\thesubpara}{\alph{subpara}}
	\renewcommand{\subparaskip}{\relax}
	\renewcommand{\subparasep}{.\enskip}
	\renewcommand{\subparanumsep}{).~}
	\renewcommand{\subparanumdash}{.}
	\renewcommand{\subparacolour}{}
	\renewcommand{\subparanumcolour}{\if@colourall\maincolour\fi}
	\renewcommand{\subparatitlestyle}[1]{%
		\if@marginalia\footnotesize\itshape\else%
		\if@modern\sffamily\fi\fi\itshape##1}
	\renewcommand{\subparanumstyle}[1]{%
		\subparanumcolour\if@modern\sffamily\fi\bfseries\itshape##1}
}
%	Set this style as default
\parastyle{default}
%% \end{noprint}

%% Le style |textbook| utilise un design un peu plus élaboré, dans un but à la fois ludique et esthétique. Dans une inspiration stylisée des enluminures médiévales, il compose les numéros de paragraphes en couleur (avec les options par défaut, dans la marge et dans un corps bien supérieur à celui du texte. Ce style est aussi particulièrement adapté à l'utilisation de couleurs.

%%	\begin{noprint}
%	Define \para ans \subapara styles for textbooks
\makeparastyle{textbook}{%
	% Styling commands for \para
	\renewcommand{\paraskip}{\par\addvspace{\baselineskip}}
	\renewcommand{\parasep}{.\enspace}
	\renewcommand{\paranumsep}{.\enspace}
	\renewcommand{\paracolour}{\if@colour\maincolour\fi}
	\renewcommand{\paranumcolour}{\paracolour}
	\renewcommand{\paratitlestyle}[1]{\sffamily\bfseries##1}
	\renewcommand{\paranumstyle}[1]{%
		\citereset\noindent%
		\llap{\raisebox{0pt}[0pt][0pt]{\huge\itshape##1}}}

	% Styling commands for \subpara
	\renewcommand{\subparanumcolour}{\if@colour\maincolour\fi}
	\renewcommand{\subparatitlestyle}[1]{%
		\if@marginalia\footnotesize\itshape\else%
		\if@modern\sffamily\fi\fi\itshape##1}
	\renewcommand{\subparanumstyle}[1]{%
		\subparanumcolour\if@modern\sffamily\fi\bfseries\itshape##1}
}
%% \end{noprint}

%% Les numéros de paragraphe peuvent être intégrés à la table des matières pour former un \enquote{précis}. Cette fonctionnalité pourra être utilisée pour la table des matières de certains ouvrages, mais aussi, par exemple, pendant la phase d'édition et de relecture d'un ouvrage, pour en percevoir plus clairement la structure. Elle peut être invoquée par l'option de classe |precis|. Les commandes \cs{precis}{Afficher les numéros et titres de paragraphes coulés dans la table des matières} et \cs{noprecis}{Ne pas aficher les numéros et titres de paragraphes coulés dans la table des matières} permettent également de produire le même résultat. Une commande \cs{subprecis}{Afficher les numéros et titres de sous-paragraphes coulés dans la table des matières} a été créée pour permettre l'insertion des |\subpara| dans la table des matières, mais cette fonctionnalité, dont l'usage semble restreint, n'est pas incluse par défaut dans les options de la classe.

% TODO > La fonction \subprecis (\subpara dans la ToC) est actuellement sous-développée, car sans doute peu utile

%% \begin{noprint}
%	Create macros that swirch on or off the precis conditional
% This is redundant with class option <precis>, but can prove useful sometimes.
\newcommand{\precis}{\@precistrue}
\newcommand{\subprecis}{\@subprecistrue}
\newcommand{\noprecis}{\@precisfalse\@subprecisfalse}
%% \end{noprint}

%% \begin{developer}
%% Le compteur \cnt{precis}{Numéro du paragraphe dans la subdivision courante} contient le numéro du paragraphe dans la subdivision courante.
%% \end{developer}

%%	\begin{noprint}
%	Create the <precis> counter
% Thiz counter stores information as to whether the current \para is the first in any given section of the document. This is used for table of contents styling (whether to add a new line or not)
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
%%	\end{noprint}

%% Les commandes permettant de composer les numéros de paragraphes dans la table des matières peuvent également être insérées dans un style de paragraphe. Elles sont documentées dans le chapitre sur les tables et sommaires~(\pageref{tables-of-contents}).

%% Chaque numéro de paragraphe et sous-paragraphe est automatiquement associé à un \enquote{label}, qui permettra d'y faire référence ailleurs dans le texte. La commande |\label{<label>}|, utilisée en interne, permet de créer une balise dans le texte et d'enregistrer à quel numéro de page et dans quel paragraphe elle se trouve. La commande |\ref{<label>}| permet à l'utilisateur d'imprimer le numéro de paragraphe sous lequel se trouve la balise, alors que |\pageref{<label>}| renverra au numéro de page en question~(sur ces questions, voir \todo{TODO, explication des labels}). Les labels associés aux paragraphes et sous-paragraphes ont toujours la forme |para:<titre>| ou, si aucun titre n'est donné, |para:<numéro>|~(le numéro risque alors de changer si de nouveaux paragraphes sont ajoutées). La syntaxe pour renvoyer à un numéro de paragraphe est, classiquement, la suivante:
%% \begin{enumerate}
%% \item Pour un paragraphe auquel aucun titre n'est donné~(|\para|, sans argument optionnel), on utilisera par exemple |\ref{para:12}|, s'il s'agit du paragraphe \no 12, pour imprimer ce numéro, ou |\pageref{para:12}| pour renvoyer à la page correspondante.
%% \item Pour un paragraphe auquel un titre est donné~(|\para[Le titre]|), on utilisera de la même manière |\ref{para:Le titre}| pour imprimer le numéro du paragraphe, ou |\pageref{para:Le titre}| pour renvoyer à la page à laquelle il se trouve.
%% \end{enumerate}

%% Le système fonctionne de la même manière pour les sous-paragraphes, à une différence près. Si, par exemple, après le |\para| numéro 3, un sous-paragraple est créé~(|\subpara[Le titre]|), la commande |\ref{para:Le titre}| imprimera le numéro \enquote{3-1}, qui est également celui que l'on trouvera au début de ce sous-paragraphe, qui est le premier à l'intérieur du troisème paragraphe.

%% \begin{developer}
%% Les commandes |\para| et |\subpara|, décrites plus haut, gèrent la composition des numéros et titres de (sous-)paragraphes, la création des labels correspondants, ainsi que l'insertion éventuelle dans la table des matières d'un précis, avec l'option correspondante (|precis|).
%% \end{developer}

%%	\begin{noprint}
%	Create the \para macro (continuously numbered inline paragraphs that can be printed in the ToC as a precis)
\newcommand{\para}[1][]{%
	% Increase \para and \precis counters
	\refstepcounter{para}%
	% \def\@currentlabel{\thepara}% TODO > Delete?
	\paraskip%
	% Print para number and title, define corresponding label
	{\paranumcolour\paranumstyle{\thepara\paranumsep}%
	 \if\relax#1\relax\label{para:\thepara}\else\label{para:#1}\fi}%
	\if@paraname
		\if\relax#1\relax\else%
			\if@marginalia%
				\marginpar{\paracolour\paratitlestyle{#1}}%
			\else%
				{\paracolour\paratitlestyle{#1\parasep}}%
	\fi\fi\fi%
	% Print para number and title in ToC if precis mode is enabled
	\if\relax#1\relax\else
		\refstepcounter{precis}
		\addtocontents{toc}{%
			\protect\if@precis%
				% Invoke styling macros depending on whether this is the first precis in the section (skip vertical space and format paragraph) or a subsequent paragraph (add separation)
				\ifnum\value{precis}>1\cftprecissep\else\cftbeforeprecis\fi%
				% Print precis number and title
				{\cftprecisstyle{\cftprecisnumstyle\thepara\cftprecisaftersnum}%
				#1\cftprecisnumsep\cftprecisleader\thepage\cftprecisafterpnum}%
			\protect\fi%
			% Invoke a styling macro when it is time to end the precis section of the ToC
			\protect\@ifnextchar\protect\contentsline{\protect\cftafterprecis}{}%
			}%
	\fi
	% Gobble empty paragraph skip
	\@ifnextchar\par{\@gobblepar\relax}{\relax}}
%%	\end{noprint}

%%	\begin{noprint}
%	Create the \subpara macro (continuously numbered inline sub-paragraphs that can be printed in the ToC as a precis)
\newcommand{\subpara}[1][]{%
	% Increase \subpara counter
	\refstepcounter{subpara}%
	\subparaskip%
	% Print subpara number and title, define corresponding label
	{\subparanumcolour\subparanumstyle{\thepara\subparanumdash\thesubpara\subparanumsep}%
	 \if\relax#1\relax\label{para:\thepara-\thesubpara}\else\label{para:#1}\fi}%
	\if@paraname
		\if\relax#1\relax\else%
			\if@marginalia%
				\marginpar{\subparacolour\subparastyle{#1}}%
			\else%
				{\subparacolour\subparatitlestyle{#1\subparasep}}%
	\fi\fi\fi	% Print para number and title in ToC if precis mode is enabled
	\if\relax#1\relax\else
		\refstepcounter{precis}
		\addtocontents{toc}{%
			\protect\if@subprecis%
				% Invoke styling macros depending on whether this is the first precis in the section (skip vertical space and format paragraph) or a subsequent paragraph (add separation)
				\ifnum\value{precis}>1\cftprecissep\else\cftbeforeprecis\fi%
				% Print precis number and title
				{\cftprecisstyle{%
	 				\cftprecisnumstyle\thepara%
	 				\subparanumdash\thesubpara\cftprecisaftersnum}
				#1\cftprecisnumsep\cftprecisleader\thepage\cftprecisafterpnum}%
			\protect\fi%
			% Invoke a styling macro when it is time to end the precis section of the ToC
			\protect\@ifnextchar\protect\contentsline{\protect\cftafterprecis}{}%
			}%
	\fi
	% Gobble empty paragraph skip
	\@ifnextchar\par{\@gobblepar\relax}{\relax}}
%%	\end{noprint}

%	TODO » Commande type \setcounter pour modifier le numéro de paragraphe et réserver des numéros (traités) --- au moins à documenter ici, e.g. \setpara{} ou \setparanum

% =***======***======***======***======***======***======***======***======***======***=

%	#####	TABLES OF CONTENTS	#####


%% \chapter{Sommaires et tables}\label{tables-of-contents}

% TODO » Create a minitoc for articles (and possibly also for chapters / sections)


% ===== Table of Contents Methods =====

%% Les divisions du document présentées dans le chapitre précédent doivent être intégrées aux sommaires et tables des matières que l'on insère généralement en début ou en fin d'ouvrage. \frenchlaw permet d'automatiser le processus et fournit plusieurs commandes à cet effet. Elles sont détaillées dans ce chapitre, ainsi que les différents paramètres qu'il peut être utile de modifier.

%% Les différentes commandes proposées par \frenchlaw permettent d'insérer les diverses tables que l'on trouve usuellement dans les documents, depuis la classique table des matières jusqu'au sommaire plus réduit, en passant par différents types de précis. La classe permet également d'insérer des listes de figures ou de tableaux\todo{, ainsi que~-- ce qui pourra être plus utile aux praticiens~-- des listes de pièces d'un dossier}.

%% \section{Table des matières}

%% Toutes les tables des matières et assimilés sont gérées au moyen de quelques commandes standard, invoquées à l'endroit où la table doit appraître. Pour composer ces tables, \LaTeX écrit un certain nombre d'informations dans un fichier auxiliaire lors de chaque compilation, puis compose les tables en relisant ce fichier lors de la compilation suivante. En somme, cela signifie qu'il faudra toujours \emph{compiler deux fois} le document pour que les tables apparaissent ou, si elles sont déjà présentes, se stabilisent avec les bons numéros de pages.

%% La commande la plus utile aux juristes sera indubitablement \cs{tableofcontents}{Commande permettant de composer une table des matières.} qui permet d'insécrer une table des matières:

%% \begin{macro}
	%% \tableofcontents % Référencée dans la table des matières
	%% \tableofcontents* % Non référencée dans la table des matières
%% \end{macro}

%% La seule différence entre les deux versions de la commande tient à ce que \cs{tableofcontents}{Commande permettant d'insérer une table des matières~(\LaTeX\ et classe \safeverb[\packagecolor]{memoir}).} s'auto-référence dans la table des matières, où elle sera renseignée ainsi que son numéro de page. Par contraste, \cs{tableofcontents*}{Commande permettant d'insérer une table des matières, sans référencer celle-ci~(\LaTeX\ et classe \safeverb[\packagecolor]{memoir}.} ne sera pas mentionnée dans la table~-- ce qui semble plus logique.

%% La table des matières classique peut être augmentée de deux manières. En premier lieu, l'option |precis|, évoquée précédemment, permet de renseigner les numéros et titres de paragraphes dans la table des matières. Ceux-ci ne seront pas suivis d'un numéro de page et seront, par défaut, présentés sous forme d'un paragraphe, à la manière des précis traditionnels destinés à donner ua lecteur un aperçu des thèmes abordés. Ce mode de présentation pourra être utile tant pour la composition d'ouvrages soignés que pour la correction de documents~(thèses, manuscrits)\todo{Réf. à la section corrections}.

%% Il est également possible d'insérer dans la table des matières des blocs de texte avec less options |outline| et |summary|. Ces fonctionnalités permettent de reproduire, dans la table des matières, des éléments directement issus du corps de texte, lesquels seront donc présents aux deux endroits. En choisissant bien les éléments à reproduire, il est possible de préparer un résumé structuré des diverses hypothèses et conclusions de l'ouvrage. Ces fonctionnalités sont présentées avec les autres outils de correction et de relecture de documents\todo{Réf. à la section corrections}.

%% La principale commande permettant de paramétrer la table des matières est \cs{maxtocdepth}{Commande permettant de définir le dernier niveau de subdivision à référencer dans la table des matières~(\safeverb[\packagecolor]{memoir}).}, qui permet de définir la dernière subdivision logique à afficher au sein de la table des matière. Par défaut, toutes les subdivisions sont référencées. Il est possible de modifier ce comportement en indiquant le nom d'une autre subdivision.

%% \begin{macro}
%% \maxtocdepth{<subdivision>}% Par défaut: subparagraph
%% \end{macro}

%% \begin{noprint}
%	Define max ToC numbering
% TODO > Change wheen new subdivision levels are added
\maxtocdepth{subparagraph}
%% \end{noprint}

%% \begin{developer}
%% Les titres et sous-titres~(|\heading| et |\subheading|) se situent au même niveau que les parties~(|\part|) dans la table des matières, soit au niveau |-1|, en raison du volume de code de la classe |memoir| qu'il faudrait modifier pour parvenir à un résultat plus satisfaisant pour l'esprit~(\latin{supra}, p.~\pageref{tab:Sectionning}). Cela ne semble pas avooir d'incidence déterminante, puisque l'on imagine mal une table tronquée avant ce niveau.
%% \end{developer}

%% \section{Sommaire}

%% En plus de la table des matières classique, \frenchlaw permet de composer un sommaire, plus court, qui ne descend pas au-delà du chapitre. De tels sommaires sont notamment utlisés dans les pages liminaires des thèses et manuels. Il est d'usage que les sommaires ne comportent pas de numéros de pages. La commande \cs{shortcontents}{Commande permettant de composer un sommaire.} s'utilise exactement comme la précédente, avec une version ordinaire (référencée dans la table des matières) et une version étoilée (non référencée).

%% \begin{macro}
	%% \shortcontents
	%% \shortcontents*
%% \end{macro}

%% La commande admet un argument optionnel permettant de choisir le dernier niveau de subdivision à inclure dans le sommaire. Cet argument prend la forme d'un chiffre (aussi appelé |\tocdepth|) correspondant au \enquote{degré} de subdivision. Les chapitres sont associés à une valeur de |1|. Pour chaque niveau de subdivision inférieure au chapitre, ce chiffre est augmenté, de sorte que les sections sont de rang |2|, etc. En sens inverse, les subdivisions supérieures au chapitres utilisent |0| (parties, titres et sous-titres) ou |-1| (livres). On pourra ainsi utiliser |\shortcontents[2]| pour include les titres des sections dans le sommaire.

%% \begin{noprint}
%	Create a command for short table of content, allowing for a starred version
% TODO » On both macros, add new subdivision levels when implemented
\newcommand{\shortcontents}{\@ifstar{\s@shortcontents}{\@shortcontents}}

%	Define two versions of \shortcontents (starred or not)
% The macro takes an optional argument allowing the user to choose a \tocdepth
% Both macros point to \@@shortcontents, feeding different arguments into it
\newcommand{\s@shortcontents}[1][0]{%
	\@@shortcontents[#1]{\tableofcontents*}
}
\newcommand{\@shortcontents}[1][0]{%
	\@@shortcontents[#1]{\tableofcontents}
}

%	Create the generic \@@shortcontents macro
\newcommand{\@@shortcontents}[2][]{
	\bgroup
		% Reset all necessary commands and remove page numbers
		\let\contentsname=\shortcontentsname
		\cftpagenumbersoff{heading}
		\cftpagenumbersoff{subheading}
		\cftpagenumbersoff{chapter}
		\cftpagenumbersoff{section}
		\cftpagenumbersoff{subsection}
		\cftpagenumbersoff{subsubsection}
		\cftpagenumbersoff{paragraph}
		\cftpagenumbersoff{subparagraph}
		% Reset precis and other additional contents
		% TODO > Add outline and summary
		\@precisfalse
		\let\cftafterprecis=\relax
		\let\cftbeforeprecis=\relax
		% Save tocdepth value
		\newcounter{save@tocdepth}
		\setcounter{save@tocdepth}{\value{tocdepth}}
		\setcounter{tocdepth}{#1}
		% Print the table of contents and restore tocdepth
		#2
		\setcounter{tocdepth}{\value{save@tocdepth}}
		\clearpage
	\egroup}
%% \end{noprint}

%% \begin{developer}
%% La commmande |\shortcontents| enregistre la valeur actuelle de |\tocdepth|, la modifie pour composer une table à l'aide de la commande |\tableofcontents|, puis restaure |\tocdepth|. Il n'est donc pas possible en l'état d'utiliser des styles différents pour le sommaire et la table des matières; au demeurant, cela ne semblerait as judicieux.
%% \end{developer}

%% \section{Tableaux et illustrations}

%% Moins utiles pour les juristes, diverses tables peuvent être créées pour référencer les tableaux et illustrations présents dans le document. Les deux fonctionnalités classiques sont \cs{listoftables}{Commande permettant de composer une liste des tableaux.} et \cs{listoffigures}{Commande permettant de composer une liste des illustrations (figures).}. Ces commendes produisent des tables pour tous les tableaux insérés dans un environnement \env{table}{Environnement destiné à accueillir des tableaux.}, et tous les illustrations ou autres supports non-textuels placés dans un environnement \env{figure}{Environnement destiné à accueillir des figures ou éléments non-textuels.}. La classe |memoir| permet également de créer de nouvelles listes associées à d'autres environnements. Sur tous ces éléments relativement moins utilisés par les juristes, nous renvoyons le lecteur à la documentation de la classe |memoir|.


% ===== Table of Contents Styling =====

%% \section{Apparence des tables et sommaires}

%% L'apparence de la table des matières est configurée en utilisant les outils fournis par la classe |memoir|. Celle-ci explique en détail comment modifier tous les éléments de la table des matières, depuis l'affichage des intitulés jusqu'à la numérotation des pages ou les lignes de points qui en facilitent la lecture, et même les espacements horizontaux et verticaux entre différents éléments. Ces éléments de configuration ne seront pas détaillés ici, et chacun pourra en modifier l'apparence des différentes subdivisions en utilisant la documentation de cette classe.

%% \begin{noprint}
%	Define ToC style for \book
\renewcommand*{\cftbookpresnum}{\space}
\renewcommand*{\cftbookaftersnum}{.}
\renewcommand*{\cftbookaftersnumb}{\space}
\renewcommand*{\cftbookfont}{\if@modern\sffamily\fi\Large\scshape\hfil}
\renewcommand*{\cftbookpagefont}{\normalsize}
\setlength{\cftbeforebookskip}{2\baselineskip}
%% \end{noprint}

%% \begin{noprint}
%	Define ToC style for \part
%	TODO » Voir pour afficher "Première partie" en Toc aussi (babel?)
\renewcommand*{\cftpartpresnum}{\space}
\renewcommand*{\cftpartaftersnum}{.}
\renewcommand*{\cftpartaftersnumb}{\space}
\renewcommand*{\cftpartfont}{\if@modern\sffamily\fi\large\scshape\hfil}
\renewcommand*{\cftpartpagefont}{\normalsize}
\setlength{\cftbeforepartskip}{\baselineskip}
%% \end{noprint}

%% \begin{developer}
%% On notera l'ajout par \frenchlaw de commandes permettant de modifier l'apparence des titres (|\heading) et sous-titres~(|\subheading|), qui obéissent aux mêmes règles de nommage que celles issues de la classe |memoir|, à savoir la longue série des |\cft...|.
%% \end{developer}

%% \begin{noprint}
%	Define ToC style for \heading
\renewcommand{\cftheadingaftersnum}{.}
\renewcommand{\cftheadingaftersnumb}{\mdseries}
\renewcommand{\cftheadingfont}{\if@modern\sffamily\fi\large\bfseries}
\renewcommand{\cftheadingleader}{\hfill}
\setlength{\cftbeforeheadingskip}{\baselineskip}
%% \end{noprint}

%% \begin{noprint}
%	Define ToC style for \subheading
\renewcommand{\cftsubheadingaftersnum}{.}
\renewcommand{\cftsubheadingaftersnumb}{\mdseries}
\renewcommand{\cftsubheadingfont}{\if@modern\sffamily\fi\bfseries}
\renewcommand{\cftsubheadingleader}{\hfill}
\setlength{\cftbeforesubheadingskip}{\baselineskip}
%% \end{noprint}

%% Le choix a été fait, pour des raisons esthériques, de faire précéder les chapitres d'un espace vertical correspondant à la moitié de l'interligne utilisé dans la table des matières~(aucun espace n'est rajouté dans les sommaires). Ce choix a pour conséquence de rompre l'alignement vertical de la page pour un chapitre sur deux. ce comportement peut être modifié en redéfinissant la longueur |\cftbeforechapterskip|\label{grid:cftbeforechapterskip}.

%% \begin{noprint}
%	Define ToC style for \chapter
\renewcommand*{\cftchapteraftersnum}{.}
\renewcommand*{\cftchapteraftersnumb}{\mdseries}
\renewcommand{\cftchapterfont}{\if@modern\sffamily\fi\bfseries}
\renewcommand*{\cftchapterpagefont}{\normalsize}
\setlength{\cftbeforechapterskip}{\ifnum\value{tocdepth}=0\relax\baselineskip\else.5\baselineskip\fi}
%% \end{noprint}

%% \begin{noprint}
%	Define ToC style for \section
\renewcommand*{\cftsectionaftersnum}{.}
\renewcommand*{\cftsectionaftersnumb}{\mdseries}
\renewcommand*{\cftsectionfont}{\if@modern\sffamily\fi\bfseries}
\setlength{\cftbeforesectionskip}{\z@}
%% \end{noprint}

%% \begin{noprint}
%	Define ToC style for \subsection
\renewcommand*{\cftsubsectionaftersnum}{.}
\renewcommand*{\cftsubsectionaftersnumb}{\mdseries}
\renewcommand*{\cftsubsectionfont}{\footnotesize\if@modern\sffamily\fi\bfseries}
\setlength{\cftbeforesubsectionskip}{\z@}
%% \end{noprint}

%% \begin{noprint}
%	Define ToC style for \subsubsection
\renewcommand*{\cftsubsubsectionaftersnum}{.}
\renewcommand*{\cftsubsubsectionaftersnumb}{\mdseries}
\renewcommand*{\cftsubsubsectionfont}{\footnotesize\if@modern\sffamily\fi\bfseries}
\setlength{\cftbeforesubsubsectionskip}{\z@}
%% \end{noprint}

%% \begin{noprint}
%	Define ToC style for \paragraph
\renewcommand*{\cftparagraphaftersnum}{.}
\renewcommand*{\cftparagraphaftersnumb}{\mdseries}
\renewcommand*{\cftparagraphfont}{\footnotesize\if@modern\sffamily\fi\bfseries}
\setlength{\cftbeforeparagraphskip}{\z@}
%% \end{noprint}

%% \begin{noprint}
%	Define ToC style for \subparagraph
\renewcommand*{\cftsubparagraphaftersnum}{.}
\renewcommand*{\cftsubparagraphaftersnumb}{\mdseries}
\renewcommand*{\cftsubparagraphfont}{\footnotesize\if@modern\sffamily\fi\bfseries}
\setlength{\cftbeforesubparagraphskip}{\z@}
%% \end{noprint}

%% \frenchlaw crée de nouvelles commandes pour configurer la présentation des précis dans la table des matières. Pour mémoire, il est possible de composer les numéros et titres des paragraphes directement dans la table des matières\todo{Réf. section sur les para}, dont il s'agit ici de paramétrer l'apparence au moyen de styles prédéfinis. La commande \cs{makeprecisstyle}{Commande permettant de créer un nouveau style pour les précis composés dans la table des matières.} permet de définir un nouveau style de précis.

%%	\begin{noprint}
%	Create the commands that define and apply precis styles
\newcommand{\makeprecisstyle}[2]{\expandafter\gdef\csname @precisstyle@#1\endcsname{#2}}
\newcommand{\precisstyle}[1]{\csname @precisstyle@#1\endcsname}
%%	\end{noprint}

%% Pour définir et sélectionner un nouveau style de numéros, il suffit de redéfinir, à l'intérieur de |\makeparastyle|, tout les paramètres que l'on souhaite modifier parmi la liste suivante:

%% \begin{macro}
%% \makeprecisstyle{<nom du style>}{ % Création du style
%%   % Style général du précis (taille du texte, variante de police, etc.)
%%   \newcommand{\cftprecisstyle}{<...>}
%%   % Style des numéros de paragraphes (s'ajoute au précédent)
%%   \newcommand{\cftprecisnumstyle}{<...>}
%%   % Séparateur après les numéros de paragraphes
%%   \newcommand{\cftprecisaftersnum}{<...>}
%%   % Séparateur entre le titre et le numéro de page
%%   \newcommand{\cftprecisnumsep}{,~}
%%   % Texte placé avant le numéro de page (ex: p.)
%%   \newcommand{\cftprecisleader}{}
%%   % Ponctuation éventuelle après le numéro de page
%%   \newcommand{\cftprecisafterpnum}{.}
%%   % Séparateur inséré entre deux numéros
%%   \newcommand{\cftprecissep}{~--- }
%% }
%% \end{macro}

%%	\begin{noprint}
%	Create macros used for styling the precis (\para and \subpara) in ToC
\newcommand{\cftprecisstyle}{}
\newcommand{\cftprecisnumstyle}{}
\newcommand{\cftprecisaftersnum}{}
\newcommand{\cftprecisnumsep}{}
\newcommand{\cftprecisleader}{}
\newcommand{\cftprecisafterpnum}{}
\newcommand{\cftprecissep}{ }
%%	\end{noprint}

% TODO > Documenter / Indexer chacune des commandes ci-dessus

%%	\begin{developer}
%%	Les macros \cs{cftbeforeprecis}{Macro permettant de façonner horizontalement et verticalement les précis dans la table des matières. Toujours employée en conjonction avec |cftafterprecis|.} et \cs{cftafterprecis}{Macro permettant de façonner horizontalement et verticalement les précis dans la table des matières. Toujours employée en conjonction avec |cftbeforeprecis|.} permettent de transformer les différentes entrées du précis en un bloc de texte unique dans chaque section de la table des matières. Ces macros, qui doivent être utilisées et modifiées ensemble (utilisation d'un environnement), déterminent l'espacement vertical avant et après le précis, ainsi que son positionnement horizontal sur la ligne.
%%	\end{developer}

%%	\begin{noprint}
%	Separate the precis from surrounding ToC elements
% The two following macros insert vertical space before and after the precis bloc, as well as create a minipage the size and position of which match the textblock used in ToC.
% With respect to implementation, see the code in \para and \subpara. Essentially, both macros are (\protect)-invoked when inputing the precis data in the ToC. The first one works by testing whether this is the first precis item in the current section (using a simple <precis> counter), while the second one is triggered when the next ToC item is a proper sectionning unit, which always starts with \contentsline (this is tested using \@ifnextchar).
\newcommand{\cftbeforeprecis}{%
	\vskip.5\baselineskip\par%
	\noindent\hspace{\dimexpr\toclabelwidth+\tocnumwidth}%
	\begin{minipage*}{\dimexpr\textwidth-\toclabelwidth-\tocnumwidth-\@pnumwidth}}
\newcommand{\cftafterprecis}{%
	\end{minipage*}%
	\vskip.5\baselineskip\par}
%%	\end{noprint}

%% \frenchlaw crée un style |default|, appliqué automatiquement, qui présente le précis comme un bloc de texte en italiques dans la table des matières. Un style spécial est également créé et appliqué automatiquement avec l'option |draft|, qui place chaque numéro sur une ligne distincte pour faciliter la relecture et l'identification de titres répétitifs, fautifs ou peu clairs. 

%%	\begin{noprint}
\makeprecisstyle{default}{
	\renewcommand{\cftprecisstyle}{\footnotesize\itshape}
	\renewcommand{\cftprecisnumstyle}{}
	\renewcommand{\cftprecisaftersnum}{.\space}
	\renewcommand{\cftprecisnumsep}{,~}
	\renewcommand{\cftprecisleader}{\normalfont p.~}
	\renewcommand{\cftprecisafterpnum}{.}
	\renewcommand{\cftprecissep}{~--- }	
}
\precisstyle{default}

\makeprecisstyle{draft}{
	\renewcommand{\cftprecisstyle}{\small}
	\renewcommand{\cftprecisnumstyle}{\bfseries}
	\renewcommand{\cftprecisaftersnum}{.\enskip}
	% Do NOT remove or comment extra line below. Explicit \par does NOT work
	\renewcommand{\cftprecissep}{

	}
}
\if@draft\precisstyle{draft}\fi
%%	\end{noprint}

%% La classe opère, enfin, quelques choix par défaut, comme celui de ne pas composer les numéros de page des livres et des parties dans la table des matières, ce qui permet notamment de centrer les titres sur la page. Ce paramétrage est documenté dans la classe |memoir|.

%% \begin{noprint}
%	Configure ToC dotted lines
\renewcommand*{\cftdotsep}{2}
% Do not print page numbers or dots in ToC for <book> and <part>, which are centered
\cftpagenumbersoff{book}
\cftpagenumbersoff{part}
%% \end{noprint}

%% Les tables des matières sont, enfin, configurées pour se comporter comme des chapitres dans les monographies, et comme des sections dans les articles. Dans un ouvrage, la table commencera ainsi sur une nouvelle page.

%% \begin{noprint}
%	Ensure ToC starts on a new page (like a chapter) for books
\if@article\else
	\pretocmd{\tableofcontents}
		{\clearforchapter}
		{}{\@latex@warning@no@line{Failed to patch \noexpand\tableofcontents.}}
\fi
%% \end{noprint}


% ===== Table of Contents Horizontal Spacing =====

%% L'apparence globale de la table des matières peut être modifiée en utilisant des styles. La commande \cs{makeptoctyle}{Commande permettant de créer un nouveau style pour les tables des matières et sommaires.} permet de définir un nouveau style de pour les tables et sommaires, alors que la commande \cs{tocstyle}{Commande permettant de sélectionner un style pour les tables des matières et sommaires.}

%% \begin{noprint}
%	Create the commands that define and apply ToC styles
\newcommand{\maketocstyle}[2]{\expandafter\gdef\csname @tocstyle@#1\endcsname{#2}}
\newcommand{\tocstyle}[1]{\csname @tocstyle@#1\endcsname}
%%	\end{noprint}

%% Un nouveau style de tables et sommaires peut être défini à l'intérieur de |\maketocstyle|, puis sélectionné avec |\tocstyle|.

%% \begin{macro}
%% % Définition du style:
%% \maketocstyle{<nom du style>}{ % Création du style
%%  ...
%% }
%% \end{macro}
%% % Application du style:
%% \tocstyle{<nom du style>}

%% \begin{developer}
%% Pour paramétrer l'apparence de chaque ligne de la table des matières, et particulièrement l'espacement horizontal entre le numéro de section et le titre de celle-ci, \frenchlaw crée plusieurs nouvelles longueurs susceptibles d'être utilisées dans les styles:
%% \begin{itemize}
%% 	\item\dim{toclabelwidth}{Dimension de l'étiquette des noms de chapitres, sections, etc. dans la table des matières.} détermine la longueur de l'étiquette précédant le numéro de subdivision, qui est précisément déterminée par la longueur du mot \enquote{Chapitre}, pour permettre ensuite l'alignement des numéros et des intitulés des différentes subdivisions;
%% 	\item\dim{tocnumwidth}{Dimension de la boîte contenant le numéro (ou autre) de la subdivision dans la table des matières.} détermine la longueur de la boîte contenant le numéro de subdivision, qui est fixée au chiffre romain XX pour l'option |article| et XXX pour les monographies;
%% 	\item\dim{toccenterwidth}{Dimension du retrait à ajouter aux éléments de la table des matières qui sont centrés.} détermine le retrait à ajouter aux éléments de la table des matière qui seront centrés: cette dimension correspond à la somme des deux précédentes.
%% \end{itemize}
%% \end{developer}

%% \begin{noprint}
%	Set ToC label to the width of 'chapter' label, which is the longest
% TODO > Ne marche pas sur les \fakechapter avec des sections en-dessous
\newlength{\toclabelwidth}
	\settowidth{\toclabelwidth}{\cftchapterfont\chaptername\space}
%	Set ToC number to the width of roman numeral 20 or 30 (reasonable longest)
% Redéfinir pour Modern
\newlength{\tocnumwidth}
\if@article
	\settowidth{\tocnumwidth}{\cftsectionfont XX\space}
\else
	\settowidth{\tocnumwidth}{\cftchapterfont XXX\space}
\fi
% Centered headings will take into account the label + number lengths
\newlength{\toccenterwidth}
	\setlength{\toccenterwidth}{\tocnumwidth}
	\addtolength{\toccenterwidth}{\toclabelwidth}
%% \end{noprint}

% TODO:
% - Utiliser \maketocstyle + \tocstyle pour créer des styles, donc peut-être un aligné basique + ajouter des couleurs dans le style moderne (supra) ?

%% \begin{noprint}
\maketocstyle{frenchlaw}{
	%	Set up ToC components indentation using the previously defined lengths
	\cftsetindents{book}{\toccenterwidth}{\tocnumwidth}
	\cftsetindents{part}{\toccenterwidth}{\tocnumwidth}
	\cftsetindents{heading}{\z@}{\tocnumwidth}
	\cftsetindents{subheading}{\z@}{\tocnumwidth}
	\cftsetindents{chapter}{\z@}{\tocnumwidth}
	\cftsetindents{section}{\z@}{\tocnumwidth}
	\cftsetindents{subsection}{%
		\if@article\tocnumwidth\else\z@\fi}{\tocnumwidth}
	\cftsetindents{subsubsection}{%
		\if@article 2\tocnumwidth\else\toclabelwidth\fi}{\tocnumwidth}
	\cftsetindents{paragraph}{%
		\if@article 3\tocnumwidth\else\dimexpr\toclabelwidth+\tocnumwidth\relax\fi}
		{\if@article\tocnumwidth\else.5\tocnumwidth\fi}
	\cftsetindents{subparagraph}{%
		\if@article 4\tocnumwidth\else\dimexpr\toclabelwidth+1.5\tocnumwidth\relax\fi}
		{\if@article\tocnumwidth\else.5\tocnumwidth\fi}
}
\tocstyle{frenchlaw}
%% \end{noprint}

%% \begin{developer}
%% La commande \cs{toclabelbox}{Commande permettant de créer une boîte dont la largeur est égale à \safeverb{toclabelwidth}, pour composer les étiquettes des subdivisions principales dans la table des matières.} permet de placer les étiquettes des subdivisions principales~(les mots \emph{Chapitre}, \emph{Section}, \emph{§}, etc.) dans une boîte insérée juste à gauche du numéro de la subdivision. Cette commande est utilisée dans le fichier \todo{nom définitif du fichier babel + typo}. Elle permet essentiellement d'aligner tous les numéros, peu important la dénomination~(ou non) de la subdivision.
%% \end{developer}

%% \begin{noprint}
%	Create a command that formats ToC labels into a box
% Thos macro is used when defining babel language strings for ToC names
\newcommand{\toclabelbox}[1]{\makebox[\toclabelwidth]{\hfill\llap{#1\normalsize\space}}}
%% \end{noprint}


% ===== Table of Contents Vertical Spacing =====

%% \begin{developer}
%% Quelques autres mécanismes mis en œuvre dans les tables des matières ne paraissent pas mériter de documentation approfondie, mais sont détaillés dans le code de la classe. Ils sont utilisés pour ajuster l'espace vertical au sein des tables des matières et tables des figures, en particulier pour la première et la dernière entrées de la table.
%% \end{developer}

%% \begin{noprint}
%	Correct annoying memoir bug: add proper \addvspace before chapters (and heading) content lines, so the first ToC entry does not drop one or two lines below the start of normal chapters
% TODO > Add messages (success / failure), last two args
\patchcmd{\l@chapapp}
	{\vskip \cftbeforechapterskip}
	{\addvspace{\cftbeforechapterskip}}
	{}{\@latex@warning@no@line{Failed to patch \noexpand\l@chapapp.}}
\patchcmd{\l@heading}
	{\vskip \@nameuse {cftbeforeheadingskip}}
	{\addvspace{\cftbeforeheadingskip}}
	{}{\@latex@warning@no@line{Failed to patch \noexpand\l@heading.}}
\patchcmd{\l@subheading}
	{\vskip \@nameuse {cftbeforesubheadingskip}}
	{\addvspace{\cftbeforeheadingskip}}
	{}{\@latex@warning@no@line{Failed to patch \noexpand\l@subheading.}}
% \patchcmd{\newlistentry}
%	{\vskip \@nameuse{cftbefore#2skip}}
%	{\addvspace{\@nameuse{cftbefore#2skip}}}
%	{}{\@latex@warning@no@line{Failed to patch \newlistentry.}
%% \end{noprint}

%% \begin{noprint}
%	Ensure that the ToC ends the paragraph properly
% Solves a bug that happens sometimes
\AtEndDocument{%
	\addtocontents{toc}{\par}%
	\addtocontents{lot}{\par}%
	\addtocontents{lof}{\par}}
%% \end{noprint}

% Récupérer outline / summary et les intégrer dans les méthodes ToC supra + dans les styles de précis, e.g. italiques ou autres


% =***======***======***======***======***======***======***======***======***======***=

%	#####	PAGE NOTES	#####

%% \chapter{Annotations et appareil critique}

%	===== Footnotes =====

%% \section{Notes de bas de page}

%	TODO » Utiliser une autre police (Concourse) ou une graisse légèrement plus épaisse (Concourse 4) pour différencier du coprs du texte en style moderne (?)

% Footnotes en deux colonnes à tester (memoir?)
% Documenter la créatino de notes hang ou indentées (ou créer une macro qui le configure automatiquement)
% Option {perpage} par défaut (mais conserver une option de numérotation continue)

% Cf. autres TODO dans le fichier

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

% TODO » Documenter les jeux de notes multiples
% TODO > Configurer les notes de fin de texte:
% \renewcommand{\prenoteinnotes}{\par\noindent\hangindent\dimexpr2ex\relax}
% \renewcommand{\notenuminnotes}[1]{\normalfont #1.\space}
% --- ùais utiliser plutôt une largeux fixe pour la boîte contenant le numéro de note


%	===== Margin Notes =====

%% \section{Annotations marginales}

%	Set margin notes width based on the actual margin width
\newlength{\marginwidth}
\setlength{\marginwidth}{\dimexpr\stockwidth-\textwidth\relax}
\if@marginalia
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


% ===== General List Spacing =====

% TODO » Commenter la commande memoir \tightlistss avec modern (mais vérifier l'alignement sur la grille)
%	Set all vertical space to mutliples of \baselineskip
% \setlength{\parskip}{\z@}%	TODO » Delete (doublon du normal)
% Some package redefines list environments \AtBeginDocument, so this needs to be overriden
\AtBeginDocument{
	\setlength{\partopsep}{\z@}
	\setlength{\parsep}{\z@}
	\setlength{\parsepi}{\z@}% TODO > Augmenter manuellement pour les descriptions
	\setlength{\parsepii}{\z@}
	\setlength{\topsep}{\z@}
	\setlength{\topsepi}{\z@}
	\setlength{\topsepii}{\z@}
	\setlength{\topsepiii}{\z@}
	\setlength{\itemindent}{\z@}
	\setlength{\itemsepi}{\z@}
	\setlength{\itemsepii}{\z@}
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
}


% ===== Quotations =====

%% \chapter{Citations}

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


% ===== Epigraphs =====

%% \chapter{Épigraphes \& dédicaces}

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
	\parskip=\z@
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


% ===== Lists =====

%% \chapter{Listes et énumérations}

%	Define <enumerate> style
\renewcommand{\labelenumii}{\itshape\theenumii)}
\renewcommand{\labelenumiii}{\textit{\theenumiii}.}
\renewcommand{\theenumiv}{\@greek\c@enumiv}

%	Define <description> style
\newcommand{\descriptionlabelstyle}{\if@modern\sffamily\bfseries\else\scshape\fi}
\newcommand{\descriptionlabelpunct}{:\enspace}
\newlength{\descriptionlabelwidth}
% TODO » Documentation: For fixed-width labels, could use:
%	\newcommand{\descriptionlabelpunct}{.\hfill}
%	\setlength{\descriptionlabelwidth}{.2\linewidth}
	\setlength{\descriptionlabelwidth}{\z@}
\renewcommand{\descriptionlabel}[1]{{%
	\hspace\labelsep\descriptionlabelstyle{#1\descriptionlabelpunct}}}
\renewcommand{\blockdescriptionlabel}[1]{{%
	\hspace\labelsep\descriptionlabelstyle{#1\descriptionlabelpunct}}}

%	Renew <description> environment
\renewenvironment{description}
	{\addvspace{\baselineskip}
	 \list{}{\let\makelabel\descriptionlabel
			 \setlength{\labelwidth}{\descriptionlabelwidth}
			 \setlength{\leftmargin}{\descriptionlabelwidth}}}
	{\endlist%
	 \addvspace{\baselineskip}}

%	Renew <blockdescription> environment
\renewcommand{\descriptionlabelpunct}{:\enspace}
% TODO » Documentation: For fixed-width labels, could use:
%	\newcommand{\descriptionlabelpunct}{.\hfill}
%	\setlength{\descriptionlabelwidth}{.2\linewidth}
	\setlength{\descriptionlabelwidth}{1em}
\renewenvironment{blockdescription}%
	{\addvspace{\baselineskip}
	 \list{}{\let\makelabel\blockdescriptionlabel
	 		 \setlength{\parsep}{\baselineskip}
			 \setlength{\labelwidth}{\descriptionlabelwidth}
			 \setlength{\leftmargin}{\descriptionlabelwidth}}}%
	{\endlist%
	 \addvspace{\baselineskip}}


% =***======***======***======***======***======***======***======***======***======***=


%	#####	BOXES & MINIPAGES	#####

%	MINIPAGES

% TODO » Remplacer la redéfinition littérale de \parfillskip par une macro \old@parfillskip définie au début de l'environnement (nécessité de la ligne??)

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
% TODO > Options classic et modern (serif ou non), cf. les options de classe
% + Diversifier les options (dont traité, avec un \makeshowcasestyle{<name>} + \setshowcasestyle{<name>} pour les sélecitonner, cf. traité + actuel --- et charger automatiquement avec le parastyle textbook (option dédiée, \AtBeginDocument / AtEndClass si besoin)
% Système de styles
\newcommand{\showcasetitle}[1]{{#1:}\par}
\newcommand{\showcasetitlestyle}{\bfseries}
\newcommand{\showcasestyle}{\sffamily}
\newcommand{\framerulecolor}{gray}

%	Environment for a box with vertical line along the left side
%	TODO » Refaire en permettant les paragraphes (?)
% 	TODO > Si parskip, ne pas ajouter d'espace avant / après
\newsavebox{\fmbox}
\newenvironment{showcase}[1][]
	{\par\addvspace{\baselineskip}%
	 \noindent\begin{lrbox}{\fmbox}%
	 \begin{minipage}[t]{\dimexpr\linewidth-1.5em\relax}%
	 \showcasestyle%
	 \if\relax#1\relax\else{\showcasetitlestyle\showcasetitle{#1}}\fi}
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

% TODO > Reprendre le package grid.sty et voir ce qu'on peut faire pour mesurer les figures…
% Idem pour {gridset} et {returntogrid}, qui permettent apparemment d'ajouter un skip jusqu'à la prochaine ligne

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

\newenvironment{legacy-tabular}[2][t]
	{\noindent\old@tabular[#1]{#2}}
	{\old@endtabular}

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

%	LANGUAGE COMMANDS
%	Create quick macros for switching languages
\newcommand{\british}[1]{\foreignlanguage{british}{\emph{#1}}}
\newcommand{\english}[1]{\foreignlanguage{english}{\emph{#1}}}
\newcommand{\french}[1]{\foreignlanguage{french}{\emph{#1}}}

\newcommand{\greek}[1]{\foreignlanguage{greek}{#1}}
\newcommand{\latin}[1]{\foreignlanguage{latin}{\emph{#1}}}
% ++ fichier llb et autres pour le latin sous biblatex afin d'éviter les erreurs (?)

% Universaliser (?)
\newcommand{\german}[1]{\foreignlanguage{german}{\emph{#1}}}
\newcommand{\italian}[1]{\foreignlanguage{italian}{\emph{#1}}}
\newcommand{\spanish}[1]{\foreignlanguage{spanish}{\emph{#1}}}

%	Fleuron pour séparer les sections + harmoniser avec celui utilisé pour la doc
% TODO > Baser sur la longueur de parskip > 0, pas sur @modern
\newcommand{\sectionbreak}[1][\adfast{3}\quad\adfast{3}\quad\adfast{3}]{%
	\needspace{\baselineskip}
	\if@modern\else\addvspace{\baselineskip}\fi
	{\noindent\centering#1\par}%
	 \if@modern\else\addvspace{\baselineskip}\fi}
\newcommand{\chapterbreak}[1][\adforn{21}\quad\adfast{3}\quad\adforn{49}]{%
	\needspace{\baselineskip}
	\if@modern\else\addvspace{\baselineskip}\fi
	{\noindent\centering#1\par}%
	\if@modern\else\addvspace{\baselineskip}\fi}
\newcommand{\frenchlawfleuron}{\adforn{25}\,\adforn{63}~\adforn{53}}


% =***======***======***======***======***======***======***======***======***======***=

%	#####	TITLE PAGES	#####

% TOSO > Déplacer avant les divisions hiérarchiques, pour mettre le code / la doc dans le même ordre que le document
% Ajouter un style pour les demandes de financements / AAP, très resséré ± singlespaced

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
% TODO > Utiliser ces conditionnels + \ifmaterials \ifquestions, cf. le cours de droit comparé des biens (reprendre et nettoyer dans ce fichier là)
\newif\iflecture\lecturefalse
\newif\ifseminar\seminarfalse
\newif\iftutorial\tutorialfalse
\newcommand{\lecture}{\lecturetrue}
\newcommand{\seminar}{\seminartrue}
\newcommand{\tutorial}{\tutorialtrue}
%	Affiliation Info
\newcommand{\institution}[1]{\gdef\@institution{#1}}
	\newcommand{\@institution}{\@empty}
\newcommand{\school}[1]{\gdef\@school{#1}}
	\newcommand{\@school}{\@empty}
\newcommand{\laboratory}[1]{\gdef\@laboratory{#1}}
	\newcommand{\@laboratory}{\@empty}
%	TODO » Revoir
%	Utilisé pour les lettres
%	Permettre d'insérer plusieurs logos, e.g. en haut de page (commande incrémentale + définir la taille et utiliser des \hfill pour les placer)
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
\newcommand{\foreword}[1]{\gdef\@foreword{#1}}
	\newcommand{\@foreword}{\@empty}
%	Publication Info
\newcommand{\publisher}[1]{\gdef\@publisher{#1}}
	\newcommand{\@publisher}{\@empty}
\newcommand{\series}[1]{\gdef\@series{#1}}
	\newcommand{\@series}{\@empty}
% TODO > Colophon à ajouter dans les différents maketitle
\newcommand{\colophon}[1]{\gdef\@colophon{#1}}
	\newcommand{\@colophon}{\@empty}
\newcommand{\printcolophon}{%
	\if\@empty\@colophon\relax\else
		\bgroup\parindent=\z@\@colophon\egroup\fi}
%	Licensing Info
\newcommand{\licensing}[1]{\long\gdef\@licensing{#1}}
	\newcommand{\@licensing}{\@empty}
\newcommand{\printcopyright}{%
	\if\@empty\@licensing\relax\else
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
\newcommand{\invoiceno}[1]{\gdef\@invoiceno{#1}}
	\newcommand{\@invoiceno}{\@empty}
\newcommand{\duedate}[1]{\gdef\@duedate{#1}}
	\newcommand{\@duedate}{\@empty}
\newcommand{\registrationno}[1]{\gdef\@registrationno{#1}}
	\newcommand{\@registrationno}{\@empty}
\newcommand{\paymentdate}[1]{\gdef\@paymentdate{#1}}
	\newcommand{\@paymentdate}{\@empty}
\newcommand{\paymenttype}[1]{\gdef\@paymenttype{#1}}
	\newcommand{\@paymenttype}{\@empty}
\newcommand{\paymentref}[1]{\gdef\@paymentref{#1}}
	\newcommand{\@paymentref}{\@empty}
% Developer Data
\newcommand{\package}[1]{\gdef\@package{#1}}
	\newcommand{\@package}{\@empty}
\newcommand{\version}[1]{\gdef\@version{v#1}}
	\newcommand{\@version}{\@empty}
\newcommand{\ctan}[1]{\gdef\@ctan{#1}}
	\newcommand{\@ctan}{\@empty}
\newcommand{\repository}[1]{\gdef\@repository{#1}}
	\newcommand{\@repository}{\@empty}
\newcommand{\maintainer}[1]{\gdef\@maintainer{#1}}
	\newcommand{\@maintainer}{\@author}

%	TODO » Ajouter un mailto: crypté en UTF-8 (\@ifstar ?), mais uniquement si on crypte l'adresse
% => Revoir le codage choisi ( [at] et [dot] ?) + essayer d'utiliser l'un des packages d'accessibilité pour rendre la chaîne de caractères non cherchable dans le PDF (ce qui supprime théoriquement la nécessité du cryptage visible) -- auquel cas, utiliser ce système directement dans \email
% => Pour crypter le code source aussi (si diffusé), utiliser une macro avec 2-3 arguments pour les différents éléments de l'adresse (optionnel)
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

\newcommand{\makepaidsignature}{
	\hfill%
	\begin{minipage}[t]{.4\textwidth}
	\centering%
	\if\@empty\@signature\else
		\raisebox{-2\baselineskip}[\z@][\z@]{%
			\includegraphics[width=\textwidth,height=4\baselineskip,keepaspectratio]{\@signature}}\\
	\fi
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

% TODO » Tout reprendre en ajoutant toutes les métadonnées possibles + utiliser des opérateurs conditionnels plutôt que de multiplier les pages de titre différentes (e.g. Article, Didactic, etc.)

%	Define a default style (esp. for long documents)
% TODO > Adde publisher logo / name \publisher[logo]{name}
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
	%	{\large\scshape\@institution\par}% TODO » Remplacer par la collection (et \ifnum, cf. infra, pour laisser une page de faux-titre)
		{\itshape\@series\par}
		\vspace*{7\baselineskip}
		{\LARGE\scshape\csname @title@\languagename\endcsname\par}
		{\Large\scshape\csname @subtitle@\languagename\endcsname\par}
		\vspace{4\baselineskip}
		{\Large\@author\par}
		\vspace{2\baselineskip}
		{\large\@foreword\par}
		\vfill
		{\ifnum\value{page}=1\relax\else\large\@publisher\par\fi}}
	% Begin \frontmatter and print the title page twice
	\frontmatter
	\bgroup
		\pagestyle{empty}%
		\reset@twocolumns%
		\printtitle%
		\if@twoside
		\cleartorecto
		\printtitle%
		\fi
		\cleartorecto\vfill
		\printcopyright%
		\restore@twocolumns%
		\cleartorecto\par
	\egroup

}

%	Define a style for modern style books
\newcommand{\maketitleModern}{%
	% Send out warnings on empty fields
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	% Create the title page
	\long\def\printtitle{
		\reset@twocolumns%
		\raggedright%
		\normalize@fontsize%
		\vspace*{6\baselineskip}
		{\huge\scshape\csname @title@\languagename\endcsname\par}%
		 \vspace{\baselineskip}%
		{\if\@empty\csname @subtitle@\languagename\endcsname\relax\else
		 \LARGE\csname @subtitle@\languagename\endcsname\par\fi}%
		\vspace{\baselineskip}
		{\Large
		 \if\@author\relax\else{\LARGE\@author}\\%
			\if\@email\relax\else\@email\par\fi\fi%
		 \vfill
		 \if\@institution\relax\else\@institution\\\fi%
		 \if@article\else
			\iflecture\lecturename\\\fi%
			\ifseminar\seminarname\\\fi
			\iftutorial\tutorialname\\\fi
		 \fi%
		 \schoolyearname~\@date\par}%
		 }%
	% Print the title page
	\frontmatter
	\bgroup
		\pagestyle{empty}
		\reset@twocolumns%
		\sffamily
		\printtitle%
		\if@twoside
		\cleartorecto
		\printtitle%
		\fi
		\restore@twocolumns%
		\cleartorecto\par
	\egroup
}

%	Define a style for modern style books
\newcommand{\maketitleModernArticle}{%
	% Send out warnings on empty fields
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	% Create the title page
	\long\def\printtitle{
		\reset@twocolumns%
		\raggedright%
		\normalize@fontsize%
		\vspace*{\z@}
		{\LARGE\scshape\sffamily\csname @title@\languagename\endcsname\par}%
		{\if\@empty\csname @subtitle@\languagename\endcsname\relax\else
		 \Large\sffamily\csname @subtitle@\languagename\endcsname\par\fi}
		\vspace{\baselineskip}}
	% Print the title page
	\mainmatter
	\bgroup
		\reset@twocolumns%
		\sffamily
		\printtitle%
		\restore@twocolumns\par
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
	\if\expandafter\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	% Create the title page
	\long\def\printtitle{
		\cleardoublepage%
		\reset@twocolumns%
		\raggedright%
		\setlength{\parindent}{0em}
		\normalize@fontsize%
		\if@article
			\vspace*{0em}
		\else
			\vspace*{2\baselineskip}
		\fi
		{\Large\scshape\csname @title@\languagename\endcsname\par}%
		 \vspace{\baselineskip}%
		{\if\csname @subtitle@\languagename\endcsname\relax\else
		 \large\csname @subtitle@\languagename\endcsname\par\fi}%
		 \if@article\else
			\iflecture\lecturename\par\fi%
			\ifseminar\seminarname\par\fi
			\iftutorial\tutorialname\par\fi
		 \fi
		 \vspace{\baselineskip}
		 \schoolyearname~\@date\par%
		 \vspace{\baselineskip}
		 \if\@author\relax\else\@author%
			\if\@email\relax\else~(\@email)\par\fi\fi%
	}%
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
		\if\@author\relax\else\@author%
			\if\@institution\relax\else, \@institution\fi%
			\if\@email\relax\else~(\@email)
				\if\@date\relax\else~--- \fi\fi\fi
		% Revoir le --- (inutile si on laisse les auteurs vides)
		\if\@date\relax\else\@date\fi\par%
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
		{\if\@email\relax\else\emailname:~\@email\fi\par}%
		\vspace{2\baselineskip}%
		\restore@twocolumns%
	\egroup
}

% Create maketitle for documentation (developer option)
\newcommand{\maketitleDocumentation}{%
	% Send out warnings on empty fields
	\if\expandafter\@empty\csname @title@\languagename\endcsname\relax
		\@latex@warning@no@line{No \noexpand\title given}\fi
	% Create the \maketitle
	\long\def\printtitle{%
		\setlength{\parindent}{0em}
		\normalize@fontsize%
		{\itshape\@series\par}
		\vspace*{7\baselineskip}
		{\LARGE\scshape\csname @title@\languagename\endcsname\par}
		{\Large\scshape\csname @subtitle@\languagename\endcsname\par}
		\vspace{2\baselineskip}
		\ifx\@empty\@subject
			\vspace{4\baselineskip}
		\else
			{\large\@subject\par}
			\vspace{3\baselineskip}\fi
		{\Large\@author\par}
		\vspace{2\baselineskip}
		{\large\@foreword\par}
		\vfill
		\ifnum\value{page}=1\relax
			\foreignlanguage{british}{%
			{\ttfamily\@package\space\@version, \@date}
			{\par Currently maintained by \@maintainer\space(\@email)}
			{\if\@empty\@ctan\else\par CTAN: \@ctan\fi}
			{\if\@empty\@repository\else\par Repository: \@repository\fi}}
		\fi}
	% Begin \frontmatter and print the title page twice, use arabic numbers throughout
	\frontmatter*
	\bgroup
	\reset@twocolumns%
	\setlrmargins{*}{*}{1}
	\checkandfixthelayout
	\pagestyle{empty}%
	\cleartorecto
	\printtitle%
	\cleartorecto
	\printtitle%
	\cleartorecto\vspace*{\fill}
	\printcolophon%
	\printcopyright%
	\cleartorecto
	\restore@twocolumns\par
	\egroup
	\mainmatter*
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
		\if\@fax\relax
			\@email%
			\if\@email\relax\else\if\relax\@phone\relax\else\ / \fi\fi%
			\@phone\par
		\else
			\if\@email\relax\else\emailname:~\@email\fi
			\if\@phone\relax\else\phonename:~\@phone\fi\par
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
		\@latex@warning@no@line{No \noexpand\location given}\fi
	\setlength{\parindent}{0em}
	\setlength{\parskip}{\baselineskip}
	\clearpage
	\if\@empty\@logo\relax\else\includegraphics[width=.3\textwidth]{\@logo}\fi\par
	\begin{minipage*}{.5\linewidth}
		\raggedright%
		\@author\par
		\@address\par
		\if\@fax\relax
			\@email%
			\if\@email\relax\else\if\relax\@phone\relax\else\ / \fi\fi%
			\@phone\par
		\else
			\if\@email\relax\else\emailname:~\@email\fi
			\if\@phone\relax\else\phonename:~\@phone\fi\par
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


\newcommand{\maketitleInvoice}{
	\if\@empty\@address\relax
		\@latex@warning@no@line{No \noexpand\address given}\fi
	\if\@empty\@recipient\relax
		\@latex@warning@no@line{No \noexpand\recipient given}\fi
	\if\@empty\@invoiceno\relax
		\@latex@warning@no@line{No \noexpand\invoiceno given}\fi
	\if\@empty\@registrationno\relax
		\@latex@warning@no@line{No \noexpand\registrationno given}\fi
	\setlength{\parindent}{0em}
	\setlength{\parskip}{\z@}
	\clearpage
	\if\@empty\@logo\relax\else\includegraphics[width=.3\textwidth]{\@logo}\fi\par
	\begin{minipage*}{.5\linewidth}
		\raggedright%
		\@author\par
		\@address\par
		\if\@fax\relax
			\@email%
			\if\@email\relax\else\if\relax\@phone\relax\else\ / \fi\fi%
			\@phone\par
		\else
			\if\@email\relax\else\emailname:~\@email\fi
			\if\@phone\relax\else\phonename:~\@phone\fi\par
			\faxname:~\@fax\par
		\fi
		\textsc{\registrationnoname}:~\@registrationno\par
	\end{minipage*}%
	\hfill
	\begin{minipage*}{.4\linewidth}
		\raggedright%
		\vspace*{\baselineskip}%
		\if\@empty\@recipient\relax\else\@recipient\fi\par
		\if\@empty\@addressee\relax\else\@addressee\fi\par
	\end{minipage*}
	\addvspace{2\baselineskip}
	\textsc{\invoicename~\no\@invoiceno}\par
	\vspace{\baselineskip}
	\if\@empty\@ourRef\relax\else N./Réf.~: \@ourRef\fi\par
	\if\@empty\@yourRef\relax\else V./Réf~: \@yourRef\fi\par
	\invoicedatename~: \@date\par
	\if\@empty\@duedate\else\duedatename~: \@duedate\fi\par
	\vspace{2\baselineskip}
}

%	Créate a command for the closing remarks in a letter
%	TODO » Prévoir de pouvoir personnaliser la hauteur de la signature, idéalement pour qu'elle empiète un peu sur le texte (ou dans \makesignature)
\newcommand{\closing}{
	\addvspace{\baselineskip}
	\if\@cc\relax\else%
		\ccname:\hfill%
		\begin{minipage*}{.85\linewidth}\@cc\end{minipage*}%
	\fi\par
	\addvspace{2\baselineskip}
	\makesignature\par
	\if\@enclosed\relax\else%
		\addvspace{2\baselineskip}
		\enclname:\hfill%
		\begin{minipage*}{.85\linewidth}\@enclosed\end{minipage*}
	\fi\par
	% TODO » Ajouter avec les clausiers
	% \nondisclosure
}

%	Create a command for paid bills
\newcommand{\debtpaidoff}{
	\if\@paymentdate\relax\vspace{6\baselineskip}\else
	\vspace{3\baselineskip}
	\textcolor[HTML]{B82010}{\bfseries\paiddebtname\space\dateprefix\@paymentdate\if\@paymenttype\relax\else\space\paymenttypename\space\@paymenttype\if\relax\@paymentref\relax\else\space\no\@paymentref\fi\fi.}\par
	\makepaidsignature\par\fi
}

%	Set the default title page styles
\titlepagestyle{Book}
\if@modern\titlepagestyle{Modern}\fi
\if@article\titlepagestyle{Article}\fi
\if@dev\titlepagestyle{Documentation}\fi
\if@vitae\titlepagestyle{CV}\fi
\if@letter\titlepagestyle{Letter}\fi
\if@didactic\titlepagestyle{Didactic}\fi


% =***======***======***======***======***======***======***======***======***======***=
 
%	#####	HEADERS & FOOTERS	#####

%	TODO » Documenté pour les livres, articles, lettres, CVs. Programmer et documenter les docs juridiques
% TODO » Programer plusieurs styles / contenus, e.g. running header à gauche (police contrastée) + numéro de page à droite (?)
%	TODO » Créer un header avec les numéros de page en haut (et vide sur la première page de chapitre) + renommer le header normal (avec les numéros en bas de page)
%	TODO »  Créer une macro spéciale type \chapterend avec fleuron si suffisamment de lignes (optionnel, via une macro) + footer vide (pas de numéro de page), à insérer manuellement (trop risqué sinon)

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
%	TODO > Adde la même chose \if@stationery (reprendre l'auteur + le titre, mais uniquement si un titre est fourni)
%	TODO > \PreviousTotalPages déjà définie par LaTeX?
\makepagestyle{letterhead}
	\makeevenhead{letterhead}
		{}
		{\ifnum\value{page}>1%
		 \if@vitae\MakeLowercase{\scshape\@author~-- \if\@empty\csname @title@\languagename\endcsname\@empty\cvname\else\csname @title@\languagename\endcsnamefi}\fi\fi}
		{}
	\makeoddhead{letterhead}
		{}
		{\ifnum\value{page}>1%
		 \if@vitae\MakeLowercase{\scshape\@author~-- \if\@empty\csname @title@\languagename\endcsname\@empty\cvname\else\csname @title@\languagename\endcsname\fi}\fi\fi}
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
			\if\@email\relax\else~(\@email)\fi%
			\if\@date\relax\else, \@date\fi.}}
		{}
		{\ifnum\value{lastpage}>1\relax\thepage\fi}
	\makeoddfoot{didactichead}
		{\footnotesize{%
			\@author%
			\if\@email\relax\else~(\@email)\fi%
			\if\@date\relax\else, \@date\fi.}}
		{}
		{\ifnum\value{lastpage}>1\relax\thepage\fi}

%	Set Default header styles
\pagestyle{frenchlaw}
%
%\if@letter\pagestyle{letterhead}\fi

\if@stationery\pagestyle{letterhead}\@require@lastpagetrue\fi
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
			\if\BODY\relax\else%
				\vskip-\lastskip\vskip\baselineskip%
				\textsc{\summaryname}: \BODY\vskip\baselineskip\par\fi}%
	\egroup\fi%
	\list{}{\vskip\baselineskip%
			\let\makelabel\summarylabel%
			\setlength{\itemsep}{\baselineskip}%
			\setlength{\leftmargin}{2\parindent}}%
	 \item\BODY% + \needspace{2\baselineskip} (?) [Semble inutile]
	 \vskip\baselineskip\endlist}

% TODO > Option <color> qui modifie également les numéros de paragraphes et toutes les têtes de chapitres, etc. Désactivé par défaut
\newcommand{\vitaecolour}{\if@colour\maincolour\fi}% Saffron / Dark Red
\newcommand{\vitaelabel}[1]{\if#1\relax\else\footnotesize\itshape{\hfill\strut#1\if@french~\fi:\strut}\fi}

%	Créer un environnement <vitae> pour les CV (label dans la marge)
\newenvironment{vitae}
	{\list{}{\let\makelabel\vitaelabel
			 \setlength{\leftmargin}{\z@}
			 \setlength{\labelwidth}{\marginparwidth}}}
	{\endlist}

%	Créer une commande pour calculer automatiquement l'âge (vitae)
% \agecalc{dd}{mm}{yyyy}
% TODO > Adde un métadata \dateofbirth + une commande qui affiche l'âge si \ifage (cf CV)
\newcounter{calculate@age}
\newcommand{\agecalc}[3]{%
	\setcounter{calculate@age}{\the\year}%
	\addtocounter{calculate@age}{-#3}%
	\ifnum\the\month < #2\relax\addtocounter{calculate@age}{-1}\fi%
	\ifnum\the\month = #2\relax
		\ifnum\the\day < #1\relax\addtocounter{calculate@age}{-1}\fi\fi%
	\arabic{calculate@age}~\agename}

% TODO > Reprendre dans le CV \ifpicture, et créer la macro correspondante, avec adresse du fichier dans un champ métadonnée \photograph
% Adde une macro pour ajouter les profils Linkedin, OrcID et autres + métadonnées correspondantes

%	Créer les commandes pour faire référence à un numéro
\newcommand{\infra}{\@ifstar{\s@infra}{\@infra}}
\newcommand{\supra}{\@ifstar{\s@supra}{\@supra}}

% Utiliser les commandes: \infra[para]{subpara} ou \infra{para}
\newcommand{\@infra}[2][]{\emph{infra} \no\if\relax#1\else\ref{para:#1}.\fi\ref{para:#2}}
\newcommand{\s@infra}[2][]{\emph{infra} \nos\if\relax#1\else\ref{para:#1}.\fi\ref{para:#2}~s.}
\newcommand{\@supra}[2][]{\emph{supra} \no\if\relax#1\else\ref{para:#1}.\fi\ref{para:#2}}
\newcommand{\s@supra}[2][]{\emph{supra} \nos\if\relax#1\else\ref{para:#1}.\fi\ref{para:#2}~s.}

%	TODO » Créer une commande \precis{} pour indiquer un résumé du paragraphe. Revoir celui de <memoir>
% TODO » Ou imprimer tous les \para + \paraname à la suite dans la ToC, en forme de précis.

% TODO > Corrspondent à des options de classe > supprimer? ou Ajouter dans la doc des helper macros, comme alternatives

% NB! Cf. la doc sur les tables des matières: détailler les deux mécanismes avec les modes de correction
%	Créer un switch pour imprimer ou non les \outline dans la table des matières
\newcommand{\outlinetoc}{\@outlinetrue}
\newcommand{\nooutlinetoc}{\@outlinefalse}
%	Créer un switch pour imprimer ou non les \outline dans la table des matières
\newcommand{\summarytoc}{\@summarytrue}
\newcommand{\nosummarytoc}{\@summaryfalse}

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
			\if\BODY\relax\else%
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

%	TODO » Créer une commande pour des superscripts utilités dans une exégèse + commande de style, par ex. pour les mettre en couleurs comme dans le traité (?)
\newcommand{\glose}[2][]{\ifx\relax#1\relax\else#1\subparanumdash\fi\emph{#2)~}\ignorespaces}
\newcommand{\glosemark}[1]{\textsuperscript{\thinspace\emph{#1)}}}


% =***======***======***======***======***======***======***======***======***======***=

%	#####	CRÉATION DES INDEX ET GLOSSAIRES	#####

% Adde sous-index du traité

%	Préparer les index
\xindyindex
\makeindex
\makeindex[\jobname-bib]
\makeindex[\jobname-law]


%	Use the same styling for letter groups with xindy and makeindex (cf. ist file)
\newcommand{\lettergroup}[1]{{\hfill#1\hfill}\nopagebreak}

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
		\AtBeginDocument{\let\index\paraindex}
	\else
		\newcommand{\bibindex}[1]{\index{\jobname-bib}{#1}}
		\newcommand{\lawindex}[1]{\index{\jobname-law}{#1}}
	\fi
%\fi


% =***======***======***======***======***======***======***======***======***======***=

%	#####	CRÉATION DES BIBLIOGRAPHIES (BIBLATEX)	#####
% TODO » Check OSCOLA for UK case citations, incl. Scotland

%	Create macros in case we want to use package <publist> (in CV style)
% Prévoir de charger le style <frenchlaw> dans les listes de publications des CV
% Ou le mettre par défaut et virer le switchç
\newcommand*{\publistbasestyle}{frenchlaw}

%	Charger <biblatex> avec les options
\RequirePackage[
	style=\set@biblatexstyle,
	citestyle=authortitle,
	\if@vitae
	%	useshortauthor=false,
		bibstyle=publist,
		sorting=ddnt,
		marginyear=false,% TODO » True
		% TODO » Avec la versio 2019
		% plnumbering=local-descending,
	\fi
	backend=biber,
	indexing=cite,
    hyperref=auto,
	% citereset=chapter,
	mincrossrefs=2,
	autolang=other*]{biblatex}

% Reprendre + uniquement piur les références .cbx
\if@french
	\ExecuteBibliographyOptions{giveninits=false,}
\else
	\ExecuteBibliographyOptions{giveninits=true,}
\fi

% \if@article
% 	\ExecuteBibliographyOptions{useshortauthor=false}
% \fi

% BibLaTeX specific penalties
\setcounter{abbrvpenalty}{9000}% Discourage line breaking within abbreviations [Orig. 100]

%	Exclude bibliographies from the short table of contents
% Do not automatically print subbibliographies in the ToC (use "subbibintoc" heading for that purpose)
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

\newcommand{\paperlength}[2]{%
	\if@french #1 \bibstring{signs}\else #2 \bibstring{words}\fi}


%	TODO » Sortir tout ce qu'on peut du \if@vitae -- créer un .bbx exprès qui charge publist et modifie ce qu'il faut
%	+ Documenter l'option {short} et le switch \iflong (=> renommer) à utiliser dans le corps du CV pour délimiter les deux versions du document
\if@vitae
	%	Use bibliography headings that fit the rest of the CV
	\defbibheading{bibliography}[\refname]{\subsection*{#1}}
	\defbibheading{subbibliography}[\refname]{\paragraph*{#1}}

	% Use own style for book reviews
	\DeclareBibliographyAlias{review}{article}
	% Reset article pagination to default (print page range)
	\DeclareFieldFormat[article,commentary,review]{pages}{%
		\mkpageprefix[bookpagination]{#1}}

	% Improve sirting scheme (use event year)
	\DeclareSortingTemplate{ddnt}{
	\sort{\field{presort}}
	\sort[final]{\field{sortkey}}
	\sort[direction=descending]{
		\field[strside=left,strwidth=4]{sortyear}
		\field[strside=left,strwidth=4]{year}
		\field[strside=left,strwidth=4]{eventyear}
		\literal{9999}}
	\sort[direction=descending]{
		\field[padside=left,padwidth=2,padchar=0]{month}
		\field[strside=left,strwidth=2]{eventmonth}
		\literal{00}}
	\sort[direction=descending]{
		\field[padside=left,padwidth=2,padchar=0]{day}
		\field[strside=left,strwidth=2]{eventday}
		\literal{00}}
	\sort{\field{sortname}
		  \field{author}
		  \field{editor}
		  \field{translator}
		  \field{institution}}
	\sort{\field{sorttitle}
		  \field{title}}
}

	%	Number CV items by section and in reverse order
	% Count total number of entries in each refsection
	% Thanks @ Audrey <https://tex.stackexchange.com/a/22770/10119>
	\AtDataInput{%
		\ifkeyword{NOPRINT}{}{%
			% Count all entries in the ref section
			\csnumgdef{entrycount:\therefsection}{\csuse{entrycount:\therefsection}+1}}
	}
		
	% Create a counter to arbitrarily change the entrycount (e.g. if there are NOPRINT + Related entries)
	\newcounter{adjustnumbers}
	\setcounter{adjustnumbers}{0}
	% Create a command that calculates the labelnumber for each entry (total number of entries in the current refsection, minus the actual labelnumber, plus one, plus or minus the value of adjustnumbers)
	\renewcommand*{\mkbibdesc}[1]{%
		\number\numexpr\csuse{entrycount:\therefsection}-#1+1+\value{adjustnumbers}\relax}

	% Print number of items per section of the bibliography (as printed -- not \refsections, which correspond to .bib files)
	% Thanks @ morwe <https://tex.stackexchange.com/a/404246/10119>
	% Instead of the package, write totals to .aux
	% See implementation in CV files... create macro to define filters + counters all at once?
	\def\countbooks{}
	\def\count@books{}
	\def\countinvited{}
	\def\countcollections{}
	\def\count@collections{}
	\def\countinvited{}
	\def\count@invited{}
	\def\countnotinvited{}
	\def\count@notinvited{}
	\def\countarticles{}
	\def\count@articles{}
	\def\countchapters{}
	\def\count@chapters{}
	\def\countinreferences{}
	\def\count@inreferences{}
	\def\countcommentaries{}
	\def\count@commentaries{}
	\def\countreviews{}
	\def\count@reviews{}
	\def\countconferences{}
	\def\count@conferences{}
	\def\countbooklaunches{}
	\def\count@booklaunches{}
	\AtEveryBibitem{%
		\ifthenelse{ \ifentrytype{book} \OR \ifentrytype{boookinbook} \OR
					 \ifentrytype{thesis} \OR \ifentrytype{phdthesis} \OR 
					 \ifentrytype{reference} }
			{\csnumgdef{count@books}{\csuse{count@books}+1}}
			{}
		\ifthenelse{ \ifentrytype{collection} \OR \ifentrytype{proceedings} }
			{\csnumgdef{count@collections}{\csuse{count@collections}+1}}
			{}
		\ifentrytype{article}
			{\csnumgdef{count@articles}{\csuse{count@articles}+1}}
			{}
		\ifthenelse{ \ifentrytype{incollection} \OR \ifentrytype{inproceedings} }
			{\csnumgdef{count@chapters}{\csuse{count@chapters}+1}}
			{}
		\ifentrytype{inreference}
			{\csnumgdef{count@inreferences}{\csuse{count@inreferences}+1}}
			{}
		\ifentrytype{commentary}
			{\csnumgdef{count@commentaries}{\csuse{count@commentaries}+1}}
			{}
		\ifentrytype{review}
			{\csnumgdef{count@reviews}{\csuse{count@reviews}+1}}
			{}
		\ifthenelse{ \ifentrytype{unpublished} }
			{\csnumgdef{count@conferences}{\csuse{count@conferences}+1}
			 \ifthenelse { \ifkeyword{INVITED} }
			 	{\csnumgdef{count@invited}{\csuse{count@invited}+1}}
			 	{\csnumgdef{count@notinvited}{\csuse{count@notinvited}+1}}}
			{}
		\ifthenelse{ \ifentrytype{booklaunch} }
			{\csnumgdef{count@booklaunches}{\csuse{count@booklaunches}+1}}
			{}
	}

	\AtEndDocument{%
		\immediate\write\@auxout{%
			\string\gdef\string\countbooks{\count@books}
			\string\gdef\string\countcollections{\count@collections}
			\string\gdef\string\countarticles{\count@articles}
			\string\gdef\string\countchapters{\count@chapters}
			\string\gdef\string\countinreferences{\count@inreferences}
			\string\gdef\string\countcommentaries{\count@commentaries}
			\string\gdef\string\countreviews{\count@reviews}
			\string\gdef\string\countconferences{\count@conferences}
			\string\gdef\string\countinvited{\count@invited}
			\string\gdef\string\countnotinvited{\count@notinvited}
			\string\gdef\string\countbooklaunches{\count@booklaunches}}%
	}

	% Print the publication {year} in the margin if it is different from the previouw entry, subsidiarily, print the {eventyear} or the {pubstate}.
	%	TODO » \if@marginyear plante si on n'est pas en mode CV, sans doute car undefined => créer le switch (?)
	\renewbibmacro*{bpl:marginyear}{%
		%\if@marginyear
			\ifbibliography
				{\ifthenelse{	\iffieldundef{pubstate}	}
					{\ifthenelse{	\iffieldundef{year} \OR
									\iffieldequals{year}{\bbx@lasthash} }
						{\ifthenelse{	\iffieldundef{eventyear} \OR
				 						\iffieldequals{eventyear}{\bbx@lasthash} }
				 			{}
				 			{% Don't print a year in the margin for related (noprint) entries, but do save the year.
				 			 \ifkeyword{NOPRINT}
				 				{}
				 				{\marginpar{\nopunct\vitaelabel{\printfield{eventyear}}}}%
					 		 \savefield{eventyear}{\bbx@lasthash}}}
						{\ifkeyword{NOPRINT}
				 			{}
				 			{\marginpar{\nopunct\vitaelabel{\printfield{year}}}}%
				 		 \savefield{year}{\bbx@lasthash}}}
					{\iffieldequals{pubstate}{\bbx@lasthash}
						{}
						{\ifkeyword{NOPRINT}
				 				{}
				 				{\marginpar{\nopunct\vitaelabel{\printfield{pubstate}}}}}%
					 \savefield{pubstate}{\bbx@lasthash}}}
				{}%
		%\fi%
		}

	% Do not print the label year, since it is in the margin already
	\renewbibmacro*{bpl:year+labelyear}{}

	% Biblatex Helpers => Babel
	\def\seeconf{\textrightarrow~\textsc{\conferencename}}
	\def\seepubl{\textrightarrow~\textsc{\publicationname}}
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


% =***======***======***======***======***======***======***======***======***======***=

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
		{\noindent\scshape\raggedright\abstractname:\space%
		 \if\relax#1\else
		 \scshape\raggedright\csname @title@\languagename\endcsname~---\fi}%
	 \else
		\setlength{\parindent}{0em}
		\normalize@fontsize
		{\noindent\large\scshape\raggedright\csname @title@\languagename\endcsname:\space%
		 \csname @subtitle@\languagename\endcsname}\par
		\setlength{\parindent}{1.5em}
		\vspace{\baselineskip}
	 \fi}
	{%\if@article\vspace{2\baselineskip}\fi%
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
	% Remplacer par shortcontents + Rajouter un RaggedRight (+package ragged2e)
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
	\addtocontents{toc}{\vspace{\baselineskip}}
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

	% Rajouter la ToC + RaggedRight (+package ragged2e)
}

%	TODO » Adde un moyen de choisir entre la page de garde et une couv. perso
% Ou deux commandes: \makefrontcover et \makefancycover
% Redéfinir tous les \printtitle@marticle dans le corps de la classe, avec un maketitle qui invoque juste le bon et quelques autres commandes, pour que \printtitle soit disponible à \makefrontcover (en choisissant le bon comme pour maketitle)
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


%	Create a command for alternative emphasis of text (Bold ± Color).
\DeclareTextFontCommand{\headline}{\if@modern\sffamily\fi\bfseries\color{\@headlinecolor}}
\DeclareTextFontCommand{\subheadline}{\itshape\color{\@headlinecolor}}
% Create color specification commands
\newcommand{\headlinecolor}[1]{\gdef\@headlinecolor{#1}}
	\newcommand{\@headlinecolor}{black}% E.g. "black", "darkgray"

%	TODO » Créer un mode couleur => pour les didactic + éventuellement dans le CV (healine), les environnements showcase, etc. -- ou même pour les titres de section (sans serif + gras / couleur == tester sur la documentation)


% =***======***======***======***======***======***======***======***======***======***=

%	#####	GESTION DU MODE DRAFT	#####

% TODO » Requires two runs of LaTeX in order to place the marks correctly.
\RequirePackage{marginnote}

%	TODO » On utilise \ifdraftdoc (de memoir) pour exclure le \if@draft (version pré-inale du manuscrit, qui ne doit pas avoir de coquilles)
% Adde un \highlight sur plusieurs lignes? (cf. packages)
% Adde un \comment marginal (stacked bottom) ± \todo sur le même système
% Commandes: \added[FV]{...} avec une autre commande en préambule \definechangeauthor{FV}{color} et imprimer les initiales de l'auteur en superscirpt après la modification en mode draft
% Commande \listofchanges (et inclure tous les changements à la listof) + ajouter l'auteur et la page pour chaque modification
%	==> Créer deux options:
%		[draft] == afficher les motifs colorées + les marques dans la marge.
%		[draft+] == afficher la version consolidée + les marques dans la marge.
% Cf. aussi package <changes>
\renewcommand{\added}[2][]{%
	\if@draft
		\marginnote
			[\raggedright\textcolor{teal}{\small #1 $\bigoplus$}]
			{\raggedleft\textcolor{teal}{\small #1 $\bigoplus$}}\fi%
	\ifdraftdoc\textcolor{teal}{#2}\else#2\fi}

%	== deleted (dont barré) + added (?)
\renewcommand{\changed}[3][]{%
	\if@draft
		\marginnote
			[\raggedright\textcolor{cyan}{\small #1 $\Leftrightarrow$}]
			{\raggedleft\textcolor{cyan}{\small #1 $\Leftrightarrow$}}\fi%
	\ifdraftdoc\textcolor{cyan}{#3}\else#3\fi}

%	TODO » Try with packages soul ( \st{#2} ) or cancel ( \cancel{#2} ) --- Soul testé sur la documentation, semble marcher avec des sauts de ligne (et de page ??)
\renewcommand{\deleted}[2][]{%
	\@bsphack
	\if@draft
		\marginnote
			[\raggedright\textcolor{purple}{\small #1 $/\kern-1ex/$}]
			{\raggedleft\textcolor{purple}{\small #1 $/\kern-1ex/$}}\fi%
	\ifdraftdoc
		\textcolor{purple}{\kern-.25ex$/$\kern-.4ex #2$/$\kern-.25ex}\fi%
	\@esphack}

\newcommand{\todo}[2][]{%
	\@bsphack
	\if@draft
		\marginnote
			[\raggedright\textcolor{violet}{\small #1 $\bigodot$}]
			{\raggedleft\textcolor{violet}{\small #1 $\bigodot$}}\fi%
	\ifdraftdoc~\textcolor{violet}{$\bigodot$\kern1ex#2\space}\fi%
	\@esphack}

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

\newcommand\point[1]{\if@modern\par\else\addvspace{\baselineskip}\fi\noindent\textrightarrow\enspace\textit{#1}:}

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

% TODO	Chantier: compatibilité LuaLaTeX? Et lua-typo, impnattypo, etc.

% TODO » Créer une commande pour copier-coller le texte (partir des articles perso) dans Word ou autre

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
		{\upshape\itshape F\kern-.2ex rench}%
		 L\kern-.4ex%
		 \raisebox{.25em}{\scshape a}\kern-.1ex%
		 W%
	\else\ifxetex
			{\upshape\itshape F\kern-.2ex rench}%
			 L\kern-.7ex%
			 \raisebox{.25em}{\scshape a}\kern-.3ex%
			 W%
		\else
			{\upshape\itshape French\kern.1ex}%
			 L\kern-.65ex%
			 \raisebox{.2em}{\scshape a}\kern-.3ex%
			 W%
	\fi\fi\xspace}


% Adde: If file exists!
% TODO » Vérifier que ça fonctionne pour plauthorname (si chargé à cet endroit) + ne fonctionne pas pour les métadonnées (qui sont sauvegardées en l'état dans \printtitle) --- sinon peut-être essayer de charger plusieurs fois le fichier: une fois près avoir chargé tous les packages, et si nécessaire après publist
% Ou utiliser des \AtBeginDocument pour les commandes de titre (?)
\IfFileExists{frenchlaw.cnf}
	{\input{frenchlaw.cnf}}
	{}

% Pour la documentation: Renommer l'env. <noprint> en autre chose de plus explicite et créer une commande qui imprime le code en mode verbose (\et\env=\verbose ?) 

% Créer les macros: 
% \changes{1.0}{description}
% \printchanges

%  End of class Frenchlaw
