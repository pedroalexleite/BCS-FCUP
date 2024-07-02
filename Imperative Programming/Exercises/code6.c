#include <stdio.h>

int main(){
  int a, b, c;

  printf("Introduza as medidas do triângulo:\n");
  scanf("%d %d %d", &a, &b, &c);

  //equilátero
  if(a == b && a == c && b == c){

  printf("O triângulo é equilátero.\n");

  }

  //isósceles
  if((a == b && a!= c)||(a == c && a!= b)||(c == b && a!= c)){

  printf("O triângulo é isósceles.\n");

  }
  //escaleno
  if(a != b && a !=c && b != c){

  printf("O triângulo é escaleno.\n");

  }

  return 0;

}
