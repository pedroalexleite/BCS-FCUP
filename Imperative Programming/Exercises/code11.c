#include <stdio.h>

  int potencia(int x, int n){
    int p = 1;

    for(int i = 0; i < n; i++){

    p = p * x;

  }

  printf("O valor da potência é: %d\n", p);

  return 0;

  }

  int main(){
    int x, n;

    printf("Base da potência:\n");
    scanf("%d", &x);
    printf("Expoente da potência:\n");
    scanf("%d", &n);

    potencia(x, n);

  return 0;

}
