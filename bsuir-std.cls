%%% Local Variables:
%%% coding: utf-8
%%% mode: latex
%%% TeX-engine: xetex
%%% End:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xelatex-bsuir-std/bsuir-std}[2024/12/16 Class conforming to BSUIR standard]

\LoadClass[a4paper,14pt]{extarticle}

%%%%%%%%%%
% Пакеты %
%%%%%%%%%%

\RequirePackage{tabularray}
\UseTblrLibrary{counter, amsmath}

\RequirePackage{tocloft} % Для настройки оглавления
\RequirePackage{fontspec} % Если вы используете XeLaTeX или LuaLaTeX для работы с шрифтами
\RequirePackage{etoolbox} % Для дополнительных манипуляций с командами
\RequirePackage{csquotes} % Чтобы автоматически заменять прямые кавычки " на «ёлочки» в LaTeX, вы можете воспользоваться пакетом csquotes
\RequirePackage{lastpage} % Для подсчёта общего числа страниц

% Чтобы сделать отступы по СТП-2024 приложение Л
\RequirePackage{geometry}

% Добавляем polyglossia, с ним же добавиться fontspec и можем
% использовать шрифт Times New Roman в XeLaTeX
% При том одним только fontspec не обойтись, потому что в
% polyglossia ещё команда setdefaultlanguage, которая позволяет
% установить русский язык в качестве основного, без чего
% не будут нормально в русском переносы работать.
\RequirePackage{polyglossia}

% Чтобы более гибко настроить межстрочный интервал в списках и перечислениях
\RequirePackage{enumitem} % https://tex.stackexchange.com/a/519982

\RequirePackage{graphicx} % Картинки Иллюстрации

% Картинки и другие float'ы там где написал инклюд через H
\RequirePackage{float}

% Подписи к картинкам.
\RequirePackage{caption}

% titles
\RequirePackage{titlesec}
\RequirePackage{titleps}


\RequirePackage{amsmath}
\RequirePackage{unicode-math}

\RequirePackage{url}

\RequirePackage{tocbasic}

\RequirePackage{setspace}
\RequirePackage{hyphenat}
\RequirePackage{lscape} % for rotated tables
\RequirePackage{rotating}

%%%%%%%
% СТП %
%%%%%%%

% Команда \sloppy в LaTeX ослабляет требования к качеству выравнивания текста, 
% чтобы предотвратить выход строк за правую границу (переполнение).
\sloppy % Разрешает более свободные переносы 


% Зачем: Отключает использование изменяемых межсловных пробелов.
% Почему: Так не принято делать в текстах на русском языке.
\frenchspacing

\lefthyphenmin=2
\righthyphenmin=2
\tolerance=9999
\emergencystretch=100pt
\hyphenpenalty=10000
\exhyphenpenalty=100

\renewpagestyle{plain}{%
  \sethead{}{}{}  
  \setfoot[\thepage][][]{}{}{\raisebox{2mm}\thepage}  
}
\pagestyle{plain}

% Настройка отступов вокруг формул вне таблиц
\g@addto@macro\normalsize{%
  \setlength\abovedisplayskip{18pt}%
  \setlength\belowdisplayskip{18pt}%
  \setlength\abovedisplayshortskip{18pt}%
  \setlength\belowdisplayshortskip{18pt}%
}

% Чтобы автоматически заменять прямые кавычки " на «ёлочки»
\DeclareQuoteStyle{russian}% 
  {\guillemotleft}% 
  {\guillemotright}% 
  {\guillemotleft}% 
  {\guillemotright}%

\MakeOuterQuote{"}

% интервал между строк
% В СТП-2017 не оговорен, просто сказано в пункте 2.1.1
% В СТП-2024 интервал уже оговорен и равен единице
% «межстрочный интервал – 1,0 (18 пунктов),»
% 40 +- 3 строки на страницу
\singlespacing

\setstretch{1}

% Содержание по СТП
% Look at comadocs for setting up toc
% https://mirror.datacenter.by/pub/mirrors/CTAN/macros/latex/contrib/koma-script/doc/scrguide-en.pdf
\DeclareTOCStyleEntries[
  beforeskip=0pt,          % интервал перед записью
  linefill=\dotfill,       % заполнитель в виде точек
  entryformat=\normalfont, % обычное начертание текста
  pagenumberformat=\normalfont, % обычное начертание номеров страниц
]{tocline}{section,subsection,subsubsection}


\DeclareTOCStyleEntry[
  indent=0em,
  numwidth=0.8em,
]{tocline}{section}
\DeclareTOCStyleEntry[
  indent=0.8em,
  numwidth=1.5em,
]{tocline}{subsection}
\DeclareTOCStyleEntry[
  indent=2.3em,
  numwidth=2.2em,
]{tocline}{subsubsection}


% Приложение Л. СТП-2024

\geometry{left=25mm, top=12mm, right=12mm, bottom=15mm}

% если будет \geometry{left=30mm, top=20mm, right=15mm, bottom=20mm}
% то слева будет 35mm  
% справа будет 18mm  
% сверху будет 28mm
% снизу будет 25mm

% СТП-2024 Пункт 2.1.1
% «абзацный отступ – 1,25 см»
\setlength{\parindent}{12.5mm}


\setlist[enumerate, 1]{
  label = \arabic* , % Поставить номер без точки
  nosep,   % У списков по СТП такой межстрочный интервал
  itemindent = *,
  labelindent = 12.5mm,
  leftmargin = 0mm,
}

\AddEnumerateCounter{\asbuk}{\russian@asbuk@alph}{щ} % section 8.1

\setlist[enumerate, 2]{ % Второй уровень в нумерованных перечислениях
  label = \asbuk*) ,
  nosep,   % У списков по СТП такой межстрочный интервал
  labelindent = 25mm,
  leftmargin = *,
}

