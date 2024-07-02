import java.util.Scanner;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.TreeMap;
class Graph{
  Node[] nodes;
  Graph(int n){
    nodes = new Node[n];
    for(int i=0;i<n;i++)
      nodes[i] = new Node(0,new LinkedList<>());
  }

  public void addEdge(int from, int to, int w){
    nodes[from].adj.add(new Edge(to, w));
  }

  public boolean bell_ford(int s){
    for(int i=0;i<nodes.length;i++)
      nodes[i].dist = Integer.MAX_VALUE;
    nodes[s].dist = 0;
    for(int k=0;k<nodes.length-1;k++){
      for(int i=0;i<nodes.length;i++){
        if(nodes[i].dist == Integer.MAX_VALUE) continue;
        relaxation(nodes[i]);
      }
    }
    int[] distances = new int[nodes.length];
    for(int i=0;i<distances.length;i++)
      distances[i] = nodes[i].dist;
    for(int i=0;i<nodes.length;i++)
      relaxation(nodes[i]);
    for(int i=0;i<nodes.length;i++)
      if(distances[i] != nodes[i].dist) return true;
    return false;
  }

  public void relaxation(Node p){
    for(Edge e : p.adj){
      if(p.dist + e.w < nodes[e.to].dist)
        nodes[e.to].dist = p.dist + e.w;
    }
  }
}

class Node{
  int dist;
  LinkedList<Edge> adj;
  Node(int dist, LinkedList<Edge> adj){
    this.dist = dist;
    this.adj = adj;
  }
}

class Edge{
  int w;
  int to;
  Edge(int to, int w){
    this.w = w;
    this.to = to;
  }
}

class daa34{
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    for(int k = in.nextInt(); k>= 1; k--){
      Graph g = new Graph(in.nextInt());
      for(int i=in.nextInt(); i>=1;i--)
        g.addEdge(in.nextInt(),in.nextInt(),in.nextInt());
      String output = g.bell_ford(0) ? "possivel" : "impossivel";
      System.out.println(output);
    }
  }
}
