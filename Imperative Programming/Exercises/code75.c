#include <stdio.h>

int main(){
  float x, y, m;

  printf("Introduza 2 valores:\n");
  scanf("%f %f", &x, &y);

  m = (x+y)/2;

  printf("A média é: %f\n", m);

  return 0;
}
