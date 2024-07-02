#include <stdio.h>

int filtrar_positivos(int vec[], int size){
int vec2[], j=0;

for(int i = 0; i<size; i++){
if(vec[i]>0){
vec[j]=vec[i];
j++;
}
}
for(int i = 0; i<size; i++){
  vec[i]= vec2[i];
}
return j;
}

int main(){
  int vec[] = {1, 2, 7, -4};
  int size =  4;

  filtrar_positivos(vec, size);

}
