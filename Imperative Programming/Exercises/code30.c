#include <stdio.h>
#include <ctype.h>

void capitalizar (char str[]){
  int i;
  
  for(i = 0; str[i] != '\0'; i++){
    str[i] = toupper(str[i]);
  }

}
int main(){
  char str [] = "aA123b";

  capitalizar(str);

  printf("%s\n", str);

  return 0;
}
