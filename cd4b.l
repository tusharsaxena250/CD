%{
#include<stdio.h>
int c = 0;
%}
%s DECLARE VAR
identifier [a-zA-Z][a-zA-Z0-9-]*
number [0-9]+(".")?[0-9]*
string ("\"")([a-zA-Z0-9]+)("\"")
%%
\n { c++ ;}
"int "|"float " {BEGIN DECLARE;}
<DECLARE>{identifier}("="{number})? {BEGIN VAR;}
<DECLARE>{identifier}("="{string}) {BEGIN VAR; printf("\n Invalid variable declaration in line: %d;String can't be assigned to int or float\n", c+1);ECHO;printf("\n");}
<VAR>";" {BEGIN 0;}
<VAR>{identifier}("="{number})? {}
<VAR>{identifier}("="{string}) {BEGIN VAR; printf("\n Invalid variable declaration in line: %d;String can't be assigned to int or float\n", c+1);ECHO;printf("\n");}
<VAR>"," {BEGIN DECLARE;}
<VAR>\n {BEGIN 0; c++;}
<VAR>[,][,]+ {printf("Invalid usage of double commas in line %d\n",c+1);BEGIN DECLARE;ECHO;printf("\n");}
. ;
%%
void main(){
yyin = fopen("sourcecd4b.txt", "r");
yylex();
fclose(yyin);
}
