\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ukydissertation}[2011/01/30 v0.1 UKY Dissertation Class]
\newif\if@endorse
\DeclareOption{endorse}{\@endorsetrue}
\DeclareOption{noendorse}{\@endorsefalse}
\ExecuteOptions{noendorse, 12pt}
\ProcessOptions
\LoadClassWithOptions{report}

\RequirePackage[left=1.5in,right=1in,top=1in,bottom=1in,footskip=0.5in]{geometry}
\RequirePackage[bookmarks,bookmarksopen]{hyperref}
\RequirePackage{bookmark}
%\RequirePackage{tocloft}



\def\college#1{\gdef\@college{#1}}  
\def\@college{\@latex@warning@no@line{No \noexpand\college given}}
\def\director#1{\gdef\@director{#1}}  
\def\@director{\@latex@warning@no@line{No \noexpand\director given}}
\def\dgs#1{\gdef\@dgs{#1}}  
\def\@dgs{\@latex@warning@no@line{No \noexpand\dgs given}}
\def\department#1{\gdef\@department{#1}}  
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\keywords#1{\gdef\@keywords{#1}}  
\def\@keywords{\@latex@warning@no@line{No \noexpand\keywords given}}
\renewcommand\abstract[1]{\renewcommand\@abstract{#1}}
\newcommand\@abstract{\@latex@warning@no@line{No \noexpand\abstract given}}



\def\@makechapterhead#1{%
  %\vspace*{50\p@}%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
    \bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 10\p@
    \fi
    \interlinepenalty\@M
    \bfseries #1\par\nobreak
    \vskip 20\p@
  }}

\def\@makeschapterhead#1{%
  %\vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \centering\bfseries  #1\par\nobreak
    \vskip 20\p@
  }}


\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let\footnote\thanks
  \null
  \bookmark[named=FirstPage,level=-1]{Title Page}
  \vskip 1.5in%
  \begin{center}%  
  \parbox[t][1.5in]{\textwidth}{\centering\MakeUppercase\@title\par}%
  \par
  \parbox[t][3\baselineskip]{0.5\textwidth}{\hrule\vskip\baselineskip%
    \centering DISSERTATION%
    \par\vskip\baselineskip\hrule}
  \vskip\baselineskip%
  {A dissertation submitted in partial fulfillment of the \\
    requirements for the degree of Doctor of Philosophy in the \\
    \@college\\ at the University of Kentucky\par}%
  \vskip 2\baselineskip%
    {By\par\vskip 0.5\baselineskip\@author\par}%
    \vskip 0.5\baselineskip%
    {Lexington, Kentucky\par}%
    \vskip 1em%
    {Director: Dr. \@director, Professor of \@department\par}%
    \vskip 0.5\baselineskip%
    {Lexington, Kentucky\par}%
    \vfill
    {Copyright \textcopyright\ \@author\ \the\year\par}%
    \vspace*{1.5in}\par
  \end{center}\par
  \null
  \end{titlepage}%
  \clearpage
  \setcounter{footnote}{0}%
}

\newcommand\@makeabstract{%
\titlepage
\hypertarget{abstract}{}
\bookmark[dest=abstract,level=0]{Abstract}
\null\vskip 1.5in
\begin{center}%
  \parbox[t][1in]{\textwidth}{\centering ABSTRACT OF DISSERTATION\par}
  \MakeUppercase\@title\par
\end{center}
\@abstract
\par\vspace\baselineskip\noindent 
  KEYWORDS: \parbox[t]{0.8\textwidth}{\@keywords}
  \par\vfill
  \hfill\parbox[t][1.5in]{0.5\textwidth}{%
    \if@endorse
    {\centering\MakeUppercase\@author\par}\vskip 2pt
    \else\fi
    \hrule
    \vskip 2pt
    Student's Signature\par
    \vfil
    \if@endorse
    {\centering\MakeUppercase\@date\par}\vskip 2pt
    \else\fi
    \hrule
  \vskip 2pt
  Date\par}
  \par\vfil\null\endtitlepage\clearpage}

\newcommand\@makeapproval{
  \thispagestyle{empty}
  \null\vskip 2in
  \noindent\parbox[t][1in]{\textwidth}{\centering\MakeUppercase\@title\par}\par
  \begin{centering}
    By
    \vskip0.5\baselineskip
    \@author\par
  \end{centering}
  \vfill 
  \hfill\parbox[t][3in]{0.5\textwidth}{%
    \if@endorse
    {\centering\MakeUppercase\@director\par}\vskip 2pt
    \else\fi
    \hrule
    \vskip 2pt
    Director of Dissertation\par
    \vfil
    \if@endorse
    {\centering\MakeUppercase\@dgs\par}\vskip 2pt
    \else\fi
    \hrule
    \vskip 2pt
    Director of Graduate Studies\par
    \vfil
    \if@endorse
    {\centering\MakeUppercase\@date\par}\vskip 2pt
    \else\fi
    \hrule
  \vskip 2pt
  Date\par}\hskip 1in
    \par\vfil\clearpage}


\newif\if@dedication
\@dedicationfalse
\newif\if@acknowledgements
\@acknowledgementsfalse

\newcommand\dedication[1]{\@dedicationtrue\gdef\@dedication{#1}}
\newcommand\acknowledgements[1]{\@acknowledgementstrue
  \gdef\@acknowledgements{#1}}

\newcommand\@makeacknowledgements{
  \if@acknowledgements%
  \phantomsection
  \addcontentsline{toc}{chapter}{Acknowledgements}
  \null
  \begin{center}
    ACKNOWLEDGEMENTS
  \end{center}
  \par\noindent
  \@acknowledgements
  \par\vfil\clearpage\fi}

%\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}


\newif\if@mainmatter
\@mainmatterfalse

\newcommand\@makededication{%
  \if@dedication
  %\titlepage%
\null\vfil
  \@dedication
  \par\vfil%\endtitlepage
  \clearpage\fi}

\newcommand\makefrontmatter{%
  \pagenumbering{Roman}
  \maketitle
  \@makeabstract
  \pagenumbering{roman}
  \setcounter{page}{1}
  \@makeapproval
  \@makededication
  \@makeacknowledgements
  \clearpage
  \hypertarget{tocpage}{}\bookmark[dest=tocpage]{Table of Contents}
  \tableofcontents
  \clearpage 
  \phantomsection
  \addcontentsline{toc}{section}{List of Tables}
  \listoftables
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{List of Figures}
  \listoffigures
  \clearpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\abstract\relax
  \global\let\dedication\relax
}

\newcommand\backmatter{\@mainmatterfalse\appendix}


\newcommand\@period[1]{#1.--- }
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {\z@}%
                                    {\normalfont\normalsize\itshape\@period}}
