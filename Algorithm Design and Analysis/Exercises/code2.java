import java.util.Scanner;

public class daa2{

  public static void main(String[] args){

    Scanner stdIn = new Scanner(System.in);
    int n = stdIn.nextInt();
    String aux1;
    int aux2;
    int str[] = new int[15];
    int total = 0, a = 0, b = 0;
    int array[] = new int[15];

    for(int i = 0; i<n; i++){
      aux1 = stdIn.next();
      aux2 = stdIn.nextInt();

      for(int j = 0; j<aux1.length(); j++){
        str[j] = Character.getNumericValue(aux1.charAt(j));
        total = total + str[j];
      }

      if(total == aux2)
        a = total;
      else{
        for(int k = (aux1.length()-1); k>=0; k--){ // 9 8 7 6 5, lenght = 5
          while((str[k] < 9)&&(total < aux2)){     // 9+8+7+9+9 = 42
            str[k] = str[k] + 1;
            total++;
          }
        }

      for(int l = 0; l < aux1.length(); l++){
        a = a*10+str[l]; // 9, 98, 987, 9879, 98799
      }

      array[b] = a;
      a = 0;
      total = 0;
      b++;
      }
    }

    for(int m = 0; m < n; m++){
      System.out.println(array[m]);
    }
  }
}
