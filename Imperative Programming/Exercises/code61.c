int prox_bissexto(int n){
  while ((n%4 != 0)||(n%100 == 0 && n%400 != 0)){
  n++;
  }
  return n;
}

//0 = Falso
//1 = Verdadeiro
