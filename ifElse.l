/*Parser for IF-ELSE Statement*/
%{
%}
alpha [a-zA-Z]
digit [0-9]
%%
[ \t\n] 
if return IF;
else return ELSE;
then return THEN;
{digit}+ return NUM;
{alpha}({alpha}|{digit})* return ID;
"<=" return LE;
">=" return GE;
"==" return EQ;
"!=" return NE;
"||" return OR;
"&&" return AND;
. return yytext[0];
%%

