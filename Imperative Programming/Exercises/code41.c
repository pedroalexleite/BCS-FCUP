#include <stdio.h>

int ordenada(int vec[], int size){
  int i;

  for(i = 0; i < (size - 1); i++){
    if(vec[i]<=vec[i+1]){
    return 1;
    }
    }
   return 0;
}

int main(){
 int vec[5] = {1, 2, 3, 4, 5};
 int size = 0;

 printf("%d\n", ordenada(vec,size));

 return 0;
}
