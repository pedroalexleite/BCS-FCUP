import java.util.Scanner;
import java.util.Arrays;

public class daa10{

  public static int pesquisabinaria(int[] array, int menor, int maior, int chave){

    int med = 0;
    while(menor < maior){
      med = menor + (maior-menor)/2;
      if(chave <= array[med])
        maior = med;
      else
        menor = med+1;
    }
    return menor;
  }
  public static void main(String[] args) {

      Scanner in = new Scanner(System.in);
      int starting_pos = 0;
      int n = in.nextInt();

      int numbers[] = new int[n];
      for(int i = 0; i < n; i++){
          numbers[i] = in.nextInt();
      }

      int soma[] = new int[(n*(n-1))/2];
      for(int m = 0; m < n; m++){
          for(int j = m+1; j < n  ; j++){
              soma[starting_pos]=numbers[m] + numbers[j];
              starting_pos++;
          }
      }
      Arrays.sort(soma);

      int n2 = in.nextInt();
      int ans[] = new int[n2];

      for(int k = 0; k < n2 ; k++){
          ans[k] = in.nextInt();
      }
      int pos, a, b;
      for(int k = 0; k < n2 ; k++){
          pos = pesquisabinaria(soma,0,soma.length-1,ans[k]);
          if(pos == 0)
            System.out.println(soma[pos]);
          else{
              a = Math.abs(soma[pos]-ans[k]);
              b = Math.abs(soma[pos-1]-ans[k]);
              if(a==b)
                System.out.println(soma[pos -1] + " " + soma[pos]);
              else if(a>b)
                System.out.println(soma[pos -1]);
              else
                System.out.println(soma[pos]);
          }
      }
  }
}
