/*ODD number of a*/
%{

%}
regEx b*a(b|ab*a)*
%%
{regEx} printf("Automata accepts the string %s\n", yytext);
.* printf("Automata rejects the string %s\n", yytext);
%%
main(){
yylex();
return 0;
}
