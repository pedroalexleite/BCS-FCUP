import java.util.Scanner;

public class RPN{

     public static void main(String [] args){

     Scanner scan = new Scanner(System.in);
     int n = scan.nextInt(); // Quantidade de expressões

     MyStack<Integer> s = new LinkedListStack<Integer>(); // Pilha
     int j=0;
     while(j<n){
       while(scan.hasNextLine()){
         int a = scan.nextInt();
         if(a >= '0' && a <= '9')
          s.push(a);
         else if(a == '+'){
          int b = s.top();
          s.pop();
          int c = s.top();
          s.pop();
          int d = b+c;
          s.push(d);
         }
         else if(a == '-'){
          int b = s.top();
          s.pop();
          int c = s.top();
          s.pop();
          int d = b-c;
          s.push(d);
         }
         else if(a == '*'){
          int b = s.top();
          s.pop();
          int c = s.top();
          s.pop();
          int d = b*c;
          s.push(d);
         }
         else if(a == '/'){
          int b = s.top();
          s.pop();
          int c = s.top();
          s.pop();
          int d = b/c;
          s.push(d);
         }
      }
     System.out.println(s);
     for(int i=0; i<s.size(); i++){
       int aux = s.pop(); // Remover todos os elementos da pilha
     }
    j++;
   }
   }
}
