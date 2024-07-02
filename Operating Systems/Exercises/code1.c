#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#define MAX_STR_SIZE 64

int main(int argc, char* argv[]){
  char* p1 = (char*)malloc(MAX_STR_SIZE * sizeof(char));
  strcpy(p1, argv[1]);
  char* p2 = (char*)malloc(MAX_STR_SIZE * sizeof(char));
  p2 = tolower(*p1);
  printf("%s\n", p2);
  /*
  if(argc == 2){
    putchar(tolower(p1));
  }
  */
  /*
  if(argc == 3){

  }*/


  return 0;
}
