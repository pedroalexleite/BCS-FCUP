#include <stdio.h>

int fib(int x){
  int f0 = 0, f1 = 1, fn;
  for(int i = 2; i <= x; i++){
    fn = f1 + f0;
    f0 = f1;
    f1 = fn;
  }
  return fn;
}

int main(){
  int x;
  scanf("%d", &x);
  printf("%d\n", fib(x));

  return 0;
}
