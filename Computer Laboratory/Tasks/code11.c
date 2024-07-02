#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct color
{
  int r,g,b;
} COLOR;

typedef struct Metadados
{
  char magico[3];
  int linhas, colunas, max;
  COLOR **matriz;
} METADADOS;

int main(int argc, char* argv[]){
  FILE *img;
  METADADOS infoimg;

  if((argc == 2 || argc == 3) && (img = fopen(argv[1], "r")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[1]);
    exit(1);
  }

  fscanf((argc == 2 || argc == 3) ? img : stdin, "%s", infoimg.magico);
  fscanf((argc == 2 || argc == 3) ? img : stdin, "%d %d", &infoimg.colunas, &infoimg.linhas);
  infoimg.matriz = (COLOR**) malloc (infoimg.linhas*sizeof(COLOR*));
  for(int i = 0; i<infoimg.linhas; i++){
    infoimg.matriz[i] = (COLOR*) malloc (infoimg.colunas*sizeof(COLOR));
  }
  fscanf((argc == 2 || argc == 3) ? img : stdin, "%d", &infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      fscanf((argc == 2 || argc == 3) ? img : stdin, "%d", &infoimg.matriz[i][j].r);
      fscanf((argc == 2 || argc == 3) ? img : stdin, "%d", &infoimg.matriz[i][j].g);
      fscanf((argc == 2 || argc == 3) ? img : stdin, "%d", &infoimg.matriz[i][j].b);
    }
  }
  if((argc == 2 || argc == 3))
    fclose(img);

  if(argc == 3 && (img = fopen(argv[2],  "w")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[2]);
    exit(1);
  }

  fprintf(argc == 3 ? img : stdout, "%s\n", infoimg.magico);
  fprintf(argc == 3 ? img : stdout, "%d %d\n", infoimg.colunas, infoimg.linhas);
  fprintf(argc == 3 ? img : stdout, "%d\n", infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      fprintf(argc == 3 ? img : stdout, "%d ", infoimg.matriz[infoimg.linhas-1-i][infoimg.colunas-1-j].r);
      fprintf(argc == 3 ? img : stdout, "%d ", infoimg.matriz[infoimg.linhas-1-i][infoimg.colunas-1-j].g);
      fprintf(argc == 3 ? img : stdout, "%d", infoimg.matriz[infoimg.linhas-1-i][infoimg.colunas-1-j].b);
      fprintf(argc == 3 ? img : stdout, "\n");
    }
  }

  return 0;
}
