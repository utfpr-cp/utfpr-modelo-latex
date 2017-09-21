%% version 1.0
%% utfprcptex2.cls
%% Copyright 2017      Rodrigo Rodrigues Sumar <sumar@utfpr.edu.br>
%% Copyright 2017      Bruno Augusto Angélico <bangelico@utfpr.edu.br>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
% http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% dependência: abntex2 >= 1.9.6

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Primeira parte: Identificação
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Esta é uma classe Latex2e:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utfprcptex2}[2017/02/20 Classe de Normas para Trabalhos da UTFPR]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions
\ProcessOptions\relax
\LoadClass[
%cleardoublepage=plain,
%pagestart=firstchapter,
chapter=TITLE,
section=TITLE,
               english,		  % idioma adicional para hifenização
               french,		  % idioma adicional para hifenização
               spanish,		  % idioma adicional para hifenização
               brazil		  % o último idioma é o principal do documento
              %floatnumber=continuous
           ]{abntex2}
%-------------------------------------------------------------
%% Desabilita a emulação de alguns pacotes pela classe memoir
%% Para evitar incompatibilidade
\DisemulatePackage{index}
\DisemulatePackage{setspace}
\DisemulatePackage{tocstyle}
%-------------------------------------------------------------
% Pacotes carregados para implementar a classe UTFPR
%-------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage[latin1]{inputenc} % pacote para acentuacao direta
\RequirePackage[acronym, nosuper, nowarn, sanitize={description=false}, style=index]{glossaries}%% Glossários e listas de acrônimos
\RequirePackage{array}
\RequirePackage{index}
\RequirePackage{rotating,newfloat}
\RequirePackage{multirow}
\RequirePackage{colortbl}
\RequirePackage{hhline}
\RequirePackage{ifthen}
\RequirePackage{lastpage}
\RequirePackage{perpage}
\RequirePackage{xparse}
\RequirePackage{fancyhdr}%
%%%%% Ajuste das Margens
\RequirePackage[paper=A4,pagesize]{typearea}
%Podem utilizar GEOMETRY{...} para realizar pequenos ajustes das margens. Onde, left=esquerda, right=direita, top=superior, bottom=inferior. P.ex.:
\RequirePackage[left=3.0cm,right=2cm,top=3cm,bottom=2cm,a4paper,
%            showframe
            ]{geometry}
\RequirePackage{xcolor}
\RequirePackage{longtable}
\RequirePackage{morewrites}%% Espaços adicionais para comandos \write*
\RequirePackage{calc} % standard package for length and number easy calculations
\RequirePackage{etoolbox}
\RequirePackage{multicol}% multicol - better multicolunms
\RequirePackage{microtype} % para melhorias de justificação
\@ifpackageloaded{breakurl}%% Verificação do pacote breakurl
  {\PassOptionsToPackage{hyphenbreaks}{breakurl}}{\RequirePackage[hyphenbreaks]{breakurl}}%% Quebra de linha em endereços da web
\usepackage{remreset}		% reinicia contadores
\definecolor{meucinza}{rgb}{0.5, 0.5, 0.5} % Definindo novo cinza
\definecolor{blue}{RGB}{41,5,195} % Alterando o aspecto da cor azul
% ---
% Pacotes de citações
% ---
\RequirePackage[brazilian,hyperpageref]{backref}	 % Paginas com as citações na bibl
\RequirePackage[alf,bibjustif,recuo=0cm]{abntex2cite}	% Citações padrão ABNT
%% Configurações do pacote backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}%% Comando usado sem a opção hyperpageref do pacote backref
\renewcommand{\backref}{}%% Texto padrão antes do número das páginas
\renewcommand*{\backrefalt}[4]{%% Definição dos textos da citação
  \ifcase #1%%
    Nenhuma citação no texto.%%
  \or%%
    Citado na página #2.%%
  \else%%
    Citado #1 vezes nas páginas #2.%%
  \fi
}

%% Configurações do pacote abntex2cite
\AtBeginDocument{%% Definições carregadas no início do documento
  \citeoption{abnt-emphasize=bf}
  \citeoption{abnt-etal-cite=3}
  \citeoption{abnt-etal-list=3}
  \citeoption{abnt-full-initials=yes}
  \citeoption{abnt-repeated-title-omit=yes}
  \citeoption{abnt-thesis-year=both}
  \citeoption{abnt-url-package=url}
  }
%%%%%%%%%%%%%%%%%%%
\PassOptionsToPackage{hyperindex=false}{hyperref}
%% Informações do PDF
\makeatletter
\hypersetup{
     	%pagebackref=true,
		%pdftitle={\@title},
		%pdfauthor={\@author},
    	%pdfsubject={\imprimirpreambulo},
%	    pdfcreator={LaTeX with abnTeX2},
%		pdfkeywords={abnt}{latex}{abntex}{abntex2}{trabalho acadêmico},
		colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=blue,          	% color of internal links
    	citecolor=blue,        		% color of links to bibliography
    	filecolor=magenta,      		% color of file links
		urlcolor=blue,
		bookmarksdepth=4
}
\makeatother
% ---
\RequirePackage{nomencl} % Pacote necessário para a lista de siglas.


%%%%%%%%%%%%%
%\RequirePackage[tocflat]{tocstyle}
%\deactivatetocstyle[flt]
%\deactivatetocstyle[lot]
%\deactivatetocstyle[lof]
%%%%%%

\captiondelim{\space--\space}%% Delimitador das legendas
\captionnamefont{\ABNTEXfontereduzida\bfseries}%% Fonte do nome das legendas
\captiontitlefont{\ABNTEXfontereduzida\bfseries}%% Fonte do título das legendas
\RequirePackage[
format=hang,
justification=justified,
singlelinecheck=false,
labelfont=bf,
labelsep=endash,
textfont=bf,
skip=1pt
]{caption}
\hangcaption%% Recuo do texto das legendas
\renewcommand{\captionfont}{\fontsize{10}{12}\selectfont}
\captionstyle[\raggedright]{\raggedright}
%---------------------------------------------------
\RequirePackage{listings} % O pacote para adição de código fonte em múltiplas linguagens
\RequirePackage{algorithmic} %% Pacote para algoritmos em pseudocódigo
%---------------------------------------------------

\makeatletter	%Para que se entenda o @

