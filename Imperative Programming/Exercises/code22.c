#include <stdio.h>
#include <ctype.h>

int main (){
  int ch, letras = 0;

  printf("Frase: \n");

  do{
    ch = getchar();
    if(isalpha(ch))
    letras++;
  }while(ch != EOF);

  printf("O número de letras é: %d\n", letras);

  return 0;
}
