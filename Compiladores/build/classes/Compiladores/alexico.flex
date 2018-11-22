
/* --------------------------Codigo de Usuario----------------------- */
package Compiladores;

import java_cup.runtime.*;
import java.io.Reader;
      
%% //inicio de opciones
   
/* ------ Seccion de opciones y declaraciones de JFlex -------------- */  
   
/* 
    Cambiamos el nombre de la clase del analizador a Lexer
*/
%class AnalizadorLexico

/*
    Activar el contador de lineas, variable yyline
    Activar el contador de columna, variable yycolumn
*/
%line
%column
    
/* 
   Activamos la compatibilidad con Java CUP para analizadores
   sintacticos(parser)
*/
%cup

//TOKEN PARA CONSTANTES
CONSTBOOLEANAS=("true")|("false")
CONSTENTERO=([0-9]+|0[xX][0-9a-fA-F]+|0[bB][01]+)
CONSTDOUBLE=(([0-9]+(".")[0-9]*) ([eE]([+-])?[0-9]+)?)
//CONSTSTRING= (("\"")(~["\""]))
CONSTSTRING=(((\")[^\n]*(\")))
 
//TOKEN PARA IDENTIFICADORES
L = [a-zA-Z]
D = [0-9]


//TOKEN DE PALABRAS RESERVADAS

VOID=("void")
INT=("int")
DOUBLE=("double")
BOOL=("bool")
STRING=("string")
CLASS=("class")
INTERFACE=("interface")
NULL=("null")
THIS=("this")
EXTENDS=("extends")
IMPLEMENTS=("implements")
FOR=("for")
WHILE=("while")
IF=("if")
ELSE=("else")
RETURN=("return")
BREAK=("break")
NEW=("New")
NEWARRAY=("NewArray")
PRINT= ("Print")
READINTEGER= ("ReadInteger")
MALLOC= ("Malloc")
READLINE= ("ReadLine")
GETBYTE= ("GetByte")
SETBYTE= ("SetByte")

//TOKEN PARA OPERADORES Y CARACTERES DE PUNTUACION
SUMA=("+")
RESTA=("-")
MULTIPLICACION=("*")
DIVISION=("/")
PORCENTAJE=("%")
MENOR=("<")
MENORIGUAL=("<=")
MAYOR=(">")
MAYORIGUAL=(">=")
IGUAL=("=")
IGUALDAD=("==")
DIFERENTE=("!=")
AND=("&&")
OR=("||")
NEGACION=("!")
PUNTOYCOMA=(";")
COMA=(",")
PUNTO=(".")
CORCHIZQ=("[")
CORCHDER=("]")
PARENIZQ=("(")
PARENDER=(")")
LLAVEIZQ=("{")
LLAVEDER=("}")
CORCHETES=("[]")
PARENTESIS=("()")
LLAVES=("{}")

ENTER=[\n]
WHITE=[ \t\r\n]

 
/*
    Declaraciones

    El codigo entre %{  y %} sera copiado integramente en el 
    analizador generado.
*/
%{
    /*  Generamos un java_cup.Symbol para guardar el tipo de token 
        encontrado */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Generamos un Symbol para el tipo de token encontrado 
       junto con su valor */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   

/*
    Macro declaraciones
  
    Declaramos expresiones regulares que despues usaremos en las
    reglas lexicas.
*/
   
/*  Un salto de linea es un \n, \r o \r\n dependiendo del SO   */
Salto = \r|\n|\r\n
   
/* Espacio es un espacio en blanco, tabulador \t, salto de linea 
    o avance de pagina \f, normalmente son ignorados */
Espacio     = {Salto} | [ \t\f]
   
/* Una literal entera es un numero 0 oSystem.out.println("\n*** Generado " + archNombre + "***\n"); un digito del 1 al 9 
    seguido de 0 o mas digitos del 0 al 9 */
Entero = 0 | [1-9][0-9]*


%% //fin de opciones
/* -------------------- Seccion de reglas lexicas ------------------ */
   
/*
   Esta seccion contiene expresiones regulares y acciones. 
   Las acciones son código en Java que se ejecutara cuando se
   encuentre una entrada valida para la expresion regular correspondiente */
   
   /* YYINITIAL es el estado inicial del analizador lexico al escanear.
      Las expresiones regulares solo serán comparadas si se encuentra
      en ese estado inicial. Es decir, cada vez que se encuentra una 
      coincidencia el scanner vuelve al estado inicial. Por lo cual se ignoran
      estados intermedios.*/
   
<YYINITIAL> {
   
	//TOKEN PARA CONSTANTES
	{CONSTBOOLEANAS} {   System.out.print(yytext()); 
                      return symbol(sym.CONSTBOOLEANAS,  (yytext())); }
	{CONSTENTERO} {   System.out.print(yytext()); 
                      return symbol(sym.CONSTENTERO,  (yytext())); }
	{CONSTDOUBLE}  {   System.out.print(yytext()); 
                      return symbol(sym.CONSTDOUBLE,  (yytext())); }
	{CONSTSTRING}  {   System.out.print(yytext()); 
                      return symbol(sym.CONSTSTRING,  (yytext())); }
	

	//TOKEN PARA COMENTARIOS

	"/*"~"*/"   { /* ignora el espacio */ } 
	("//"[^\n]*)   { /* ignora el espacio */ } 	
					  
	//TOKEN DE PALABRAS RESERVADAS
	{VOID} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.VOID,  (yytext())); }
	{INT} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.INT,  (yytext())); }
	{DOUBLE} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.DOUBLE,  (yytext())); }
	{BOOL} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.BOOL,  (yytext())); }
	{STRING} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.STRING,  (yytext())); }
	{CLASS} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.CLASS,  (yytext())); }
	{INTERFACE} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.INTERFACE,  (yytext())); }
	{NULL} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.NULL,  (yytext())); }
	{THIS} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.THIS,  (yytext())); }
	{EXTENDS} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.EXTENDS,  (yytext())); }
	{IMPLEMENTS} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.IMPLEMENTS,(yytext())); }
	{FOR} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.FOR, (yytext())); }
	{WHILE} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.WHILE, (yytext())); }
	{IF} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.IF, (yytext())); }
	{ELSE} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.ELSE, (yytext())); }
	{RETURN} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.RETURN, (yytext())); }
	{BREAK} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.BREAK, (yytext())); }
	{NEW} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.NEW, (yytext())); }
	{NEWARRAY} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.NEWARRAY, (yytext())); }
	{PRINT} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.PRINT, (yytext())); }
	{READINTEGER} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.READINTEGER, (yytext())); }
	{MALLOC} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.MALLOC, (yytext())); }
	{READLINE} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.READLINE, (yytext())); }
	{GETBYTE} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.GETBYTE, (yytext())); }
	{SETBYTE} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.SETBYTE, (yytext())); }
					  
					  
					  
  //TOKEN PARA OPERADORES Y CARACTERES DE PUNTUACION
	{SUMA} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.SUMA, (yytext())); }
	{RESTA} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.RESTA, (yytext())); }
	{MULTIPLICACION} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.MULTIPLICACION, (yytext())); }
	{DIVISION} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.DIVISION, (yytext())); }
	{PORCENTAJE} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.PORCENTAJE, (yytext())); }
	{MENOR} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.MENOR, (yytext())); }
	{MENORIGUAL} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.MENORIGUAL,(yytext())); }
	{MAYOR} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.MAYOR, (yytext())); }
	{MAYORIGUAL} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.MAYORIGUAL, (yytext())); }
	{IGUAL} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.IGUAL, (yytext())); }
	{IGUALDAD} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.IGUALDAD, (yytext())); }
	{DIFERENTE} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.DIFERENTE, (yytext())); }
	{AND} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.AND, (yytext())); }
	{OR} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.OR, (yytext())); }
	{NEGACION} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.NEGACION, (yytext())); }
	{PUNTOYCOMA} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.PUNTOYCOMA, (yytext())); }
	{COMA} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.COMA, (yytext())); }
	{PUNTO} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.PUNTO, (yytext())); }
	{CORCHIZQ} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.CORCHIZQ, (yytext())); }
	{CORCHDER} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.CORCHDER, (yytext())); }
	{PARENIZQ} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.PARENIZQ, (yytext())); }
	{PARENDER} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.PARENDER, (yytext())); }
	{LLAVEIZQ} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.LLAVEIZQ, (yytext())); }
	{LLAVEDER} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.LLAVEDER, (yytext())); }
	{CORCHETES} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.CORCHETES, (yytext())); }
	{PARENTESIS} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.PARENTESIS, (yytext())); }
	{LLAVES} {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.LLAVES, (yytext())); }
	
	{L}({L}|{D}|"_")* {   System.out.print(yytext()+"		Linea "+yyline+"\n"); 
                      return symbol(sym.IDENTIFICADOR, (yytext())); }
	
    /* Regresa que el token SEMI declarado en la clase sym fue encontrado. */
    ";"                { return symbol(sym.SEMI); }
    /* Regresa que el token OP_SUMA declarado en la clase sym fue encontrado. */
    "+"                {  System.out.print(" + ");
                          return symbol(sym.OP_SUMA); }
    /* Regresa que el token OP_SUMA declarado en la clase sym fue encontrado. */
    "-"                {  System.out.print(" - ");
                          return symbol(sym.OP_RESTA); }
    /* Regresa que el token OP_SUMA declarado en la clase sym fue encontrado. */
    "*"                {  System.out.print(" * ");
                          return symbol(sym.OP_MULT); }
    
   
    /* Si se encuentra un entero, se imprime, se regresa un token numero
        que representa un entero y el valor que se obtuvo de la cadena yytext
        al convertirla a entero. yytext es el token encontrado. */
    {Entero}      {   System.out.print(yytext()); 
                      return symbol(sym.ENTERO, new Integer(yytext())); }

    /* No hace nada si encuentra el espacio en blanco */
    {Espacio}       { /* ignora el espacio */ } 
	
}


/* Si el token contenido en la entrada no coincide con ninguna regla
    entonces se marca un token ilegal */
[^]                    { throw new Error("Caracter ilegal <"+yytext()+">"); }
