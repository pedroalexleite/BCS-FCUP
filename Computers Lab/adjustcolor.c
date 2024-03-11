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
  int r_i, g_i, b_i;
  r_i = atoi(argv[1]);
  g_i = atoi(argv[2]);
  b_i = atoi(argv[3]);
  FILE *img;
  METADADOS infoimg;

  if((argc == 5 || argc == 6) && (img = fopen(argv[4], "r")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[4]);
    exit(1);
  }

  fscanf((argc == 5 || argc == 6) ? img : stdin, "%s", infoimg.magico);
  fscanf((argc == 5 || argc == 6) ? img : stdin, "%d %d", &infoimg.colunas, &infoimg.linhas);
  infoimg.matriz = (COLOR**) malloc (infoimg.linhas*sizeof(COLOR*));
  for(int i = 0; i<infoimg.linhas; i++){
    infoimg.matriz[i] = (COLOR*) malloc (infoimg.colunas*sizeof(COLOR));
  }
  fscanf((argc == 5 || argc == 6) ? img : stdin, "%d", &infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      fscanf((argc == 5 || argc == 6) ? img : stdin, "%d", &infoimg.matriz[i][j].r);
      fscanf((argc == 5 || argc == 6) ? img : stdin, "%d", &infoimg.matriz[i][j].g);
      fscanf((argc == 5 || argc == 6) ? img : stdin, "%d", &infoimg.matriz[i][j].b);
    }
  }
  if((argc == 5 || argc == 6))
    fclose(img);

  if(argc == 6 && (img = fopen(argv[5],  "w")) == NULL){
    printf("Erro a abrir o ficheiro %s.\n", argv[2]);
    exit(1);
  }

  fprintf(argc == 6 ? img : stdout, "%s\n", infoimg.magico);
  fprintf(argc == 6 ? img : stdout, "%d %d\n", infoimg.colunas, infoimg.linhas);
  fprintf(argc == 6 ? img : stdout, "%d\n", infoimg.max);
  for(int i = 0; i<infoimg.linhas; i++){
    for(int j = 0; j<infoimg.colunas; j++){
      int new_r = infoimg.matriz[i][j].r + r_i;
      if(new_r<=0){
          fprintf(argc == 6 ? img : stdout, "%d ", 0);
        }
        if(new_r>=infoimg.max){
          fprintf(argc == 6 ? img : stdout, "%d ",infoimg.max);
        }
        if(new_r>0 && new_r<infoimg.max){
          fprintf(argc == 6 ? img : stdout, "%d ", new_r);
        }
        int new_g = infoimg.matriz[i][j].g + g_i;
        if(new_g<=0){
          fprintf(argc == 6 ? img : stdout, "%d ", 0);
        }
        if(new_g>=infoimg.max){
          fprintf(argc == 6 ? img : stdout, "%d ",infoimg.max);
        }
        if(new_g>0 && new_g<infoimg.max){
          fprintf(argc == 6 ? img : stdout, "%d ", new_g);
        }
        int new_b = infoimg.matriz[i][j].b + b_i;
        if(new_b<=0){
          fprintf(argc == 6 ? img : stdout, "%d", 0);
        }
        if(new_b>=infoimg.max){
          fprintf(argc == 6 ? img : stdout, "%d",infoimg.max);
        }
        if(new_b>0 && new_b<infoimg.max){
          fprintf(argc == 6 ? img : stdout, "%d", new_b);
        }
        fprintf(argc == 6 ? img : stdout, "\n");
    }
  }

  return 0;
}
