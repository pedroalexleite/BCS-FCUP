#include <stdio.h>

int main(){
  int num, r, bin;

  printf("Inserir número:\n");
  scanf("%d", &num);

  while(num != 0){
  bin = num/2;
  r = bin%2;

  printf("O valor binário é:\n", &r);
  }

  return 0;
}
