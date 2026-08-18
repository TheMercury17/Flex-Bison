%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 3: Analizador Sintactico para Impresion de Tokens
 * Recibe tokens del lexer e imprime sus representaciones de salida formateadas.
 */
#include <stdio.h>
#include <stdlib.h>

extern int yylex(void);
void yyerror(const char *msg);
%}

%union {
    char *lex_str;
}

%token TOK_PLUS TOK_MINUS TOK_TIMES TOK_DIVIDE TOK_ABS TOK_NEWLINE
%token <lex_str> TOK_NUM TOK_UNRECOGNIZED

%%

token_stream:
      /* vacio */
    | token_stream token_entry
    ;

token_entry:
      TOK_PLUS         { printf("PLUS\n"); }
    | TOK_MINUS        { printf("MINUS\n"); }
    | TOK_TIMES        { printf("TIMES\n"); }
    | TOK_DIVIDE       { printf("DIVIDE\n"); }
    | TOK_ABS          { printf("ABS\n"); }
    | TOK_NUM          { printf("NUMBER %s\n", $1); free($1); }
    | TOK_NEWLINE      { printf("NEWLINE\n"); }
    | TOK_UNRECOGNIZED { printf("Mystery character %s\n", $1); free($1); }
    ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Error lexico/sintactico: %s\n", msg);
}

int main(void) {
    yyparse();
    return 0;
}
