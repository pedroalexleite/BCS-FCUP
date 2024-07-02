import java.util.Scanner;
import java.util.*;
import java.util.io.*;

public class daa9_2{
  class Par implements Comparable<Par>{
    public int freq, pos;
    public char let;

    Par(int a, int b, char c){
      a = freq;
      b = pos;
      c = let;
    }
    public int compareTo(Par p){
      if(freq<p.freq)
        return +1;
      if(freq>p.freq)
        return -1;

      return let.compareTo(p.let);
    }
  }
  public static void main(String[] args){
      Scanner stdIn = new Scanner(System.in);
      String s = stdIn.next();
      int size = s.length();
      Par letra[] = new Par[26];
      char x = 'A';

      for(int i = 0; i<26; i++){
        letra[i] = Par(0, -1, x);
        x++;
      }

      for(int i = 0; i<size; i++){
        alf[(int)s.charAt(i)-65].freq++;
        if(alf[(int)s.charAt(i)-65].pos == -1)
          alf[(int)s.charAt(i)-65].pos = i;
      }
  }
}
