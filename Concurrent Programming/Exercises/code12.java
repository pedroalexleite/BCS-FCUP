import java.util.LinkedList;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class Stack2<E> implements IStack<E> {
  private final LinkedList<E> elems;
  private final ReentrantLock lock;
  private final Condition notEmpty;
  public Stack2() {
    elems = new LinkedList<>();
    lock = new ReentrantLock();
    notEmpty = lock.newCondition();
  }
  @Override
  public int size() {
    return elems.size();
  }
  @Override
  public void push(E elem) {
    try{
      lock.lock();
      elems.addFirst(elem);
      notEmpty.signal();
    }
    finally{
      lock.unlock();
    }
  }
  @Override
  public E pop() throws InterruptedException {
    E elem = null;
    try {
      lock.lock();  // block until condition holds
      while(elems.size() == 0){
        notEmpty.await();
      }
      elem = elems.removeFirst();
      finally { // finally executa mesmo depois do return na função
      lock.unlock();
    }
    return elem;
  }
}
