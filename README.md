# Solucion de Ejercicios 1 a 5: Flex y Bison

Este repositorio contiene la solucion desarrollada para los Ejemplos 1 al 5 del Capitulo 1 del libro *Flex & Bison* por John Levine.

## Autores
- **Grupo 5**
- **Andres Sebastian Coral**
- **Johan Galeano**

---

## Descripcion General

El objetivo de este proyecto es implementar, analizar y documentar el comportamiento de los primeros cinco ejemplos del libro *Flex & Bison*. Cada ejemplo demuestra conceptos fundamentales de analisis lexico (scanner) y sintactico (parser), tales como el conteo de tokens, la traduccion basada en reglas de coincidencia, la tokenizacion con valores semanticos, la especificacion explicita de identificadores de token y la construccion de una calculadora interactiva con precedencia de operadores.

La solucion esta estructurada de forma modular en C99, garantizando un codigo limpio, estructurado y mantenible.

---

## Estructura del Repositorio

```
Flex-y-Bison/
├── README.md
├── ejercicio1/
│   ├── scanner.l
│   └── parser.y
├── ejercicio2/
│   ├── scanner.l
│   └── parser.y
├── ejercicio3/
│   ├── scanner.l
│   └── parser.y
├── ejercicio4/
│   ├── scanner.l
│   └── parser.y
└── ejercicio5/
    ├── scanner.l
    └── parser.y
```

---

## Requisitos y Compilacion

### Requisitos Previos
- **Flex** (v2.6 o superior)
- **Bison** (v3.8 o superior)
- **GCC / Clang** (compatible con C99)

### Guia de Compilacion Manual

Para compilar y ejecutar cualquier ejercicio, ingrese a la carpeta del ejercicio correspondiente y ejecute la siguiente secuencia de tres comandos en la terminal:

```bash
cd ejercicio1

# 1. Generar el archivo C del analizador sintactico y su encabezado con Bison
bison -d parser.y

# 2. Generar el archivo C del analizador lexico con Flex
flex scanner.l

# 3. Compilar los archivos C generados usando GCC
gcc -o programa.exe parser.tab.c lex.yy.c
```

Una vez generado el ejecutable `programa.exe`, se puede ejecutar directamente en la consola:

```bash
./programa.exe
```

---

## Analisis y Documentacion de Ejercicios

### Ejercicio 1: Contador de Lineas, Palabras y Caracteres

#### Descripcion Teorica
Inspirado en la utilidad clasica `wc` de Unix. El escaneador identifica secuencias alfabeticas como palabras (`TOK_WORD`), saltos de linea (`TOK_NEWLINE`) y caracteres individuales (`TOK_CHAR`). El analizador sintactico acumula los conteos de forma estructurada.

#### Archivos Principales
- `ejercicio1/scanner.l`: Tokenizador en Flex.
- `ejercicio1/parser.y`: Reglas de acumulacion sintactica y funcion de impresion.

#### Pruebas y Resultados

##### Prueba 1.1: Texto multilinea estandar
- **Entrada:**
```text
The boy stood on the burning deck
shelling peanuts by the peck
```
- **Comandos de ejecucion:**
```bash
cd ejercicio1
bison -d parser.y
flex scanner.l
gcc -o programa.exe parser.tab.c lex.yy.c
./programa.exe < entrada.txt
```
- **Salida:**
```text
       2      12      63
```
- **Analisis:** 2 lineas, 12 palabras y 63 caracteres totales (incluyendo saltos de linea).

##### Prueba 1.2: Texto alternativo
- **Entrada:**
```text
Flex and Bison example code.
Written for Group 5 testing.
Third line of text.
```
- **Salida:**
```text
       4      13      79
```

---

### Ejercicio 2: Traductor de Ingles Britanico a Americano

#### Descripcion Teorica
Demuestra la capacidad de sustitucion de cadenas basadas en coincidencia de patrones. El lexico intercepta variantes de ortografia britanica (`colour`, `flavour`, `clever`, `smart`, `conservative`, `centre`, `theatre`, `analyse`) y las traduce a sus equivalentes en ingles americano (`color`, `flavor`, `smart`, `elegant`, `liberal`, `center`, `theater`, `analyze`), pasando cualquier otro caracter sin modificacion.