\setlist[itemize, 1]{ % Первый уровень в нумерованных перечислениях
  label = \textendash,
  nosep,   % У списков по СТП такой межстрочный интервал
  itemindent = *,
  labelindent = 12.5mm,
  leftmargin = 0mm,
}

% Считать рисунки и таблицы в пределах глав.
\counterwithin{figure}{section}
\counterwithin{table}{section}

% Оглавление секций:
% Отсуствие точек у номеров
% Верхний регистр
%
% https://tex.stackexchange.com/a/324041
% https://mirror.datacenter.by/pub/mirrors/CTAN/macros/latex/contrib/titlesec/titlesec.pdf

\titleformat{\section}[hang]
{\normalfont\bfseries\raggedright}{\hspace{12.5mm}\thesection}{0.4em}{\MakeUppercase}

\titleformat{\subsection}[hang]
{\normalfont\bfseries\raggedright}{\hspace{12.5mm}\thesubsection}{0.4em}{}

\titleformat{\subsubsection}[hang]
{\normalfont\bfseries\raggedright}{\hspace{12.5mm}\thesubsubsection}{0.4em}{}

\titleformat{name=\section,numberless}[block]
{\normalfont\bfseries}{}{0.4em \centering}{\MakeUppercase}

\titlespacing*{\section}
{0pt}{18pt}{18pt}  % section: 18pt до/после

\titlespacing*{\subsection}
{0pt}{18pt}{18pt}  % subsection: 18pt до/после

\titlespacing*{\subsubsection}
{0pt}{18pt}{18pt}  % subsubsection: 18pt до/после

\titlespacing*{name=\section,numberless}
{0pt}{18pt}{18pt}  % безымянные секции: 18pt до/после


\counterwithin{equation}{section}

% Нумерация и подписи к рисункам
\captionsetup[figure]{
    name={Рисунок},
    labelsep=endash,
    justification=centering,
    skip=18pt,
}
\numberwithin{figure}{section}

% Обнуляем стандартные отступы LaTeX для figure
\AtBeginEnvironment{figure}{%
  \setlength{\intextsep}{0pt}      % Отступы внутри текста (для [h])
  \setlength{\floatsep}{0pt}       % Между float'ами (для [t], [b])
  \setlength{\textfloatsep}{0pt}   % Между float'ами и текстом
  \setlength{\abovecaptionskip}{0pt} % Над подписью
  \setlength{\belowcaptionskip}{0pt} % Под подписью
}
\BeforeBeginEnvironment{figure}{\vspace{18pt}}
\AfterEndEnvironment{figure}{\vspace{7pt}}

% Название таблиц  по стп 2024
\DeclareCaptionFormat{bsuirtable}{%
    \raggedright
    \hangindent=6em% Отступ для последующих строк
    \hangafter=1% Применять отступ после первой строки
    #1#2#3%
}
\captionsetup[table]{
    format=bsuirtable,
    singlelinecheck=false,
    labelsep=endash,
    skip=1mm,
    position=above,
    parindent=0pt, % Убираем стандартный отступ
}

\newcommand{\eqt}[1]{
  \vbox{
    \[
      #1
    \]
  }
}

\newcommand{\neqt}[1]{
  \vbox{
    \begin{equation}
      #1,
    \end{equation}
  }
}


%%%%%%%%%%%%%%%%%%%
% ifxetex section %
%%%%%%%%%%%%%%%%%%%

\RequirePackage{iftex}
% Я использую XeLaTeX потому что это позволяет использовать системный
% Times New Roman
\ifXeTeX
  %% устанавливает главный язык документа
  \setdefaultlanguage[spelling=modern]{russian}
  %% устанавливает второй язык документа
  \setotherlanguage{english}

  % СТП-2024 пункт 2.1.1
  % Устанавливаем основным шрифтом системный Times new Roman
  \setmainfont{Times New Roman}
  \newfontfamily{\cyrillicfont}{Times New Roman}[Script=Cyrillic]
  \newfontfamily{\cyrillicfontsf}{Times New Roman}[Script=Cyrillic]
  % Выставляем в качестве моноширинного шрифта системный Courier
  \setmonofont{Courier New}
  \newfontfamily{\cyrillicfonttt}{Courier New}

  \providecommand{\No}{\textnumero}

  %% Убираем предупреждение о использовании команды \cyr из eskdx
  \RequirePackage{xecyr}
  % Почему раньше был использован класс eskdx?
  % Главным образом потом что он позволяет
  % - Делать секции по ГОСТ 2.105-95
  % - Писать спецификацию
  % - Не подгружать пакет geometry, отступы уже в соответсвии с приложением Л СТП 


  % \setmathfont{Cambria Math}

  % Автоматическая Замена `--` на endash
  \RequirePackage{xesearch}
  \UndoBoundary{-}
  \SearchList{dash}{\textendash}{--}

\fi
