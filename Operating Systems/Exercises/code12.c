//Pedro Leite - 201906697 - Exercício 2:
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
  m = atoi(argv[2]); //número de processos
  k = atoi(argv[3]); //valor a ser comparado
  char c;
  c = getc(file1);
  int n = atoi(&c); //dimensões da matriz
  int matrix[n][n]; //matriz

  //se o ficheiro estiver vazio
  if(file1 == NULL){
    printf("Ficheiro vazio.\n");
    exit(EXIT_FAILURE);
  }

  //ler a matriz
  for(int i = 0; i<n; i++){
    for(int j = 0; j<n; j++){
      fscanf(file1, "%d", &matrix[i][j]);
    }
  }
  fclose(file1);

  //criar novo endereço de mapeamento de espaço (endereço, tamanho, o endereço pode ser lido ou escrito, pode ser acedido por qualquer processo ou inicializado a zero , 0, 0)
  int *parciais = mmap(NULL, m*sizeof(int), PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, 0, 0);

  //inicializar tudo a 0
  for(int i = 0; i<m; i++)
    parciais[i] = 0;
  for(int i = 0; i<m; i++){
    //especifica os processos filhos a ser chamados
    pid_t pid;
    //fork falhou
    if((pid=fork()) < 0) {
      perror("fork");
      exit(EXIT_FAILURE);
    }
    //fork filho
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
    //esperar que um dos processos filhos termine
    if(waitpid(-1, NULL, 0)<0){
      perror("waitpid");
      exit(EXIT_FAILURE);
    }
  }

  //total
  int count = 0;
  for(int i = 0; i<m; i++)
    count += parciais[i];
  printf("%d\n", count);

  return 0;
}