#### Archivos Principales
- `ejercicio2/scanner.l`: Reglas de traduccion y asignacion de `yylval.str`.
- `ejercicio2/parser.y`: Procesamiento de flujo de texto e impresion con gestion dinamica de memoria (`free`).

#### Pruebas y Resultados

##### Prueba 2.1: Oracion con multiples terminos
- **Entrada:**
```text
The colour of the flavour is clever and smart and conservative.
```
- **Salida:**
```text
The color of the flavor is smart and elegant and liberal.
```

##### Prueba 2.2: Terminos adicionales de ortografia
- **Entrada:**
```text
At the centre of the theatre, we analyse the programme.
```
- **Salida:**
```text
At the center of the theater, we analyze the programme.
```

---

### Ejercicio 3: Analizador Lexico para Calculadora Elemental

#### Descripcion Teorica
Primera etapa de una calculadora interactiva. Clasifica el flujo de entrada en tokens de operadores aritmeticos (`+`, `-`, `*`, `/`, `|`), numeros enteros, saltos de linea y caracteres no reconocidos (`Mystery character`).

#### Archivos Principales
- `ejercicio3/scanner.l`: Tokenizador lexico.
- `ejercicio3/parser.y`: Generador de informe de tokens.

#### Pruebas y Resultados

##### Prueba 3.1: Operaciones basicas y caracter no valido
- **Entrada:**
```text
12+34
 5 6 / 7q
```
- **Salida:**
```text
NUMBER 12
PLUS
NUMBER 34
NEWLINE
NUMBER 5
NUMBER 6
DIVIDE
NUMBER 7
Mystery character q
NEWLINE
```

---

### Ejercicio 4: Tokenizacion con Valores Semanticos e IDs Explicitos

#### Descripcion Teorica
Establece la comunicacion explicita entre Flex y Bison mediante constantes numericas de tokens (`NUMBER = 258`, `ADD = 259`, `SUB = 260`, `MUL = 261`, `DIV = 262`, `ABS = 263`, `EOL = 264`). Al detectar un numero, convierte la cadena mediante `atoi` y la almacena en `yylval.val`.

#### Archivos Principales
- `ejercicio4/scanner.l`: Asignacion de `yylval.val` y retorno de constantes.
- `ejercicio4/parser.y`: Declaracion explicita de tokens e impresion de codigos numericos.

#### Pruebas y Resultados

##### Prueba 4.1: Secuencia de tokens y valores semanticos
- **Entrada:**
```text
a / 34 + |45
```
- **Salida:**
```text
Mystery character a
262
258 = 34
259
263
258 = 45
264
```

---

### Ejercicio 5: Calculadora Escritorio con Precedencia de Operadores

#### Descripcion Teorica
Calculadora de escritorio funcional construida con una gramatica BNF no ambigua en cascada (`calclist`, `exp`, `factor`, `term`). Garantiza la precedencia de operadores (* y / sobre + y -), soporte de operador unario de valor absoluto (`|`), manejo de lineas en blanco y deteccion de errores sintacticos o division por cero.

#### Archivos Principales
- `ejercicio5/scanner.l`: Tokenizador de la calculadora.
- `ejercicio5/parser.y`: Gramatica BNF y evaluador aritmetico.

#### Pruebas y Resultados

##### Prueba 5.1: Verificacion de precedencia aritmetica
- **Entrada:**
```text
2 + 3 * 4
2 * 3 + 4
20 / 4 - 2
20 - 4 / 2
```
- **Salida:**
```text
= 14
= 10
= 3
= 18
```
- **Explicacion:** `2 + (3 * 4) = 14`, `(2 * 3) + 4 = 10`, `(20 / 4) - 2 = 3`, `20 - (4 / 2) = 18`.

##### Prueba 5.2: Control de division por cero y operador unario
- **Entrada:**
```text
10 / 0
| 15
```
- **Salida:**
```text
Error en ejecucion: Division por cero detectada.
= 0
= 15
```

---

## Conclusiones
1. La separacion entre analisis lexico (Flex) y analisis sintactico (Bison) permite construir compiladores e interpretes de forma modular, mantenible y eficiente.
2. La definicion rigurosa de precedencia de operadores mediante estructuras de reglas BNF evita ambiguedades sintacticas sin requerir tablas complejas.
3. La gestion adecuada de memoria al transferir cadenas entre Flex y Bison evita fugas de memoria (`memory leaks`) en aplicaciones de procesamiento de texto continuo.
