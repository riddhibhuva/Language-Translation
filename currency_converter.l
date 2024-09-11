%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
[0-9]+|[0-9]+"."[0-9]* {
	yylval.real=(float)atof(yytext);
	return NUM;
}
[a] {yylval.real=1.0; return RS;}
[b] {yylval.real=1.0; return DOLLAR;}
[c] {yylval.real=1.0; return YUAN;}
[d] {yylval.real=1.0; return EURO;}
[e] {yylval.real=1.0; return POUND;}
find {return find;}
to {return to;}
[\n] {return yytext;}
[/t] ;
%%
int yywrap() {return 1;}
