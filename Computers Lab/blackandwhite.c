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
  int threshold;
  threshold = atoi(argv[1]);

  if((argc == 3 || argc == 4) && (img = fopen(argv[2], "r")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[2]);
    exit(1);
  }

  fscanf((argc == 3 || argc == 4) ? img : stdin, "%s", infoimg.magico);
  fscanf((argc == 3 || argc == 4) ? img : stdin, "%d %d", &infoimg.colunas, &infoimg.linhas);
  infoimg.matriz = (COLOR**) malloc (infoimg.linhas*sizeof(COLOR*));
  for(int i = 0; i<infoimg.linhas; i++){
    infoimg.matriz[i] = (COLOR*) malloc (infoimg.colunas*sizeof(COLOR));
  }
  fscanf((argc == 3 || argc == 4) ? img : stdin, "%d", &infoimg.max);
  double g;
  int g2;
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      fscanf((argc == 3 || argc == 4) ? img : stdin, "%lf", &infoimg.matriz[i][j].r);
      fscanf((argc == 3 || argc == 4) ? img : stdin, "%lf", &infoimg.matriz[i][j].g);
      fscanf((argc == 3 || argc == 4) ? img : stdin, "%lf", &infoimg.matriz[i][j].b);
      g = 0.2126*infoimg.matriz[i][j].r + 0.7152*infoimg.matriz[i][j].g + 0.0722*infoimg.matriz[i][j].b;
      g2 = round(g);
      if(g2>threshold){
        fprintf(argc == 3 ? img : stdout, "%d ", infoimg.max);
        fprintf(argc == 3 ? img : stdout, "%d ", infoimg.max);
        fprintf(argc == 3 ? img : stdout, "%d", infoimg.max);
        fprintf(argc == 3 ? img : stdout, "\n");
      }
      else{
        fprintf(argc == 3 ? img : stdout, "%d ", 0);
        fprintf(argc == 3 ? img : stdout, "%d ", 0);
        fprintf(argc == 3 ? img : stdout, "%d", 0);
        fprintf(argc == 3 ? img : stdout, "\n");
      }
    }
  }
  if((argc == 3 || argc == 4))
    fclose(img);

  if(argc == 4 && (img = fopen(argv[3],  "w")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[2]);
    exit(1);
  }

  return 0;
}
