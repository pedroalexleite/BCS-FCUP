#include <stdio.h>

  void g(int n) {
    if (n == 0)
      return;
    else {
      printf("%d", n%2);
      g(n/2);
    }
  }

  int main(){
    int n = 25;

    g(n);
  }
