#include <stdio.h>

int main(){
  float valor, comissao;

  printf("Introduza o valor:
  EUR");
  scanf("%f", &valor);


  while(valor != 0){
  if(valor < 2500.0)
    comissao = 30.0 + 0.017 * valor;
  else if(valor < 6250.0)
    comissao = 56.0 + 0.0066 * valor;
  else if(valor < 20e3)
    comissao = 76.0 + 0.0034 * valor;
  else if(valor < 50e3)
    comissao = 100.0 + 0.0022 * valor;
  else if(valor < 500e3)
    comissao = 155.0 + 0.0011 * valor;
  else
    comissao = 255.0 + 0.0009 * valor;
  if (comissao < 39.0)
    comissao = 39.0;

  printf("Comissão: EUR %.2f\n", comissao);
  scanf("%f", &valor);
  }

  return 0;
}
