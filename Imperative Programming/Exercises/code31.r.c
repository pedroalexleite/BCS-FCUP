#include <stdio.h>
#include <ctype.h>
#include <string.h>

int palindromo(char str[]){

int t = strlen(str);

for(int i=0; i<t/2; i++){
int aux = str[i];
str[i] = str[t-i-1];
str[t-i-1] = aux;
}

}
int main(){
char str[] = "AbCCbA";

palindromo(str);

if(str[] == palindromo)
printf("Palindromo\n");
else
printf("Não é Palindromo\n");

return 0;
}
