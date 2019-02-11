#include<stdio.h>
#include<string.h>
int main()  {
    char input[100],*l,*r,*temp,productions[25][50];
    int i=0,j=0,flag=0;
int k;

    printf("Enter the production rule: ");
    scanf("%s",input);
    l = strtok(input,"->");
    r = strtok(NULL,"->");
    temp = strtok(r,"|");
    while(temp)  {
        if(temp[0] == l[0])  {
            flag = 1;
            sprintf(productions[i++],"%s'->%s%s'\0",l,temp+1,l);
        }
        else
            sprintf(productions[i++],"%s->%s%s'\0",l,temp,l);
        temp = strtok(NULL,"|");
    }
    sprintf(productions[i++],"%s'->\u03B5",l);
    if(flag == 0)
        printf("The given production rule doesn't have Left Recursion");
    else
        for(j=0;j<i;j++)  {
            printf("\n%s\n",productions[j]);
        }
    

return 0;
}
