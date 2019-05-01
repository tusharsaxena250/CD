%{
#include<stdio.h>
int c = 0;
FILE *fp;
%}
number [0-9]+(".")?[0-9]*
invalid [0-9]+(".")[0-9]*((".")[0-9]*)+
%%
\n { c++; }
{number} {printf("Valid number in line %d\n", c+1);ECHO;printf("\n");}
{number}[a-zA-Z0-9_]+ {printf("Invalid number in line %d: Number followed with alphabets is invalid\n", c+1);ECHO;printf("\n");}
{invalid} {printf("Valid number in line %d: More than 1 decimal points not allowed\n", c+1);ECHO;printf("\n");}
. ;
%%
void main(){
yyin = fopen("sourcecd4a.txt", "r");
yylex();
fclose(yyin);
}
