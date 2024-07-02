//Pedro Leite - 201906697 - Exercício 1:
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <sys/mman.h>
#define INT_MAX 100

int main(int argc, char *argv[]){
  char *string1;
  string1 = argv[1]; //string
  FILE *file1;
  file1 = fopen(argv[2], "r");

  //se o ficheiro estiver vazio
  if(file1 == NULL){
    printf("Ficheiro vazio.\n");
    exit(EXIT_FAILURE);
  }

  size_t size = 0;
  char* line = NULL; //linha completa
  int line_numb = 1; //número de linhas
  int col_numb = 0; //número de colunas

  while(getline(&line, &size, file1) != -1){
    //nova palavra
    char* token = strtok(line, " ");
    while(token != NULL){
      //número de colunas
      col_numb = token - line + 1;
      printf("[%d:%d", line_numb, col_numb);
      //no caso de a string occorer mais que uma vez por linha
      while((token = strstr(token + 1, string1)) != NULL){
        col_numb = token - line + 1;
        printf(",%d", col_numb);
      }
      printf("]\n");
      token = strtok(NULL, " ");
    }
    //número de linhas
    line_numb++;
  }
  fclose(file1);

  exit(EXIT_SUCCESS);
}
