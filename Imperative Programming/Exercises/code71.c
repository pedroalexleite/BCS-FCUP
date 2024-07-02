#include <stdio.h>

int main(){
  int a, b;

  printf("Digite dois valores.\n");
  scanf("%d %d", &a, &b);

  printf("Soma: %d + %d = %d\n",a, b, (a+b));
  printf("Subtração: %d - %d = %d\n",a, b, (a-b));
  printf("Multiplicação: %d * %d = %d\n",a, b, (a*b));
  printf("Divisão: %d / %d = %d\n",a, b, (a/b));

  printf("\nVerdade = 1\nFalso = 0\n");
  printf("Igualdade: %d == %d --> %d\n",a, b, (a==b));
  printf("Diferença: %d != %d --> %d\n",a, b, (a!=b));
  printf("Menor Igual: %d <= %d --> %d\n",a, b, (a<=b));
  printf("Maior Igual: %d >= %d --> %d\n",a, b, (a>=b));

  return 0;
}
