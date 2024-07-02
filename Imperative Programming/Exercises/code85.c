#include <stdio.h>

int main(){
  int a, b, c;

  scanf("%d \n %d \n %d", &a, &b, &c);

  if((a == b) && (a == c) && (b == c))
  {
  printf("O triângulo é equilátero\n");
  }

  else if(((a == b) && (b != c)) || ((a == c) && (b != c)) || ((b == c) && (a != b)))
  {
  printf("O triãngulo é isósceles\n");
  }

  else if ((a != b) && (a != c) && (b != c))
  {
  printf("O triângulo é escaleno\n");
  }

  return 0;}
