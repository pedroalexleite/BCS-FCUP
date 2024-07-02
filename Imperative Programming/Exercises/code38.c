#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int contar_maiores(int vec[], int size, int val){
  int pontos=0;

for(int i = 0; i<size; i++){
if(vec[i] > val)
pontos += 1;
else
pontos += 0;
}

return pontos;
}

int main(){
int vec[]= {1,2,3,4};
int size = 4;
int val = 3;

contar_maiores(vec, size, val);

}
