@echo off
REM make.bat, 2014/06/25
REM Copyright (C) 2014 Luiz E. M. Lima (luizeduardomlima@gmail.com)
REM
REM This make.bat provide commands to make compiling LaTeX files.

REM Set local variables
setlocal EnableDelayedExpansion

REM Source
set src=Modelo_Dissertacao.tex
if "%src%" == "" (set /p src="Enter source filename with 3-digits extension: ")

REM Base name
set base_name=%src:~0,-4%

REM Title
title %base_name%

REM Commands
set program_latex=latex
set program_pdflatex=pdflatex
set program_dvips=dvips
set program_ps2pdf=ps2pdf
set program_bibtex=bibtex
set program_makeindex=makeindex

REM Options
set config_latex=--interaction=errorstopmode
set config_dvips=-P pdf




REM Create dvi file
set "dvi_cmd=%program_latex% %config_latex% %base_name%.tex & #"^
 "%program_bibtex% %base_name%& #"^
 "@echo %program_makeindex% -s estilo-glossario.ist -t %base_name%.glg -o %base_name%.gls %base_name%.glo & #"^
 "@echo %program_makeindex% -s estilo-indice.ist -t %base_name%.ilg -o %base_name%.ind %base_name%.idx & #"^
 "@echo %program_makeindex% -s tabela-abreviaturas.ist -t %base_name%.abrel -o %base_name%.abrevia %base_name%.abreviax & #"^
 "@echo %program_makeindex% -s tabela-abreviaturas.ist -t %base_name%.acrl -o %base_name%.acron %base_name%.acronx & #"^
 "@echo %program_makeindex% %base_name%.nlo -s nomencl.ist -o %base_name%.nls & #"^
 "%program_latex% %config_latex% %base_name%.tex & #"^
 "%program_latex% %config_latex% %base_name%.tex"
set "dvi_cmd=!dvi_cmd:#" "=!"
if %1 == dvi (%dvi_cmd%)

REM Create ps file
set "ps_cmd=%dvi_cmd% & #"^
 "%program_dvips% %config_dvips% %base_name%.dvi -o %base_name%.ps"
set "ps_cmd=!ps_cmd:#" "=!"
if %1 == ps (%ps_cmd%)

REM Create pdf file using latex
set "pdf1_cmd=%ps_cmd% & #"^
 "%program_ps2pdf% %base_name%.ps %base_name%.pdf"
set "pdf1_cmd=!pdf1_cmd:#" "=!"
if %1 == pdf1 (%pdf1_cmd%)

REM Create pdf file using pdflatex
set "pdf2_cmd= %program_pdflatex% %base_name%.tex & #"^
 "%program_bibtex% %base_name% & #"^
 "%program_makeindex% -s estilo-glossario.ist -t %base_name%.glg -o %base_name%.gls %base_name%.glo & #"^
 "%program_makeindex% -s estilo-indice.ist -t %base_name%.ilg -o %base_name%.ind %base_name%.idx & #"^
 "%program_makeindex% -s tabela-abreviaturas.ist -t %base_name%.abrel -o %base_name%.abrevia %base_name%.abreviax & #"^
 "%program_makeindex% -s tabela-abreviaturas.ist -t %base_name%.acrl -o %base_name%.acron %base_name%.acronx & #"^
 "%program_makeindex% %base_name%.nlo -s utfpr-siglas.ist -o %base_name%.nls & #"^
 "%program_pdflatex% %base_name%.tex &  #"^
 "%program_pdflatex% %base_name%.tex"
 set "pdf2_cmd=!pdf2_cmd:#" "=!"
if %1 == pdf2 (%pdf2_cmd%)

REM Remove intermediate files
set inter_files=*.aux *.log *.bbl *.blg *.brf *.mw *.out^
  *.abr *.abrevia *.abreviax *.glo *.gls *.idx *.ilg *.ind *.ist *.nlo *.nls^
  *.flt *.flx *.ftg *.glg *.grf *.loa *.lof *.loh *.lop *.lot *.tdo *.toc^
  *.los *.qdr *.bak *.tmp *.acn *.acrl *.acron *.acronx
set "clean_cmd=del /s %inter_files% & del /s %base_name%.dvi %base_name%*.ps"
if %1 == clean (%clean_cmd%)

REM Create pdf file using latex and remove intermediate files
if %1 == all1 (%pdf1_cmd% & %clean_cmd%)

REM Create pdf file using pdflatex and remove intermediate files
if %1 == all2 (%pdf2_cmd% & %clean_cmd%)

REM Show help
if %1 == help (
  @echo ##############################################################################
  @echo # Commands to make compiling LaTeX source files
  @echo ##############################################################################
  @echo # make dvi:   create dvi, convert tex-dvi.
  @echo # make ps:    create ps, convert tex-dvi-ps.
  @echo # make pdf1:  create pdf using latex, convert tex-dvi-ps-pdf.
  @echo # make pdf2:  create pdf using pdflatex, convert tex-pdf.
  @echo # make clean: remove intermediate.
  @echo # make all1:  create pdf using latex and remove intermediate.
  @echo # make all2:  create pdf using pdflatex and remove intermediate.
  @echo # make help:  show help.
  @echo ##############################################################################
)

REM Unset local variables
REM endlocal
