#include <stdio.h>

  int bissexto(int n){

  while (n > 0){

  if(n % 4 == 0 && n % 100 != 0){

  printf("O ano %d é bissexto.\n", n);

  }

  else if(n % 4 == 1){

  n += 3;

  printf("O próximo ano bissextro é: %d", n);

  }
  else if(n % 4 == 2){

  n += 2;

  printf("O próximo ano bissextro é: %d", n);

  }
  else if(n % 4 == 3){

  n += 3;

  printf("O próximo ano bissextro é: %d", n);

  }

  }

  return 0;
}

}

  int main(){
    int n;

    printf("Introduzir ano:\n");
    scanf("%d", &n);

    bissexto(n);

    return 0;
  }
