%{
#include "head.h"
#include "y.tab.h"
void yyerror(char *);
%}
%%
"print" {return PRINT;}
"exit"	{return EXIT_COMMAND;}
[a-z]	{yylval = *yytext - 'a'; return ID;}		/*identificadores*/
[0-9]+	{yylval = atoi(yytext); return INTEGER;}	/*enteros*/
[-+()=/*;]	{return *yytext;}			/*operadores*/
[ \t]	; /*saltar espacios en blanco*/
[\n]	{yylineno++;}
.	{ECHO;yyerror("caracter invalido");}
%%
int yywrap(void){
	return 1;
}