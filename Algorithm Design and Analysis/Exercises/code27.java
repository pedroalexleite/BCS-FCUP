import java.util.*;
import java.io.*;
import java.util.Scanner;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;

class Node{
  LinkedList<Integer> adj;
  boolean visited;
  int distancia;

  Node(){
    adj = new LinkedList<Integer>();
  }
}

class Graph{
  int n;
  Node[] v;

  Graph(int n){
    this.n = n;
    v = new node[n+1];
    for(int i = 1; i<=n; i++)
      v[i] = new Node();
  }

  void addLink(int a, int b){
    v[a].adj.add(b);
  }

  void bfs(int x){
    Queue<Integer> q = new LinkedList<>();
    for(int i = 1; i<=n; i++)
      v[i].visited = false;
    q.add(x); //adicionar o nó à fila
    v[x].visted = true;
    v[x].distancia = 0;
    while(!q.isEmpty()){ //enquanto a fila tiver qualquer coisa
      int u = q.poll(); //retirar e retornar
      for(int w : v[u].adj) //todos os nós adjacentes a u
        if(!v[w].visited){
          q.add(w);
          v[w].visited = true;
          v[w].distancia = v[u].distancia+1;
        }
    }
  }
}

public class daa31{
  public static void main(String[] args){
    Scanner stdin = new Scanner(System.in);
    int l = stdin.nextInt();
    int c = stdin.nextInt();
    for(int i = 0; i<l; i++){
      String aux = stdin.next();
      for(int j = 0; j<c; j++){
        String aux2 = aux.charAt(j);

      }
    }

  }
}
