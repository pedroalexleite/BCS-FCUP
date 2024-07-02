#include <stdio.h>

int soma_divisores(int n){

//0 = Falso
//1 = Verdadeiro

  int d, soma = 0;  
  d = 1;
  while(d < n){
    if(n%d == 0)
    soma += d;
    d++;
  }

  return soma;
}
