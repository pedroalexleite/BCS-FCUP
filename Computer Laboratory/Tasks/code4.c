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

  if((argc == 3 || argc == 4) && (img = fopen(argv[1], "r")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[1]);
    exit(1);
  }

  fscanf((argc == 3 || argc == 4) ? img : stdin, "%s", infoimg.magico);
  fscanf((argc == 3 || argc == 4) ? img : stdin, "%d %d", &infoimg.colunas, &infoimg.linhas);
  infoimg.matriz = (COLOR**) malloc (infoimg.linhas*sizeof(COLOR*));
  for(int i = 0; i<infoimg.linhas; i++){
    infoimg.matriz[i] = (COLOR*) malloc (infoimg.colunas*sizeof(COLOR));
  }
  fscanf((argc == 3 || argc == 4) ? img : stdin, "%d", &infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      fscanf((argc == 3 || argc == 4) ? img : stdin, "%d", &infoimg.matriz[i][j].r);
      fscanf((argc == 3 || argc == 4) ? img : stdin, "%d", &infoimg.matriz[i][j].g);
      fscanf((argc == 3 || argc == 4) ? img : stdin, "%d", &infoimg.matriz[i][j].b);
    }
  }
  if((argc == 3 || argc == 4))
    fclose(img);

  FILE *img2;
  METADADOS infoimg2;

  if((argc == 3 || argc == 4) && (img2 = fopen(argv[2], "r")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[2]);
    exit(1);
  }

  fscanf((argc == 3 || argc == 4) ? img2 : stdin, "%s", infoimg2.magico);
  fscanf((argc == 3 || argc == 4) ? img2 : stdin, "%d %d", &infoimg2.colunas, &infoimg2.linhas);
  infoimg2.matriz = (COLOR**) malloc (infoimg2.linhas*sizeof(COLOR*));
  for(int i = 0; i<infoimg2.linhas; i++){
    infoimg2.matriz[i] = (COLOR*) malloc (infoimg2.colunas*sizeof(COLOR));
  }
  fscanf((argc == 3 || argc == 4) ? img2 : stdin, "%d", &infoimg2.max);
  for(int i = 0; i<infoimg2.linhas; i++){
    for(int j = 0; j<infoimg2.colunas; j++){
      fscanf((argc == 3 || argc == 4) ? img2 : stdin, "%d", &infoimg2.matriz[i][j].r);
      fscanf((argc == 3 || argc == 4) ? img2 : stdin, "%d", &infoimg2.matriz[i][j].g);
      fscanf((argc == 3 || argc == 4) ? img2 : stdin, "%d", &infoimg2.matriz[i][j].b);
    }
  }
  if((argc == 3 || argc == 4))
    fclose(img2);

  if(argc == 4 && (img = fopen(argv[3],  "w")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[3]);
    exit(1);
  }

  int min_linhas;
  if(infoimg.linhas<infoimg2.linhas)
    min_linhas = infoimg.linhas;
  else
    min_linhas = infoimg2.linhas;
  fprintf(argc == 4 ? img : stdout, "%s\n", infoimg.magico);
  fprintf(argc == 4 ? img : stdout, "%d %d\n", infoimg.colunas+infoimg2.colunas, min_linhas);
  fprintf(argc == 4 ? img : stdout, "%d\n", infoimg.max);
  for(int i = 0; i<min_linhas; i++){
    for(int j = 0; j<infoimg.colunas+infoimg2.colunas; j++){
      fprintf(argc == 4 ? img : stdout, "%d ", infoimg.matriz[i][j].r);
      fprintf(argc == 4 ? img : stdout, "%d ", infoimg.matriz[i][j].g);
      fprintf(argc == 4 ? img : stdout, "%d", infoimg.matriz[i][j].b);
      fprintf(argc == 4 ? img : stdout, "\n");
    }
  }

  return 0;
}
