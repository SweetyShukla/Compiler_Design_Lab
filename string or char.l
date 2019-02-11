%{
#include<stdio.h>
void display(int);
%}

%%
[a-zA-Z0-9] {printf("\nCharacter\n");}
[a-zA-Z0-9]+ {printf("\n String\n");}
.+ { printf("\nOther Symbol\n"); }
%%


main()
{
 printf("Enter to check if it is a string or character: ");
 yylex();
}
