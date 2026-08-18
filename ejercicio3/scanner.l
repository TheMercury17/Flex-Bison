%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 3: Analizador Lexico Reconocedor de Tokens de Calculadora
 * Identifica operadores, numeros, saltos de linea y caracteres desconocidos.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
%}

%option noyywrap

%%

"+"         { return TOK_PLUS; }
"-"         { return TOK_MINUS; }
"*"         { return TOK_TIMES; }
"/"         { return TOK_DIVIDE; }
"|"         { return TOK_ABS; }
[0-9]+      { yylval.lex_str = strdup(yytext); return TOK_NUM; }
\n          { return TOK_NEWLINE; }
[ \t]+      { /* Ignorar espacios y tabulaciones */ }
.           { yylval.lex_str = strdup(yytext); return TOK_UNRECOGNIZED; }

%%
