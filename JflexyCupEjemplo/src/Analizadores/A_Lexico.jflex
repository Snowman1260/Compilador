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
S = "[]"|"()"|"{}"

IGUAL = "="
MAS = "+"
MENOS = "-"
POR = "*"
DIVISION = "/"
PORCENTAJE = "%"
NEGATIVO = "-"
MENOR = "<"
MENORIGUAL = "<="
MAYOR = ">"
MAYORIGUAL = ">="
IGUALIGUAL = "=="
NOTIGUAL = "!="
AND = "&&"
OR = "||"
NOT = "!"

PUNTOCOMA = ";"
COMA = ","
PUNTO = "."
ABRIRPARENTESIS = "("
CERRARPARENTESIS = ")"
ABRIRCORCHETE = "["
CERRARCORCHETE = "]"
ABRIRLLAVE = "{"
CERRARLLAVE = "}"

NUEVO = "New"
NUEVOARREGLO = "NewArray"
LEERINT = "ReadInteger"
LEERLINEA = "ReadLine"
MALLOC = "Malloc"
BREAK = "break"

INT = "int"
DOUBLE = "double"
BOOL = "bool"
STRING = "string"
IDENT = "ident"

VOID = "void"
CLASS = "class"
EXTENDS = "extends"
IMPLEMENTS = "implements"
INTERFACE = "interface"
IF = "if"
WHILE = "while"
FOR = "for"
RETURN = "return"
ELSE = "else"
THIS = "this"
NULL = "null"


GUIONBAJO = "_"

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

/*
<YYINITIAL> "+"         { System.out.println("Reconocio "+yytext()+" mas"); return new Symbol(Simbolos.mas, yycolumn, yyline, yytext()); }
<YYINITIAL> "-"         { System.out.println("Reconocio "+yytext()+" menos"); return new Symbol(Simbolos.menos, yycolumn, yyline, yytext()); }
<YYINITIAL> "*"         { System.out.println("Reconocio "+yytext()+" por"); return new Symbol(Simbolos.por, yycolumn, yyline, yytext()); }
<YYINITIAL> "/"         { System.out.println("Reconocio "+yytext()+" div"); return new Symbol(Simbolos.div, yycolumn, yyline, yytext()); }
<YYINITIAL> "("         { System.out.println("Reconocio "+yytext()+" para"); return new Symbol(Simbolos.para, yycolumn, yyline, yytext()); }
<YYINITIAL> ")"         { System.out.println("Reconocio "+yytext()+" parc"); return new Symbol(Simbolos.parc, yycolumn, yyline, yytext()); }
<YYINITIAL> {numero}    { System.out.println("Reconocio "+yytext()+" num"); return new Symbol(Simbolos.num, yycolumn, yyline, yytext()); }
*/

//-------> Simbolos ER
<YYINITIAL> {IGUAL}               { System.out.println("Reconocio "+yytext()+" IGUAL"); return new Symbol(Simbolos.igual, yycolumn, yyline, yytext()); }
<YYINITIAL> {MAS}                 { System.out.println("Reconocio "+yytext()+" MAS"); return new Symbol(Simbolos.mas, yycolumn, yyline, yytext()); }
<YYINITIAL> {MENOS}               { System.out.println("Reconocio "+yytext()+" MENOS"); return new Symbol(Simbolos.menos, yycolumn, yyline, yytext()); }
<YYINITIAL> {POR}                 { System.out.println("Reconocio "+yytext()+" POR"); return new Symbol(Simbolos.por, yycolumn, yyline, yytext()); }
<YYINITIAL> {DIVISION}            { System.out.println("Reconocio "+yytext()+" DIVISION"); return new Symbol(Simbolos.division, yycolumn, yyline, yytext()); }
<YYINITIAL> {PORCENTAJE}          { System.out.println("Reconocio "+yytext()+" PORCETAJE"); return new Symbol(Simbolos.porcentaje, yycolumn, yyline, yytext()); }

<YYINITIAL> {NEGATIVO}            { System.out.println("Reconocio "+yytext()+" NEGATIVO"); return new Symbol(Simbolos.negativo, yycolumn, yyline, yytext()); }
<YYINITIAL> {MENOR}               { System.out.println("Reconocio "+yytext()+" MENOR"); return new Symbol(Simbolos.menor, yycolumn, yyline, yytext()); }
<YYINITIAL> {MENORIGUAL}          { System.out.println("Reconocio "+yytext()+" MENORIGUAL"); return new Symbol(Simbolos.menorigual, yycolumn, yyline, yytext()); }
<YYINITIAL> {MAYOR}               { System.out.println("Reconocio "+yytext()+" MAYOR"); return new Symbol(Simbolos.mayor, yycolumn, yyline, yytext()); }
<YYINITIAL> {MAYORIGUAL}          { System.out.println("Reconocio "+yytext()+" MAYORIGUAL"); return new Symbol(Simbolos.mayorigual, yycolumn, yyline, yytext()); }
<YYINITIAL> {IGUALIGUAL}          { System.out.println("Reconocio "+yytext()+" IGUALIGUAL"); return new Symbol(Simbolos.igualigual, yycolumn, yyline, yytext()); }

