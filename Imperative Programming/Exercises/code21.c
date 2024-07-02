#include <stdio.h>

int primo(int n) {
   int d;
   if(n <= 1) return 0;
   for (d = 2; d < n; d++) {
     if (n%d == 0)
       return 0;
    }
   return 1;
}

int main(){
  int n, z;

  printf("Limite superior:");
  scanf("%d", &n);

  int i = 2;

  while(i < n){

  z = primo(i);

  if(z == 1){

  printf("%d\t", i);

  }

  i++;

}

  printf("\n");

  return 0;
}
