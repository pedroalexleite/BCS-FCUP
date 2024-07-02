#include <stdio.h>

int main(){
  int i, *p;

  i = 1;
  p = &i;

  printf("O valor de i:%d\n", i);
  printf("O valor apontado por p:%d\n", *p);

  return 0;
}
