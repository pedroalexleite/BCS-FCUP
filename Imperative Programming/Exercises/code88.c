#include <stdio.h>
#include <math.h>

void ordenada(int vec[], int n){
int aux, j;

for(int i = 1; i<n; i++){
aux = vec[i];
j = i -1;
while(j >= 0 && vec[j] > aux){
vec[j+1] = vec[j];
j = j - 1;
}
vec[j+1] = aux;
}

}

int main(){
int vec[]={3, 2, 1, 7};
int n = 4;

ordenada(vec, n);

for(int i = 0; i<n; i++){
printf("%d\n", vec[i]);
}

}
