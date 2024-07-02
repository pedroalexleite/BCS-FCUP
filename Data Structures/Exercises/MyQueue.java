// -----------------------------------------------------------
// Estruturas de Dados 2019/2020 (CC1007) - DCC/FCUP
// http://www.dcc.fc.up.pt/~pribeiro/aulas/edados1920/
// -----------------------------------------------------------
// Interface para o TAD Fila
// Ultima alteracao: 06/04/2018
// -----------------------------------------------------------

public interface MyQueue<T> {

   // Metodos que modificam a fila
   public void enqueue(T v); // Coloca um valor no final da fila
   public T dequeue();       // Retira e retorna o valor no inicio da fila

   // Metodos que acedem a informacao (sem modificar)
   public T first();         // Retorna valor no inicio da fila
   public int size();        // Retorna quantidade de elementos na fila
   public boolean isEmpty(); // Indica se a fila esta vazia

/*
   //process - ED196
   public static void process(MyQueue<String> q, MyQueue<String> a, MyQueue<String> b){
     int size = q.size();
     char string[] = new char[size];

     for(int i = 0; i<size; i++){
       string[i]= q.dequeue();
       if(string[i] == 'A')
        a.enqueue(string[i-1]);
       else if(string[i] == 'B')
        b.enqueue(string[i-1]);
     }

   }

   //merge - ED197
   public static merge(MyQueue<Integer> a, MyQueue<Integer> b){

      while(!a.isEmpty() || !b.isEmpty()){
        if(a.isEmpty())
          n.enqueue(b.dequeue());
        else if(b.isEmpty())
          n.enqueue(a.dequeue());
        else if(a.first() <= b.first())
          n.enqueue(a.dequeue());
        else
          n.enqueue(b.dequeue());
      }

      return n;
   }*/

}
