#include <stdio.h>

void eliminar(chat str[], char ch){
  char str2[];
  int j = 0;

for(int i = 0; i != '\0'; i++){
if(str[i] != ch)
str[i]=str2[j];
j++
}

}
int main(){
char str[] = "ABBA";
char ch = 'B';

eliminar(str, ch);

for(j = 0; j != 0; j++){
printf("String sem ch %c", str2[j])
}
}
