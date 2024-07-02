#include <stdio.h>

int main(){
  int x;

  printf("Inserir valor:");
  scanf("%d", &x);

  while(x != 0){
  if(x%2 == 0){

  printf("O número é par.\n");

  }

  else{

  printf("O número é ímpar.\n");

  }
  scanf("%d", &x);
}

  return 0;
}
