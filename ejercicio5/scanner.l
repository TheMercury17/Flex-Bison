%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 5: Analizador Lexico (Calculadora Escritorio)
 * Genera tokens para operadores aritmeticos, enteros y fin de linea.
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
[ \t]+      { /* Ignorar espacios en blanco */ }
.           { fprintf(stderr, "Caracter no reconocido: %c\n", *yytext); }

%%
