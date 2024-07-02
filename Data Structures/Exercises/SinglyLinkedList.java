/*
Nome: Pedro Alexandre Sampaio Costa Leite
Número Mecanográfico: 201906697
*/

public class SinglyLinkedList<T> {
   private Node<T> first;    // Primeiro no da lista
   private int size;         // Tamanho da lista

   // Construtor (cria lista vazia)
   SinglyLinkedList() {
      first = null;
      size = 0;
   }

   // Retorna o tamanho da lista
   public int size() {
      return size;
   }

   // Devolve true se a lista estiver vazia ou falso caso contrario
   public boolean isEmpty() {
      return (size == 0);
   }

   // Adiciona v ao inicio da lista
   public void addFirst(T v) {
      Node<T> newNode = new Node<T>(v, first);
      first = newNode;
      size++;
   }

   // Adiciona v ao final da lista
   public void addLast(T v) {
      Node<T> newNode = new Node<T>(v, null);
      if (isEmpty()) {
         first = newNode;
      } else {
         Node<T> cur = first;
         while (cur.getNext() != null)
            cur = cur.getNext();
         cur.setNext(newNode);
      }
      size++;
   }

   // Retorna o primeiro valor da lista (ou null se a lista for vazia)
   public T getFirst() {
      if (isEmpty()) return null;
      return first.getValue();
   }

   // Retorna o ultimo valor da lista (ou null se a lista for vazia)
   public T getLast() {
      if (isEmpty()) return null;
      Node<T> cur = first;
      while (cur.getNext() != null)
         cur = cur.getNext();
      return cur.getValue();
   }

   // Remove o primeiro elemento da lista (se for vazia nao faz nada)
   public void removeFirst() {
      if (isEmpty()) return;
      first = first.getNext();
      size--;
   }

   // Remove o ultimo elemento da lista (se for vazia nao faz nada)
   public void removeLast() {
      if (isEmpty()) return;
      if (size == 1) {
         first = null;
      } else {
         // Ciclo com for e uso de de size para mostrar alternativa ao while
         Node<T> cur = first;
         for (int i=0; i<size-2; i++)
            cur = cur.getNext();
         cur.setNext(cur.getNext().getNext());
      }
      size--;
   }

   // Converte a lista para uma String
   public String toString() {
      String str = "{";
      Node<T> cur = first;
      while (cur != null) {
         str += cur.getValue();
         cur = cur.getNext();
         if (cur != null) str += ",";
      }
      str += "}";
      return str;
   }

   // Reverse
   public SinglyLinkedList<T> reverse(){
    String str = list.toString(); //lista inicial para string
    SinglyLinkedList<String> new_list = new SinglyLinkedList<String>(); //nova lista

    for(int i = 0; i<size; i++){ //inverter a string
      int a = str[size-1-i];
      str[size-1-i] = str[i];
      str[i] = a;
    }
    for(int i = 0; i<size; i++){ //string para lista
      new_list.addLast(str[i]);
    }

    return new_list;
   }

   // Occurrences
   public int[] occurrences(T elem){
     int a = 0;
     Node<T> cur = first;
     int occs[] = new int[100]; //array guarda as posições de quando T aparece
     int i = 0;
     while(cur != null){
       if(cur.getValue().equals(elem)){ //quando == ao elem T
         occs[i] = a;
         i++;
       }
       cur = cur.getNext();
       a++;
     }
     if(i == 0){ //quando o elem T não aparece na lista
      return null;
     }
     int result[] = new int[i];
     for(int j=0; j<i; j++){ //retirar o elemento a mais da string
       result[j] = occs[j];
     }
     return result;
   }

  // Remove
  public void remove(SinglyLinkedList<T>toRemove){
    //1º elemento a ser removido
    while(toRemove.contains(first.getValue()) && first != null){
       first = first.getNext();
       size--;
       if(size == 0){
         first = null;
         return;
       }
     }
    Node<T> cur = first;
    //2º elemento a ser removido
    while(cur != null && cur.getNext() != null){
      if(toRemove.contains(cur.getNext().getValue())){
        cur.setNext(cur.getNext().getNext()); size--;
      }
      else
        cur = cur.getNext();
    }
  }
}
