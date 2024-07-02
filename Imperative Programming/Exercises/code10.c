#include <stdio.h>

  int mediana(int a, b, c){

    if((a <= b && b <= c)||(c <= b && b <= a)){

    printf("Mediana: %d\n", b);

    }
    else if((b <= a && a <= c)||(c <= a && a <= b)){

    printf("Mediana: %d\n", a);

    }
    else if((a <= c && c <= b)||(b <= c && c <= a)){

    printf("Mediana: %d\n", c);

    }
    if(a == b && b == c){

    printf("Não existe mediana.\n");

    }

    return 0;

}

  int main(){
    int a, b, c;

    printf("Inserir os 3 valores:\n");
    scanf("%d %d %d", &a, &b ,&c);

    mediana(a, b, c);

    return 0;
  }
