import java.util.ArrayList;

import java.util.ArrayList;

public class TestStack{
  public static void main(String[] args) throws InterruptedException {
    int n = args.length >= 1 ? Integer.parseInt(args[0]) : 3;
    D.enable();
    // test(new Stack1<>(), n);
    // test(new Stack2<>(), n);
    test(new Stack3<>(), n);
  }

  static void test(IStack<Integer> s, int n)
  throws InterruptedException {
    ArrayList<Thread> threads = new ArrayList<>();
    for (int i = 0; i < n; i++) {
      threads.add( producer(s, i) );
      threads.add( consumer(s, i) );
    }
    for (Thread t : threads) t.start();
    for (Thread t : threads) t.join();
    D.print("Size at the end: %d", s.size());
  }

  static Thread producer(IStack<Integer> s, int i) {
    Thread t = new Thread(() -> { D.print("Print %s", i); s.push(i); });
    t.setName("P" + i);
    return t;
  }

  static Thread consumer(IStack<Integer> s, int i) {
    Thread t = new Thread(() -> {
      try {
        D.print("Popped %s", s.pop());
      }
      catch (InterruptedException e) {
        throw new RuntimeException("Unexpected interrupt");
      }
    });
    t.setName("C" + i);
    return t;
  }
}
