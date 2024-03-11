#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <sys/mman.h>
#define INT_MAX 100

int main(int argc, char *argv[]){
  FILE *file1;
  file1 = fopen(argv[1], "r");
  int m, k;
  m = atoi(argv[2]);
  k = atoi(argv[3]);
  char c;
  c = getc(file1);
  int n = atoi(&c);
  int matrix[n][n];

  if(file1 == NULL){
    printf("Ficheiro vazio.\n");
    exit(EXIT_FAILURE);
  }

  for(int i = 0; i<n; i++){
    for(int j = 0; j<n; j++){
      fscanf(file1, "%d", &matrix[i][j]);
    }
  }
  fclose(file1);

  int *parciais = mmap(NULL, m*sizeof(int), PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, 0, 0);

  for(int i = 0; i<m; i++)
    parciais[i] = 0;
  for(int i = 0; i<m; i++){
    pid_t pid;

    if((pid=fork()) < 0) {
      perror("fork");
      exit(EXIT_FAILURE);
    }

    if(pid == 0){
      for(int j = 0; j<n; j++){
        if(j%m == i){
          for(int l = 0; l<n; l++){
            if(matrix[j][l] > k)
              parciais[i]++;
          }
        }
      }
    exit(EXIT_SUCCESS);
    }
  }

  for(int i = 0; i<m; i++){
    if(waitpid(-1, NULL, 0)<0){
      perror("waitpid");
      exit(EXIT_FAILURE);
    }
  }
  
  int count = 0;
  for(int i = 0; i<m; i++)
    count += parciais[i];
  printf("%d\n", count);

  return 0;
}
