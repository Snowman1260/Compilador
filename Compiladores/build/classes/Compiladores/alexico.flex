/* --------------------------Codigo de Usuario----------------------- */
package Compiladores;

import java_cup.runtime.*;
import java.io.Reader;
      
%% //inicio de opciones

%class AnalizadorLexico

%line
%column

%cup

%{
    private Symbol symbol(int type) 
    {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) 
    {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
/* ------------------------------------------------------------------------------------------------------------------------------------------------------------- */
//------------------------------------------------------------------------------
//-----------------------------Palabras Reservadas------------------------------
//------------------------------------------------------------------------------
Void        = "void" 
IntP         = "int" 
DoubleP      = "double" 
BoolP        = "bool" 
StringP      = "string" 
Class       = "class" 
Interface   = "interface" 
Null        = "null" 
This        = "this" 
Extends     = "extends" 
Implements  = "implements" 
For         = "for" 
While       = "while" 
If          = "if" 
Else        = "else" 
Return      = "return" 
Break       = "break" 
New         = "New" 
NewArray    = "NewArray"

Print       = "Print"
ReadInteger = "ReadInteger" 
ReadLine    = "ReadLine" 
Malloc      = "Malloc"

GetByte = "GetByte"
SetByte = "SetByte"


//------------------------------------------------------------------------------
//-------------------------------Identificadores--------------------------------
//------------------------------------------------------------------------------
Identifi = [A-Za-z]+([_]|[A-Za-z]|[0-9])*

//------------------------------------------------------------------------------
//---------------------------------Constantes-----------------------------------
//------------------------------------------------------------------------------
Booles = "true"|"false"
Entero    = [0-9]+
Hexa = 0[xX][0-9a-fA-F]+
Double    = [0-9]+ "." [0-9]* 
            | [0-9]+ "." [0-9]* [eE] [\+|-]? [0-9]+ "."? [0-9]*
            | [0-9]+ [eE] [\+|-]? [0-9]+

String    = (\")[^\n]*(\") 

//------------------------------------------------------------------------------
//------------------------------------Otros-------------------------------------
//------------------------------------------------------------------------------


Comentario   	= "/*" [^]~ "*/"
Comentario2 	= "//" [^\n]*
ERROR_COMENTARIO = "/*" [^*]+ 

Salto = \r|\n|\r\n
Espacio     = {Salto} 
			| [ \t\f\n\r] 
//------------------------------------------------------------------------------
//---------------------------------Operadores-----------------------------------
//------------------------------------------------------------------------------
SUMA 			= \+ 
RESTA 			= "-" 
MULTIPLICACION 	        = \* 
DIVISION		= \/ 
MOD			= "%" 
MENOR			= "<"  
MENORIGUAL		= "<=" 
MAYOR			= ">" 
MAYORIGUAL		= ">=" 
IGUAL			= "="
IGUALIGUAL		= "==" 
NOTIGUAL		= "!=" 
AND 			= "&&" 
OR			= "||" 
NOT		        = "!" 
CORCHETEIZQ		= "[" 
COMA 			= "," 
PUNTO 			= "." 
PUNTOYCOMA		= ";" 
CORCHETEDER		= "]" 
PARENTESISIZQ		= \( 
PARENTESISDER		= \) 
LLAVEIZQ    		= \{ 
LLAVEDER                = \} 
CORCHETES		= "[]" 
PARENTESIS		= "()" 
LLAVES			= "{}"
/* ------------------------------------------------------------------------------------------------------------------------------------------------------------- */


%% //fin de opciones
/* ----------------------------------------------------------------- Seccion de reglas lexicas ---------------------------------------------------------------- */
<YYINITIAL> 
{
	{Espacio}       		{ /* ignora el espacio */ } 
	{Comentario}			{ /* ignora el espacio */ }
	{Comentario2}			{ /* ignora el espacio */ }
	{Entero}      			{System.out.print(yytext()); return symbol(sym.ENTERO, 	(yytext()));}
	
	//------------------------------------------------------------------------------
	//-----------------------------------Retornos-----------------------------------
	{Void}   	{System.out.print(yytext()); return symbol(sym.VOID, 	(yytext()));}
	{IntP}    	{System.out.print(yytext()); return symbol(sym.INT, 	(yytext()));}   	
	{DoubleP} 	{System.out.print(yytext()); return symbol(sym.DOUBLE, 	(yytext()));}
	{BoolP}      {System.out.print(yytext()); return symbol(sym.BOOL, 	(yytext()));}
	{StringP}    {System.out.print(yytext()); return symbol(sym.STRING, 	(yytext()));}
	{Class}     {System.out.print(yytext()); return symbol(sym.CLASS, 	(yytext()));}
	{Interface} {System.out.print(yytext()); return symbol(sym.INTERFACE,(yytext()));}
	{Null}      {System.out.print(yytext()); return symbol(sym.NULL, 	(yytext()));}
	{This}      {System.out.print(yytext()); return symbol(sym.THIS, 	(yytext()));}
	{Extends}   {System.out.print(yytext()); return symbol(sym.EXTENDS,	(yytext()));}
	{Implements} {System.out.print(yytext()); return symbol(sym.IMPLEMENTS,(yytext()));}
	{For}       {System.out.print(yytext()); return symbol(sym.FOR, 	(yytext()));}
	{While}     {System.out.print(yytext()); return symbol(sym.WHILE, 	(yytext()));}
	{If}        {System.out.print(yytext()); return symbol(sym.IF, 		(yytext()));}
	{Else}      {System.out.print(yytext()); return symbol(sym.ELSE, 	(yytext()));}
	{Return}    {System.out.print(yytext()); return symbol(sym.RETURN, 	(yytext()));}
	{Break}     {System.out.print(yytext()); return symbol(sym.BREAK, 	(yytext()));}
	{New}       {System.out.print(yytext()); return symbol(sym.NEW, 	(yytext()));}
	{NewArray}  {System.out.print(yytext()); return symbol(sym.NEWARRAY,    (yytext()));}

	{Print}     {System.out.print(yytext()); return symbol(sym.PRINT, 	 (yytext()));}
	{ReadInteger} {System.out.print(yytext()); return symbol(sym.READINTEGER,(yytext()));}
	{ReadLine}  {System.out.print(yytext()); return symbol(sym.READLINE,     (yytext()));}
	{Malloc}    {System.out.print(yytext()); return symbol(sym.MALLOC, 	 (yytext()));}


	{Booles}   {System.out.print(yytext()); return symbol(sym.BOOLEANO, 	(yytext()));}
	//{Entero}      {System.out.print(yytext()); return symbol(sym.ENTERO, 		(yytext()));} 
	{Hexa} {System.out.print(yytext()); return symbol(sym.HEXADECIMAL,	(yytext()));}
	{Double}      {System.out.print(yytext()); return symbol(sym.DECIMAL, 	(yytext()));}
	{String}      {System.out.print(yytext()); return symbol(sym.CADENA, 		(yytext()));}

	{Identifi} {System.out.print(yytext()); return symbol(sym.IDENTIFICADOR, (yytext()));}

	{SUMA}			{System.out.print(yytext()); return symbol(sym.Suma, 			(yytext()));}
	{RESTA}			{System.out.print(yytext()); return symbol(sym.Resta, 			(yytext()));}
	{MULTIPLICACION}        {System.out.print(yytext()); return symbol(sym.Multiplicacion,          (yytext()));}
	{DIVISION}		{System.out.print(yytext()); return symbol(sym.Division, 		(yytext()));}
	{MOD}			{System.out.print(yytext()); return symbol(sym.Mod, 			(yytext()));}
	{MENOR}			{System.out.print(yytext()); return symbol(sym.Menor,	 		(yytext()));}
	{MENORIGUAL}	        {System.out.print(yytext()); return symbol(sym.MenorIgual, 		(yytext()));}
	{MAYOR}			{System.out.print(yytext()); return symbol(sym.Mayor,	 		(yytext()));}
	{MAYORIGUAL}	        {System.out.print(yytext()); return symbol(sym.MayorIgual, 		(yytext()));}
	{IGUAL}			{System.out.print(yytext()); return symbol(sym.Igual,	 		(yytext()));}
	{IGUALIGUAL}	        {System.out.print(yytext()); return symbol(sym.IgualIgual, 		(yytext()));}
	{NOTIGUAL}		{System.out.print(yytext()); return symbol(sym.Diferente, 		(yytext()));}
	{AND}			{System.out.print(yytext()); return symbol(sym.And,		 		(yytext()));}
	{OR}			{System.out.print(yytext()); return symbol(sym.Or,		 		(yytext()));}
	{NOT}		{System.out.print(yytext()); return symbol(sym.Negacion, 		(yytext()));}
	{COMA}			{System.out.print(yytext()); return symbol(sym.Coma, 			(yytext()));}
	{PUNTO}			{System.out.print(yytext()); return symbol(sym.Punto,	 		(yytext()));}
	{PUNTOYCOMA}	{System.out.print(yytext()); return symbol(sym.PuntoyComa, 		(yytext()));}
	{CORCHETEIZQ}		{System.out.print(yytext()); return symbol(sym.CorcheteIZQ, 		(yytext()));} 
	{CORCHETEDER}		{System.out.print(yytext()); return symbol(sym.CorcheteDER, 		(yytext()));}
	{PARENTESISIZQ}	{System.out.print(yytext()); return symbol(sym.ParentesisIzq, 	(yytext()));}
	{PARENTESISDER}	{System.out.print(yytext()); return symbol(sym.ParentesisDer,		(yytext()));}
	{LLAVEIZQ}		{System.out.print(yytext()); return symbol(sym.LlavesIzq, 			(yytext()));}
	{LLAVEDER}		{System.out.print(yytext()); return symbol(sym.LlavesDer, 			(yytext()));}
	{CORCHETES}		{System.out.print(yytext()); return symbol(sym.Corchetes, 		(yytext()));}
	{PARENTESIS}	{System.out.print(yytext()); return symbol(sym.Parentesis, 		(yytext()));}
	{LLAVES}		{System.out.print(yytext()); return symbol(sym.Llaves, 			(yytext()));}

        {GetByte}               {System.out.print(yytext()); return symbol(sym.GETBYTE, 			(yytext()));}
        {SetByte}               {System.out.print(yytext()); return symbol(sym.SETBYTE, 			(yytext()));}
}

[^]                    { throw new Error("Caracter ilegal <"+yytext()+">"); }