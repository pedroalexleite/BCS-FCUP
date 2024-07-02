#include <stdio.h>

int main(){
  int a, b, c;

  printf("Introduza 3 valores:\n");
  scanf("%d %d %d", &a, &b, &c);

  if(a > b && a > c){

  printf("O %d é o valor máximo\n", a);

  }

  if(b > a && b > c){

  printf("O %d é o valor máximo\n", b);

  }

  if(c > b && c > a){

  printf("O %d é o valor máximo\n", c);

  }

  if(a == b && a > c){

  printf("O %d é o valor máximo\n", a);

  }

  if(a == c && a > b){

  printf("O %d é o valor máximo\n", a);

  }

  if(c == b && c > a){

  printf("O %d é o valor máximo\n", c);

  }

  if(a == b == c){

  printf("Os valores são todos iguais!!!\n");

  }

  return 0;
}
