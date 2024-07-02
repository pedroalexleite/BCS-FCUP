#include <stdio.h>
#define VALUE 10

int main(){

  for(int i = 0; i < 10; i++){
    printf("%d x %d = %d\n", i, VALUE, i * VALUE);
  }

  return 0;
}
