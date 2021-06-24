%% tauthesis.cls
%% Copyright 2021 Tampere University
%
% This work may be distributed and/or modified
% under the conditions of the LaTeX Project Public
% License, either version 1.3 of this license or
% (at your option) any later version.
%
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is
%   Ville Koljonen
%
% This work consists of the files taudissertation.cls.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{taudissertation}
[2021/06/21 v2.0 Dissertation styles used in Tampere University]

% Inherit from the book document class.
\LoadClass[11pt, b5paper]{book}

% Gain access to internal macros.
\makeatletter

%%%%% CLASS OPTIONS %%%%%

\newcommand{\@mainlanguage}{finnish}
\newcommand{\@otherlanguage}{english}
\newcommand{\@citationstyle}{numeric}

% Language selection.
\newif\if@langenglish\@langenglishfalse
\DeclareOption{english}{%
    \@langenglishtrue
    \renewcommand{\@mainlanguage}{english}
    \renewcommand{\@otherlanguage}{finnish}
}
\DeclareOption{finnish}{%
    \@langenglishfalse
    \renewcommand{\@mainlanguage}{finnish}
    \renewcommand{\@otherlanguage}{english}
}

% Citation style selection.
\newif\if@apacitation\@apacitationfalse
\newif\if@ieeecitation\@ieeecitationfalse
\DeclareOption{numeric}{%
    \renewcommand{\@citationstyle}{numeric}
}
\DeclareOption{authoryear}{%
    \renewcommand{\@citationstyle}{authoryear}
}
\DeclareOption{apa}{%
    \renewcommand{\@citationstyle}{apa}
    \@apacitationtrue
}
\DeclareOption{ieee}{%
    \renewcommand{\@citationstyle}{ieee}
    \@ieeecitationtrue
}

\DeclareOption*{
  \ClassWarning{taudissertation}{Unknown option '\CurrentOption'}
}

% Default options.
\ExecuteOptions{finnish,numeric}

\ProcessOptions\relax

%%%%% PACKAGES AND RELATED DEFINITIONS %%%%%

% ISO-19005 compliant document (pdf/A-2b)
\RequirePackage[a-2b,mathxmp]{pdfx}
\catcode30=12

% UTF-8 input
\RequirePackage[utf8]{inputenc}

% Font selection
\RequirePackage[T1]{fontenc}
\renewcommand{\sffamily}{\fontfamily{phv}\fontseries{mc}\selectfont}
\RequirePackage[cmbraces]{newtxmath}
\let\Bbbk\relax
\RequirePackage{ebgaramond-maths}
\RequirePackage{garamondlibre}

% Page geometry and heading handling
\newlength{\thispaperwidth}
\setlength{\thispaperwidth}{176mm}

\newlength{\thispaperheight}
\setlength{\thispaperheight}{250mm}

\newlength{\bindingoffsetwidth}
\setlength{\bindingoffsetwidth}{0.5cm}

\RequirePackage
    [%showframe,
    b5paper,
    top=2cm,
    bottom=3cm,
    inner=2cm,
    outer=2cm,
    bindingoffset=\bindingoffsetwidth]{geometry}
\special{papersize={\thispaperwidth, \thispaperheight}}
\RequirePackage{fancyhdr}
\RequirePackage[explicit]{titlesec}
\RequirePackage{enumitem}
\RequirePackage{setspace}

%\setlength{\voffset}{-0.9in}

\newlength\chapterspace
\setlength\chapterspace{0.4cm}
\newlength\chapterindent
\setlength\chapterindent{0.5in}
\setlength{\parindent}{0.5cm}
\linespread{1.213}

\setlist{itemsep=0pt, labelindent=0.5cm}

% Try to prevent large figures appearing
% by themselves without any text. Be
% careful not to make \floatpagefraction
% larger than \topfraction.
%\renewcommand{\topfraction}{0.85}        % default 0.7
%\renewcommand{\textfraction}{0.1}        % default 0.2
%\renewcommand{\floatpagefraction}{0.75}

