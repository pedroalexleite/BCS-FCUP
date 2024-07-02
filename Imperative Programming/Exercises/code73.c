#include <stdio.h>

int main(){
  int x, y;

  printf("Inserir valor x e valor y:");
  scanf("%d %d", &x, &y);

  if(x>y){

  printf("O máximo é: %d\n", &x);

  }

  if(x>y){

  printf("O máximo é: %d\n", &y);

  }

  if(x==y){

  printf("Os valores são iguais.");

  }

  return 0;
}
