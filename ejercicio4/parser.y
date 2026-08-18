%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 4: Analizador Sintactico con IDs de Token Explicitados
 * Muestra el codigo entero de cada token y su valor asociado en caso de ser numerico.
 */
#include <stdio.h>
#include <stdlib.h>

extern int yylex(void);
void yyerror(const char *msg);
%}

%union {
    int val;
    char unrecognized_ch;
}

%token <val> NUMBER 258
%token ADD 259
%token SUB 260
%token MUL 261
%token DIV 262
%token ABS 263
%token EOL 264
%token <unrecognized_ch> UNKNOWN_TOK

%%

token_sequence:
      /* vacio */
    | token_sequence token_unit
    ;

token_unit:
      NUMBER      { printf("258 = %d\n", $1); }
    | ADD         { printf("259\n"); }
    | SUB         { printf("260\n"); }
    | MUL         { printf("261\n"); }
    | DIV         { printf("262\n"); }
    | ABS         { printf("263\n"); }
    | EOL         { printf("264\n"); }
    | UNKNOWN_TOK { printf("Mystery character %c\n", $1); }
    ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Error de tokenizacion: %s\n", msg);
}

int main(void) {
    yyparse();
    return 0;
}
