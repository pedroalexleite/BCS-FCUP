
public class Semaphore {
  private int value; 
  Semaphore(int v) {
    assert(v >= 0);
    value = v;
  } 

  synchronized void acquire() {
    while (value == 0) {
      try {
        wait();
      }
      catch(InterruptedException e) { } // ignore
    }
    value--;
  }

  synchronized void release() {
    value ++;
    notify();
  }

  synchronized int value() {
    return value;
  }

  public static void main(String[] args) throws Exception  {
    D.enable();
    D.enableDeadlockDetection();
    Semaphore s = new Semaphore(0);
    Thread[] threads = {
       new Thread(() -> s.acquire()),
       new Thread(() -> s.acquire()),
       new Thread(() -> s.release()),
       new Thread(() -> s.release())
    };
    for (Thread t : threads) t.start();
    for (Thread t : threads) t.join();
    System.out.println(s.value);
  }
}
