/*------------  1ra Area: Codigo de Usuario ---------*/
//------> Paquetes,importaciones
package Analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

/*------------  2da Area: Opciones y Declaraciones ---------*/
%%
%{
    //----> Codigo de usuario en sintaxis java
    public static LinkedList<TError> TablaEL = new LinkedList<TError>(); 
%}

//-------> Directivas
%public 
%class Analizador_Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

//------> Expresiones Regulares
numero = [0-9]+

L = [a-zA-Z]                           
D = [0-9]
S = "+"|"-"|"*"|"/"|"%"|"<"|"<="|">"|">="|"="|"=="|"!="|"&&"|"||"|"!"|"[]"|"()"|"{}"
PUNTOCOMA = ";"
COMA = ","
PUNTO = "."
ABRIRPARENTESIS = "("
CERRARPARENTESIS = ")"
ABRIRCORCHETE = "["
CERRARCORCHETE = "]"
ABRIRLLAVE = "{"
CERRARLLAVE = "}"




GUIONBAJO = "_"

PALABRASRESERVADAS = "void"|"int"|"double"|"bool"|"string"|"class"|"interface"|"null"|"this"|"extends"|"implements"|"for"|"while"|"if"|"else"|"return"|"break"|"New"|"NewArray"


DOUBLES = ([-+]?[0-9]+"."([0-9]+)?)|([-+]?[0-9]+(".")[0-9]*([eE][-+]?[0-9]+))

IDENTIFI = {L}({D}|{L}|{GUIONBAJO})*

BOOLES = "true" | "false"

STRINGES = (\")[^\n]*(\")

HEXADECIMAL = 0[xX][0-9a-fA-F]+

CONSTANTE = {D}+

COMENTARIOSLINEA = "//"[^\n]*

COMENTARIOSLINEAS = "/*"~"*/"


ENTER = [\n]
WHITE = [ \t\r]

//------> Estados

%%
/*------------  3raa Area: Reglas Lexicas ---------*/

//-----> Simbolos

/* <YYINITIAL> "+"         { System.out.println("Reconocio "+yytext()+" mas"); return new Symbol(Simbolos.mas, yycolumn, yyline, yytext()); }
<YYINITIAL> "-"         { System.out.println("Reconocio "+yytext()+" menos"); return new Symbol(Simbolos.menos, yycolumn, yyline, yytext()); }
<YYINITIAL> "*"         { System.out.println("Reconocio "+yytext()+" por"); return new Symbol(Simbolos.por, yycolumn, yyline, yytext()); }
<YYINITIAL> "/"         { System.out.println("Reconocio "+yytext()+" div"); return new Symbol(Simbolos.div, yycolumn, yyline, yytext()); }
<YYINITIAL> "("         { System.out.println("Reconocio "+yytext()+" para"); return new Symbol(Simbolos.para, yycolumn, yyline, yytext()); }
<YYINITIAL> ")"         { System.out.println("Reconocio "+yytext()+" parc"); return new Symbol(Simbolos.parc, yycolumn, yyline, yytext()); } */

//-------> Simbolos ER
/* <YYINITIAL> {numero}    { System.out.println("Reconocio "+yytext()+" num"); return new Symbol(Simbolos.num, yycolumn, yyline, yytext()); } */
/* <YYINITIAL> {D}+                                                              { System.out.println("Reconocio "+yytext()+" numeros"); return new Symbol(Simbolos.numeros, yycolumn, yyline, yytext()); } {lexeme=yytext(); return INT;} */
<YYINITIAL> {S}                                             { System.out.println("Reconocio "+yytext()+" Signo"); return new Symbol(Simbolos.signo, yycolumn, yyline, yytext()); }                   //{lexeme=yytext(); return SIGNO;}
<YYINITIAL> STRINGES}                                       { System.out.println("Reconocio "+yytext()+" String"); return new Symbol(Simbolos.string, yycolumn, yyline, yytext()); }                 //{lexeme=yytext(); return STRING;}
<YYINITIAL> {DOUBLES}                                       { System.out.println("Reconocio "+yytext()+" Double"); return new Symbol(Simbolos.numerospuntos, yycolumn, yyline, yytext()); }              //{lexeme=yytext(); return DOUBLE;}
<YYINITIAL> {CONSTANTE}                                     { System.out.println("Reconocio "+yytext()+" Int"); return new Symbol(Simbolos.numeros, yycolumn, yyline, yytext()); }                    //{lexeme=yytext(); return INT;}
<YYINITIAL> {BOOLES}                                        { System.out.println("Reconocio "+yytext()+" Bool"); return new Symbol(Simbolos.bool, yycolumn, yyline, yytext()); }                     //{lexeme=yytext(); return BOOL;}
<YYINITIAL> {PALABRASRESERVADAS}                            { System.out.println("Reconocio "+yytext()+" Reservada"); return new Symbol(Simbolos.reservada, yycolumn, yyline, yytext()); }           //{lexeme=yytext(); return PRESERVADA;}
<YYINITIAL> {IDENTIFI}                                      { System.out.println("Reconocio "+yytext()+" Identificador"); return new Symbol(Simbolos.identificador, yycolumn, yyline, yytext()); }   //{lexeme=yytext(); return IDENTIFICADOR;}
<YYINITIAL> {HEXADECIMAL}                                   { System.out.println("Reconocio "+yytext()+" Hexadecimal"); return new Symbol(Simbolos.hexadecimal, yycolumn, yyline, yytext()); }       //{lexeme=yytext(); return HEXADECIMAL;}
<YYINITIAL> {ENTER}                                         { System.out.println("Reconocio "+yytext()+" Enter"); return new Symbol(Simbolos.enter, yycolumn, yyline, yytext()); }                   //{lexeme=yytext(); return ENTER;}
<YYINITIAL> {WHITE}                                         { System.out.println("Reconocio "+yytext()+" White"); return new Symbol(Simbolos.white, yycolumn, yyline, yytext()); }                   //{lexeme=yytext(); return WHITE;}
<YYINITIAL> ({COMENTARIOSLINEA}|{COMENTARIOSLINEAS})        { System.out.println("Reconocio "+yytext()+" Comentario"); return new Symbol(Simbolos.comentario, yycolumn, yyline, yytext()); }         //{lexeme=yytext(); return COMENTARIO;}

//------> Espacios
[ \t\r\n\f]             {/* Espacios en blanco, se ignoran */}

//------> Errores Lexicos
.                       { System.out.println("Error Lexico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                          TError datos = new TError(yytext(),yyline,yycolumn,"Error Lexico","Simbolo no existe en el lenguaje");
                          TablaEL.add(datos);}