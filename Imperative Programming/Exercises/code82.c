#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){

  int r;
  float SomaMedia;

  srand((unsigned)time(NULL));

  for(int i = 0; i<10000; i++)
  {

  r = (int)((double)rand() / (double) RAND_MAX * 6);

  SomaMedia += r;

  }

  printf("Media %f\n", SomaMedia/10000);

  return 0;
}
