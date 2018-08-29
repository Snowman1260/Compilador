package compiladores;;                 /*IMPORTACIONES*/
import static compiladores.Token.*;
%%                                      /*DEFINICIONES*/
%class Lexer                            /*LA CLASE QUE SE GENERARA SE LLAMA "LEXER" Y ESCRIBE CODIGO AHI*/
%type Token                             /*LOS VALORES SE RETORNAN DE TIPO "TOKEN" */
L = [a-zA-Z]                           
D = [0-9]
S = "+"|"-"|"*"|"/"|"%"|"<"|"<="|">"|">="|"="|"=="|"!="|"&&"|"||"|"!"|";"|","|"."|"["|"]"|"("|")"|"{"|"}"|"[]"|"()"|"{}"
GUIONBAJO = "_"

PALABRASRESERVADAS = "void"|"int"|"double"|"bool"|"string"|"class"|"interface"|"null"|"this"|"extends"|"implements"|"for"|"while"|"if"|"else"|"return"|"break"|"New"|"NewArray"

IDENTIFI = {L}({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?
           ({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?
           ({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?({D}|{L}|{GUIONBAJO})?

HEXADECIMAL = 0[xX][0-9a-fA-F]+

COMENTARIOSLINEA = "//" ({WHITE}|{L}|{GUIONBAJO}|{D})* "//"

COMENTARIOSLINEAS = "/*"({WHITE}|{L}|{GUIONBAJO}|{D}|{ENTER})*  "*/"

CONSTANT ={HEXADECIMAL}

ENTER = [\n]
WHITE = [ \t\r]

%{
public String lexeme;
%}
%%
                                                                  /*IGNORA ESPACIOS EN BLANCO*/
"//".*                                                            /*EL PUNTO HACE REFERENCIA A CUALQUIER CARACTER EXCEPTUANDO EL RETORNO DE CARRO.*/
{S}?{D}+                                                          {lexeme=yytext(); return INT;}
{S}?{D}+                                                          {lexeme=yytext(); return INT;}
{PALABRASRESERVADAS}                                              {lexeme=yytext(); return PRESERVADA;}
{IDENTIFI}                                                        {lexeme=yytext(); return IDENTIFICADOR;}
{CONSTANT}                                                        {lexeme=yytext(); return CONSTANTES;}
{ENTER}                                                           {lexeme=yytext(); return ENTER;}
{WHITE}                                                           {lexeme=yytext(); return WHITE;}
{S}                                                               {lexeme=yytext(); return SIGNO;}
({COMENTARIOSLINEA}|{COMENTARIOSLINEAS})                          {lexeme=yytext(); return COMENTARIO;}
.                                                                 {lexeme=yytext(); return ERROR;}

