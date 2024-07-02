import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicInteger;

public class Stack4<E> implements IStack<E> {

  private static class Node<E> {
    E data;
    Node<E> next;
    Node(E data, Node<E> next) {
      this.data = data;
      this.next = next;
    }
  }

  private static class State<E> {
    Node<E> top;
    int size;
  }

  private AtomicReference<State<E>> ref;
  
  public Stack4() {
    State<E> initial = new State<>();
    initial.top = null;
    initial.size = 0;
    ref = new AtomicReference<>(initial);
  }

  @Override
  public int size() {
    return ref.get().size;
  }

  @Override
  public void push(E elem) {
    // TODO
  }

  @Override
  public E pop() throws InterruptedException {
    State<E> oldState;
    State<E> newState = new State<>();
    E elem = null;
    while(true) {
      oldState = ref.get();
      if (oldState.size == 0) {
        continue;
      }
      newState.top = oldState.top.next;
      newState.size = oldState.size - 1;
      elem = oldState.top.data;
      if (ref.compareAndSet(oldState, newState)) break;
    } 
    return elem;
  }
} 
