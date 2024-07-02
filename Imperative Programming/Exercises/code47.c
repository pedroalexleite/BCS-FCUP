#include <stdio.h>
#include <ctype.h>
#include <string.h>

void inserir(char str[], char ch){
int size = strlen(str);

for(int i = size-1; i>=0; i--){
if(str[i]>ch){
str[i+1]=str[i];
size=i;
}
str[size]=ch;
}
}
int main(){
char str[] = "ABCDEF";
char ch = 'B';

inserir(str, ch);

printf("%s", (str));

return 0;
}
