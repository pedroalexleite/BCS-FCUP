#include <stdio.h>

void max_min(int vec[], int size, int *pmax, int *pmin){
  *pmax = vec[0];
  *pmin = vec[0];

  for(int i = 1; i < size; i++){
    if(vec[i] < *pmin)
    *pmin = vec[i];
    else if(vec[i] > *pmax)
    *pmax = vec[i];
  }

}
int main(){
  int n = 5, min, max;
  int vec[5] = {3, 5, 2, 7, 6};

  max_min(vec, n, &max, &min);

  printf("M=%d m=%d\n", max, min);

}