% Define the header and footer content.

\pagestyle{fancyplain}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Define chapter and section heading styles.

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% Part
\titleformat
    {\part}[display]{\centering\LARGE\sffamily}
    {\partname~\thepart}{0em}
    {\fancyhf{}\cfoot{\thepage}\MakeUppercase{#1}}
\titleformat
    {name=\part, numberless}[hang]
    {\centering\LARGE\sffamily}{}{0em}
    {\fancyhf{}\cfoot{\thepage}\MakeUppercase{#1}}

% Chapter
\titleformat
    {\chapter}[block]{\raggedright\LARGE\sffamily%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thechapter}}{0em}
    {\fancyhf{}\cfoot{\thepage}\MakeUppercase{#1}}
\titleformat
    {name=\chapter, numberless}[hang]
    {\raggedright\LARGE\sffamily}{}{0em}
    {\fancyhf{}\cfoot{\thepage}\MakeUppercase{#1}}
\titlespacing*{\chapter}{0em}{0pt}{70.9pt}
\titlespacing*{name=\chapter, numberless}{0em}{0pt}{70.9pt}

% Section
\titleformat
    {\section}[block]{\raggedright\Large\sffamily%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thesection}}{0em}{#1}
\titleformat
    {name=\section, numberless}[hang]
    {\raggedright\Large\sffamily}{}{0em}{#1}
\titlespacing*{\section}{0em}{14.2pt}{14.2pt}
\titlespacing*{name=\section, numberless}{0em}{14.2pt}{14.2pt}

% Subsection
\titleformat
    {\subsection}[block]{\raggedright\large\sffamily%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thesubsection}}{0em}{#1}
\titleformat
    {name=\subsection, numberless}[hang]
    {\raggedright\large\sffamily}{}{0em}{#1}
\titlespacing*{\subsection}{0em}{14.2pt}{14.2pt}
\titlespacing*{name=\subsection, numberless}{0em}{14.2pt}{14.2pt}

% Subsubsection
\titleformat
    {\subsubsection}[block]{\raggedright\normalsize\sffamily%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\makebox[\chapterindent][l]{\thesubsubsection}}{0em}{#1}
\titleformat
    {name=\subsubsection, numberless}[hang]
    {\raggedright\normalsize\sffamily}{}{0em}{#1}
\titlespacing*{\subsubsection}{0em}{14.2pt}{14.2pt}
\titlespacing*{name=\subsubsection, numberless}{0em}{14.2pt}{14.2pt}

%\setlength{\parskip}{14.2pt}
\setlength{\parskip}{0pt}

% Language support for Finnish and English
\RequirePackage[\@otherlanguage, main=\@mainlanguage]{babel}
\RequirePackage{csquotes}

% Powerful color package
\RequirePackage{xcolor}
%\definecolor{taupurple}{RGB}{78,0,148}

% Smart bibliography handling
\RequirePackage
    [backend=biber,
    citestyle=\@citationstyle,
    bibstyle=\@citationstyle,
    defernumbers=true]{biblatex}

\DefineBibliographyStrings{finnish}{%
  bibliography = {Lähteet},
  references = {Lähteet}
}
\DefineBibliographyStrings{english}{%
  bibliography = {References},
  references = {References}
}

\AtBeginBibliography{%
    \renewcommand*{\makelabel}[1]{#1\hss}%
}

% Graphics inclusion and drawing
\RequirePackage{graphicx}

% Caption formatting
\RequirePackage
    [format=hang,
    singlelinecheck=false,
    labelfont={sf,bf,small},
    font={sf,small},
    labelsep={quad}]{caption}
\renewcommand{\arraystretch}{1.25}

% Code listing handling
\RequirePackage{listings}

\lstset{texcl=true, captionpos=b, commentstyle=\tt}

% List of symbols and abbreviations
\RequirePackage[automake, nonumberlist, nopostdot]{glossaries}

\newlength\glsnamewidth
\newglossarystyle{taulong}{%
    \setglossarystyle{long}%
    \renewenvironment{theglossary}{%
      \tablehead{}%
      \tabletail{}%
      \begin{longtable}{p{\glsnamewidth}p{\glsdescwidth}}%
    }{%
      \end{longtable}%
    }%
    \renewcommand{\glossentry}[2]{%
    \raggedright
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \glossentrydesc{##1}\glspostdescription\space ##2\tabularnewline
    }%
}

% Table of contents formatting
\RequirePackage{titletoc}

\if@langenglish
    \addto\captionsenglish{%
        \renewcommand{\contentsname}{Contents}%
        \renewcommand{\listfigurename}{List of Figures}%
        \renewcommand{\listtablename}{List of Tables}%
    }
    \renewcommand{\lstlistlistingname}{List of Programs and Algorithms}
\else
    \addto\captionsfinnish{%
        \renewcommand{\contentsname}{Sisällys}%
        \renewcommand{\listfigurename}{Kuvioluettelo}%
        \renewcommand{\listtablename}{Taulukkoluettelo}%
        \renewcommand{\figurename}{Kuvio}%
    }
    \renewcommand{\lstlistlistingname}{Ohjelma- ja algoritmiluettelo}
\fi

\contentsuse{lstlisting}{lol}

\titlecontents{part}[0pt]{\bf}%
    {\thecontentslabel}{}{\hfill\contentspage}
\dottedcontents{chapter}[2em]{\vspace{8.5pt}}{2em}{0.7pc}
\dottedcontents{section}[5em]{}{3em}{0.7pc}
\dottedcontents{subsection}[9em]{}{4em}{0.7pc}
\dottedcontents{subsubsection}[14em]{}{5em}{0.7pc}
\dottedcontents{figure}[3em]{}{3em}{0.7pc}
\dottedcontents{table}[3em]{}{3em}{0.7pc}
\dottedcontents{lstlisting}[3em]{}{3em}{0.7pc}

\newcommand{\renewlistof}[3]%
{\renewcommand{#1}{%
\vspace{10pt}
\section*{\large\emph{#3}}%
% \addcontentsline{toc}{chapter}{#3}%
\markboth{#3}{#3}%
\ifthenelse{\equal{#2}{lol}}%
{\addtocontents{#2}{\protect\addvspace{10pt}}}%
{}%
\@starttoc{#2}%
}%
}
\renewlistof{\listoffigures}{lof}{\listfigurename}
\renewlistof{\listoftables}{lot}{\listtablename}
\renewlistof{\lstlistoflistings}{lol}{\lstlistlistingname}

\newenvironment{appendices}{%
\setcounter{chapter}{0}
\renewcommand{\thechapter}{\Alph{chapter}}
\renewcommand{\theHchapter}{\Alph{chapter}}
\titleformat
    {\chapter}{\raggedright\LARGE\sffamily%
    \parshape %
    2 %
    0pt \linewidth %
    \chapterindent \dimexpr\linewidth-\chapterindent}
    {\MakeUppercase{\appendixname~\thechapter}}{\chapterspace}
    {\fancyhf{}\cfoot{\thepage}\MakeUppercase{##1}}
\titlecontents{chapter}[0pt]{\vspace{8.5pt}}%
    {\appendixname~\thecontentslabel\hspace{\chapterspace}}{}%
    {\titlerule*[0.7pc]{.}\contentspage}
}{}

% Including original article pdf files.
\RequirePackage{pdfpages}

\includepdfset{%
    offset={0.5\bindingoffsetwidth} 0pt
}

% Image alt texts
\RequirePackage{pdfcomment}

% Automated math alt texts.
\RequirePackage[accsupp]{axessibility}

% Text hyperlinking
\RequirePackage{hyperref}
%\RequirePackage{url}
\urlstyle{same}

%%%%% COMMAND DEFINITIONS %%%%%

% Functional language selection
\newcommand{\xselectlanguage}[1]{%
  \begingroup\edef\x{\endgroup
    \noexpand\selectlanguage{#1}}\x
}

% \title command
\renewcommand{\title}[1]{%
    \gdef\@title{#1}
}
\renewcommand{\@title}[1]{
    \@latex@warning@no@line{No \noexpand\title given.}
}

% \subtitle command
\newcommand{\subtitle}[1]{%
    \gdef\@subtitle{#1}
}
\newcommand{\@subtitle}[1]{
    \@latex@warning@no@line{No \noexpand\subtitle given.}
}

\if@langenglish
    \newcommand{\@firstprinttext}{%
        This and the following page
        will be replaced in the printing house.
    }
    \newcommand{\@lastprinttext}{%
        This and the preceding page
        will be replaced in the printing house.
    }
    \newcommand{\@librarytext}{%
        The series, ISBN and ISSN numbers
        are added on this page in the library.
    }
\else
    \newcommand{\@firstprinttext}{%
        Tämä ja seuraava sivu
        korvataan painossa nimiösivuilla.
    }
    \newcommand{\@lastprinttext}{%
        Tämä ja edellinen sivu
        korvataan painossa nimiösivuilla.
    }
    \newcommand{\@librarytext}{%
        Tälle sivulle lisätään kirjastossa
        sarjan numero, ISBN- ja ISSN-numerot.
    }
\fi

% Make the title
\renewcommand\maketitle{
    \thispagestyle{empty}
    \hspace{0pt}\vfill
    {\raggedleft\LARGE\textsc{\@author}\par}
    \vspace{42pt}
    {\raggedleft\huge\@title\par}
    {\raggedleft\LARGE\@subtitle\par}
    \vfill
    {\raggedleft\sffamily\large\color{red}\@firstprinttext\par}
    \vspace{42pt}
    \clearpage
    \thispagestyle{empty}
    \hspace{0pt}\vfill
    \noindent\@librarytext
    \vfill
    {\raggedleft\sffamily\large\color{red}\@lastprinttext\par}
    \vspace{42pt}
    \cleardoublepage
}

% The \frontmatter command
\renewcommand{\frontmatter}{
    \cleardoublepage
    \pagenumbering{roman}
    \setcounter{page}{1}
    \fancyhf{}
    \cfoot{\thepage}
}

% Make the dedication
\newcommand{\dedication}[1]{
    \cleardoublepage
    \input{#1}
    \cleardoublepage
}

% Make the acknowledgements or preface
\newcommand{\preface}[2]{
    \cleardoublepage
    \chapter*{#1}
    \input{#2}
    \cleardoublepage
}

\if@langenglish
    \newcommand{\@abstractname}{Abstract}
    \newcommand{\@otherabstractname}{Tiivistelmä}
\else
    \newcommand{\@abstractname}{Tiivistelmä}
    \newcommand{\@otherabstractname}{Abstract}
\fi

% Make the abstracts
\newcommand{\abstract}[1]{
    \cleardoublepage
    \chapter*{\@abstractname}
    \input{#1}
    \cleardoublepage
}

\newcommand{\otherabstract}[1]{
    \cleardoublepage
    \chapter*{\@otherabstractname}
    \input{#1}
    \cleardoublepage
}

\if@langenglish
    \newcommand{\@publicationname}{Publication}
    \newcommand{\@publicationplural}{Publications}
    \newcommand{\@listpublicationname}{%
        Original publications}
    \newcommand{\@copyrighttext}{%
        Publication reprinted with
        the permission of the copyright holders.
    }
    \newcommand{\@authorcontributionname}{Author's contribution}
\else
    \newcommand{\@publicationname}{Julkaisu}
    \newcommand{\@publicationplural}{Julkaisut}
    \newcommand{\@listpublicationname}{%
        Alkuperäisjulkaisut}
    \newcommand{\@copyrighttext}{%
        Artikkeleiden käyttöön väitöskirjan
        osana on saatu kustantajan lupa.
    }
    \newcommand{\@authorcontributionname}{Kirjoittajan osuus}
\fi

\newlength\publistlabelwidth
\settowidth{\publistlabelwidth}{\@publicationname8888}
\addtolength{\publistlabelwidth}{\parindent}

\defbibenvironment{thisdissertationstyle}
    {\list
        {\printtext[labelnumberwidth]{%
            \printfield{labelprefix}%
            \printfield{labelnumber}}}
        {\settowidth{\labelnumberwidth}{\@publicationname8888}%
            \setlength{\labelwidth}{\labelnumberwidth}%
            \setlength{\leftmargin}{\labelwidth}%
            \setlength{\labelsep}{\biblabelsep}%
            \addtolength{\leftmargin}{\labelsep}%
            \setlength{\itemsep}{\bibitemsep}%
            \setlength{\parsep}{\bibparsep}}%
        \renewcommand*{\makelabel}[1]{##1\hss}}
    {\endlist}
    {\item}

\newlist{publikeenumerate}{enumerate}{1}
\setlist[publikeenumerate,1]{label={\@publicationname{} \Roman*}, wide=0pt, widest=99, leftmargin=\publistlabelwidth, labelsep=*, itemsep=\bibitemsep}

% Make the list of publications
\newcommand{\listofpublications}{
    \begin{refsection}
    \begin{refcontext}[labelprefix=\@publicationname\addspace, sorting=none]
    \nocite{*}
    \emergencystretch=2em
    \setlength{\bibitemsep}{8.5pt}
    \DeclareFieldFormat{labelnumber}{\ifinteger{##1}{\RN{##1}}{##1}}
    \DeclareFieldFormat{labelnumberwidth}{##1}
    \printbibliography[%
        title=\@listpublicationname,%
        keyword=thisdissertation,%
        env=thisdissertationstyle]
    \end{refcontext}
    \end{refsection}
    \settowidth{\labelnumberwidth}{888}
}

% Make the author's contribution
\newcommand{\authorcontribution}[1]{
    \section*{\large\emph{\@authorcontributionname}}
    \input{#1}
    \cleardoublepage
}

% The \mainmatter command
\renewcommand{\mainmatter}{
    \cleardoublepage
    \newcounter{temp}
    \setcounter{temp}{\value{page}}
    \pagenumbering{arabic}
    \setcounter{page}{\value{temp}}
}

% The \publicationmatter command
\newcommand{\publicationmatter}{
\addtocontents{toc}{\protect\setcounter{tocdepth}{-10}}
\part*{\@publicationplural}
\addtocontents{toc}{\protect\setcounter{tocdepth}{3}}
% APA related fixes
\if@apacitation
\newcommand*{\apablx@ifnotfinalname}{%
  \ifboolexpr{
    test {\ifnumless{\value{listcount}}{\value{liststop}}}
    or
    test \ifmorenames
    }}
\newcommand*{\apablx@ifrevnameappcomma}[2]{%
  \ifdefvoid{##1}
    {\ifdefvoid{##2}}
    {\@secondoftwo}
  {\@secondoftwo}
  {\apablx@ifnotfinalname}%
}
\renewbibmacro*{name:apa:family-given}[5]{%
  \ifuseprefix
    {\usebibmacro{name:delim}{##4##1}%
     \usebibmacro{name:hook}{##4##1}%
     \ifdefvoid{##4}{}{%
       \mkbibnameprefix{##4}\isdot%
       \ifprefchar{}{\bibnamedelimc}}%
     \mkbibnamefamily{##1}\isdot%
     \ifdefvoid{##2}{}{\revsdnamepunct\bibnamedelimd\mkbibnamegiven{##3}\isdot%
                      \ifthenelse{\value{uniquename}>1}
                        {\bibnamedelimd\mkbibbrackets{##2}}
                        {}}%
     \ifdefvoid{##5}{}{\addcomma\bibnamedelimd\mkbibnamesuffix{##5}\isdot}%
     \apablx@ifrevnameappcomma{##2}{##5}
       {\addcomma}
       {}}
    {\usebibmacro{name:delim}{##1}%
     \usebibmacro{name:hook}{##1}%
     \mkbibnamefamily{##1}\isdot
     \ifboolexpe{%
       test {\ifdefvoid{##2}}
       and
       test {\ifdefvoid{##4}}}
       {}
       {\revsdnamepunct}%
     \ifdefvoid{##2}{}{\bibnamedelimd\mkbibnamegiven{##3}%
                      \ifthenelse{\value{uniquename}>1}
                        {\bibnamedelimd\mkbibbrackets{##2}}
                        {}}%
     \ifdefvoid{##4}{}{%
       \bibnamedelimc\mkbibnameprefix{##4}%
       \ifprefchar{}{\bibnamedelimc}}%
     \ifdefvoid{##5}{}{\addcomma\bibnamedelimd\mkbibnamesuffix{##5}\isdot}%
     \apablx@ifrevnameappcomma{##2}{##5}
       {\addcomma}
       {}}}
\renewcommand*{\intitlepunct}{\space}
\fi
\if@ieeecitation
\DeclareFieldFormat[article,periodical]{volume}{\bibstring{jourvol}\addnbspace##1}
\fi
\DeclareFieldFormat[article,inbook,incollection,inproceedings,patent,thesis,unpublished]{title}{##1\isdot}
}

% Make the publication title pages.
\newcounter{publication}
\setcounter{publication}{0}

\DeclareCiteCommand{\thisdissertation}{
%    \cleardoublepage
    \thispagestyle{empty}
    \refstepcounter{publication}
    \addcontentsline{toc}{chapter}{\@publicationname{} \Roman{publication}}
    \hspace*{0pt}\vfill
    {\centering\LARGE\sffamily
        \MakeUppercase{\@publicationname}\\
        \Roman{publication}
    \par}
    \vspace{42pt}
}{%
  {\centering\textbf{\usebibmacro{title}}\par}%
  \medskip
  {\centering\nopunct%
  \printnames[][-\value{listtotal}]{author}\par}%
  \bigskip
  {\centering\small%
  \ifentrytype{article}{%
  \usebibmacro{journal+issuetitle}%
  \usebibmacro{byeditor+others}%
  \usebibmacro{note+pages}%
  }{}%
  \if@apacitation
  \ifentrytype{inbook}{%
  \usebibmacro{in:}%
  \usebibmacro{editor+trans}%
  \usebibmacro{maintitle+booktitle}%
  \printlist{publisher}%
  }{}
  \else
  \ifentrytype{incollection}{%
  \usebibmacro{in:}%
  \usebibmacro{maintitle+booktitle}%
  \usebibmacro{byeditor+others}%
  \printfield{edition}%
  \iffieldundef{maintitle}
    {\printfield{volume}%
     \printfield{part}}{}%
  \printfield{volumes}%
  \usebibmacro{series+number}%
  \printfield{note}%
  \usebibmacro{publisher+location+date}%
  \usebibmacro{chapter+pages}%
  }{}%
  \fi
  \usebibmacro{addendum+pubstate}\par}%
  {\centering\small\nopunct%
  \usebibmacro{doi+eprint+url}\par}%
}{}{
    \bigskip
    {\centering\textbf{\@copyrighttext}\par}
    \vfill\hspace*{0pt}
    \clearpage
    \thispagestyle{empty}
    \cleardoublepage
}

\newlength{\@includewidth}
\newlength{\@includeheight}
\newlength{\@onept}
\setlength{\@onept}{1pt}

\newlength{\@widthratio}
\newlength{\@heightratio}

\newlength{\@truepaperwidth}
\setlength{\@truepaperwidth}{%
    \thispaperwidth-\bindingoffsetwidth%
}

\newcommand{\publication}[2]{
    \thisdissertation{#1}
    \includepdf[%
        pages=-,
        width=\@truepaperwidth,
        height=\paperheight,
        keepaspectratio]{#2}
    \cleardoublepage
}
