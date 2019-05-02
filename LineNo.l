/*To Number Each Line*/
%{
int lineno = 1;
%}

line .*\n

%%
{line} {printf("%d. %s\n", lineno++, yytext);}
%%
main(){
yylex();
return 0;
}
