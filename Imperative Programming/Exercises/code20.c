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
  int x,n=2,z;

  printf("Digite o seu valor:");
  scanf("%d", &x);

  do {
    z=primo(n);
    while (z == 1 && x%n==0){
      x=x/n;
      printf("%d\t", n);
    }
    n++;
  } while(x>1);

  return 0;
}
