%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 2: Analizador Sintactico (Traductor Ingles Britanico -> Americano)
 * Imprime el texto procesado liberando la memoria dinamica de cada token.
 */
#include <stdio.h>
#include <stdlib.h>

extern int yylex(void);
void yyerror(const char *msg);
%}

%union {
    char *str;
}

%token <str> TOK_TEXT
%token <str> TOK_OTHER

%%

document:
      /* vacio */
    | document fragment
    ;

fragment:
      TOK_TEXT  { printf("%s", $1); free($1); }
    | TOK_OTHER { printf("%s", $1); free($1); }
    ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Error en traduccion: %s\n", msg);
}

int main(void) {
    yyparse();
    return 0;
}
