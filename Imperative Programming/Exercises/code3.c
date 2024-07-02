#include <stdio.h>

int main(){
  int x, n20, x20, n10, x10, n5, x5, n1;

  printf("Digite o seu valor:");
  scanf("%d", &x);

  n20 = x / 20;
  x20 = x % 20;
  n10 = x20 / 10;
  x10 = x % 10;
  n5 = x10 / 5;
  x5 = x % 5;
  n1 = x5 / 1;

  printf("Notas de 20: %d\n", n20);
  printf("Notas de 10: %d\n", n10);
  printf("Notas de 5: %d\n", n5);
  printf("Notas de 1: %d\n", n1);

  return 0;
}
