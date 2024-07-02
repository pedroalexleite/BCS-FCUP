import java.util.concurrent.LinkedBlockingDeque;
public class Stack3<E> implements IStack<E> {
  private final LinkedBlockingDeque<E> elems;

  public Stack3() {
    elems = new LinkedBlockingDeque<>();
  }
  @Override
  public int size() {
    return elems.size();
  }
  @Override
  public void push(E elem) {
    elems.addFirst(elem);
  }
  @Override
  public E pop() throws InterruptedException {
    return elems.take();
  }
}
