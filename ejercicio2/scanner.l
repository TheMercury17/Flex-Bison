%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 2: Analizador Lexico (Traductor Ingles Britanico -> Americano)
 * Captura terminos especificos y realiza la traduccion hacia ingles americano.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
%}

%option noyywrap

%%

"colour"        { yylval.str = strdup("color"); return TOK_TEXT; }
"flavour"       { yylval.str = strdup("flavor"); return TOK_TEXT; }
"clever"        { yylval.str = strdup("smart"); return TOK_TEXT; }
"smart"         { yylval.str = strdup("elegant"); return TOK_TEXT; }
"conservative"  { yylval.str = strdup("liberal"); return TOK_TEXT; }
"centre"        { yylval.str = strdup("center"); return TOK_TEXT; }
"theatre"       { yylval.str = strdup("theater"); return TOK_TEXT; }
"analyse"       { yylval.str = strdup("analyze"); return TOK_TEXT; }
[a-zA-Z]+       { yylval.str = strdup(yytext); return TOK_TEXT; }
.|\n            { yylval.str = strdup(yytext); return TOK_OTHER; }

%%
