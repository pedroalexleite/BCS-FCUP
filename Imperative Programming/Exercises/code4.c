#include <stdio.h>

int main(){
  int x, y, a, b, r, s;

  printf("Primeiro numerador:");
  scanf("%d", &x);
  printf("Primeiro denominador:");
  scanf("%d", &y);
  printf("Segundo numerador:");
  scanf("%d", &a);
  printf("Segundo denominador:");
  scanf("%d", &b);

  printf("%d/%d + %d/%d = ", x, y, a, b);

  r = x * b + a * y;
  s = b * y;

  printf("%d/%d\n", r, s);

  return 0;
}
