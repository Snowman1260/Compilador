package compiladores;;                 /*IMPORTACIONES*/
import static compiladores.Token.*;
%%                                      /*DEFINICIONES*/
%class Lexer                            /*LA CLASE QUE SE GENERARA SE LLAMA "LEXER" Y ESCRIBE CODIGO AHI*/
%type Token                             /*LOS VALORES SE RETORNAN DE TIPO "TOKEN" */
L = [a-zA-Z_]                           
D = [0-9]
S = [- + * /]


WHITE = [ \t\n\r]

%{
public String lexeme;
%}
%%
{WHITE} {}                            /*IGNORA ESPACIOS EN BLANCO*/
"//".*                               /*EL PUNTO HACE REFERENCIA A CUALQUIER CARACTER EXCEPTUANDO EL RETORNO DE CARRO.*/
{S}?{D}+                                                          {lexeme=yytext(); return INT;}
{S}?{D}+                                                          {lexeme=yytext(); return INT;}
{L}({L}|{D})*                                                     {lexeme=yytext(); return ID;}
{S}                                                               {lexeme=yytext(); return SIGNO;}
.                                                                 {return ERROR;}
