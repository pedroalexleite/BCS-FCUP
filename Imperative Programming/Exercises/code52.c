#include <stdio.h>

int magico(int a[20][20], int n){
  int i,j,v,soma=0; //i = linha e j = coluna
  if(n==1)
      return 1;
  else for(j=0;j<n;j++){
        soma+=a[0][j]; //soma da primeira linha

  }
  v=soma;
  soma=0; //repor a soma
  for(i=1;i<n;i++){
      for(j=0;j<n;j++){
          soma+=a[i][j]; //soma de todas as linhas
      }
      j=0;
      if(v!=soma)
          return 0;
      soma = 0;
  }
  soma=0;
  for(j=0;j<n;j++){
      for(i=0;i<n;i++){
          soma+=a[i][j]; //soma de todas as colunas
      }
      i=0;
      if(v!=soma)
          return 0;
      soma = 0;
  }
  soma=0;
  for(i=0;i<n;i++){
      soma+=a[i][i]; //soma da diagonal principal
      }
  if(v!=soma)
      return 0;
  soma=0;
  for(i=0;i<n;i++){
      soma+=a[i][n-(i+1)];
      }
  if(v!=soma)
      return 0;
  return 1;
}