<YYINITIAL> {NOTIGUAL}            { System.out.println("Reconocio "+yytext()+" NOTIGUAL"); return new Symbol(Simbolos.notigual, yycolumn, yyline, yytext()); }
<YYINITIAL> {AND}                 { System.out.println("Reconocio "+yytext()+" AND"); return new Symbol(Simbolos.and, yycolumn, yyline, yytext()); }
<YYINITIAL> {OR}                  { System.out.println("Reconocio "+yytext()+" OR"); return new Symbol(Simbolos.or, yycolumn, yyline, yytext()); }
<YYINITIAL> {NOT}                 { System.out.println("Reconocio "+yytext()+" NOT"); return new Symbol(Simbolos.not, yycolumn, yyline, yytext()); }

<YYINITIAL> {PUNTOCOMA}            { System.out.println("Reconocio "+yytext()+" PUNTOCOMA"); return new Symbol(Simbolos.puntocoma, yycolumn, yyline, yytext()); }
<YYINITIAL> {COMA}                 { System.out.println("Reconocio "+yytext()+" COMA"); return new Symbol(Simbolos.coma, yycolumn, yyline, yytext()); }
<YYINITIAL> {PUNTO}                { System.out.println("Reconocio "+yytext()+" PUNTO"); return new Symbol(Simbolos.punto, yycolumn, yyline, yytext()); }
<YYINITIAL> {ABRIRPARENTESIS}      { System.out.println("Reconocio "+yytext()+" ABRIRPARENTESIS"); return new Symbol(Simbolos.abrirparentesis, yycolumn, yyline, yytext()); }
<YYINITIAL> {CERRARPARENTESIS}     { System.out.println("Reconocio "+yytext()+" CERRARPARENTESIS"); return new Symbol(Simbolos.cerrarparentesis, yycolumn, yyline, yytext()); }
<YYINITIAL> {ABRIRCORCHETE}        { System.out.println("Reconocio "+yytext()+" ABRIRCORCHETE"); return new Symbol(Simbolos.abrircorchete, yycolumn, yyline, yytext()); }

<YYINITIAL> {CERRARCORCHETE}       { System.out.println("Reconocio "+yytext()+" CERRARCORCHETE"); return new Symbol(Simbolos.cerrarcorchete, yycolumn, yyline, yytext()); }
<YYINITIAL> {ABRIRLLAVE}           { System.out.println("Reconocio "+yytext()+" ABRIRLLAVE"); return new Symbol(Simbolos.abrirllave, yycolumn, yyline, yytext()); }
<YYINITIAL> {CERRARLLAVE}          { System.out.println("Reconocio "+yytext()+" CERRARLLAVE"); return new Symbol(Simbolos.cerrarllave, yycolumn, yyline, yytext()); }

<YYINITIAL> {NUEVO}                { System.out.println("Reconocio "+yytext()+" NUEVO"); return new Symbol(Simbolos.nuevo, yycolumn, yyline, yytext()); }
<YYINITIAL> {NUEVOARREGLO}         { System.out.println("Reconocio "+yytext()+" NUEVOARREGLO"); return new Symbol(Simbolos.nuevoarreglo, yycolumn, yyline, yytext()); }
<YYINITIAL> {LEERINT}              { System.out.println("Reconocio "+yytext()+" LEERINT"); return new Symbol(Simbolos.leerint, yycolumn, yyline, yytext()); }
<YYINITIAL> {LEERLINEA}            { System.out.println("Reconocio "+yytext()+" LEERLINEA"); return new Symbol(Simbolos.leerlinea, yycolumn, yyline, yytext()); }
<YYINITIAL> {MALLOC}               { System.out.println("Reconocio "+yytext()+" MALLOC"); return new Symbol(Simbolos.malloc, yycolumn, yyline, yytext()); }
<YYINITIAL> {BREAK}                { System.out.println("Reconocio "+yytext()+" BREAK"); return new Symbol(Simbolos.breaking, yycolumn, yyline, yytext()); }

<YYINITIAL> {INT}                  { System.out.println("Reconocio "+yytext()+" INT"); return new Symbol(Simbolos.interG, yycolumn, yyline, yytext()); }
<YYINITIAL> {DOUBLE}               { System.out.println("Reconocio "+yytext()+" DOUBLE"); return new Symbol(Simbolos.doubleG, yycolumn, yyline, yytext()); }
<YYINITIAL> {BOOL}                 { System.out.println("Reconocio "+yytext()+" BOOL"); return new Symbol(Simbolos.booles, yycolumn, yyline, yytext()); }
<YYINITIAL> {STRING}               { System.out.println("Reconocio "+yytext()+" STRING"); return new Symbol(Simbolos.stringes, yycolumn, yyline, yytext()); }
<YYINITIAL> {IDENT}              { System.out.println("Reconocio "+yytext()+" IDENT"); return new Symbol(Simbolos.ident, yycolumn, yyline, yytext()); }

