%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 1: Analizador Sintactico (Parser)
 * Cuenta lineas, palabras y caracteres procesando los tokens recibidos de Flex.
 */
#include <stdio.h>
#include <stdlib.h>

extern int yylex(void);
void yyerror(const char *msg);

static int line_count = 0;
static int word_count = 0;
static int char_count = 0;
%}

%union {
    int length;
}

%token <length> TOK_WORD
%token TOK_NEWLINE
%token TOK_CHAR

%%

stream_input:
      /* vacio */
    | stream_input element
    ;

element:
      TOK_WORD    { word_count++; char_count += $1; }
    | TOK_NEWLINE { line_count++; char_count++; }
    | TOK_CHAR    { char_count++; }
    ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Error sintactico: %s\n", msg);
}

int main(void) {
    yyparse();
    printf("%8d%8d%8d\n", line_count, word_count, char_count);
    return 0;
}
