import java.util.Scanner;

public class daa1{

  public static void main(String[] args){

    Scanner stdIn = new Scanner(System.in);
    int n = stdIn.nextInt();
    int aux;
    int total = 0;

    for(int i = 0; i<n; i++){
      aux = stdIn.nextInt();
      if(aux == 42)
        total++;
    }

    System.out.println(total);
  }
}