<YYINITIAL> {VOID}                 { System.out.println("Reconocio "+yytext()+" VOID"); return new Symbol(Simbolos.voides, yycolumn, yyline, yytext()); }
<YYINITIAL> {CLASS}                { System.out.println("Reconocio "+yytext()+" CLASS"); return new Symbol(Simbolos.classing, yycolumn, yyline, yytext()); }
<YYINITIAL> {EXTENDS}             { System.out.println("Reconocio "+yytext()+" EXTENDS"); return new Symbol(Simbolos.exetndsing, yycolumn, yyline, yytext()); }

<YYINITIAL> {IMPLEMENTS}           { System.out.println("Reconocio "+yytext()+" IMPLEMENTS"); return new Symbol(Simbolos.implementsing, yycolumn, yyline, yytext()); }
<YYINITIAL> {INTERFACE}            { System.out.println("Reconocio "+yytext()+" INTERFACE"); return new Symbol(Simbolos.interfaceing, yycolumn, yyline, yytext()); }
<YYINITIAL> {IF}                   { System.out.println("Reconocio "+yytext()+" IF"); return new Symbol(Simbolos.ifing, yycolumn, yyline, yytext()); }

<YYINITIAL> {WHILE}                { System.out.println("Reconocio "+yytext()+" WHILE"); return new Symbol(Simbolos.whileing, yycolumn, yyline, yytext()); }
<YYINITIAL> {FOR}                  { System.out.println("Reconocio "+yytext()+" FOR"); return new Symbol(Simbolos.foring, yycolumn, yyline, yytext()); }
<YYINITIAL> {RETURN}               { System.out.println("Reconocio "+yytext()+" RETURN"); return new Symbol(Simbolos.returning, yycolumn, yyline, yytext()); }
<YYINITIAL> {ELSE}                 { System.out.println("Reconocio "+yytext()+" ELSE"); return new Symbol(Simbolos.elseing, yycolumn, yyline, yytext()); }
<YYINITIAL> {THIS}                 { System.out.println("Reconocio "+yytext()+" THIS"); return new Symbol(Simbolos.thising, yycolumn, yyline, yytext()); }
<YYINITIAL> {NULL}                 { System.out.println("Reconocio "+yytext()+" NULL"); return new Symbol(Simbolos.nulling, yycolumn, yyline, yytext()); }

<YYINITIAL> {GUIONBAJO}            { System.out.println("Reconocio "+yytext()+" GUIONBAJO"); return new Symbol(Simbolos.guionbajo, yycolumn, yyline, yytext()); }
<YYINITIAL> {DOUBLES}              { System.out.println("Reconocio "+yytext()+" DOUBLES"); return new Symbol(Simbolos.doubles, yycolumn, yyline, yytext()); }
<YYINITIAL> {IDENTIFI}             { System.out.println("Reconocio "+yytext()+" IDENTIFI"); return new Symbol(Simbolos.identifi, yycolumn, yyline, yytext()); }
<YYINITIAL> {BOOLES}               { System.out.println("Reconocio "+yytext()+" BOOLES"); return new Symbol(Simbolos.boolesing, yycolumn, yyline, yytext()); }
<YYINITIAL> {STRINGES}             { System.out.println("Reconocio "+yytext()+" STRINGES"); return new Symbol(Simbolos.stringesing, yycolumn, yyline, yytext()); }
<YYINITIAL> {HEXADECIMAL}          { System.out.println("Reconocio "+yytext()+" HEXADECIMAL"); return new Symbol(Simbolos.hexadecimal, yycolumn, yyline, yytext()); }

<YYINITIAL> {CONSTANTE}            { System.out.println("Reconocio "+yytext()+" CONSTANTE"); return new Symbol(Simbolos.constante, yycolumn, yyline, yytext()); }
<YYINITIAL> {COMENTARIOSLINEA}     { System.out.println("Reconocio "+yytext()+" COMENTARIOSLINEA"); return new Symbol(Simbolos.comentariolinea, yycolumn, yyline, yytext()); }
<YYINITIAL> {COMENTARIOSLINEAS}    { System.out.println("Reconocio "+yytext()+" COMENTARIOSLINEAS"); return new Symbol(Simbolos.comentariolineas, yycolumn, yyline, yytext()); }

<YYINITIAL> {S}                    { System.out.println("Reconocio "+yytext()+" SimbolosAlaPar"); return new Symbol(Simbolos.simboling, yycolumn, yyline, yytext()); }


//------> Espacios
[ \t\r\n\f]             {/* Espacios en blanco, se ignoran */}

//------> Errores Lexicos
.                       { System.out.println("Error Lexico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                          TError datos = new TError(yytext(),yyline,yycolumn,"Error Lexico","Simbolo no existe en el lenguaje");
                          TablaEL.add(datos);}