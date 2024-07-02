import java.util.Scanner;
import java.util.*;

class Par implements Comparable<Par>{

  public int Li, Ri;

  Par(int x,int y){
    Li=x;
    Ri=y;
  }

  public int compareTo(Par p) {
    if (Li > p.Li) return +1;
    if (Li < p.Li) return -1;
    return -1;
  }
  public String toString(){
    return "(" + Li + "," + Ri + ")";
  }
}

public class daa13{

  public static void main(String[] args){

    Scanner stdIn = new Scanner(System.in);
    int M = stdIn.nextInt();
    int N = stdIn.nextInt();
    int end = 0;
    int count = 0;
    int maior = 0;
    Par[] pares = new Par[N];
    int estado = 0;

    for(int i=0;i<N;i++)
      pares[0][i] = new Par(stdIn.nextInt(),stdIn.nextInt());

    Arrays.sort(pares);

    while(end<M){
        for(int i=0;i<N;i++){
          if(pares[i].Li<=end){
            if(pares[i].Ri>=maior){
                maior=pares[i].Ri;
             }
              estado=1;
           }
        }
        if(estado==0)
          end++;
        else
          end=maior;
        estado=0;
        maior=0;
        count++;
      }
        System.out.println(count);
      }
    }
