#include <stdio.h>

int main(){
  int *p, *q;
  int a, b;

  a = 1;
  b = 2;
  p = &a;
  q = &b;

  printf("O valor de p:%p\n", p);
  printf("O valor de q:%p\n", q);
  printf("O valor de a:%d\n", a);
  printf("O valor de b:%d\n", b);
  printf("O valor apontado por p:%d\n", *p);
  printf("O valor apontado por q:%d\n", *q);

  return 0;
}
