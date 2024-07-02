import java.util.Scanner;
import java.io.*;
import java.util.*;

class Par implements Comparable<Par>{
    public int inicio, fim;

    Par(int a, int b){
      a = inicio;
      b = fim;
    }

    public int compareTo(Par p){

    }
}
public class daa13_2{

  public static void main(String[] args){
    Scanner stdIn = new Scanner(System.in);
    int m = stdIn.nextInt();
    int n = stdIn.nextInt();
    Par[] = new Par[n];

    for(int i = 0; i<n; i++)
      Par[i] = Par(stdIn.nextInt(),stdIn.nextInt());

  }
}
