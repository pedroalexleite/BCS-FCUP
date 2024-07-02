//javac HelloWorld.java && java HelloWorld
//Thread.sleep(), suspende durante um determinado tempo a thread
//Thread.yeld(), manda o thread atual para o final da lista de agendamento
import java.util.Scanner;

public class HelloWorld {
  public static void main(String[] args) throws InterruptedException {
    hello1();
    //hello2();
    //hello3();
  }

  // Example creation 1 (extension of class java.lang.Thread)
  static class HelloThread extends Thread {
    @Override
    public void run() {
      System.out.println("Hello from spawned thread");
    }
  }

  static void hello1() throws InterruptedException {
    System.out.println("=> Hello 1");
    HelloThread t = new HelloThread();
    t.start();
    //Thread.sleep(1,0);
    System.out.println("Hello from main thread");
    t.join(); //a main thread vai esperar pelo término da execução da thread que está a correr
  }

  // Example creation 2 (use of Runnable instance)
  static class HelloRunnable implements Runnable {
    @Override
    public void run() {
      System.out.println("Hello from spawned thread");
    }
  }

  static void hello2() throws InterruptedException {
    System.out.println("=> Hello 2");
    Thread t = new Thread(new HelloRunnable());
    t.start();
    System.out.println("Hello from main thread");
    t.join();
  }

  // Example 3 (use of a Runnable instance defined by a lambda expression)
  static void hello3() throws InterruptedException {
    System.out.println("=> Hello 3");
    Thread t = new Thread(() -> {
      System.out.println("Hello from spawned thread");
    });

    t.start();
    System.out.println("Hello from main thread");
    t.join();
  }
}
