#include <stdio.h>

int main() {
   float n, soma = 0;

   printf("Introduza valores (tem de terminar em 0):\n");
   scanf("%f", &n);

   int numeros = 1;

   while (n != 0) {
        soma += n;
        scanf("%f", &n);
        numeros++;
   }
   printf("A média é: %f\n", soma/numeros);
   return 0;
}
