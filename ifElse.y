%{
#include<stdio.h>
#include<stdlib.h>
%}

%token ID NUM IF ELSE THEN LE GE NE EQ AND OR
%right '='
%left AND OR
%left '<''>'LE GE EQ NE
%left '+''-'
%left '*''/' 
%right UMINUS
%left '!'
%%

S : ST{printf("\nInput accepted\n");exit(0);}
  ;
ST: IF'('E1')' THEN ST1';'ELSE ST1';'
  | IF'('E1')' THEN ST1';'
  ;
ST1: ST
   | E
   ;
E : ID'='E
  | E'+'E
  | E'-'E
  | E'*'E
  | E'/'E
  | E'>'E
  | E'<'E
  | E LE E
  | E GE E
  | E EQ E
  | E NE E
  | E OR E
  | E AND E
  | ID
  | NUM
  ;
E1: E'>'E
  | E'<'E
  | E LE E
  | E GE E
  | E EQ E
  | E NE E
  | E OR E
  | E AND E
  | ID
  | NUM
  ;
%%
#include "lex.yy.c"

main(){
printf("\nEnter your expression");
yyparse();
}
