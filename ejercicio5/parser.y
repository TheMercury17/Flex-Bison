%{
/*
 * Autores: Grupo 5
 * - Andres Sebastian Coral
 * - Johan Galeano
 *
 * Ejercicio 5: Analizador Sintactico (Calculadora Aritmetica con Precedencia)
 * Evalua expresiones aritmeticas respetando precedencia de operadores (*, / sobre +, -) y valor absoluto.
 */
#include <stdio.h>
#include <stdlib.h>

extern int yylex(void);
void yyerror(const char *msg);
%}

%union {
    int val;
}

%token <val> NUMBER
%token ADD SUB MUL DIV ABS EOL

%type <val> exp factor term

%%

calclist:
      /* vacio */
    | calclist exp EOL { printf("= %d\n", $2); }
    | calclist EOL     { /* linea en blanco */ }
    ;

exp:
      factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor:
      term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term {
        if ($3 == 0) {
            yyerror("Division por cero detectada.");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
      }
    ;

term:
      NUMBER
    | ABS term { $$ = ($2 >= 0) ? $2 : -$2; }
    ;

%%

void yyerror(const char *msg) {
    fprintf(stderr, "Error en ejecucion: %s\n", msg);
}

int main(void) {
    yyparse();
    return 0;
}
