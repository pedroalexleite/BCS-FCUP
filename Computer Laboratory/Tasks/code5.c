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
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);
  int c = atoi(argv[3]);
  int d = atoi(argv[4]);

  if((argc == 6 || argc == 7) && (img = fopen(argv[5], "r")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[5]);
    exit(1);
  }

  fscanf((argc == 6 || argc == 7) ? img : stdin, "%s", infoimg.magico);
  fscanf((argc == 6 || argc == 7) ? img : stdin, "%d %d", &infoimg.colunas, &infoimg.linhas);
  infoimg.matriz = (COLOR**) malloc (infoimg.linhas*sizeof(COLOR*));
  for(int i = 0; i<infoimg.linhas; i++){
    infoimg.matriz[i] = (COLOR*) malloc (infoimg.colunas*sizeof(COLOR));
  }
  fscanf((argc == 6 || argc == 7) ? img : stdin, "%d", &infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      fscanf((argc == 6 || argc == 7) ? img : stdin, "%d", &infoimg.matriz[i][j].r);
      fscanf((argc == 6 || argc == 7) ? img : stdin, "%d", &infoimg.matriz[i][j].g);
      fscanf((argc == 6 || argc == 7) ? img : stdin, "%d", &infoimg.matriz[i][j].b);
    }
  }
  if((argc == 6 || argc == 7))
    fclose(img);

  if(argc == 7 && (img = fopen(argv[6],  "w")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[6]);
    exit(1);
  }

  fprintf(argc == 7 ? img : stdout, "%s\n", infoimg.magico);
  fprintf(argc == 7 ? img : stdout, "%d %d\n", c-a, d-b);
  fprintf(argc == 7 ? img : stdout, "%d\n", infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      if(infoimg.linhas>b && infoimg.colunas>a && infoimg.linhas<d && infoimg.colunas<c){
        fprintf(argc == 7 ? img : stdout, "%d ", infoimg.matriz[i][j].r);
        fprintf(argc == 7 ? img : stdout, "%d ", infoimg.matriz[i][j].g);
        fprintf(argc == 7 ? img : stdout, "%d", infoimg.matriz[i][j].b);
        fprintf(argc == 7 ? img : stdout, "\n");
      }
    }
  }

  return 0;
}
