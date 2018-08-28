package compiladores;;                 /*IMPORTACIONES*/
import static compiladores.Token.*;
%%                                      /*DEFINICIONES*/
%class Lexer                            /*LA CLASE QUE SE GENERARA SE LLAMA "LEXER" Y ESCRIBE CODIGO AHI*/
%type Token                             /*LOS VALORES SE RETORNAN DE TIPO "TOKEN" */
L = [a-zA-Z_]                           
D = [0-9]
S = "+"|"-"|"*"|"/"|"%"|"<"|"<="|">"|">="|"="|"=="|"!="|"&&"|"||"|"!"|";"|","|"."|"["|"]"|"("|")"|"{"|"}"|"[]"|"()"|"{}"

PALABRASRESERVADAS = "void"|"int"|"double"|"bool"|"string"|"class"|"interface"|"null"|"this"|"extends"|"implements"|"for"|"while"|"if"|"else"|"return"|"break"|"New"|"NewArray"


ENTER = [\n]
WHITE = [ \t\r]

%{
public String lexeme;
%}
%%
{WHITE} {}                            /*IGNORA ESPACIOS EN BLANCO*/
"//".*                               /*EL PUNTO HACE REFERENCIA A CUALQUIER CARACTER EXCEPTUANDO EL RETORNO DE CARRO.*/
{S}?{D}+                                                          {lexeme=yytext(); return INT;}
{S}?{D}+                                                          {lexeme=yytext(); return INT;}
{PALABRASRESERVADAS}                                              {lexeme=yytext(); return PRESERVADA;}
{ENTER}                                                           {lexeme=yytext(); return ENTER;}
{S}                                                               {lexeme=yytext(); return SIGNO;}
.                                                                 {return ERROR;}
