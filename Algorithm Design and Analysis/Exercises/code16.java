import java.util.*;
import java.util.Scanner;

class Par implements Comparable<Par>{
  public int pos,Li,Ri;
  public float val;

  Par(int z,int x,int y){
    pos=z;Li=x; Ri=y;
    val= (float)Ri/(float)Li;
  }

  public int compareTo(Par p) {
    if (val > p.val) return -1;
    if (val < p.val) return 1;
    if (Ri> p.Ri) return +1;
    return 1;
  }

  public String toString(){
    return ""+pos;
  }
}


public class daa14 {

  public static void main(String[] args) {
  	Scanner in = new Scanner(System.in);
    int N = in.nextInt();
    Par []lista= new Par[N];

    for(int i = 0; i<N ; i++)
      lista[i]=new Par(i+1,in.nextInt(),in.nextInt());

    Arrays.sort(lista);
    int j = 0;

    for(j = 0; j<N-1 ; j++)
      System.out.print(lista[j].pos+" ");

    System.out.println(lista[j].pos);

  }
}
