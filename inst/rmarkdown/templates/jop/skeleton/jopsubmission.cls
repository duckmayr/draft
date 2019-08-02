\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jopsubmission}[2019/08/02 Article Meeting JOP Submission Guidelines]

% Information about the JOP submission guidelines can be found here:
% https://www.journals.uchicago.edu/journals/JOP/instruct
% https://www.journals.uchicago.edu/journals/jop/style

% We start with an article class,
% making sure the font is 12 point
% and the title and abstract are on their own pages
\LoadClass[12pt, titlepage]{article}

% The etoolbox package will be our friend for messing with commands and macros
\RequirePackage{etoolbox}

% We need ALL text to be double-spaced, including footnotes
\RequirePackage{setspace}
\RequirePackage[bottom]{footmisc}
\doublespacing
\setlength{\footnotesep}{\baselineskip}
\renewcommand{\footnotelayout}{\doublespacing}

% BUT, we can have single-spaced tables and figures
\AtBeginEnvironment{table}{\singlespacing}
\AtEndEnvironment{table}{\doublespacing}
\AtBeginEnvironment{figure}{\singlespacing}
\AtEndEnvironment{figure}{\doublespacing}

% We need footnotes to be the same font size as the main text
\patchcmd{\@footnotetext}{\footnotesize}{\normalsize}{}{}

% We need one-inch margins
\RequirePackage{geometry}
\geometry{margin = 1in}

% We need to get the Appendix counters right.
% Note that the Appendix should be in its own file.
\makeatletter
\apptocmd{\appendix}{
    \setcounter{equation}{0}
    \setcounter{table}{0}
    \setcounter{figure}{0}
    \setcounter{footnote}{0}
    \setcounter{page}{1}
    \renewcommand\thefigure{A\arabic{figure}}
    \renewcommand{\thetable}{A\arabic{table}}
    \renewcommand{\thepage}{\alph{section}: \arabic{page}}
    \renewcommand{\thesection}{\alph{section}}
}
\makeatother

% References; use chicago-authordate like APSR, but ensure use of repeated names
\RequirePackage[natbib=true, style=chicago-authordate]{biblatex}
\makeatletter
\AtEveryBibitem{\global\undef\bbx@lasthash}
\makeatother

% We don't want extra space after paragraphs, and do want to indent paragraphs
\setlength{\parindent}{0.5in}
\setlength{\parskip}{0.0in}

