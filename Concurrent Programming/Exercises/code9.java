//javac ReversePrint.java && java ReversePrint 20
import java.util.Scanner;

public class ReversePrint {
  public static void main(String[] args){
    int n = Integer.parseInt(args[0]);
    Thread[] t = new Thread[n];
    for (int i = 0; i < n; i++) {
      int id = i;
      t[i] = new Thread(() -> {
        try{
          if(id < n-1) t[id+1].join();
        }catch(InterruptedException e){

        }
        System.out.println("Hello " + id);
      });
      t[i].start();
    }
    for(int i = 0; i<n; i++){}
  }
}
