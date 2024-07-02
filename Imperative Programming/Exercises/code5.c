#include <stdio.h>

int main(){
  int x, a;

  printf("Introduza o valor de x:");
  scanf("%d", &x);

  a = 3 * x * x * x * x * x + 2 * x * x * x * x - 5 * x * x * x - x * x + 7 * x - 6;

  printf("O resultado é %d\n", a);

  return 0;
}
