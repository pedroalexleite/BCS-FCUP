#include <stdio.h>

  int bissexto(int n){

  while (n > 0){

  if(n % 4 == 0 && n % 100 != 0){

  printf("O ano %d é bissexto.\n", n);

  }

  else{

  printf("O ano %d não é bissexto.\n", n);

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
