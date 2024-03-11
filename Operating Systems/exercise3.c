//Pedro Leite - 201906697 - Exercício 3:
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include <sys/mman.h>
#define INT_MAX 100

int main(int argc, char* argv[]){
  FILE *file1;
  file1 = fopen(argv[1], "r");
  int parent[2];
  int child[2];
  pid_t pid;
  char buff;
  char *line = NULL;
  size_t size = 0;
  ssize_t buffs;
  char uppercase;

  if((pipe(parent)!=0) || (pipe(child)!=0)){
    printf("Erro a abrir %s.\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  if((pid = fork()) == 0){
    close(child[1]);
    close(parent[0]);

    while(read(child[0], &buff, sizeof(char))>0){
        buff = toupper(buff);
        write(parent[1], &buff, sizeof(char));
    }
    close(child[0]);
    close(parent[1]);
    exit(EXIT_SUCCESS);
  }
  else if(pid>0){
    close(parent[1]);
    close(child[0]);

    while((buffs = getline(&line, &size, stdin)) != -1){
        for(int i=0;i<buffs;i++)
            write(child[1], (line+i), sizeof(char));
    }

    while(read(parent[0], &uppercase, sizeof(char))){
        putchar(uppercase);
    }
    
    close(child[1]);
    close(parent[0]);
    exit(EXIT_SUCCESS);
  }

  return 0;
}
