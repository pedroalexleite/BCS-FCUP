import java.util.Scanner;
import java.io.*;
import java.util.*;

class Letra implements Comparable<Letra>{
    public int freq;
    public int pos;
    public char let;

    Letra(int a, int b, char n) {
	     freq = a;
       pos = b;
	     let = n;
    }

    public int compareTo(Letra p){
	     if(freq > p.freq)
          return -1;
	     if(freq < p.freq)
          return +1;
      if(p.pos-pos<0)
          return +1;

	     return -1;
    }
}
public class daa9{

  public static void main(String[] args){

    Letra alf[] = new Letra[26];
    Scanner stdin = new Scanner(System.in);
    String ch = stdin.next();
    int size = ch.length();
    char x = 'A';

    for(int j = 0; j<26; j++){
      alf[j] = new Letra(0, -1, x);
      x++;
    }

    for(int i = 0; i<size; i++){
      alf[(int)ch.charAt(i)-65].freq++;
      if(alf[(int)ch.charAt(i)-65].pos==-1)
        alf[(int)ch.charAt(i)-65].pos=i;
    }

    Arrays.sort(alf);

    for(int k = 0; k<26; k++){
       if(alf[k].freq>0)
  	    System.out.println(alf[k].let + " " + alf[k].freq);
    }
  }
}
