#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

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
  int max = infoimg.max;
  int count[max];
  for(int i = 0; i<max; i++)
    count[i] = 0;
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      fscanf((argc == 2 || argc == 3) ? img : stdin, "%d", &infoimg.matriz[i][j].r);
      fscanf((argc == 2 || argc == 3) ? img : stdin, "%d", &infoimg.matriz[i][j].g);
      fscanf((argc == 2 || argc == 3) ? img : stdin, "%d", &infoimg.matriz[i][j].b);
      //neste caso r = g = b, já que  aimagem vai estar em tons de cinza
      count[infoimg.matriz[i][j].r]++;
    }
  }
  if((argc == 2 || argc == 3))
    fclose(img);

  int cdf[max];
  cdf[0] = count[0];
  for(int i = 1; i<max; i++){
    cdf[i] += count[i];
  }
  int cdf_min = 10000;
  for(int i = 0; i<max; i++){
    if(cdf[i]<cdf_min)
      cdf_min = cdf[i];
  }
  int h[max];
  for(int i = 0; i<max; i++){
    h[i] = round(((cdf[i] - cdf_min)/((infoimg.colunas*infoimg.linhas)-cdf_min))*max);
  }

  if(argc == 3 && (img = fopen(argv[2],  "w")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[2]);
    exit(1);
  }

  fprintf(argc == 3 ? img : stdout, "%s\n", infoimg.magico);
  fprintf(argc == 3 ? img : stdout, "%d %d\n", infoimg.colunas, infoimg.linhas);
  fprintf(argc == 3 ? img : stdout, "%d\n", infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      fprintf(argc == 3 ? img : stdout, "%d ", h[infoimg.matriz[i][j].r]);
      fprintf(argc == 3 ? img : stdout, "%d ", h[infoimg.matriz[i][j].r]);
      fprintf(argc == 3 ? img : stdout, "%d", h[infoimg.matriz[i][j].r]);
      fprintf(argc == 3 ? img : stdout, "\n");
    }
  }

  return 0;
}
