%{
#include <stdio.h>
int i=0;
%}
%%
.*	{fun();}
%%
void match(char c)
{
	if(yytext[i]!=c)
	{
		printf("%c Error!",c);
		exit(0);
	}
	i++;
}
void A()
{
	if(yytext[i]=='a')
	{
		i++;
		if(yytext[i]=='b')
		{
			i++;
			A();
		}
		return;
	}
	else
		return;
}
void S()
{
	match('c');
	A();
	match('d');
}
fun()
{
	S();
	if(yytext[i]=='\0')
		printf("valid expression.\n");
	i=0;
	printf("Enter a string: ");
}
main()
{
	printf("Enter a string: ");
	yylex();
	return 0;
}
int yywrap()
{
}
