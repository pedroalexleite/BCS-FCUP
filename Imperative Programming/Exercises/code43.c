#include <stdio.h>

int desordem(int vec[]), int size){

int contador = 0;

for(int i=1; i<n; i++){
if(vec[i-1]>vec[i])
contador++;
}
return contador;
}

int main(){
int vec[] = {1, 2, 6, 5};
int size = 4;

desordem(vec, size);
}
