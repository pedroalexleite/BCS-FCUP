#include <stdio.h>

int main(){
  int a, b, c;

  printf("Introduza os 3 valores:\n");
  scanf("%d %d %d", &a ,&b ,&c);

  if(a != b && a != c && b == c){

  printf("2 valores distintos.\n");

  }
  if(c != b && a != b && a == c){

  printf("2 valores distintos.\n");

  }
  if(a != c && c != b && a == b){

  printf("2 valores distintos.\n");

  }
  if(c != b && b != a && a != c){

  printf("3 valores distintos.\n");

  }
  if(a == b && a == c && b == c){

  printf("0 valores distintos.\n");

  }

  return 0;
}
