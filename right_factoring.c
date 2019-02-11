%{
#include<stdio.h>
#include<string.h>

char prod[20],part1[20],part2[20],modprod[20],newprod[20],temprod[20];  
int i,j=0,k=0,l=0,pos;
%}

%%
[a-zA-Z]+[|][a-zA-Z]+ {right_factoring();}
\n {return 0;}

%%
  
void right_factoring()
{
	strcpy(prod, yytext);
	for(i=0;prod[i]!='|';i++,j++)
	p1[j]=prod[i];
	p1[j]='\0';
	for(j=++i,i=0;prod[j]!='\0';j++,i++)
		p2[i]=prod[j];
		p2[i]='\0';
newprod[k]='X';
for(i=0;i<strlen(p1)||i<strlen(p2);i++)
{
if(p1[i]==p2[i])
{k++;
newprod[k]=p1[i];
}
else
{
modprod1[l]=p1[i];
modprod2[l]=p2[i];
l++;
}}

newprod[++k]='\0';
modprod1[l]='|';
modprod2[l]='\0';
modprod1[++l]='\0';
strcat(modprod1,modprod2);
printf("\n S->%s\n",newprod);
printf("\n X->%s\n",modprod1);

}

int yywrap(){}
int main()
{
printf("Enter the production rules: A-> ");
yylex();
return 0;
}

