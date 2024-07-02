#include <stdio.h>

  int soma_divisores(int n){
    int i = 1;
    int soma = 0;

  while(n > i){

  if(n % i == 0){

  soma += n;

  }

  ++i;

  }

  return soma;
}

  int main(){
    int n;

    printf("Introduza o valor:\n");
    scanf("%d\n", &n);

    int soma = soma_divisores(n);

    printf("%d\n", soma);

  return 0;
}
