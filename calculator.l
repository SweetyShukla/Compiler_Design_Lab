%{
int num1=0,num2=0;
float op1=0,op2=0,ans=0;
char operator;
void calculate(); 
%} 
dig [0-9]
number {dig}+(\.{dig}+)?
operator [*/+-]
%%
 
{number} {
 if(num1==0) {
 op1=atof(yytext);
 num1=1;
 } 
 else if(num2==-1) {
 op2=atof(yytext);
 num2=1;
 } 
 if((num1==1) && (num2==1)) {
 calculate();
 num1=0;
 num2=0; 
 }
} 
{operator} {
 operator=(char) *yytext;
 num2=-1;
}  
%% 
main(){
printf("Enter 2 numbers and any of the operators: +, -, * or / here:");
 yylex();
}  

void calculate(){
 switch(operator)
 {
 case '+': ans=op1+op2; break;
 
 case '-': ans=op1-op2; break;
 
 case '*': ans=op1*op2; break;
 
 case '/':
 if(op2==0){
 printf("Error!");
 return;
}
 else { ans=op1/op2;}
 break;
 default: printf("Operation is not available"); break;
 }
 printf("Result: %lf",ans);
} 
