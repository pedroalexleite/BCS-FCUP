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
  int size = atoi(argv[1]);
  int r = atoi(argv[2]);
  int g = atoi(argv[3]);
  int b = atoi(argv[4]);

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
  fprintf(argc == 7 ? img : stdout, "%d %d\n", infoimg.colunas+(size*2), infoimg.linhas+(size*2));
  fprintf(argc == 7 ? img : stdout, "%d\n", infoimg.max);
  //imprimir parte de cima da moldura
  for(int i = 0; i<infoimg.colunas+(size*2); i++){
    fprintf(argc == 7 ? img : stdout, "%d ", r);
    fprintf(argc == 7 ? img : stdout, "%d ", g);
    fprintf(argc == 7 ? img : stdout, "%d", b);
    fprintf(argc == 7 ? img : stdout, "\n");
  }
  for(int i = 0; i<infoimg.linhas; i++){
    //imprimir parte do lado esquerdo da moldura
    for(int l = 0; l<size; l++){
      fprintf(argc == 7 ? img : stdout, "%d ", r);
      fprintf(argc == 7 ? img : stdout, "%d ", g);
      fprintf(argc == 7 ? img : stdout, "%d", b);
      fprintf(argc == 7 ? img : stdout, "\n");
    }
    for(int j = 0; j<infoimg.colunas; j++){
      fprintf(argc == 7 ? img : stdout, "%d ", infoimg.matriz[i][j].r);
      fprintf(argc == 7 ? img : stdout, "%d ", infoimg.matriz[i][j].g);
      fprintf(argc == 7 ? img : stdout, "%d", infoimg.matriz[i][j].b);
      fprintf(argc == 7 ? img : stdout, "\n");
    }
    for(int k = 0; k<size; k++){
      fprintf(argc == 7 ? img : stdout, "%d ", r);
      fprintf(argc == 7 ? img : stdout, "%d ", g);
      fprintf(argc == 7 ? img : stdout, "%d", b);
      fprintf(argc == 7 ? img : stdout, "\n");
    }
  }
  for(int i = 0; i<infoimg.colunas+(size*2); i++){
    fprintf(argc == 7 ? img : stdout, "%d ", r);
    fprintf(argc == 7 ? img : stdout, "%d ", g);
    fprintf(argc == 7 ? img : stdout, "%d", b);
    fprintf(argc == 7 ? img : stdout, "\n");
  }

  return 0;
}
