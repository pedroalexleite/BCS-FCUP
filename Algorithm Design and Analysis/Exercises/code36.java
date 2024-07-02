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
public class bfs{
  public static void main(String[] args){
    Scanner stdin = new Scanner(System.in);

    int n = stdin.nextInt();
    Graph g = new Graph(n);

    int e = stdin.nextInt()
    for(int i = 0; i<e; i++){
      int a = stdin.nextInt();
      int b = stdin.nextInt();
      g.addLink(a,b); //ligação entre dois nós
      g.addLink(b,a);
    }

    g.bfs(1);

  }
}
