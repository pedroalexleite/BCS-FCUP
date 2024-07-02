#include <stdio.h>

int main(){
  float v, r;

  printf("Inserir o raio da esfera:\n");
  scanf("%f", &r);

  v = (4 / 3) * 3.14 * r * r * r;

  printf("O volume da esfera é: %f\n", v);

  return 0;
}
