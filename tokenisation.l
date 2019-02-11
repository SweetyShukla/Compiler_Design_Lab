%{
#include<stdio.h>
#include<stdlib.h>

%}
constant [0-9]+|[0-9]+[.][0-9]*
seperator [{}()]
delimiter [,]
terminator[;]
identifier [a-zA-Z_][a-zA-Z_0-9]*
operator [-+*/=<>]
punc["]

%%

auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|const|float|short|unsigned|continue|for|signed|void|default|goto|sizeof|volatile|do|if|static|while|main|include<stdio.h>|printf|scanf {printf("%s is an keyword\n",yytext);}

{operator} {printf("%s : operator\n",yytext);}
{seperator} {printf("%s : seperator\n",yytext);}
{identifier} {printf("%s : identifier\n",yytext);}
{constant} {printf("%s : constant\n",yytext);}
{delimiter} {printf("%s : delimiter\n",yytext);}
{terminator} {printf("%s : terminator\n",yytext);}
{punc} {printf("%s : punctuation symbol\n",yytext);}
%%

int yywrap(){
return 1;
}

void main(){
extern FILE *yyin;
yyin=fopen("hello.c","r");
yylex();
}
