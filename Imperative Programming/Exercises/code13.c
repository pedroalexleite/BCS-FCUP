#include <stdio.h>

int main() {
   int n, maior;

   printf("Introduza valores (termina no 0):\n");
   scanf("%d", &n);

   maior = n;

   while(n != 0) {   // enquanto não terminou
    scanf("%d", &n); // ler próximo valor

    if(n > maior)
    maior = n;
   }

   printf("O maior é: %d\n", maior);

   return 0;
}
