#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

typedef struct color
{
  double r,g,b;
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
      fscanf((argc == 2 || argc == 3) ? img : stdin, "%lf", &infoimg.matriz[i][j].r);
      fscanf((argc == 2 || argc == 3) ? img : stdin, "%lf", &infoimg.matriz[i][j].g);
      fscanf((argc == 2 || argc == 3) ? img : stdin, "%lf", &infoimg.matriz[i][j].b);
    }
  }
  if((argc == 2 || argc == 3))
    fclose(img);

  if(argc == 3 && (img = fopen(argv[2],  "w")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[2]);
    exit(1);
  }

  double g = 0;
  int g2;
  fprintf(argc == 3 ? img : stdout, "%s\n", infoimg.magico);
  fprintf(argc == 3 ? img : stdout, "%d %d\n", infoimg.colunas, infoimg.linhas);
  fprintf(argc == 3 ? img : stdout, "%d\n", infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      g += 0.2126*infoimg.matriz[i][j].r;
      g += 0.7152*infoimg.matriz[i][j].g;
      g += 0.0722*infoimg.matriz[i][j].b;
      g = round(g);
      g2 = g;
      fprintf(argc == 3 ? img : stdout, "%d ", g2);
      fprintf(argc == 3 ? img : stdout, "%d ", g2);
      fprintf(argc == 3 ? img : stdout, "%d", g2);
      fprintf(argc == 3 ? img : stdout, "\n");
      g = 0;
    }
  }

  return 0;
}
