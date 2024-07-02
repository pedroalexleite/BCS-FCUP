#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

int main(){
  byte vec[];
  char vec2[] = "Abre sesamo";
  int soma = 0;

  scanf("%s\n", vec);

for(int i = 0; i<12; i++){
if(vec[i] == vec2[i])
soma++;
}

if(soma == 11)
printf("Sésamo aberto!\n");

  return 0;
}
