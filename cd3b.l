

%{
#include<stdio.h>
int c = 0;
FILE *fp;
%}
operator [-+*/]
identifier [a-zA-Z][a-zA-Z0-9]*
number [0-9]+
expression ([identifier]|[number]){operator}([identifier]|[number])
%%
\n { c++; }
^"#".+ ;
^("int "|"float "|"char ").+ ;
"void main()" ;
{identifier}"="({expression}+";") { printf("Vallid expression in line no %d\t", c+1);ECHO;printf("\n");}
{identifier}"="({number}|{identifier}";") { printf("Vallid expression in line no %d\t", c+1);ECHO;printf("\n");}
({number}|([0-9]*[a-zA-Z0-9-]+))"="{expression}+ { printf("Invallid expression in line no %d; L-value should satisfy to identifier rules\n", c+1);ECHO;printf("\n");}
{identifier}"=;" { printf("Invallid expression in line no %d; R-value required\n", c+1);ECHO;printf("\n");}
{operator}{operator}+ { printf("Invallid expression in line no %d;More than 1 operator cannot be used in single expression conequetively\n", c+1);ECHO;printf("\n");}
.|\n ;
%%
main(){
yyin = fopen("sourcecd3b.txt", "r");
yylex();
fclose(yyin);
}
