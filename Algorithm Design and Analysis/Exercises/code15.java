import java.util.Scanner;
import java.io.*;
import java.util.*;

class Par implements Comparable<Par>{
    public int inicio, fim, pos;
    public float val;

    Par(int a, int b, int c){
      inicio = a;
      fim = b;
      pos = c;
      val = (float)fim/(float)inicio;
    }

    public int compareTo(Par p){
      if(val > p.val)
        return -1;
      if(val < p.val)
        return +1;
      if(fim > p.fim)
        return +1;
      return -1;
    }
}
public class daa14_2{

  public static void main(String[] args){
    Scanner stdIn = new Scanner(System.in);
    int n = stdIn.nextInt();
    Par a[] = new Par[n];

    for(int i = 0; i<n; i++)
      a[i] = new Par(stdIn.nextInt(), stdIn.nextInt(), i+1);

    Arrays.sort(a);

    for(int i = 0; i<n-1; i++)
      System.out.println(a[i].pos + " ");
    System.out.println(a[n-1].pos);
  }
}
