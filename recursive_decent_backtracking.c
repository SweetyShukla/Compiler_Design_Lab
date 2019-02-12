//	Used productions: 
//	S	->	cAd
//	A	->	abA
//	A	->	a
#include "stdio.h"
#include "string.h"
char a[100];
int i=0;
void match(char c)
{
	if(a[i]!=c)
	{
		printf("Error! \n");
		exit(0);
	}
	i++;
}
void A()
{
	if(a[i]=='a')
	{
		i++;
		if(a[i]=='b')
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
main()
{
	printf("Used productions:\nS->cAd\nA->abA\nA->a");
	printf("Enter a string: ");
	scanf("%s",a);
	S();
	if(a[i]=='\0')
		printf("valid expression.\n");
}
