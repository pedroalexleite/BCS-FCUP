#include <stdio.h>

void ordenada(int vec[], int n){

  for(int j = 0; j<n; j++){
    int min = j;
    for(int i = j+1; i<n; i++){
      if(vec[i]<vec[min])
        min = i;
    }
      int aux = vec[j];
      vec[j] = vec[min];
      vec[min] = aux;
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
