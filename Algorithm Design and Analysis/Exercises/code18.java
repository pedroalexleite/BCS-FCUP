import java.util.Scanner;
import java.io.*;
import java.util.*;

public class daa17{
  public static void main(String[] args){
    Scanner stdin = new Scanner(System.in);
    int size = stdin.nextInt();
    long[][] piramide = new long[size][size];

    for(int i = 0; i<size; i++) {
      for(int j = 0; j<=i; j++) {
        piramide[i][j] = 1; //todas as pedras = 1
      }
    }

    int blocked = stdin.nextInt(); //número de pedras deterioradas
    for(int i = 0; i<blocked; i++){
      piramide[size-stdin.nextInt()][stdin.nextInt()-1] = 0; //as camadas são contadas a partir da base
    }

    if(size>1){
      for(int i = size-2; i>=0; i--){ //começamos na 2 segunda camada, já que as anteroiores não têm precedentes
        for(int j = i; j>=0; j--){ //percorrem-se as camadas de baixo para cima
          piramide[i][j] = piramide[i][j] * (piramide[i+1][j] + piramide[i+1][j+1]); //pedra atual = pedra atual * pedras de baixo
        }
      }
    }
    System.out.println(piramide[0][0]); //pedra do topo que tem a soma de todos os caminhos possíveis
  }
}
