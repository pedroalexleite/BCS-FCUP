import java.util.Arrays;
import java.util.LinkedList;
import java.util.TreeSet;
import java.util.Collections;
import java.util.LinkedList;

class daa38{
  public static void main(String[] args) {
    FastScanner in = new FastScanner(System.in);
    int a = in.nextInt();
    int b = in.nextInt();
    int n = a+b;
    int e = in.nextInt();
    Graph g = new Graph(n);
    for(int i = 1; i<a; i++)
      g.addEdge(i-1, i, 0);
    for(int i = 0; i<e; i++){
      int p1 = in.nextInt()-1, p2 = in.nextInt()-1, w = in.nextInt();
      g.addEdge(p1,p2,w);
    }
    System.out.println(g.connect());
    Collections.sort(g.added);
    System.out.print(g.added.pollFirst());
    for(int s : g.added)
      System.out.print(" " + s);
    System.out.println();
  }
}

class Graph{
  int n;
  Node[] nodes;
  LinkedList<Integer> added = new LinkedList<>();

  Graph(int n){
    this.n = n;
    nodes = new Node[n];
    for(int i = 0; i<n; i++)
      nodes[i] = new Node();
  }

  public void addEdge(int p1, int p2, int w){
    nodes[p1].adj.add(new Edge(p2,w));
    nodes[p2].adj.add(new Edge(p1,w));
  }

  public int connect(){
    int sum = 0;
    for(int i = 0; i<n;  i++){
      nodes[i].visited = false;
      nodes[i].dist = Integer.MAX_VALUE;
    }
    nodes[0].visited = true;
    nodes[0].dist = 0;
    TreeSet<NodeQ> q = new TreeSet<>();
    q.add(new NodeQ(0,nodes[0].dist));
    while(!q.isEmpty()){
      NodeQ par = q.pollFirst();
      nodes[par.node].visited = true;
      sum += nodes[par.node].dist;
      if(nodes[par.node].dist != 0) added.add(nodes[par.node].dist);
      for(Edge e : nodes[par.node].adj){
        if(!nodes[e.to].visited){
          if(e.w < nodes[e.to].dist){
            q.remove(new NodeQ(e.to,nodes[e.to].dist));
            nodes[e.to].dist = e.w;
            q.add(new NodeQ(e.to,nodes[e.to].dist));
          }
        }
      }
    }
    return sum;
  }
}

class Node{
  boolean visited;
  int dist, parent;
  LinkedList<Edge> adj;

  Node(){
    adj = new LinkedList<>();
  }
  public String toString(){return dist+"";}
}

class Edge{
  int to;
  int w;
  Edge(int to, int w){
    this.to = to;
    this.w = w;
  }
  public String toString(){return to+1 +":"+ w;}
}

class NodeQ implements Comparable<NodeQ>{
  int node;
  int w;
  NodeQ(int node, int w){
    this.node=node;
    this.w=w;
  }
  public int compareTo(NodeQ b){
    if(w > b.w) return 1;
    if(w < b.w) return -1;
    return node-b.node;
  }
}
