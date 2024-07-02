package pc.stack;

public class Node<E> {
  public E data;
  public Node<E> next;

  Node(E data, Node<E> next) {
    this.data = data;
    this.next = next;
  }
}
