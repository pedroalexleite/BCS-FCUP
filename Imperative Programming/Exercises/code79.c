#include <stdio.h>

int main(){
  int a;

  printf("Introduza um número inteiro:\n");
  scanf("%d", &a);

  if(a % 2 == 0){

  printf("%d é par.\n", a);

  }

  if(a % 2 != 0){

  printf("%d é impar.\n", a);

  }

  return 0;
}
