%{
#include<stdio.h>
#include<math.h>
%}

%union{
int integer;
float real;
}

%token <real> NUM RS DOLLAR POUND YUAN EURO 
%token find  D to
%type <real> S F1 F2 F3 F4 F5 T 
%%
S : find T NUM {$$=$2*$3;printf(" Converted Amount: %f",$$);};
T:RS to F1{$$=$1*$3;}|DOLLAR to F2{$$=$1*$3;} |YUAN to F3{$$=$1*$3;}|EURO to F4{$$=$1*$3;}
|POUND to F5{$$=$1*$3;}
;
F1:DOLLAR{$$=$1*0.013;}
|POUND{$$=$1*0.011;}
|YUAN{$$=$1*0.094;}
|EURO{$$=$1*0.012;}
|RS{$$=$1*1;}
;

F2:RS{$$=$1*75.79;}
|DOLLAR{$$=$1*1;}
|YUAN{$$=$1*7.10;}
|EURO{$$=$1*0.91;}
|POUND{$$=$1*0.82;}
;


F3:RS{$$=$1*10.68;}
|DOLLAR{$$=$1*0.14;}
|YUAN{$$=$1*1;}
|EURO{$$=$1*0.13;}
|POUND{$$=$1*0.12;}
;

F4:RS{$$=$1*83.05;}
|DOLLAR{$$=$1*1.10;}
|YUAN{$$=$1*7.79;}
|EURO{$$=$1*1;}
|POUND{$$=$1*0.90;}
;


F5:RS{$$=$1*92.50;}
|DOLLAR{$$=$1*1.22;}
|YUAN{$$=$1*8.66;}
|EURO{$$=$1*1.11;}
|POUND{$$=$1*1;}
;
%% 
void yyerror(char *s){}
int main(int argc,char *argv[])
{
	printf("CURRENCY CONVERTOR\n");
	printf("OPTION AVAILABLE\n a)RUPEES\n b)DOLLAR \n c)YUAN\n d)EURO\n e)POUND\n");
	printf("Give Input in particlur order << Find (a-e) to (a-e) <Value> >>\n");
	printf("For example:\nIf you need to convert from Dollar to Rupess then you need to input as follow: \n'Find b to a 100' \n"); 

	int n=0;
	printf("Enter number of time you need to convert Currency:");
	scanf("%d\n",&n);
	for(int i=0;i<n*2;i++)
	{
		yyparse();
	}
return 0;
}
