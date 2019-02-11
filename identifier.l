%{
#include<stdio.h>
void display(int);
%}

%%
^[a-z|A-Z|_].* {printf("Identifier");}
.*    {printf("invalid");}
%%


main()
{
 printf("Enter a letter to check that it is an identifier or not: ");
 yylex();
}





