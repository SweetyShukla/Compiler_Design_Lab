%{
//Given Productions: S->AA
//A->aA
//A->b
        #include<bits/stdc++.h>
        using namespace std;
        int flag=1,pos=0;
        string input;
        stack<int> s;
%}

%%
[ab]+ {input=yytext;}
.                {flag=0;}
\n                 {return 0;}
%%

int yywrap();
int GOTO(int i,string s)
{
        if(i==0&&s=="S")return 1;
        if(i==0&&s=="A")return 2;
        if(i==2&&s=="A")return 5;
        if(i==3&&s=="A")return 6;
}
string ACTION(int i,string s)
{
        if(i==0&&s=="a")return "s3";
        if(i==0&&s=="b")return "s4";
        if(i==1) return "accept";
        if(i==2&& s=="a")return "s3";
        if(i==2&&s=="b")return "s4";
        if(i==3&&s=="a")return "s3";
        if(i==3&&s=="b")return "s4";
        if(i==4) return "r3";
        if(i==5&&s=="$")return "r1";
        if(i==6) return "r2";
}

void print()

{

	stack<int> temp;

	while(!s.empty())

	{

		cout<<s.top()<<" ";

		temp.push(s.top());

		s.pop();

	}

	while(!temp.empty())

	{

		s.push(temp.top());

		temp.pop();

	}

	cout<<endl;

}
main()
{
        yylex();
        input = input+"$";
        if(flag)
        {
                s.push(0);
                while(1)
                {printf("Stack Contents: ");
                print();
                        int u=s.top();
                        string ref=ACTION(u,input.substr(pos,1));
                        if(ref=="s3")
                        {
                                s.push(3);
                                pos++;
                        }
                        else if(ref=="s4")
                        {
                                s.push(4);
                                pos++;
                        }
                        else if(ref=="r1")
                        {
                                s.pop();
                                s.pop();
                                u=s.top();
                                s.push(GOTO(u,"S"));
                        }
                        else if(ref=="r2")
                        {
                                s.pop();
                                s.pop();
                                u=s.top();
                                s.push(GOTO(u,"A"));
                        }
                        else if(ref=="r3")
                        {
                                s.pop();
                                u=s.top();
                                s.push(GOTO(u,"A"));
                        }
                        else if(ref=="accept")
                        {
                                printf("Input string is accepted\n");
                                exit(0);
                        }
                        else
                        {
                                printf("Input string is rejected\n");
                                exit(0);
                        }
                }
        }
}
