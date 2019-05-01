%{
#include<stdio.h>
int flag = 1;
%}

%token id num
%left '(' ')'
%left '+' '-'
%left '/' '*'
%nonassoc UMINUS

%%
stmt: expression {printf("\nValid expression");}
;
expression : '(' expression ')'
| '(' expression {printf("\nInvalid syntax. Missing right paranthesis");}
| expression '+' expression {printf("\nPlus detected");$$=$1+$3;printf("\n%d", $$);}
| expression '+' {printf("\nInvalid syntax. Missing right operand");}
| expression '-' expression {printf("\nMinus detected");$$=$1-$3;printf("\n%d", $$);}
| expression '-' {printf("\nInvalid syntax. Missing right operand");}
| expression '/' expression {printf("\nDivide detected");if($3==0) printf("\nInvalid division. Divide by zero error");else {$$=$1/$3;printf("\n%d", $$);}}
| expression '/' {printf("\nInvalid syntax. Missing right operand");}
| expression '*' expression {printf("\nMultiply detected");$$=$1*$3;printf("\n%d", $$);}
| expression '*' {printf("\nInvalid syntax. Missing right operand");}
| expression '%' expression {printf("\nModulo detected");$$=$1%$3;printf("\n%d", $$);}
| expression '%' {printf("\nInvalid syntax. Missing right operand");}
| id
| num
;
%%

main(){
printf("Enter an arithmetic expression\n");
yyparse();
}

yyerror(){
printf("Invalid Arithmetic Expression\n");
exit(1);
}
