%{
#include<stdio.h>
int flag = 1;
%}

%token id num

%%
stmt: expression {printf("Logical Expression: Evaluated result is %d", $1);}
;
expression: '(' expression ')' {$$=$2;printf("Value: %d\n", $$);}
| '(' expression {printf("Syntax Error: Missing Right paranthesis\n");exit(0);}
| expression '&''&' expression {printf("Logical And Detected\n");$$=(($1)&&($4));printf("%d\n",$$);}
| expression '&''&' {printf("Invalid Syntax: Missing Right Operand\n");exit(0);}
| expression '|''|' expression {printf("Logical OR Detected\n");$$=(($1)||($4));printf("%d\n",$$);}
| expression '|''|' {printf("Invalid Syntax: Missing Right Operand\n");exit(0);}
| '!'expression {printf("Logical NOT Detected\n");$$=(!($1));printf("%d\n",$$);}
| '!'{printf("Invalid Syntax: Missing Right Operand\n");exit(0);}
| id
| num
;
%%

main(){
printf("Enter the expression\n");
yyparse();
}
yyerror(){
printf("Invalid logical expression");
exit(1);
}
