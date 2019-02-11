%{
#include<stdio.h>
void display(int);
%}

%%
[[a-z|A-Z|0-9][+|-|*|/]]*[a-z|A-Z|0-9] printf("\nValid Expression\n");
%%


main()
{
 printf("Enter to check if it is a valid expression or not: ");
 yylex();

}
