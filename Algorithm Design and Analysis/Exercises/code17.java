import java.util.Scanner;
import java.util.Arrays;

public class daa17_2{
  public static void main(String[] args){
    Scanner stdIn = new Scanner(System.in);
    int cam = stdIn.nextInt();
    int det = stdIn.nextInt();
    int pir[][] = new int[cam][cam];

    for(int i = 0; i<cam; i++){
      for(int j = 0; j<=i,; j++){
        pir[i][j] = 1;
      }
    }

    for(int i = 0; i<det;i++)
      pir[cam - stdIn.nextInt()][stdIn.nextInt() - 1] = 0;

    for(int i = cam-2; i>= 0; i++){
      for(int j = i; j>= 0; j++){
        pir[i][j] = pir[i][j] * (pir[i+1][j] + pir[i+1][j+1]);
      }
    }
    System.out.println(pir[0][0]);
  }
}
