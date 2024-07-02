#include <stdio.h>
#include <ctype.h>
#include <string.h>

int algum_digito(char str[]){

int  t = strlen(str);

for(int i = 0; i<t; i++){

if(str[i] == isdigit())
return 1;
else
continue;
}

}
int main(){
  char str[] = "Abb23";

  algum_digito(str);

  return 0;
}
