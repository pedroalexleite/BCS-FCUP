#include <stdio.h>

int segundo_menor(int vec[], int size){

for(int i = 1; i<size; i++){
int aux = vec[i];
j = i - 1;
while(j >= 0 && vec[j]>aux){
vec[j+1]=vec[j];
j = j - 1;
}
vec[j+1] = aux;
}

}

int main(){
int vec[]={1,3,4,5};
int size=4;

segundo_menor(vec,size);

printf("Segundo menor valor: %d\n", vec[1])

}
