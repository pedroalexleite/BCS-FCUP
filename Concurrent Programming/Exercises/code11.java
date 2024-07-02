import java.util.LinkedList;
public class Stack1<E> implements IStack<E> {
  private final LinkedList<E> elems;

  public Stack1() {
    elems = new LinkedList<>();
  }

  public synchronized int size() {
    return elems.size();
  }

  public synchronized void push(E elem) {
    elems.addFirst(elem);
    notify(); //(*)
  }

  public synchronized E pop() throws InterruptedException {
    while(elems.size() == 0){ //se a linkedlist não estiver vazia a thread não pode dar pop
      wait();                 //logo, vai ter de esperar, até que receber o notify(*) do push
    }
    return elems.removeFirst();
  }
}
