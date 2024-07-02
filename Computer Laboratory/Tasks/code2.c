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
  int alpha = atoi(argv[1]);
  int x = atoi(argv[2]);
  int y = atoi(argv[3]);
  FILE *img;
  METADADOS infoimg;

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

  FILE *img2;
  METADADOS infoimg2;

  if((argc == 6 || argc == 7) && (img2 = fopen(argv[6], "r")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[6]);
    exit(1);
  }

  fscanf((argc == 6 || argc == 7) ? img2 : stdin, "%s", infoimg2.magico);
  fscanf((argc == 6 || argc == 7) ? img2 : stdin, "%d %d", &infoimg2.colunas, &infoimg2.linhas);
  infoimg2.matriz = (COLOR**) malloc (infoimg2.linhas*sizeof(COLOR*));
  for(int i = 0; i<infoimg2.linhas; i++){
    infoimg2.matriz[i] = (COLOR*) malloc (infoimg2.colunas*sizeof(COLOR));
  }
  fscanf((argc == 6 || argc == 7) ? img2 : stdin, "%d", &infoimg2.max);
  for(int i = 0; i<infoimg2.linhas; i++){
    for(int j = 0; j<infoimg2.colunas; j++){
      fscanf((argc == 6 || argc == 7) ? img2 : stdin, "%d", &infoimg2.matriz[i][j].r);
      fscanf((argc == 6 || argc == 7) ? img2 : stdin, "%d", &infoimg2.matriz[i][j].g);
      fscanf((argc == 6 || argc == 7) ? img2 : stdin, "%d", &infoimg2.matriz[i][j].b);
    }
  }
  if((argc == 6 || argc == 7))
    fclose(img2);

  fprintf(argc == 3 ? img : stdout, "%s\n", infoimg.magico);
  fprintf(argc == 3 ? img : stdout, "%d %d\n", infoimg.colunas, infoimg.linhas);
  fprintf(argc == 3 ? img : stdout, "%d\n", infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      fprintf(argc == 3 ? img : stdout, "%d ", infoimg.matriz[i][j].r);
      fprintf(argc == 3 ? img : stdout, "%d ", infoimg.matriz[i][j].g);
      fprintf(argc == 3 ? img : stdout, "%d", infoimg.matriz[i][j].b);
      fprintf(argc == 3 ? img : stdout, "\n");
    }
  }

  return 0;
}
