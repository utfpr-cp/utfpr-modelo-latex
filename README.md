# UTFPR Cornélio Procópio - Trabalhos Acadêmicos

Olá, este é um modelo para a criação de um ambiente em LaTeX para a criação de trabalhos acadêmicos nas normas da UTFPR Campus Cornélio Procópio.

# Dependências

Esta classe requer que a classe ABNTEX2 versão 1.96 ou superior esteja instalada.

# Instruções

Separamos em 2 seções.

A pasta **utfpr-modelo-latex-class** possui a classe propriamente dita, para realizar a sua instalação deve-se:

1. Copiar os diretorios: doc, makeindex e tex para a raiz do diretório de instalação do LaTeX;
2. Atualizar a base de dados LaTeX;

A pasta **utfpr-modelo-latex-doc** possui um modelo de utilização da classe em questão.

A sequência de compilação correta é:

```
$ pdflatex
$ bibtex
$ pdflatex
$ pdflatex
```