\setlength\parskip{0pt} %% Alterado para zero para o espacamento entre paragrafos ser de aproximadamente 1.5 linhas.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Line spacing stuff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Since version 0.3 the `setspace' package is used.

% Space scheme in notes (footnotes and margin notes) removed since
% version 0.3 since setspace do not support it; footnotes are always
% single spaced!

% \espaco{} - ativa o espacamento para um numero dado (taxa de
% esticamento), mas aceita os parametros simples, umemeio, e duplo.

% Stretch factor for default line spacing schemes
\RequirePackage{setspace}

\newcommand*{\taxaespacosimples}{1.}
\newcommand*{\taxaespacoumemeio}{1.35}
\newcommand*{\taxaespacoduplo}{1.7}

\newcommand{\espaco}[1]%
{\ifthenelse{\equal{#1}{simples}}% se espacamentos simples
  {\setstretch{\taxaespacosimples}} % entao
  { %senao (espaco simples)
   \ifthenelse{\equal{#1}{umemeio}}% se espaco 1 1/2
     {\setstretch{\taxaespacoumemeio}} % entao
     {%senao (espaco 1 1/2)
      \ifthenelse{\equal{#1}{duplo}}% se espaco duplo
        {\setstretch{\taxaespacoduplo}}% entao
        {\setstretch{#1}} % senao espaco dado
     } %fim se espaco 1 1/2
  } %fim se espaco simples
}%fim newcommand

\newenvironment{espacosimples}
  {\begin{spacing}{\taxaespacosimples}}{\end{spacing}}

\newenvironment{espacoumemeio}
  {\begin{spacing}{\taxaespacoumemeio}}{\end{spacing}}

\newenvironment{espacoduplo}%
  {\begin{spacing}{\taxaespacoduplo}}{\end{spacing}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Segunda parte: Declaração das opções da UTFPR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\UTFPRsignwidth}
\setlength{\UTFPRsignwidth}{8cm}

% thickness of the line
\newlength{\UTFPRsignthickness}
\setlength{\UTFPRsignthickness}{0pt}

% ammount of space left between previous text and th signature line
\newlength{\UTFPRsignskip}
\setlength{\UTFPRsignskip}{2.5cm}

%%%%%%    Indent code

% indenting first paragraph of each section
\RequirePackage{indentfirst}
% paragraph indentation size and skip
\setlength{\parindent}{.7cm}
\setlength{\parskip}{0cm}
%%%%%% Adequar comprimento da linha do rodapé as normas da utfpr
\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 5cm height 1pt
  \kern 2pt
}
%%%%%%%%%%%%%%%%%%%%%
% Logotipo:
\newcommand{\utfprtex}{{\textrm{U\kern-.15em\lower.7ex\hbox{T}\kern-.125em{FPRCP}\kern-.125em T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX2}}}

\newlength{\siglawidth}
\newlength{\siglamaxwidth}
\newlength{\simbwidth}
\newlength{\simbmaxwidth}
\newlength{\abrevwidth}
\newlength{\abrevmaxwidth}
% Comandos para selecionar o tipo de fonte
\renewcommand{\rmdefault}{ptm}%% Fonte Adobe Times
\renewcommand{\sfdefault}{phv}%% Fonte Adobe Helvetica
\renewcommand{\ttdefault}{pcr}%% Fonte Adobe Courier

\newcommand{\fontetipo}[1]%
{
\ifthenelse{\equal{#1}{times}}
           {\renewcommand*\familydefault{\rmdefault}\usepackage{times}}{\RequirePackage[scaled=0.9]{helvet}} % Times (Nimbus Roman)
\ifthenelse{\equal{#1}{arial}}
           {\renewcommand*\familydefault{\sfdefault}\usepackage{helvet}}{\RequirePackage[scaled=0.9]{helvet}}%\usepackage[scaled]{uarial}}{}% Arial
}

\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% -----
% Declaracoes de cabecalhos
% -----
% Cabecalho padrao
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{0pt}{\normalrulethickness}

% Cabecalho do inicio do capitulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}
% ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% ENTRADAS REFERENTES A INSTITUICAO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\providecommand{\UTFPRinstituicaodata}{}
\renewcommand{\instituicao}[1]{\renewcommand{\UTFPRinstituicaodata}{#1}}

\providecommand{\UTFPRunidadedata}{}
\newcommand{\unidade}[1]{\renewcommand{\UTFPRunidadedata}{#1}}

\providecommand{\UTFPRabrev}{}
\newcommand{\abreviatura}[1]{\renewcommand{\UTFPRabrev}{#1}}

\providecommand{\UTFPRdiretoriadata}{}
\newcommand{\diretoria}[1]{\renewcommand{\UTFPRdiretoriadata}{#1}}

\providecommand{\UTFPRcoordenacaodata}{}
\newcommand{\coordenacao}[1]{\renewcommand{\UTFPRcoordenacaodata}{#1}}

\providecommand{\UTFPRcursodata}{}
\newcommand{\curso}[1]{\renewcommand{\UTFPRcursodata}{#1}}

\providecommand{\UTFPRareadata}{}
\newcommand{\area}[1]{\renewcommand{\UTFPRareadata}{#1}}

\providecommand{\UTFPRniveldata}{}
\newcommand{\nivel}[1]{\renewcommand{\UTFPRniveldata}{#1}}

\providecommand{\UTFPRtitulacaodata}{}
\newcommand{\titulacao}[1]{\renewcommand{\UTFPRtitulacaodata}{#1}}

\providecommand{\UTFPRdiscip}{}
\newcommand{\discipUTFPR}[1]{\renewcommand{\UTFPRdiscip}{#1}}

\providecommand{\UTFPRlab}{}
\newcommand{\labUTFPR}[1]{\renewcommand{\UTFPRlab}{#1}}

\providecommand{\UTFPRcoordenadorname}{}
\providecommand{\UTFPRcoordenadordata}{}
\providecommand{\UTFPRcoordenadorStr}{}
\newcommand{\coordenadorUTFPR}[3][Coordenador]%
  {\renewcommand{\UTFPRcoordenadorname}{#3}%
   \renewcommand{\UTFPRcoordenadordata}{#2}
   \renewcommand{\UTFPRcoordenadorStr}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% ENTRADAS REFERENTES AOS AUTORES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\providecommand{\UTFPRautordata}{}
\renewcommand{\autor}[1]{\renewcommand{\UTFPRautordata}{#1}}
\let\author\autor\relax
\providecommand{\UTFPRautordoisdata}{}
\newcommand{\autordois}[1]{\renewcommand{\UTFPRautordoisdata}{#1}}

\providecommand{\UTFPRautortresdata}{}
\newcommand{\autortres}[1]{\renewcommand{\UTFPRautortresdata}{#1}}

\providecommand{\UTFPRautorquatrodata}{}
\newcommand{\autorquatro}[1]{\renewcommand{\UTFPRautorquatrodata}{#1}}

\providecommand{\UTFPRautorcincodata}{}
\newcommand{\autorcinco}[1]{\renewcommand{\UTFPRautorcincodata}{#1}}

\providecommand{\UTFPRautorseisdata}{}
\newcommand{\autorseis}[1]{\renewcommand{\UTFPRautorseisdata}{#1}}

\providecommand{\UTFPRcitadata}{}
\newcommand{\cita}[1]{\renewcommand{\UTFPRcitadata}{#1}}

%%% USADOS NO MODELO DE PRE PROJETOS %%%%%%
\providecommand{\UTFPRemailaluno}{}
\newcommand{\emailaluno}[1]{\renewcommand{\UTFPRemailaluno}{#1}}

\providecommand{\UTFPRcodigoaluno}{}
\newcommand{\codigoaluno}[1]{\renewcommand{\UTFPRcodigoaluno}{#1}}

\providecommand{\UTFPRfone}{}
\newcommand{\fonealuno}[1]{\renewcommand{\UTFPRfone}{#1}}
%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% ENTRADAS REFERENTES AO DOCUMENTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\providecommand{\UTFPRtitulodata}{}
\renewcommand{\titulo}[1]{\renewcommand{\UTFPRtitulodata}{#1}}

\providecommand{\UTFPRdocumentodata}{}
\newcommand{\documento}[1]{\renewcommand{\UTFPRdocumentodata}{#1}}

\providecommand{\UTFPRtitledata}{}
\renewcommand{\title}[1]{\renewcommand{\UTFPRtitledata}{#1}}

\providecommand{\UTFPRpalavraschavedata}{}
\newcommand{\palavraschave}[1]{\renewcommand{\UTFPRpalavraschavedata}{#1}}

\providecommand{\UTFPRkeywordsdata}{}
\newcommand{\keywords}[1]{\renewcommand{\UTFPRkeywordsdata}{#1}}

\providecommand{\UTFPRcomentariodata}{}
\newcommand{\comentario}[1]{\renewcommand{\UTFPRcomentariodata}{#1}}

\providecommand{\UTFPRlocaldata}{}
\renewcommand{\local}[1]{\renewcommand{\UTFPRlocaldata}{#1}}

\providecommand{\UTFPRdatadata}{}
\renewcommand{\data}[1]{\renewcommand{\UTFPRdatadata}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% ENTRADAS REFERENTES AOS ORIENTADORS E MEMBROS DA BANCA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecommand{\UTFPRorientadorStr}{}
\providecommand{\UTFPRorientadordata}{}
\providecommand{\UTFPRorientadorname}{}
\renewcommand{\orientador}[3][Orientador]%
  {\renewcommand{\UTFPRorientadorname}{#3}%
   \renewcommand{\UTFPRorientadordata}{#2}
   \renewcommand{\UTFPRorientadorStr}{#1}
}

\providecommand{\UTFPRcoorientadorname}{}
\providecommand{\UTFPRcoorientadordata}{}
\providecommand{\UTFPRcoorientadorStr}{}
\renewcommand{\coorientador}[3][Co-orientador]%
  {\renewcommand{\UTFPRcoorientadorname}{#3}%
   \renewcommand{\UTFPRcoorientadordata}{#2}%
   \renewcommand{\UTFPRcoorientadorStr}{#1}
}

%%% USADOS NO MODELO DE PRE PROJETOS %%%%%%
\providecommand{\UTFPRemailori}{}
\newcommand{\emailorientador}[1]{\renewcommand{\UTFPRemailori}{#1}}

\providecommand{\UTFPRemailcoori}{}
\newcommand{\emailcoorientador}[1]{\renewcommand{\UTFPRemailcoori}{#1}}
%%%%%%

%200611: mais coorientadores
\providecommand{\UTFPRcoorientadorbdata}{}
\newcommand{\coorientadorb}[1]{\renewcommand{\UTFPRcoorientadorbdata}{#1}}

%%%%%%%% OUTROS COMANDOS %%%%%%%%%%%%%
\newcommand{\UTFPRifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}
\newcommand{\UTFPRnotempty}[3]{\ifthenelse{\not\equal{#1}{}}{#2}{#3}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPA DISSERTACAO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\capa}{
\if@openright		% Garante que se a página for "direita"
     \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\thispagestyle{empty} 	% Define o estilo desta página como vazio
	\begin{center}
		  \begin{espacosimples}
				{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRinstituicaodata}}\par}
				\UTFPRifnotempty{\UTFPRunidadedata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRunidadedata}}\par}
                \UTFPRifnotempty{\UTFPRdiretoriadata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRdiretoriadata}}\par}
                \UTFPRifnotempty{\UTFPRcoordenacaodata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRcoordenacaodata}}\par}
				{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRcursodata}}\par}	
		\end{espacosimples}		
	\end{center}		
		\vspace{12pt}	
		\begin{center}
			\begin{espacosimples}
				{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautordata}}\par}
				\UTFPRifnotempty{\UTFPRautordoisdata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautordoisdata}}\par}{\vspace{18pt}}
				\UTFPRifnotempty{\UTFPRautortresdata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautortresdata}}\par}{\vspace{18pt}}
				\UTFPRifnotempty{\UTFPRautorquatrodata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautorquatrodata}}\par}{\vspace{18pt}}
			\end{espacosimples}
		\end{center}
		\vspace{60pt}
		\begin{center}
		  \begin{espacosimples}
		       {\fontsize{14}{14}\selectfont \textbf{\MakeUppercase{\UTFPRtitulodata}}\par}
		  \end{espacosimples}
		\end{center}
		\vspace{12pt}
		\begin{center}
			{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRdocumentodata}}\par}%
		\end{center}
		\vfill
		\begin{center}
			{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRlocaldata}}\par}
			{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRdatadata}}}
		\end{center}
\vspace{1cm}
\if@restonecol\twocolumn \else \newpage \fi
\if@twoside\setcounter{page}\z@ \else\setcounter{page}{1} \fi	% Reseta o contador de páginas. Parece não ser necessário aqui
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPA TRABALHO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\capatrab}{
\if@openright		% Garante que se a página for "direita"
     \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn
  \@restonecoltrue\onecolumn
\else
  \@restonecolfalse\newpage
\fi
\thispagestyle{empty}
	   \begin{center}
            \begin{espacosimples}
				{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRinstituicaodata}}}\par
				\UTFPRifnotempty{\UTFPRunidadedata}{{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRunidadedata}}}\par}
                \UTFPRifnotempty{\UTFPRdiretoriadata}{{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRdiretoriadata}}\par}}
                \UTFPRifnotempty{\UTFPRcoordenacaodata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRcoordenacaodata}}\par}
				{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRcursodata}}\par}
                {\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRlab}}\par}
                {\fontsize{12}{13}\selectfont \textbf{DISCIPLINA: \MakeUppercase{\UTFPRdiscip}}\par}
                {\fontsize{12}{13}\selectfont \textbf{DOCENTE: \MakeUppercase{\UTFPRorientadorname}}}	
	       \end{espacosimples}		
	 \end{center}		
		\vfill
		\begin{center}
		  \begin{espacosimples}
			{\fontsize{14}{14}\selectfont \textbf{\MakeUppercase{\UTFPRtitulodata}}} \par
			\end{espacosimples}
		\end{center}
        \vfill
		\begin{center}
			\begin{espacosimples}
				{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautordata}}}\par
				\UTFPRnotempty{\UTFPRautordoisdata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautordoisdata}}\par}{\vspace{18pt}}
				\UTFPRnotempty{\UTFPRautortresdata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautortresdata}}\par}{\vspace{18pt}}
				\UTFPRnotempty{\UTFPRautorquatrodata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautorquatrodata}}\par}{\vspace{18pt}}
                \UTFPRnotempty{\UTFPRautorcincodata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautorcincodata}}\par}{\vspace{18pt}}
                \UTFPRnotempty{\UTFPRautorseisdata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautorseisdata}}\par}{\vspace{18pt}}
			\end{espacosimples}
		\end{center}
        \vfill
        \begin{center}
			{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRlocaldata}}}\par
			{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRdatadata}}}
		\end{center}
\if@restonecol\twocolumn \else \newpage \fi
\if@twoside\setcounter{page}\z@ \else\setcounter{page}{1} \fi	% Reseta o contador de páginas. Parece não ser necessário aqui
\espaco{\taxaespacoumemeio}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPA PARA PRE-PROPOSTA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\capapre}{
\UTFPRifnotempty{\UTFPRcoorientadorname}
% SE TIVER COOORIENTADOR
{ \fontsize{12}{14}\selectfont
     \if@twocolumn
  \@restonecoltrue\onecolumn
\else
  \@restonecolfalse\newpage
\fi
%\thispagestyle{empty}
     \renewcommand{\thepage}{}
       \begin{center}
		  \begin{espacosimples}
				{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRinstituicaodata}\par}
				\UTFPRifnotempty{\UTFPRunidadedata}{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRunidadedata}\par}
                \UTFPRifnotempty{\UTFPRdiretoriadata}{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRdiretoriadata}\par}
                \UTFPRifnotempty{\UTFPRcoordenacaodata}{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRcoordenacaodata}\par}
				{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRcursodata}\\}	
		\end{espacosimples}		
	 \end{center}
      \noindent \newline
      \begin{center}
      \begin{tabular}{| C{5cm} |}
            \hline
           \fontsize{14}{14}\selectfont  \textbf PRÉ-PROJETO \\
            \hline
      \end{tabular}\vspace{30pt}
      \end{center}
     \begin{center}
		  \begin{espacosimples}
		       {\fontsize{14}{14}\selectfont  \textbf \MakeUppercase \UTFPRtitulodata \par}
		  \end{espacosimples}
	 \end{center}\vspace{12pt}
    \begin{espacosimples} \noindent
     \begin{tabular}{| m{0.25\linewidth} | m{0.25\linewidth} |m{0.25\linewidth}|m{0.25\linewidth}|}
            \hline
            \textbf{Nome:} & \textbf{Código:} & \textbf{Telefone:} & \textbf{E-mail:} \\
            {\fontsize{12}{14}\selectfont \UTFPRautordata} & {\fontsize{12}{14}\selectfont \UTFPRcodigoaluno} & \UTFPRfone & \texttt{\UTFPRemailaluno}\\
            \hline
            \multicolumn{2}{|l|}{\fontsize{12}{14}\selectfont \textbf{\UTFPRorientadorStr:}} & \multicolumn{2}{l|}{\textbf{Assinatura do orientador:}}\\
            \multicolumn{2}{|l|}{\fontsize{12}{14}\selectfont \UTFPRorientadordata~  \UTFPRorientadorname} &  \multicolumn{2}{l|}{}\\
            \multicolumn{2}{|l|}{\textbf{E-mail do orientador:}} & \multicolumn{2}{l|} {}\\
            \multicolumn{2}{|l|}{\texttt{\UTFPRemailori}} &  \multicolumn{2}{l|}{} \\
            \hline
            \multicolumn{2}{|l|}{\fontsize{12}{14}\selectfont \textbf{\UTFPRcoorientadorStr:}} & \multicolumn{2}{l|}{\textbf{Assinatura do coorientador:}}\\
            \multicolumn{2}{|l|}{\fontsize{12}{14}\selectfont \UTFPRcoorientadordata~  \UTFPRcoorientadorname} &  \multicolumn{2}{l|}{} \\
            \multicolumn{2}{|l|}{\textbf{E-mail do coorientador:}} & \multicolumn{2}{l|} {}\\
            \multicolumn{2}{|l|}{\texttt{\UTFPRemailcoori}} &  \multicolumn{2}{l|}{} \\ \hline
      \end{tabular}
      \end{espacosimples}
      \vfill
      \begin{center}
			{\fontsize{12}{14}\selectfont  \textbf \MakeUppercase{\UTFPRlocaldata} \par}
			{\fontsize{12}{14}\selectfont  \textbf \MakeUppercase{\UTFPRdatadata}}
		\end{center}
\if@restonecol\twocolumn \else \newpage \fi
\if@twoside\setcounter{page}\z@ \else\setcounter{page}{1} \fi	% Reseta o contador de páginas. Parece não ser necessário aqui
}
% SE NAO TIVER
{ \fontsize{12}{14}\selectfont
\if@twocolumn
  \@restonecoltrue\onecolumn
\else
  \@restonecolfalse\newpage
\fi
%\thispagestyle{empty}
     \renewcommand{\thepage}{}
           \begin{center}
		  \begin{espacosimples}
				{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRinstituicaodata}\par}
				\UTFPRifnotempty{\UTFPRunidadedata}{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRunidadedata}\par}
                \UTFPRifnotempty{\UTFPRdiretoriadata}{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRdiretoriadata}\par}
                \UTFPRifnotempty{\UTFPRcoordenacaodata}{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRcoordenacaodata}\par}
				{\fontsize{12}{14}\selectfont \textbf \MakeUppercase{\UTFPRcursodata}\\}	
		\end{espacosimples}		
	 \end{center}
      \noindent \newline
      \begin{center}
      \begin{tabular}{| C{5cm} |}
            \hline
            \fontsize{14}{14}\selectfont  \textbf PRÉ-PROJETO \\
            \hline
      \end{tabular}\vspace{30pt}
      \end{center}
     \begin{center}
		  \begin{espacosimples}
		       {\fontsize{14}{14}\selectfont  \textbf \UTFPRtitulodata \par}
		  \end{espacosimples}
	 \end{center}\vspace{12pt}
    \begin{espacosimples}\noindent
     \begin{tabular}{| m{0.25\linewidth} | m{0.25\linewidth} |m{0.25\linewidth}|m{0.25\linewidth}|}
            \hline
            \noindent \textbf{Nome:} & \textbf{Código:} & \textbf{Telefone:} & \textbf{E-mail:} \\
            {\fontsize{12}{14}\selectfont \UTFPRautordata} & 123456 & \UTFPRfone & \texttt{\UTFPRemailaluno}\\
            \hline
            \multicolumn{2}{|l|}{\fontsize{12}{14}\selectfont \textbf{\UTFPRorientadorStr:}} & \multicolumn{2}{l|}{\textbf{Assinatura do orientador:}}\\
            \multicolumn{2}{|l|}{\fontsize{12}{14}\selectfont \UTFPRorientadordata~  \UTFPRorientadorname} &  \multicolumn{2}{l|}{}\\
            \multicolumn{2}{|l|}{\textbf{E-mail do orientador:}} & \multicolumn{2}{l|} {}\\
            \multicolumn{2}{|l|}{\texttt{\UTFPRemailori}} &  \multicolumn{2}{l|}{} \\
            \hline
     \end{tabular}
      \end{espacosimples}
      \vfill
      \begin{center}
			{\fontsize{12}{14}\selectfont  \textbf \MakeUppercase{\UTFPRlocaldata} \par}
			{\fontsize{12}{14}\selectfont  \textbf \MakeUppercase{\UTFPRdatadata}}
		\end{center}
\if@restonecol\twocolumn \else \newpage \fi
\if@twoside\setcounter{page}\z@ \else\setcounter{page}{1} \fi	% Reseta o contador de páginas. Parece não ser necessário aqui
}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE ROSTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\folhaderosto}[1][semficha]
{
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\PRIVATEbookmarkthis{Folha de Rosto}
    \espaco{1.1}
		\begin{center}
			\begin{espacosimples}
				{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautordata}}\par}
				\UTFPRifnotempty{\UTFPRautordoisdata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautordoisdata}}\par}{\vspace{18pt}}
				\UTFPRifnotempty{\UTFPRautortresdata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautortresdata}}\par}{\vspace{18pt}}
				\UTFPRifnotempty{\UTFPRautorquatrodata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautorquatrodata}}\par}{\vspace{18pt}}
                \UTFPRifnotempty{\UTFPRautorcincodata}{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRautorcincodata}}\par}{\vspace{18pt}}
     		\end{espacosimples}
		\end{center}
		\vspace{96pt}
		\begin{center}
			{\fontsize{14}{14}\selectfont  \textbf{\MakeUppercase{\UTFPRtitulodata}}\par}
		\end{center}
		\vspace{60pt}
		%\hspace{.35\textwidth}	
        \hfill
		\begin{minipage}{.55\textwidth}
			\begin{espacosimples}
				\fontsize{12}{14}\selectfont \UTFPRcomentariodata \\[1.5mm] \UTFPRorientadorStr: \UTFPRorientadordata~  \UTFPRorientadorname   \UTFPRifnotempty{\UTFPRcoorientadorname}{\\[1.5mm] \UTFPRcoorientadorStr: \UTFPRcoorientadordata~ \UTFPRcoorientadorname}
				\end{espacosimples}		
		\end{minipage}
		\vfill
		\begin{center}
    		{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRlocaldata}}\par}
        	{\fontsize{12}{14}\selectfont \textbf{\MakeUppercase{\UTFPRdatadata}}}
		\end{center}
\vspace{1cm}
\ifthenelse{\equal{#1}{comficha}}
    {\if@twoside
         \newpage
     \else
         \cleardoublepage
     \fi
     %\setcounter{page}\z@
     ~\mbox{}~
     \vfill
     \input{fichacatalografica}
    }
    {\ifthenelse{\equal{#1}{semficha}}
      {}
      {\if@twoside
         \newpage
       \else
         \cleardoublepage
       \fi
       %\setcounter{page}\z@
         {
         ~\vfill
         \begin{center}
         \includegraphics[width=12.5cm,height=7.5cm]{#1}
         \end{center}
         }
    }
    }
}
%%%%%%%
%%%% Ficha catalografica
%%%%%%%
\providecommand{\UTFPRassuntoum}{}
\providecommand{\UTFPRassuntodois}{}
\providecommand{\UTFPRassuntotres}{}
\providecommand{\UTFPRassuntoquatro}{}
\newcommand{\assuntos}[4]{
                     \renewcommand{\UTFPRassuntoum}{#1}
                     \renewcommand{\UTFPRassuntodois}{#1}
                     \renewcommand{\UTFPRassuntotres}{#1}
                     \renewcommand{\UTFPRassuntoquatro}{#4}
                     }
\providecommand{\UTFPRcutter}{}
\newcommand{\cutter}[1]{\renewcommand{\UTFPRcutter}{#1}}

\providecommand{\UTFPRcdd}{}
\newcommand{\cdd}[1]{\renewcommand{\UTFPRcdd}{#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TERMO DE APROVACAO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\providecommand{\UTFPRtextoaprovacaodata}{}
\newcommand{\textoaprovacao}[1]{\renewcommand{\UTFPRtextoaprovacaodata}{#1}}
\providecommand{\UTFPRversaoeletronica}{}
\newcommand{\versaoeletronica}[1]{\renewcommand{\UTFPRversaoeletronica}{#1}}


%% Banca - Ate 4 membros, fora orientador e coorientador.
%% Se o nro de membros passar de 4, serão geradas duas colunas
\providecommand\orientadorbancadata{nao}
\providecommand\coorientadorbancadata{nao}
\newcounter{nrobanca}
\setcounter{nrobanca}{4}
\newcommand\numerodemembrosnabanca[1]{\setcounter{nrobanca}{#1}}
\newcommand\orientadornabanca[1]{\renewcommand\orientadorbancadata{#1}}
\newcommand\coorientadornabanca[1]{\renewcommand\coorientadorbancadata{#1}}

\providecommand{\UTFPRprimeiroassinanome}{}
\providecommand{\UTFPRprimeiroassinadata}{}
\newcommand{\primeiroassina}[2][Doutor]%
{\renewcommand{\UTFPRprimeiroassinanome}{#2}%
\renewcommand{\UTFPRprimeiroassinadata}{#1}}

\providecommand{\UTFPRsegundoassinanome}{}
\providecommand{\UTFPRsegundoassinadata}{}
\newcommand{\segundoassina}[2][Doutor]%
{\renewcommand{\UTFPRsegundoassinanome}{#2}%
\renewcommand{\UTFPRsegundoassinadata}{#1}}

\providecommand{\UTFPRterceiroassinanome}{}
\providecommand{\UTFPRterceiroassinadata}{}
\newcommand{\terceiroassina}[2][Doutor]%
{\renewcommand{\UTFPRterceiroassinanome}{#2}%
\renewcommand{\UTFPRterceiroassinadata}{#1}}

\providecommand{\UTFPRquartoassinanome}{}
\providecommand{\UTFPRquartoassinadata}{}
\newcommand{\quartoassina}[2][Doutor]%
{\renewcommand{\UTFPRquartoassinanome}{#2}%
\renewcommand{\UTFPRquartoassinadata}{#1}}

\providecommand{\UTFPRquintoassinanome}{}
\providecommand{\UTFPRquintoassinadata}{}
\newcommand{\quintoassina}[2][Doutor]%
{\renewcommand{\UTFPRquintoassinanome}{#2}%
\renewcommand{\UTFPRquintoassinadata}{#1}}

\providecommand{\UTFPRsextoassinanome}{}
\providecommand{\UTFPRsextoassinadata}{}
\newcommand{\sextoassina}[2][Doutor]%
{\renewcommand{\UTFPRsextoassinanome}{#2}%
\renewcommand{\UTFPRsextoassinadata}{#1}}

\providecommand{\UTFPRsetimoassinanome}{}
\providecommand{\UTFPRsetimoassinadata}{}
\newcommand{\setimoassina}[2][Doutor]%
{\renewcommand{\UTFPRsetimoassinanome}{#2}%
\renewcommand{\UTFPRsetimoassinadata}{#1}}


\providecommand{\UTFPRdiadefesa}{}
\providecommand{\UTFPRmesdefesa}{}
\providecommand{\UTFPRanodefesa}{}
\newcommand{\datadefesaUTFPR}[3]%
	{\renewcommand{\UTFPRdiadefesa}{#1}
    \renewcommand{\UTFPRmesdefesa}{#2}
    \renewcommand{\UTFPRanodefesa}{#3}}

\fancypagestyle{aprovacao}{
\fancyhead{}
\setlength{\topmargin}{-12mm}
\setlength{\topskip}{0mm}
\setlength{\footskip}{0mm}
\setlength{\headheight}{14mm}
\renewcommand{\headrule}{\hrule height\headrulewidth \vspace{0.3mm} {\color{yellow} \hrule width\headwidth height\headrulewidth \vskip-\headrulewidth}}
\addtolength{\headheight}{\baselineskip}
\renewcommand{\headrulewidth}{1pt}
\lhead{
\begin{minipage}[c][24mm][c]{30mm}
\centering \includegraphics[width=22mm]{brasao.png}
\end{minipage}
}
\chead{
\begin{minipage}[c][24mm][c]{100mm}
\begin{center}
\begin{espacosimples}
{\fontsize{10}{12}\selectfont Minstério da Educação \\}
{\fontsize{10}{12}\selectfont \UTFPRinstituicaodata \\}
{\fontsize{10}{12}\selectfont  \UTFPRunidadedata \\}
\UTFPRifnotempty{\UTFPRdiretoriadata}{\fontsize{10}{12}\selectfont \UTFPRdiretoriadata \\}
\UTFPRifnotempty{\UTFPRcoordenacaodata}{\fontsize{10}{12}\selectfont \UTFPRcoordenacaodata \\}
\UTFPRifnotempty{\UTFPRcursodata}{\fontsize{10}{12}\selectfont \UTFPRcursodata \\}	
\end{espacosimples}		
\end{center}
\end{minipage}
}
\rhead{
\begin{minipage}[c][24mm][c]{30mm}
\centering \includegraphics[width=30mm]{logo-utfpr.png}
\end{minipage}
}

\UTFPRifnotempty{\UTFPRversaoeletronica}{\fontsize{10}{12}\selectfont \fancyfoot[C]{\UTFPRversaoeletronica}}
}

\renewcommand{\folhadeaprovacaoname}{Termo de Aprovação}

\newcommand{\termodeaprovacao}[1][\folhadeaprovacaoname]
{
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
%\thispagestyle{empty} 	% Define o estilo desta página como vazio
%\renewcommand{\thepage}{}
\thispagestyle{aprovacao}
  \espaco{1}
        \begin{center}
            \PRIVATEbookmarkthis{#1}
			\textbf{\MakeUppercase{#1}} \\[20pt]
			\UTFPRtitulodata \\[10pt]
			por \\[10pt]
    		\UTFPRautordata \\[-10mm]
		\end{center}
		\begin{espacosimples}
			\UTFPRtextoaprovacaodata
		\end{espacosimples}

\setlength{\UTFPRsignthickness}{0.4pt}
\setlength{\UTFPRsignskip}{6mm}
\setlength{\UTFPRsignwidth}{0.7\linewidth}
{\centering \UTFPRlocaldata,  \UTFPRdiadefesa/\UTFPRmesdefesa/\UTFPRanodefesa.}
\assinatura{\UTFPRcoordenadorname, \UTFPRcoordenadordata \\ \UTFPRcoordenadorStr~do Curso}%
\ifthenelse{\equal{\orientadorbancadata}{nao}}
{\vspace{0.5em}  \addtocounter{nrobanca}{1}
\assinatura{\UTFPRorientadorname, \UTFPRorientadordata \\ \UTFPRorientadorStr}%
}{}
\UTFPRifnotempty{\UTFPRcoorientadorname}{
\ifthenelse{\equal{\coorientadorbancadata}{nao}}
{\vspace{0.5em} \addtocounter{nrobanca}{1}
\assinatura{\UTFPRcoorientadorname, \UTFPRcoorientadordata \\ \UTFPRcoorientadorStr}
}
}{}
{\noindent\bfseries\selectfont Banca Examinadora:}
\ifnum \value{nrobanca} > 6
{
\begin{multicols}{2}\setlength{\UTFPRsignwidth}{0.9\linewidth}
\ifthenelse{\equal{\orientadorbancadata}{sim}}
{
\assinatura{\UTFPRorientadorname, \UTFPRorientadordata \\ \UTFPRorientadorStr}%
\vfill
}{}
\UTFPRifnotempty{\UTFPRcoorientadorname}{
\ifthenelse{\equal{\coorientadorbancadata}{sim}}
{
\assinatura{\UTFPRcoorientadorname, \UTFPRcoorientadordata \\ \UTFPRcoorientadorStr}
\vfill
}
}{}
        \UTFPRifnotempty{\UTFPRprimeiroassinadata}%
		{
		\begin{center}
    	    \assinatura{\UTFPRprimeiroassinanome, \UTFPRprimeiroassinadata}
            \vfill
		\end{center}
		}
		\UTFPRifnotempty{\UTFPRsegundoassinadata}%
		{
		\begin{center}
			\assinatura{\UTFPRsegundoassinanome, \UTFPRsegundoassinadata}
            \vfill
		\end{center}
		}
		\UTFPRifnotempty{\UTFPRterceiroassinadata}%
		{
		\begin{center}
			\assinatura{\UTFPRterceiroassinanome, \UTFPRterceiroassinadata}
            \vfill
		\end{center}
		}
		\UTFPRifnotempty{\UTFPRquartoassinadata}%
		{%
		\begin{center}
			\assinatura{\UTFPRquartoassinanome, \UTFPRquartoassinadata}
            \vfill
		\end{center}
		}
\UTFPRifnotempty{\UTFPRquintoassinadata}%
		{%
		\begin{center}
			\assinatura{\UTFPRquintoassinanome, \UTFPRquintoassinadata}
            \vfill
		\end{center}
		}
\UTFPRifnotempty{\UTFPRsextoassinadata}%
		{%
		\begin{center}
			\assinatura{\UTFPRsextoassinanome, \UTFPRsextoassinadata}
            \vfill
		\end{center}
		}
\UTFPRifnotempty{\UTFPRsetimoassinadata}%
		{%
		\begin{center}
			\assinatura{\UTFPRsetimoassinanome, \UTFPRsetimoassinadata}
            \vfill
		\end{center}
		}
\end{multicols}
}
\else
{
\ifthenelse{\equal{\orientadorbancadata}{sim}}
{
\assinatura{\UTFPRorientadorname, \UTFPRorientadordata \\ \UTFPRorientadorStr}%
\vfill
}{}
\UTFPRifnotempty{\UTFPRcoorientadorname}{
\ifthenelse{\equal{\coorientadorbancadata}{sim}}
{
\assinatura{\UTFPRcoorientadorname, \UTFPRcoorientadordata \\ \UTFPRcoorientadorStr}
\vfill
}
}{}
        \UTFPRifnotempty{\UTFPRprimeiroassinadata}%
		{
		\begin{center}
    	    \assinatura{\UTFPRprimeiroassinanome, \UTFPRprimeiroassinadata}
            \vfill
		\end{center}
		}
		\UTFPRifnotempty{\UTFPRsegundoassinadata}%
		{
		\begin{center}
			\assinatura{\UTFPRsegundoassinanome, \UTFPRsegundoassinadata}
            \vfill
		\end{center}
		}
		\UTFPRifnotempty{\UTFPRterceiroassinadata}%
		{
		\begin{center}
			\assinatura{\UTFPRterceiroassinanome, \UTFPRterceiroassinadata}
            \vfill
		\end{center}
		}
		\UTFPRifnotempty{\UTFPRquartoassinadata}%
		{%
		\begin{center}
			\assinatura{\UTFPRquartoassinanome, \UTFPRquartoassinadata}
            \vfill
		\end{center}
		}
}
\fi
\espaco{\taxaespacoumemeio}
\if@openright\cleardoublepage\else\clearpage\fi
%\thispagestyle{empty}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   DEDICATORIA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{dedicatoria}[1][]%
{
\if@openright		% Garante que se a página for "direita"
   \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\dedicatorianame}
    }{\PRIVATEbookmarkthis{#1}}

	~\vfill
	\begin{flushright}
		\begin{minipage}{.75\textwidth}
			\begin{espacosimples}%
				\setlength\parindent{0pt}
				\setlength\parskip{12pt}
}%
{
			\end{espacosimples}
		\end{minipage}
	\end{flushright}
\PRIVATEclearpageifneeded
\if@openright\cleardoublepage\else\clearpage\fi
%\thispagestyle{empty}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AGRADECIMENTOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{agradecimentos}[1][\agradecimentosname]%
{%
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
%\thispagestyle{empty} 	% Define o estilo desta página como vazio
	\pretextualchapter{#1}%
}%
{
\if@openright\cleardoublepage\else\clearpage\fi%
\PRIVATEclearpageifneeded
%\thispagestyle{empty} 	% Define o estilo desta página como vazio
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EPIGRAFE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{epigrafe}[1][]%
{%
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\epigraphname}
    }{\PRIVATEbookmarkthis{#1}}
	~\vfill
	\begin{flushright}
		\begin{minipage}{.75\textwidth}
			\begin{espacosimples}%
				\setlength\parindent{0pt}
				\setlength\parskip{12pt}
}%
{
			\end{espacosimples}
		\end{minipage}
	\end{flushright}
\PRIVATEclearpageifneeded
\if@openright\cleardoublepage\else\clearpage\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RESUMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{resumo}[1][\resumoname]%
{%
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
	\pretextualchapter{#1}%
	\begin{espacosimples}%
		\setlength\parindent{0pt}
		\setlength\parskip{12pt}
		\UTFPRcitadata. \textbf{\UTFPRtitulodata}. \UTFPRanodefesa. \pageref{LastPage} f. \UTFPRdocumentodata\ -- \ifthenelse{\equal{\UTFPRniveldata}{Mestrado}}
           {\UTFPRcoordenacaodata}{\UTFPRcursodata},
		\UTFPRinstituicaodata. \UTFPRlocaldata, \UTFPRdatadata.\par
}%
{
		\par \textbf{Palavras-chave:} \UTFPRpalavraschavedata
	\end{espacosimples}
\if@openright\cleardoublepage\else\clearpage\fi
%\thispagestyle{empty}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ABSTRACT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{abstract}[1][Abstract]%
{%
\begin{otherlanguage*}{english}
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
	\pretextualchapter{#1}%
	\begin{espacosimples}%
		\setlength\parindent{0pt}
		\setlength\parskip{12pt}
%		\UTFPRcitadata. \textbf{\UTFPRtitledata.} \UTFPRanodefesa. \pageref{LastPage} f. \UTFPRdocumentodata\ -- \ifthenelse{\equal{\UTFPRniveldata}{Mestrado}}
%           {\UTFPRcoordenacaodata}{\UTFPRcursodata},
%		\UTFPRinstituicaodata. \UTFPRlocaldata, \UTFPRdatadata. \par
}%
{
%		\par \textbf{Keywords:} \UTFPRkeywordsdata
		\end{espacosimples}
\if@openright\cleardoublepage\else\clearpage\fi
\end{otherlanguage*}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RESUME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{resume}[1][Résumé]%
{%
\begin{otherlanguage*}{french}
\if@openright		% Garante que se a página for "direita"
    \cleardoublepage	% ele pula uma página para deixar o anverso em branco
\else
    \clearpage
\fi
\if@twocolumn		% Força que a página seja de uma coluna apenas
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
	\pretextualchapter{#1}%
	\begin{espacosimples}%
		\setlength\parindent{0pt}
		\setlength\parskip{12pt}
%		\UTFPRcitadata. \textbf{\UTFPRtitulodata}. \UTFPRanodefesa. \pageref{LastPage} f. \UTFPRdocumentodata\ -- \ifthenelse{\equal{\UTFPRniveldata}{Mestrado}}
%           {\UTFPRcoordenacaodata}{\UTFPRcursodata},
%		\UTFPRinstituicaodata. \UTFPRlocaldata, \UTFPRdatadata.\par
}%
{
%		\par \textbf{Mots-clés:} \UTFPRpalavraschavedata
	\end{espacosimples}
\if@openright\cleardoublepage\else\clearpage\fi
\end{otherlanguage*}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% LISTA DE ILUSTRACOES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\sloppy%% Força todas as linhas ficarem dentro das margens
\newlength{\linha}%% Escala linha
\setlength{\linha}{\baselineskip}%% Espessura da escala linha
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gera lista de Ilustracoes em ordem de tipo
% substituida pela lista gerada por ordem de aparecimento
% e colocada no inicio do documento.
%%%%%
%\newcommand{\listadeilustracoes}
%{
%	\ifthenelse{\boolean{@twocolumn}}
%		{\setboolean{UTFPRrestorecol}{true}\onecolumn}
%		{\setboolean{UTFPRrestorecol}{false}}
%	\pretextualchapter{Lista de Ilustrações}
%    \begin{espacosimples}
%	\@starttoc{lof}\vspace{9pt}
%    \@starttoc{qdr}
%	\end{espacosimples}
%
%	\ifthenelse{\boolean{UTFPRrestorecol}}
%		{\twocolumn}
%		{}
%\cleardoublepage
%}
%%%%%%%%%%%%%%%%%%%%%%%%
%%% Novo comando para lista de ilustracoes
%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
\makeatletter
\newcommand{\listfloatname}{Lista de Ilustrações}
\newlistof{listoffloat}{flt}{\listfloatname}
\long\def\@caption#1[#2]#3{%
\par
\addcontentsline{\csname ext@#1\endcsname}{#1}%
 {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
\ifthenelse{\equal{#1}{table}}{}{\ifthenelse{\equal{#1}{algorithm}}{}{
\addcontentsline{flt}{#1}%
 {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}
 }}%
\begingroup
\@parboxrestore
      \if@minipage
        \@setminipage
      \fi
      \normalsize
\@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
\endgroup
}
\newcommand{\listadeilustracoes}{
\listoffloat*
\PRIVATEbookmarkthis{\listfloatname}
\cleardoublepage
}
\makeatother
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE FIGURAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{UTFPRrestorecol} % new boolean to avoid conflicts
% Altera a forma de montagem da lista de figuras
\renewcommand{\cfttablename}{\MakeTextUppercase\tablename\space}%% Nome da entrada na lista de objetos flutuantes
\newcommand{\listadefiguras}
{
	\ifthenelse{\boolean{@twocolumn}}
		{\setboolean{UTFPRrestorecol}{true}\onecolumn}
		{\setboolean{UTFPRrestorecol}{false}}
	\pretextualchapter{Lista de Figuras}
    \begin{espacosimples}
	\@starttoc{lof}
	\end{espacosimples}
	\ifthenelse{\boolean{UTFPRrestorecol}}
		{\twocolumn}
		{}
\cleardoublepage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE TABELAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Altera a forma de montagem da lista de tabelas
\renewcommand{\cftfigurename}{\MakeTextUppercase\figurename\space}%% Nome da entrada na lista de objetos flutuantes
\newcommand{\listadetabelas}
{
	\ifthenelse{\boolean{@twocolumn}}
		{\setboolean{UTFPRrestorecol}{true}\onecolumn}
		{\setboolean{UTFPRrestorecol}{false}}
%	\setchaptertype{listoftables}
	\pretextualchapter{Lista de Tabelas}
	\begin{espacosimples}
	\@starttoc{lot}
	\end{espacosimples}
	\ifthenelse{\boolean{UTFPRrestorecol}}
		{\twocolumn}
		{}
\cleardoublepage
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% LISTA DE QUADROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\listofquadrosname}{Lista de Quadros}
\newcommand{\quadroname}{Quadro}
\newlistof{listofquadros}{qdr}{\listofquadrosname}
\newlistentry{quadro}{qdr}{0}%% Entrada da lista de objetos flutuantes (fotografia)
\newfloat{quadro}{qdr}{\quadroname}%% Objeto flutuante (fotografia)
\renewcommand{\fnum@quadro}{\quadroname ~\thequadro}
\renewcommand{\cftquadroname}{\MakeTextUppercase\quadroname\space}%% Nome da entrada na lista de objetos flutuantes (quadro)
\renewcommand*{\cftquadroaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (quadro)
\def\quadroautorefname{\quadroname}

\renewcommand{\listofquadros}{
  \ifthenelse{\boolean{@twocolumn}}%
    {\setboolean{UTFPRrestorecol}{true}\onecolumn}%
    {\setboolean{UTFPRrestorecol}{false}}%
  \pretextualchapter{\listofquadrosname}
  \begin{espacosimples}
  \@starttoc{qdr}%
  \end{espacosimples}
  \ifthenelse{\boolean{UTFPRrestorecol}}{\twocolumn}{}
  \cleardoublepage%
}%
\let\listadequadros\listofquadros\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% LISTA DE GRAFICOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\listofgraficosname}{Lista de Gráficos}
\newcommand{\graficoname}{Gráfico}
\newlistof{listofgraficos}{grf}{\listofgraficosname}
\newlistentry{grafico}{grf}{0}%% Entrada da lista de objetos flutuantes (grafico)
\newfloat{grafico}{grf}{\graficoname}%% Objeto flutuante (grafico)
\renewcommand{\fnum@grafico}{\graficoname ~\thegrafico }
\renewcommand{\cftgraficoname}{\MakeTextUppercase\graficoname\space}%% Nome da entrada na lista de objetos flutuantes (grafico)
\renewcommand*{\cftgraficoaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (grafico)
\def\graficoautorefname{\graficoname}

\renewcommand{\listofgraficos}{
  \ifthenelse{\boolean{@twocolumn}}%
    {\setboolean{UTFPRrestorecol}{true}\onecolumn}%
    {\setboolean{UTFPRrestorecol}{false}}%
  \pretextualchapter{\listofgraficosname}
  \begin{espacosimples}
  \@starttoc{grf}%
  \end{espacosimples}
  \ifthenelse{\boolean{UTFPRrestorecol}}{\twocolumn}{}
  \cleardoublepage%
}%

\let\listadegraficos\listofgraficos\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% LISTA DE FOTOGRAFIAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\listoffotosname}{Lista de Fotografias}
\newcommand{\fotoname}{Fotografia}
\newlistof{listoffotos}{ftg}{\listoffotosname}
\newlistentry{foto}{ftg}{0}%% Entrada da lista de objetos flutuantes (foto)
\newfloat{foto}{ftg}{\fotoname}%% Objeto flutuante (foto)
\renewcommand{\fnum@foto}{\fotoname ~\thefoto}
\renewcommand{\cftfotoname}{\MakeTextUppercase\fotoname\space}%% Nome da entrada na lista de objetos flutuantes (grafico)
\renewcommand*{\cftfotoaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (grafico)
\def\fotoautorefname{\fotoname}

\renewcommand{\listoffotos}{
  \ifthenelse{\boolean{@twocolumn}}%
    {\setboolean{UTFPRrestorecol}{true}\onecolumn}%
    {\setboolean{UTFPRrestorecol}{false}}%
  \pretextualchapter{\listoffotosname}
  \begin{espacosimples}
  \@starttoc{ftg}%
  \end{espacosimples}
  \ifthenelse{\boolean{UTFPRrestorecol}}{\twocolumn}{}
  \cleardoublepage%
}%

\let\listadefotos\listoffotos\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% LISTA DE FLUXOGRAMAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\listoffluxosname}{Lista de Fluxogramas}
\newcommand{\fluxoname}{Fluxograma}
\newlistof{listoffluxos}{flx}{\listoffluxosname}
\newlistentry{fluxo}{flx}{0}%% Entrada da lista de objetos flutuantes (fluxogramas)
\newfloat{fluxo}{flx}{\fluxoname}%% Objeto flutuante (fluxograma)
\renewcommand{\fnum@fluxo}{\fluxoname ~\thefluxo}
\renewcommand{\cftfluxoname}{\MakeTextUppercase\fluxoname\space}%% Nome da entrada na lista de objetos flutuantes (fluxograma)
\renewcommand*{\cftfluxoaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (fluxograma)
\def\fluxoautorefname{\fluxoname}

\renewcommand{\listoffluxos}{
  \ifthenelse{\boolean{@twocolumn}}%
    {\setboolean{UTFPRrestorecol}{true}\onecolumn}%
    {\setboolean{UTFPRrestorecol}{false}}%
  \pretextualchapter{\listoffluxosname}
  \begin{espacosimples}
  \@starttoc{flx}%
  \end{espacosimples}
  \ifthenelse{\boolean{UTFPRrestorecol}}{\twocolumn}{}
  \cleardoublepage%
}%

\let\listadefluxogramas\listoffluxos\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE SIMBOLOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define os comandos que montam a lista de simbolos
\renewcommand{\listadesimbolosname}{Lista de S\'imbolos}
\newcommand{\listadesimbolos}
{  \pretextualchapter{\listadesimbolosname}
	\begin{espacosimples}  %cesar230511
	{\setlength{\parindent}{0cm}
	 % Abrindo arquivo para leitura e verificando se ele existe:
		 \newread\instream
		 \immediate\openin\instream= \jobname.tmp
		 \ifeof\instream
		 	\message{\jobname.tmp nao existe ainda. Rode o latex novamente.} % Na primeira vez.
       \else
       	\immediate\read\instream to \auxcommand % O comando no arquivo temporario é salvo em \auxcommand.
       	\immediate\closein\instream % Fechando o arquivo.
       	\auxcommand % Executando o comando lido.
       \fi
	 \addtolength{\simbmaxwidth}{1em}
    \@starttoc{los}
}	
	\end{espacosimples}
    \cleardoublepage
}

\newcommand{\simbolo}[2]
{
     \settowidth{\simbwidth}{#1}\ignorespaces
     \ifthenelse{\lengthtest{\simbwidth > \simbmaxwidth}} % Se o novo simbolo é maior,
     {\settowidth{\simbmaxwidth}{#1}} % seta o valor da maior com o tamanho da atual.
     {}\ignorespaces
	  \ifthenelse{\equal{#2}{}}
		  {\addcontentsline{los}{simbolo}{\hspace{0.24cm}\protect\parbox[t]{\protect\simbmaxwidth}{#1}}}
		  {\addcontentsline{los}{simbolo}{\hspace{0.24cm}\protect\parbox[t]{\protect\simbmaxwidth}{#1}\protect\parbox[t]{\protect\textwidth - \protect\simbmaxwidth}{#2}}}\ignorespaces\hspace{-0.24cm}#1}

% como a entrada ser´a impressa
\newcommand\l@simbolo[2]{
	\parbox[b]{\textwidth}{#1}
}




%%%%%%%%% LISTA DE ALGORITMOS %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Altera a forma de montagem da lista de algoritmos
\newlistof{listofalgorithms}{loa}{\listalgorithmname}
\newlistentry{algorithm}{loa}{0}%% Entrada da lista de objetos flutuantes (algoritmo)
\newfloat{algorithm}{loa}{Algoritmo}%% Objeto flutuante (algoritmo)
\renewcommand{\fnum@algorithm}{Algoritmo ~\thealgorithm}
\renewcommand{\cftalgorithmname}{\MakeTextUppercase{Algoritmo}\space}%% Nome da entrada na lista de objetos flutuantes (quadro)
\renewcommand*{\cftalgorithmaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (quadro)
\def\algorithmautorefname{Algoritmo}
%%%------------------------------------
%%% Acrescenta Listings na Lista de Algoritmos
%%%------------------------------------
\begingroup\makeatletter
\let\newcounter\@gobble\let\setcounter\@gobbletwo
  \globaldefs\@ne \let\c@loldepth\@ne
  \newlistof{listings}{lol}{\lstlistlistingname}
  \newlistentry{lstlisting}{lol}{0}
\endgroup

\makeatletter
\lstset{frame=tb,breaklines=true,
 breakatwhitespace=true,
 breakindent=2ex,
 postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\hookrightarrow\space}}
 }
\pretocmd\lst@makecaption{\noindent{\rule{\linewidth}{2pt}}}{}{}
\renewcommand{\cftlstlistingname}{\MakeTextUppercase{Algoritmo}\space}%% Nome da entrada na lista de objetos flutuantes (quadro)
\renewcommand*{\cftlstlistingaftersnum}{~~--~~}%% Conteúdo após a entrada na lista de objetos flutuantes (quadro)
\renewcommand{\fnum@lstlisting}{Algoritmo ~\thelstlisting}
\patchcmd{\lst@MakeCaption}{\addcontentsline{lol}}{\addcontentsline{loa}}{}{}
\patchcmd{\lst@MakeCaption}{\addcontentsline{lol}}{\addcontentsline{loa}}{}{}
\AtBeginDocument{%
  \let\c@lstlisting\c@algorithm
  \let\thelstlisting\thealgorithm
}
\makeatother
\def\lstlistingautorefname{Algoritmo}
\makeatletter
%%%------------------------------------


\renewcommand{\listofalgorithms}
{
	\ifthenelse{\boolean{@twocolumn}}
		{\setboolean{UTFPRrestorecol}{true}\onecolumn}
		{\setboolean{UTFPRrestorecol}{false}}
	\pretextualchapter{Lista de Algoritmos}
	\begin{espacosimples}
	\@starttoc{loa}
	\end{espacosimples}
	\ifthenelse{\boolean{UTFPRrestorecol}}
		{\twocolumn}
		{}
}
\let\listadealgoritmos\listofalgorithms\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE SIGLAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \sigla{sigla}{entrada na lista de siglas}:
% Escreve a sigla no texto e uma entrada na Lista de Siglas.
% Se o parâmetro opcional á omitido, usa-se o parâmetro obrigatório.
\newcommand{\sigla}{\@ifstar{\siglaStar}{\siglaNotStar}}	
\newcommand{\siglaNotStar}[2]{%
	\settowidth{\siglawidth}{#1}\ignorespaces
	\ifthenelse{\lengthtest{\siglawidth > \siglamaxwidth}}% Se a nova sigla é maior,
		{\settowidth{\siglamaxwidth}{#1}}% seta o valor da maior com o tamanho da atual.
		{}\ignorespaces
\nomenclature{\hspace{0.14cm} #1}{#2}%
{#2} ({#1})}



\newcommand{\siglaStar}[2]{%
	\settowidth{\siglawidth}{#1}\ignorespaces
	\ifthenelse{\lengthtest{\siglawidth > \siglamaxwidth}}% Se a nova sigla é maior,
		{\settowidth{\siglamaxwidth}{#1}}% seta o valor da maior com o tamanho da atual.
		{}\ignorespaces
\nomenclature{\hspace{0.14cm} #1}{#2}%
{#2}}


\def\@@@nomenclature[#1]#2#3{%
\def\@tempa{#2}\def\@tempb{#3}%
\protected@write\@nomenclaturefile{}%
{\string\nomenclatureentry{#1\nom@verb\@tempa @{\nom@verb\@tempa}&%
\begingroup\nom@verb\@tempb\protect\nomeqref{\theequation}%
|nompageref}{\thepage}}%
\endgroup
\@esphack}

% Este comando redefine o codigo relevante do nomencl.sty

\newcommand{\fazlistasiglas}[1][Lista de Siglas]{
\def\thenomenclature{%
\if@openright\cleardoublepage\else\clearpage\fi%
\if@intoc\addcontentsline{toc}{chapter}{\nomname}\fi%
\pretextualchapter{\nomname}
\nompreamble
\begin{flushleft}
\begin{longtable}[l]{@{}ll@{}}
}
\def\endthenomenclature{%
\end{longtable}%
\end{flushleft}

\nompostamble}
\makenomenclature%
\renewcommand{\nomname}{#1}
\renewcommand{\nomentryend}{}%
\setlength{\nomitemsep}{-\parsep}% Tirando espaço extre entre as entradas na lista.
}

%% Define o comando que monta a lista de siglas
\newcommand{\listadesiglas}{
		 % Abrindo arquivo para leitura e verificando se ele existe:
		 \newread\instream
		 \immediate\openin\instream=\jobname.tmp
		 \ifeof\instream
		 	\message{\jobname.tmp nao existe ainda. Rode o latex novamente.} % Na primeira vez.
       \else
        \immediate\read\instream to \auxcommand % O primeiro comando é o da lista de simbolos.
       	\immediate\read\instream to \auxcommand % O comando no arquivo temporario é salvo em \auxcommand.
       	\immediate\closein\instream % Fechando o arquivo.
       	\auxcommand % Executando o comando lido.
       \fi
	   \addtolength{\siglamaxwidth}{1em}
% O comando a seguir executa o makeindex automaticamente
% para ordenar automaticamente a lista de siglas
\immediate\write18{makeindex \jobname.nlo -s utfpr-siglas.ist -o \jobname.nls}\relax
\printnomenclature[\the\siglamaxwidth]
\setcounter{abstable}{0}
\cleardoublepage
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE ABREVIATURAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{AlphaSort}
\setboolean{AlphaSort}{true}
\newcommand{\TSStextpagesep}{ }
\newcommand{\TSSThePage}[1]{&}
\providecommand{\listofabreviationsname}{Lista de Abreviaturas}
\newindex{abrevia}{abreviax}{abrevia}{ddede}%\listofabreviationsname}

\newcommand{\IndexCommand}[3]{\index[#1]{#2@#3|TSSThePage}}%

\newcommand{\abrevi}[2]{\IndexCommand{abrevia}{#1 #2}{#1& #2} #2 (#1)}

\newcommand{\Babrevtable}{\begin{flushleft}\begin{longtable}[l]{lp{0.7\textwidth}l}}
\newcommand{\Eabrevtable}{\end{longtable}\end{flushleft}}

\newenvironment{abreviaturas}{\Babrevtable}{\Eabrevtable}

\newcommand{\listadeabreviaturas}{
\immediate\write18{makeindex \jobname.abreviax -s tabela-abreviaturas.ist -o \jobname.abrevia}\relax
\pretextualchapter{\listofabreviationsname}
\IfFileExists{\jobname.abrevia}{
\begin{abreviaturas}
\printindex[abrevia]
\end{abreviaturas}
\setcounter{abstable}{0}
\cleardoublepage
}{Sua lista de siglas s\'o vai aparecer aqui quando for rodar o makeindex.
Veja a documenta\c c\~ao para mais detalhes.}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTA DE ACRONIMOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecommand{\listofacronimosname}{Lista de Acrônimos}
\newindex{acron}{acronx}{acron}{}


\newcommand{\acron}[2]{\IndexCommand{acron}{#1 #2}{#1& #2} #2 (#1)}

\newcommand{\Bacrontable}{\begin{flushleft}\begin{longtable}[l]{lp{0.7\textwidth}l}}
\newcommand{\Eacrontable}{\end{longtable}\end{flushleft}}

\newenvironment{acronimos}{\Bacrontable}{\Eacrontable}

\newcommand{\listadeacronimos}{
\immediate\write18{makeindex \jobname.acronx -s tabela-abreviaturas.ist -o \jobname.acron}\relax
\pretextualchapter{\listofacronimosname}
\IfFileExists{\jobname.acron}{
\begin{acronimos}
\printindex[acron]
\end{acronimos}
\setcounter{abstable}{0}
\cleardoublepage
}{Sua lista de acrônimos s\'o vai aparecer aqui quando for rodar o makeindex.
Veja a documenta\c c\~ao para mais detalhes.}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Glossário
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\glossaryname}{GLOSSÁRIO}
\renewcommand*{\glsseeformat}[3][\seename]{{#1}\space\glsseelist{#2}.}%% Formatação do texto "veja..." no glossário
\newcommand{\incluirglossario}{%% Definição do comando para inclusão do glossário
    \immediate\write18{makeindex \jobname.glo -s estilo-glossario.ist -t \jobname.glg -o \jobname.gls}\relax%% Compilação do glossário
    \setlength{\glstreeindent}{\parindent}%% Recuo dos itens do glossário
    \cleardoublepage%% Página de verso
    \phantomsection%% Atalho do sumário
    \addtocontents{toc}{\vspace{-\cftbeforechapterskip}}
    \tocprintchapternonum
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeUppercase{\glossaryname}}{\glossaryname}}%% Adição do glossário ao sumário
    \printglossary%[title={GLOSSÁRIO}]%% Impressão do glossário
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Indice Remissivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ---
%% compila o indice
%% ---
\AtBeginDocument{\makeindex}
\addto{\captionsbrazil}{%
   \renewcommand*{\indexname}{Índice Remissivo}
}
\newcommand{\indiceremissivo}{
    \renewenvironment{theindex}{%% Formatação do índice
      \clearforchapter
      \if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
      \ifonecolindex
        \onecolumn
        \chapter*{\indexname}
        \preindexhook
      \else
        \setlength{\columnseprule}{\indexrule}
        \setlength{\columnsep}{\indexcolsep}
        \twocolumn[\@makeschapterhead{\indexname}\preindexhook]
      \fi
      \indexmark
      \ifnoindexintoc\else
       \phantomsection
       \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeUppercase{\indexname}}{\indexname}}%% Adição do índice ao sumário
      \fi
      %\thispagestyle{indextitlepagestyle}\parindent\z@
      \parskip\z@ \@plus 0.3\p@\relax
      \let\item\@idxitem
    }{%%
      \if@restonecol\onecolumn\else\twocolumn\fi
    }
\immediate\write18{makeindex \jobname.idx -s estilo-indice.ist -o \jobname.ind}\relax
\IfFileExists{\jobname.ind}{
\cleardoublepage
\printindex
\cleardoublepage
}{Sua lista de termos s\'o vai aparecer aqui quando for rodar o makeindex.
Veja a documenta\c c\~ao para mais detalhes.}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUMARIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Macro para deteminar maior tamanho de numero no sumario
%%%%%%%%%%%
\makeatletter
\newcommand\mem@auxrestore[2]{\csgdef{stored@value@#1}{#2}}
\newcommand\memstorevalue[2]{%
\@bsphack%
\immediate\write\@mainaux{\string\mem@auxrestore{#1}{#2}}%
\@esphack}
\newcommand\RetrieveStoredLength[1]{%
\ifcsdef{stored@value@#1}{\csuse{stored@value@#1}}{0pt}}%
\makeatletter

%%%%
\newlength\tmplen % scratch length
\newlength\widestchapter % guess, they are zero by default
\newlength\widestsection
\newlength\widestsubsection
\newlength\widestsubsubsection
\newlength\widestparagraph
\renewcommand\chapternumberlinehook[1]{%
\settowidth\tmplen{\hbox{\cftchapterfont#1}}%
\ifdimgreater\tmplen\widestchapter{%
\global\widestchapter=\tmplen}{}}
%%%%
\renewcommand\numberlinehook[1]{%
% use a loop handler to loop over a list of possible
% types. \forcsvlist comes from etoolbox
\forcsvlist{\ToCHookListHandler{#1}}{section,subsection,subsubsection,paragraph,subparagraph,figure,table}}
% the actual handler.
\newcommand\ToCHookListHandler[2]{%
\edef\tmpstr{#2}%
\ifdefstrequal{\cftwhatismyname}{\tmpstr}{%
\settowidth\tmplen{\hbox{\csuse{cft\cftwhatismyname font}#1}}%
\ifcslength{widest#2}{% is this length defined?
\ifdimgreater\tmplen{\csuse{widest#2}}{%
\global\csuse{widest#2}=\tmplen}{}}{}}{}}
%%%%%
\AtBeginDocument{
\AtEndDocument{
\memstorevalue{widestchapter}{\the\widestchapter}
\memstorevalue{widestsection}{\the\widestsection}
\memstorevalue{widestsubsection}{\the\widestsubsection}
\memstorevalue{widestsubsubsection}{\the\widestsubsubsection}
\memstorevalue{widestparagraph}{\the\widestparagraph}
}
}
%%%%
\newlength\cftnumpad % padding
\setlength\cftnumpad{0.2cm}
\AtBeginDocument{
\ifdimgreater{\RetrieveStoredLength{widestparagraph}}{\RetrieveStoredLength{widestsubsubsection}}
       {\setlength{\cftlastnumwidth}{\RetrieveStoredLength{widestparagraph}+\cftnumpad}}
       {\ifdimgreater{\RetrieveStoredLength{widestsubsubsection}}{\RetrieveStoredLength{widestsubsection}}
               {\setlength{\cftlastnumwidth}{\RetrieveStoredLength{widestsubsubsection}+\cftnumpad}}
               {\ifdimgreater{\RetrieveStoredLength{widestsubsection}}{\RetrieveStoredLength{widestsection}}
                       {\setlength{\cftlastnumwidth}{\RetrieveStoredLength{widestsubsection}+\cftnumpad}}
                       {\ifdimgreater{\RetrieveStoredLength{widestsection}}{\RetrieveStoredLength{widestchapter}}
                               {\setlength{\cftlastnumwidth}{\RetrieveStoredLength{widestsection}+\cftnumpad}}
                               {\setlength{\cftlastnumwidth}{\RetrieveStoredLength{widestchapter}+\cftnumpad}}
                        }
                }
        }


\cftsetindents{part}{0em}{\cftlastnumwidth}
\cftsetindents{chapter}{0em}{\cftlastnumwidth}
\cftsetindents{section}{0em}{\cftlastnumwidth}
\cftsetindents{subsection}{0em}{\cftlastnumwidth}
\cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
\cftsetindents{paragraph}{0em}{\cftlastnumwidth}
\cftsetindents{subparagraph}{0em}{\cftlastnumwidth}
}

%%%%
%Altera o espacamento entre dots
%\renewcommand\@dotsep{2}
%%% Altera espaco entre capitulos no sumario
\setlength{\cftbeforechapterskip}{\taxaespacoduplo pt}
%%% Altera espaco entre capitulos no texto
\setlength{\afterchapskip}{\baselineskip}
%%%%%
\setlength{\cftbeforepartskip}{0pt}%% Remoção de espaço adicional antes de uma parte nas listas
\renewcommand*{\insertchapterspace}{}%% Remoção do espaço vertical de um capítulo nas listas
%%%%%%%%%%%%%%%%%%%%%%%%
 % Fontes das entradas do sumario
\renewcommand{\cftpartfont}{\normalfont\normalsize\bfseries}%% Estilo da parte no sumário
\renewcommand{\cftchapterfont}{\normalfont\normalsize\bfseries}%% Estilo do capítulo no sumário
\renewcommand{\cftsectionfont}{\normalfont\normalsize\scshape}%% Estilo da seção no sumário
\renewcommand{\cftsubsectionfont}{\normalfont\normalsize}%% Estilo da subseção no sumário
\renewcommand{\cftsubsubsectionfont}{\normalfont\normalsize}%% Estilo da subsubseção no sumário
\renewcommand{\cftparagraphfont}{\normalfont\normalsize\itshape}%% Estilo do parágrafo no sumário
\renewcommand{\cftsubparagraphfont}{\normalfont\normalsize}%% Estilo do subparágrafo no sumário
\renewcommand{\cftpartpagefont}{\normalfont\normalsize\bfseries}%% Estilo da página da parte no sumário
\renewcommand{\cftchapterpagefont}{\normalfont\normalsize\bfseries}%% Estilo da página do capítulo no sumário
\renewcommand{\cftsectionpagefont}{\normalfont\normalsize}%% Estilo da página da seção no sumário
\renewcommand{\cftsubsectionpagefont}{\normalfont\normalsize}%% Estilo da página da subseção no sumário
\renewcommand{\cftsubsubsectionpagefont}{\normalfont\normalsize}%% Estilo da página da subsubseção no sumário
\renewcommand{\cftparagraphpagefont}{\normalfont\normalsize}%% Estilo da página do parágrafo no sumário
\renewcommand{\cftsubparagraphpagefont}{\normalfont\normalsize}%% Estilo da página do subparágrafo no sumário

% redefine os comandos *paragraph* para *subsubsubsection* ****
\renewcommand{\cftbeforesubsubsubsectionskip}{\cftbeforeparagraphskip}
\renewcommand{\cftsubsubsubsectionfont}{\cftparagraphfont}
\renewcommand{\setsubsubsubsecheadstyle}{\setparaheadstyle}

%% Níveis de seções no documento e no sumário
\setsecnumdepth{all}%% Utilizado no documento
\maxsecnumdepth{all}%% Máximo no documento
\maxtocdepth{all}%% Utilizado no sumário
\settocdepth{all}%% Máximo no sumário
%%%%%%%%%%%%%%%
% Altera a forma do sumario
% -----
\renewcommand{\tableofcontents}{
	\ifthenelse{\boolean{@twocolumn}}%
	{
		\setboolean{UTFPRrestorecol}{true}\onecolumn
	}%
	{
		\setboolean{UTFPRrestorecol}{false}
	}%
	\if@openright\cleardoublepage\else\clearpage\fi
  	\pretextualchapter{Sum\'ario}%
    \begin{espacosimples}
    \thispagestyle{empty}

    \global\@topnum\z@
	\@afterindentfalse
	\@afterheading
	\@mkboth{\contentsname}{\contentsname}
	\@starttoc{toc}
    \end{espacosimples}%
    \ifthenelse{\boolean{UTFPRrestorecol}}{\twocolumn}{}%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\textual

}%
\let\sumario\tableofcontents\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPÍTULOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Altera o tamanho das fontes
\renewcommand{\ABNTEXchapterfont}{\bfseries}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}
\renewcommand{\ABNTEXsectionfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont\itshape}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}
\newcommand{\ABNTanapsize}{\normalsize}

% Altera o espacamento das linhas dos capitulos e apendices
\newcommand*{\taxaespacomeio}{0.5}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NUMERAÇÃO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define o tipo de numeracao de figuras, tabelas e equacoes
\AddAbsoluteCounter{figure}
\setcounter{absfigure}{0}
\renewcommand{\thefigure}{\arabic{absfigure}}
\AddAbsoluteCounter{table}
\setcounter{abstable}{0}
\renewcommand{\thetable}{\arabic{abstable}}
\AddAbsoluteCounter{equation}
\renewcommand\theequation{\arabic{equation}}



%Altera o tamanho da indentação do paragrafo
\setlength{\parindent}{1.5cm} %


\renewcommand{\fonte}[1]
{
\begin{flushleft}
        \begin{spacing}{0.5}
			\par
		\end{spacing}
		{\fontsize{10}{12}\selectfont \textbf{Fonte: #1}} %%%% Alterado em 19/09/2012 para fonte normal
	\end{flushleft}
}


%%% Outros Ajustes:
\renewenvironment{quote}{\list{}{\leftmargin=4cm\rightmargin=0cm\footnotesize\singlespace}\item[]}{\endlist}  %ajuste para citacao direta: para mais de 3 linhas, deve estar em um parágrafo próprio, com recuo de 4cm, espacamento simples e fonte tamanho 10

%% permite mais de três níveis no sumário
\setcounter{secnumdepth}{10}
\setcounter{tocdepth}{10}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtEndDocument{%
\typeout{+===================================================================+}
\typeout{|      Modelo de teses e dissertações da UTFPR.                }
\typeout{|      Alterado conforme regras de 2009.       }
\typeout{|      Desenvolvido por  UTFPR-CP                               }
\typeout{|      Versão: 1.0                                            }
\typeout{|      $LastChangedDate: 2017-02-27 19:06:00 -0300$  }
\typeout{+===================================================================+}

% Salvando arquivo temporário com dados a serem utilizados na próxima "rodada"
% do latex.
\newwrite\outputstream
\immediate\openout\outputstream=\jobname.tmp
% Salvando comando contendo a largura do maior simbolo:
\immediate\write\outputstream{\string\setlength{\simbmaxwidth}{\the\simbmaxwidth}}
% Salvando comando contendo a largura da maior sigla:
\immediate\write\outputstream{\string\setlength{\siglamaxwidth}{\the\siglamaxwidth}}
% Salvando comando contendo a largura da maior abreviatura:
\immediate\write\outputstream{\string\setlength{\abrevmaxwidth}{\the\abrevmaxwidth}}
% Fechando stream:
\immediate\closeout\outputstream
}%
