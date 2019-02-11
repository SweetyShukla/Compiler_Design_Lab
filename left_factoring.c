%{#include<stdio.h>  
  #include<string.h>  
  char prod[20],part1[20],part2[20],modprod[20],newprod[20],temprod[20];  
  int i,j=0,k=0,l=0,pos;
%}

%%
[a-zA-Z]+[|][a-zA-Z]+ {left_factorial();}
\n {return 0;}

%%
  
  int left_factorial()  
  {  
       
      strcpy(prod,yytext); 
      for(i=0;prod[i]!='|';i++,j++)  
            part1[j]=prod[i];  
       part1[j]='\0';  
      for(j=++i,i=0;prod[j]!='\0';j++,i++)  
            part2[i]=prod[j];  
       part2[i]='\0';  
        
       for(i=0;i<strlen(part1)||i<strlen(part2);i++)  
      {  
           if(part1[i]==part2[i])  
            {  
                 modprod[k]=part1[i];  
                 k++;  
                 pos=i+1;  
            }  
      }  
      for(i=pos,j=0;part1[i]!='\0';i++,j++){  
            newprod[j]=part1[i];  
       }  
       newprod[j++]='|';  
       for(i=pos;part2[i]!='\0';i++,j++){  
            newprod[j]=part2[i];  
       }  
       modprod[k]='T';  
       modprod[++k]='\0';  
       newprod[j]='\0';  
      printf("\n S->%s",modprod);  
       printf("\n T->%s\n",newprod);  
 }  

int yywrap(){}
int main()
{
printf("Enter the production rules: A-> ");
yylex();
return 0;
}