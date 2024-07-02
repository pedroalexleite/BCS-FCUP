//javac HelloWorld2.java && java HelloWorld2 16
//setDaemon(), marca uma Thread como Daemon Thread (true) ou uma Thread usada (false),
//uma Daemon Thread
import java.util.Scanner;

public class HelloWorld2 {
  public static void main(String[] args) throws InterruptedException {
    int n = Integer.parseInt(args[0]);
    Thread[] t = new Thread[n];
    for (int i = 0; i < n; i++) {
      int id = i + 1; //temos que usar id porque i não é uma variável final
      t[i] = new Thread(() -> {
        System.out.println("Hello from spawned thread " + id);
      });
      //t[i].setDaemon(true);
      t[i].start();
    }
    System.out.println("Hello from main thread");
  }
}
