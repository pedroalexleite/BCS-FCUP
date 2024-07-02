import java.util.Scanner;

public class daa5_2{

  public static void main(String[] args){

    FastScanner stdIn = new FastScanner(System.in);
    int n1 = stdIn.nextInt();
    int aux1;
    int str[] = new int[n1+1];

    for(int i = 1; i<=n1; i++){
      aux1 = stdIn.nextInt();
      str[i] = aux1;
    }

    int n2 = stdIn.nextInt();
    int a, b;
    int total = 0;

    for(int j = 0; j<n2; j++){
      a = stdIn.nextInt();
      b = stdIn.nextInt();

      total = 0;

      for(int k = a; k <= b; k++){
        total += str[k];
      }

      FastPrint.out.println(total);
    }

    FastPrint.out.close();
  }
}
