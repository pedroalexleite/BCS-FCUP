import java.util.Scanner;
import java.util.Arrays;

public class daa10_2{
  public static int pesquisabinaria(int []array, int menor, int maior, int chave){
    int med = 0;

    while(menor<maior){
      med = menor + (maior - menor)/2;
      if(chave<array[med])
        maior = med;
      else
        menor = med + 1;
    }

    return menor;
  }
  public static void main(String[] args){
    Scanner stdIn = new Scanner(System.in);
    int n = stdIn.nextInt();
    int a[] = new int[n];

    for(int i = 0; i<n; i++)
      a[i] = stdIn.nextInt();

    int n2 = stdIn.nextInt();
    int b[] = new int[n2];

    for(int i = 0; i<n2; i++)
      b[i] = stdIn.nextInt();

    int max = 0;
    int n3 = n-1;
    for(int i = 0; i<n-1; i++){
      max = max+n3;
      n3--;
    }

    int soma[] = new int[max];
    int tot = 0;
    for(int i = 0; i<n; i++){
      for(int j = i+1; j<n; j++){
        soma[tot] = a[i] + a[j];
        tot++;
      }
    }

    Arrays.sort(soma);
    int pos, d, e;

    for(int i = 0; i<n2; i++){
      pos = pesquisabinaria(soma, 0, soma.length-1, b[i]);
      if(pos == 0)
        System.out.println(soma[0]);
      else{
        d = Math.abs(b[i] - soma[pos]);
        e = Math.abs(b[i] - soma[pos-1]);
        if(d == e)
          System.out.println(soma[pos-1] + " " + soma[pos]);
        if(d>e)
          System.out.println(soma[pos-1]);
        if(d<e)
          System.out.println(soma[pos]);
      }
    }

  }
}
