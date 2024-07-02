#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
  int x;

  srand((unsigned)time(NULL));

  x =((int)(double)rand()) / ((double)(RAND_MAX))*100;

  printf("Número:%d\n", x);

  return 0;
}
