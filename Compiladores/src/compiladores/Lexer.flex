package compiladores;;                 /*IMPORTACIONES*/
import static compiladores.Token.*;
%%                                      /*DEFINICIONES*/
%class Lexer                            /*LA CLASE QUE SE GENERARA SE LLAMA "LEXER" Y ESCRIBE CODIGO AHI*/
%type Token                             /*LOS VALORES SE RETORNAN DE TIPO "TOKEN" */
%line
%column

L = [a-zA-Z]                           
D = [0-9]
S = "+"|"-"|"*"|"/"|"%"|"<"|"<="|">"|">="|"="|"=="|"!="|"&&"|"||"|"!"|";"|","|"."|"["|"]"|"("|")"|"{"|"}"|"[]"|"()"|"{}"
GUIONBAJO = "_"

PALABRASRESERVADAS = "void"|"int"|"double"|"bool"|"string"|"class"|"interface"|"null"|"this"|"extends"|"implements"|"for"|"while"|"if"|"else"|"return"|"break"|"New"|"NewArray"

DOUBLES = ([-+]?[0-9]+"."([0-9]+)?)|([-+]?[0-9]+(".")[0-9]*([eE][-+]?[0-9]+))

IDENTIFI = {L}({D}|{L}|{GUIONBAJO})*

BOOLES = "true" | "false"

STRINGES = (\")[^\n](\")

HEXADECIMAL = 0[xX][0-9a-fA-F]+

CONSTANTE = ["+"|"-"]?{D}+

COMENTARIOSLINEA = "//" ({WHITE}|{L}|{GUIONBAJO}|{D})*

COMENTARIOSLINEAS = "/*"~"*/"


ENTER = [\n]
WHITE = [ \t\r]

%{
public int Lineas(java.io.Reader reader)
    {
        return yyline;
    }
public int Columnas(java.io.Reader reader)
    {
        return yycolumn;
    }
%}
%{
public String lexeme;
%}
%%
                                                                  /*IGNORA ESPACIOS EN BLANCO*/
"//".*                                                            /*EL PUNTO HACE REFERENCIA A CUALQUIER CARACTER EXCEPTUANDO EL RETORNO DE CARRO.*/
{S}?{D}+                                                          {lexeme=yytext(); return INT;}
{STRINGES}                                                        {lexeme=yytext(); return STRING;}
{DOUBLES}                                                         {lexeme=yytext(); return DOUBLE;}
{CONSTANTE}                                                       {lexeme=yytext(); return INT;}
{BOOLES}                                                          {lexeme=yytext(); return BOOL;}
{PALABRASRESERVADAS}                                              {lexeme=yytext(); return PRESERVADA;}
{IDENTIFI}                                                        {lexeme=yytext(); return IDENTIFICADOR;}
{HEXADECIMAL}                                                     {lexeme=yytext(); return HEXADECIMAL;}
{ENTER}                                                           {lexeme=yytext(); return ENTER;}
{WHITE}                                                           {lexeme=yytext(); return WHITE;}
{S}                                                               {lexeme=yytext(); return SIGNO;}
({COMENTARIOSLINEA}|{COMENTARIOSLINEAS})                          {lexeme=yytext(); return COMENTARIO;}
.                                                                 {lexeme=yytext(); return ERROR;}

