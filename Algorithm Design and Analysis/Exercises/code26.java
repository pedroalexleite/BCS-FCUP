import java.util.Scanner;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;

class Graph{
  int maxDist=0, minDist = Integer.MAX_VALUE;
  LinkedList<Integer> centralNodes = new LinkedList<>();
  LinkedList<Integer> sideNodes = new LinkedList<>();
  int dist[][];
  Node[] nodes;

  Graph(int size){
    nodes = new Node[size];
    dist = new int[size][size];
    for(int i = 0; i<nodes.length; i++)
      nodes[i] = new Node();
  }

  public void addEdge(int a, int b){
    nodes[a].edges.addFirst(b);
  }

  public void show(){
    for(int i = 0; i<nodes.length; i++)
      System.out.println(i + " " + nodes[i].edges);
  }

  public void bfs(int p){
    int max = 0;
    Queue<Integer> q = new LinkedList<>();
    for(int i=0;i<nodes.length;i++) nodes[i].visited = false;
    nodes[p].visited = true;
    nodes[p].d = 0;
    q.add(p);
    while(!q.isEmpty()){
      Node n = nodes[q.poll()];
      for(int i : n.edges){
        if(!nodes[i].visited) {
          q.add(i);
          dist[p][i] = nodes[i].d = n.d + 1;
          max = Math.max(dist[p][i], max);
          nodes[i].visited = true;
        }
      }
    }
    if(maxDist == max)
      sideNodes.addLast(p);
    else if(maxDist < max){
      maxDist = max;
      sideNodes = new LinkedList<>();
      sideNodes.addFirst(p);
    }
    if(minDist == max)
      centralNodes.addLast(p);
    else if(minDist > max){
      minDist = max;
      centralNodes.clear();
      centralNodes.addFirst(p);
    }
  }
}

class Node{
  boolean visited;
  int d;
  LinkedList<Integer> edges = new LinkedList<>();
}

class daa30{
  static Graph g;

  public static void main(String[] args){
    String out;
    int n1,n2;
    Scanner in = new Scanner(System.in);
    g = new Graph(in.nextInt());
    for(int i = in.nextInt(); i>=1; i--){
      n1 = in.nextInt()-1;
      n2 = in.nextInt()-1;
      g.addEdge(n1,n2);
      g.addEdge(n2,n1);
    }
    for(int i=0;i<g.nodes.length;i++)
      g.bfs(i);
    System.out.println(g.maxDist);
    System.out.println(g.minDist);
    System.out.print( (g.centralNodes.removeFirst()+1));
    for(int i : g.centralNodes)
      System.out.print(" " + (i+1));
    System.out.println();
    System.out.print((g.sideNodes.removeFirst()+1));
    for(int i : g.sideNodes)
      System.out.print(" " + (i+1));
    System.out.println();
  }
}
