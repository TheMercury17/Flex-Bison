%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 1: Analizador Lexico (Scanner)
 * Revisa el flujo de entrada y retorna tokens para palabras, saltos de linea y caracteres.
 */
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"
%}

%option noyywrap

%%

[a-zA-Z]+   { yylval.length = yyleng; return TOK_WORD; }
\n          { return TOK_NEWLINE; }
.           { return TOK_CHAR; }

%%
