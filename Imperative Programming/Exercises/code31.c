#include <stdio.h>
#include <string.h>

int palindromo(char str[]){
  //inverter
  i = 0;
  j = strlen(str) -1; //tamanho

  while(i < j){
  if (str[i] != str[j]){
  i++;
  j--;
  }

}

int main(){

  char str[] = "ACoCA";
  palindromo(str);

  //se o invertido = original --> provado

  if(str[] == ){
  printf("Provado.\n");
  }
  else{
  printf("Não provado.\n");
  }

  return 0;
}
