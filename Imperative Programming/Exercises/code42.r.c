#include <stdio.h>
//SELECTIONSORT
int ordenada(int vec[], int size){

int vec2[] = vec[];

for(int j=0; j<size; j++){
int min = j;
for(int i = 0; i<size; i++){
if(vec2[i]<vec2[min])
min = i;
}
int aux = vec2[j];
vec2[j] = vec[2min],
vec2[min] = aux;
}
for(int  i = 0; i<size; i++){
if(vec2[i]=vec[i])
return 1;
else
return 0;
}
}
int main(){
int vec[]={1,4,3,2};
int size = 4;

ordenada(vec, size);

}
