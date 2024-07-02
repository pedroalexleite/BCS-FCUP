import java.util.*;
import java.io.*;
import java.util.Scanner;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

class Pair<U,V>{
  public final U first;
  public final V second;
  private Pair(U first, V second){
    this.first = first;
    this.scond = second;
  }
}

class Node{
  public LinkedList<Pair<int, int>> adj;
  public boolean visited;
  public int distancia;
}

class Graph{
  public int n;
  public Node nodes[];

  Graph(int n){
    this.n = n;
    nodes = new node[n+1];
  }

  void addLink(int a , int b, intc){
    v[a].adj.add({b,c});
  }

  void show(){
    for(int i = 1; i<=n; i++){
      System.out.print(i + ":");
      for(int e : nodes[i].adj)
        System.out.println("(" + e.first() + ";" + e.second() +")");
    }
  }

  void dijkstra_funct(int s){
    for(int i = 1; i<=n; i++){
      nodes[i].distance() = Integer.MAX_VALUE;
      nodes[i].visited() = false;
    }
    nodes[s].distance() = 0;
    Set <Pair<Integer, Integer>> q = new Set <>();
    q.insert({0,s});
    while(!q.isEmptty()){
      int tmp = q.begin();
      q.erase(tmp);
      int u = tmp.second();
      System.out.println(u + " | dist " + nodes[u].distance());
      for(int e : nodes[u].adj){
        int v = e.first();
        int w = e.second();
        if(!nodes[v].visted() && nodes[u].distance() + w < nodes[v].distance())
          q.erase({nodes[v].distance(), v});
          nodes[v].distance() = nodes[u].distance() + w;
          q.insert({nodes[v].distance(), v});
      }
    }
  }
}

class dijkstra{
  public static void main(String[] args){
    Scanner stdin = new Scanner(System.in);
    int n, e, a, b, c;
    n = stdin.nextInt();
    e = stdin.nextInt();
    Graph g = new Graph(n);
    for(int i = 0; i<e; i++){
      a = stdin.nextInt();
      b = stdin.nextInt();
      c = stdin.nextInt();
      g.addLink(a, b, c);
    }
    g.show();
    q.dijkstra_funct(1):

  }
}
