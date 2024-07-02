#include <stdio.h>

int main(){
  int a, b, amp;

  printf("Introduza os dois valores:\n");
  scanf("%d %d", &a, &b);

  if(a > b){

  printf("Máximo: %d\n", a);
  printf("Minímo: %d\n", b);

  amp = a - b;

  printf("Amplitude: %d\n", amp);

  }
  if(b > a){

  printf("Máximo: %d\n", b);
  printf("Minímo: %d\n", a);

  amp = b - a;

  printf("Amplitude: %d\n", amp);

  }

  return 0;
}
