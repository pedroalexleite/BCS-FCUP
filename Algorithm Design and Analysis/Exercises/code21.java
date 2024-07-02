import java.util.Scanner;
import java.util.*;
import java.util.TreeMap;


public class daa21{
  public static void main(String[] args){
    FastScanner stdIn = new FastScanner(System.in);
    int a = stdIn.nextInt();
    int r = stdIn.nextInt();
    TreeMap<Integer,Integer> s = new TreeMap<Integer,Integer>();

    for(int i=0;i<a+r;i++){
      String aux = stdIn.next();
      if(aux.equals("BAK")){
        int val = stdIn.nextInt();
        if(!s.containsKey(val))
          s.put(val,1);
        else
          s.replace(val,s.get(val)+1);
      }
      if(aux.equals("MIN")){
        int menor = s.firstKey();
        FastPrint.out.println(menor);
        if(s.get(menor)-1<=0)
          s.remove(menor);
        else
          s.replace(menor,s.get(menor)-1);
      }

      if(aux.equals("MAX")){
        int maior = s.lastKey();
        FastPrint.out.println(maior);
        if(s.get(maior)-1<=0)
          s.remove(maior);
        else
          s.replace(maior,s.get(maior)-1);
      }
    }
    FastPrint.out.close();
  }
}
