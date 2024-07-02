#include <stdio.h>

  int main(){
    int den, num, n = 2;

    printf("O valor do numerador é:");
    scanf("%d", &num);
    printf("O valor do denominador é:");
    scanf("%d", &den);

    while(!(n >= num || n >=  den)){

    while((num % n == 0)&&(den % n == 0)){

    num /= n;
    den /= n;
    }

    n++;

    }

    printf("O valor da fração é: %d/%d\n", num, den);

    return 0;
}
