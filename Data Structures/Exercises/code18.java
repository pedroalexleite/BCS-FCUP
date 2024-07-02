/*
Nome: Pedro Alexandre Sampaio Costa Leite
Número Mecanográfico: 201906697
Explicação da Solução:
Primeiro Input -> Número de dias
Segundo Input -> Número de casos por dia
Terceiro Input -> Flag (1,2 ou 3)
- Flag 1 - Valor minímo e valor máximo de casos novos:
Criei o array a[] para o número de casos novos por dia, a partir de um
novo ciclo comparei os valores do array um a um, começando no a[0] e
comparando o a[i] com a[i+1], para descobrir os valores minímos e máximos de casos novos.
- Flag 2 - Quantidade de períodos de baixa propagação
e o maior tamanho de um período de um período de baixa propagação
(subida percentual =< 5%):
A variável b guarda o valor percentual correspondente ao número de novos casos por dia,
se o valor percentual for menor ou igual a 5 a variável c++, e no caso contrário d++
(indo restaurando o valor de c), max2 é a variável que guarda o valores de c,
se estes forem maiores que o último (necessitei de ajuda nesta parte).
- Flag 3 - Gráfico de barras indicando o total de casos confirmados por dia,
cada coluna corresponde a um dia, e a altura da barra corresponde ao número de casos,
a barra deve ser constituída por '#' = 100 casos, espaços em branco = '.':
O gráfico vai ser representado através de uma matriz e[][] onde o número de linhas é o
max2=n2[n1-1]/100 e colunas o n1, os espaços em branco são representados por "."
e quando o valor do n2 for >= 1 a coluna aumenta um "#".
 */

import java.util.Scanner;

public class ED231{

  public static void main (String [] args){

    Scanner scan = new Scanner(System.in);
    int n1 = scan.nextInt(); scan.nextLine(); //número de dias
    int n2[] = new int[n1]; //número de casos por dia
    for(int i = 0; i<n1; i++){
      n2[i] = scan.nextInt();
    }
    int n3 = scan.nextInt(); scan.nextLine(); //flag
    scan.close();

    //Flag 1
    if(n3 == 1){
      int a[] = new int[n1-1];
      int j = 0;
        for(int i = 1; i<n1; i++){
          a[j] = n2[i]-n2[i-1];
          j++;
        }
      int min = a[0];
      int max = a[0];
        for(int i = 0; i<n1-2; i++){
            if(min>a[i+1]){
              min = a[i+1];
            }
            if(max<a[i+1]){
              max = a[i+1];
            }
        }
      System.out.println(min + " " + max);
    }
    //Flag 2
    if(n3 == 2){
      float b;
      int c = 0;
      int d = 0;
      int max2 = 0;
        for(int i = 1; i<n1; i++){
            b = ((n2[i]-n2[i-1])/((float)n2[i-1]))*100;
              if(b <= 5.00 && i != (n1-1)){
                c++;
              }
              else if(b <= 5.00 && i == (n1-1)){
                c++;
                d++; //como não conta o último
              }
              else{
                if(c != 0){
                  d++;
                }
              c = 0;
              }
              if(c > max2){
                max2 = c;
              }
        }

        System.out.println(d + " " + max2);
    }
    //Flag 3
    if(n3 == 3){
      int max3 = n2[n1-1]/100;
      int d = 0;
      char e[][] = new char[max3][n1];
        for(int i = 0; i<max3; i++){
          for(int j = 0; j<n1; j++){
            e[i][j] = '.';
          }
        }
        for(int i = 0; i<n1 ;i++){
            d = n2[i]/100;
              if(d >= 1) {
                for(int j=max3-1; j>=(max3-d); j--) {
                  e[j][i] = '#';
                }
              }
            }
        for(int i=0;i<max3;i++){
            for(int j=0;j<n1;j++){
              System.out.print(e[i][j]);
            }
            System.out.println();
        }
    }

  }
}
