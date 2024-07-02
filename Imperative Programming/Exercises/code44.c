#include <stdio.h>
//INSERTIONSORT
void vetor(){

for(int i = 1; i<n; i++){
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
  int vec[] = {1, 4, 3, 2};
  int size = 4

  vetor(vec, size);

  for(int i = 0; i<size; i++){
  printf("%d\n", vec[i]);
  }
}
