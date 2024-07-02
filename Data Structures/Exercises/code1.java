import java.util.Scanner;

public class Losango{

  static boolean isImpar(int n){

    if(n%2==0)
      return false;
    else
      return true;

  }

  public static void main(String[] args){

    Scanner stdIn = new Scanner(System.in);
    int n = stdIn.nextInt();

    int m = ((n-1)/2)+1;

      if(isImpar(n)){

      int p = 0;
        while(p<m){
          for(int i = 1; i<=n; i++){
            if(i>=m-p && i<=m+p){
              System.out.print("#");
            }
            else{
              System.out.print(".");
            }
          }
          System.out.println();
          p++;
        }

        int q = 1;
          while(q<m){
            for(int i = 1; i<=n; i++){
              if(i>=1+q && i<=n-q){
                System.out.print("#");
              }
              else{
                System.out.print(".");
              }
            }
            System.out.println();
            q++;
          }
    }
  }
}
