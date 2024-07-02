import java.util.Scanner;

public interface MyStack<T>{

   // Metodos que modificam a pilha
   public void push(T v); // Coloca um valor no topo da pilha
   public T pop();        // Retira e retorna o valor no topo da pilha

   // Metodos que acedem a informacao (sem modificar)
   public T top();           // Retorna valor no topo da pilha
   public int size();        // Retorna quantidade de elementos na pilha
   public boolean isEmpty(); // Indica se a pilha esta vazia

   //reverse - 194
   public static void reverse(MyStack<Integer> s, int n){
     int size = s.size(); //5
     int [] array = new int[size]; //pilha: 1 2 3 4 5

     //Guardar os valores da pilha num array
     for(int i = 0; i<size; i++){
       array[i] = s.top(); //array: 5 4 3 2 1
       int aux = s.pop(); //pilha:
     }
     //Reordenar pilha (de baixo para cima)
     for(int j = 0; j<size; j++){ //array: 1 2 3 4 5
       int a = array[j];
       array[j] = array[size-1-j];
       array[size-1-j] = a;
       //Inverter tudo para trás de n
     }
     for(int k = 0; k<n; k++){ //n = 3; array = 3 2 1 4 5
       int b = array[k];
       array[k] = array[n-1-k];
       array[n-1-k] = b;
     }
     //Transformar o array em pilha
     for(int l = 0; l<size; l++){
       s.push(array[l]);
     }
   }
   /*
    //balanced - 195
    public static boolean balanced(String s){
      int size = s.length();
      for(int i = 0; i<size; i++{
        if(s.charAt(i) == s.chartAt(size-i))
          continue;
        else
          return false;
      }

    return true;
  }*/
}
