#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <sys/mman.h>
#define INT_MAX 100

int main(int argc, char *argv[]){
  char *string1;
  string1 = argv[1];
  FILE *file1;
  file1 = fopen(argv[2], "r");

  if(file1 == NULL){
    printf("Ficheiro vazio.\n");
    exit(EXIT_FAILURE);
  }

  size_t size = 0;
  char* line = NULL;
  int line_numb = 1;
  int col_numb = 0;

  while(getline(&line, &size, file1) != -1){
    char* token = strtok(line, " ");
    while(token != NULL){
      col_numb = token - line + 1;
      if(strcmp(token, string1) == 0){
        printf("[%d:%d", line_numb, col_numb);
        while((token = strstr(token + 1, string1)) != NULL){
          col_numb = token - line + 1;
          printf(",%d", col_numb);
        }
        printf("]\n");
      }
      token = strtok(NULL, " ");
    }
    line_numb++;
  }
  fclose(file1);

  exit(EXIT_SUCCESS);
}
