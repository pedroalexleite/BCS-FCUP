#include <stdio.h>
#include <ctype.h>


void capitalizar(char str[]){

for(int i = 0; str[i] != '\0'; i++){
str[i]=toupper(str[i]);
}

}
int main(){
char str[] = "abba";

capitalizar(str);

printf("%s\n",str);

  return 0;
}
