//Pedro Leite - up201906697

import java.util.Scanner;
import java.util.LinkedList;

class Pair{
  int n1, n2;
  Pair(int a, int b){
    n1 = a;
    n2 = b;
  }
}

class ED234{

    //flag 1
    static void flag1(Scanner scan){
      BSTree<String> t = new BSTree<>();
      int n = scan.nextInt();
      int nota;

      for(int i = 0; i<n; i++){
        String filme = scan.next();
        nota = scan.nextInt();
        t.insert(filme); //inserir na BST apenas os filmes que ainda não foram inseridos
      }

      int nos = t.numberNodes(); //quantidade de nós = quantidade de filmes

      System.out.println(nos);
    }
    //flag 2
    static void flag2(Scanner scan){
      BSTMap<String, Integer> map = new BSTMap<>();
      int n = scan.nextInt();
      int nota;

      while(scan.hasNext()){
        String filme = scan.next();
        nota = scan.nextInt();
        if(map.get(filme) == null) //quando o filme/chave aparece pela primeira vez, valor = 1
          map.put(filme, 1);
        else
          map.put(filme, map.get(filme)+1); //quando o fillme/chave já apareceu, a contagem aumenta 1
      }

      int max = 0;
      String max2 = " ";
      for(String s : map.keys()){
        int aux = map.get(s);
        if(aux>max){ //ver qual é o filme/chave com maior valor (max guarda o valor e max2 o filme)
            max = aux;
            max2 = s;
        }
      }
      System.out.println(max2 + " " + max);
    }
    //flag 3
    static void flag3(Scanner scan){
      BSTMap<String, Pair> map = new BSTMap<>();
      int n = scan.nextInt();
      int nota;

      while(scan.hasNext()){
        String filme = scan.next();
        nota = scan.nextInt();
        Pair a  = map.get(filme);
        if(map.get(filme) == null)
          map.put(filme, new Pair(nota, 1)); //dentro do map temos (filme, soma das notas, quantidade de avaliações)
        else
          map.put(filme, new Pair(nota+a.n1,a.n2+1));
      }
      for(String s : map.keys()){
        Pair b = map.get(s);
        double media = (double)b.n1/b.n2; //media das notas
        if(media>=5.0)
          System.out.println(s);
      }
    }

    public static void main (String [] args){

      Scanner scan = new Scanner(System.in);
      int f = scan.nextInt(); //flag

      switch(f){
        case 1:
          flag1(scan);
          break;
        case 2:
          flag2(scan);
          break;
        case 3:
          flag3(scan);
          break;
      }
   }
}
