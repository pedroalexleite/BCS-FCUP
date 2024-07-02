#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
  int n, m, o = 1;

  n = 1 + rand()%1000;

  printf("O valor é: ");
  scanf("%d", &m);

  while(n != m){
    if(m > n){
    printf("Demasiado alto!\n");
    }
    else{
    printf("Demasiado baixo!\n");
    }
    ++o;
  }

  printf("Acertou em %d tentativas!", o);

  return 0;
}
