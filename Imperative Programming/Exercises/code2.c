#include <stdio.h>

int main(){
  int x, y;

  printf("Digite o seu preço:\n");
  scanf("%d", &x);

  y = x + (x * 0.23);

  printf("O preço com iva é: %d\n", y);

  return 0;
}
