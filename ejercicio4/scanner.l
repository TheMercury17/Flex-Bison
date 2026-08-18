%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 4: Analizador Lexico con Retorno de Valores y Codigos de Token
 * Asigna valores numericos a yylval y retorna codigos de token estandar.
 */
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"
%}

%option noyywrap

%%

"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"|"         { return ABS; }
[0-9]+      { yylval.val = atoi(yytext); return NUMBER; }
\n          { return EOL; }
[ \t]+      { /* Ignorar espacios */ }
.           { yylval.unrecognized_ch = *yytext; return UNKNOWN_TOK; }

%%
