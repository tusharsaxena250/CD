# CD
Compiler Design Coding

# Steps to install lex and yacc:
sudo apt-get install flex

sudo apt-get install flex-old

sudo apt-get install bison

# Steps for running lex programs
Create a file using : $ vi program_name.l  

To generate lex.yy.c: $ lex program_name2.l

To compile with library files : $ cc lex.yy.c -ll 

# Steps to compile the yacc and lex programs
yacc -d program_name1.y

lex program_name2.l

cc lex.yy.c y.tab.c -ll -ly
