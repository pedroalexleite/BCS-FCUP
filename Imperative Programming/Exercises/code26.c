#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 10 // 10 perguntas

int main(){
  int n1, n2, s;

  srand((unsigned)time(NULL));
  n1 = rand() % 10; // número de 0 a 9
  n2 = rand() % 10; // número de 0 a 9

  printf("%d x %d?\n", n1, n2);
  printf("Resposta:\n");
  scanf("%d", &s);

  if(n1*n2 == s){
  printf("Certo!\n");
  }
  else{
  printf("Errado!\n");
  }

return 0;
}
