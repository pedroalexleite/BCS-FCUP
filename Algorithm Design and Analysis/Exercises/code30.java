import java.util.Scanner;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;

class Graph{
  Node[] nodes;

  Graph(int n){
    nodes = new Node[n];
    for(int i=0;i<n;i++) nodes[i] = new Node();
  }

  public void addEdge(int a, int b){
    nodes[a].adj.add(b);
  }

  public void reachable(int s){
    for(int i=0;i<nodes.length;i++) nodes[i].vis = false;
    Queue<Integer> q = new LinkedList<>();
    q.add(s);
    while(!q.isEmpty()){
      int rem = q.remove();
      Node parent = nodes[rem];
      parent.vis = true;
      for(int son : parent.adj)
        if(!nodes[son].vis) q.add(son);
    }
  }
}

class Node{
  boolean vis;
  LinkedList<Integer> adj;
  Node(){
    adj = new LinkedList<>();
  }
}

class daa35{
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    int v = in.nextInt();
    Graph g = new Graph(v);
    for(int i = 0;i<v;i++){
      int p1 = (int) in.next().charAt(0)-'A';
      int k = in.nextInt();
      for(int j=0;j<k;j++){
        int p2 = in.next().charAt(0)-'A';
        g.addEdge(p1,p2);
      }
    }

    System.out.print(" ");
    for(char c='A';c<'A'+v;c++){
      System.out.print(" " + c);
    }
    System.out.println();
    for(int i=0;i<v;i++){
      g.reachable(i);
      int reach = g.nodes[0].vis ? 1 : 0;
      System.out.print((char)(i+'A') + " " +reach);
      for(int j=1;j<v;j++){
        reach = g.nodes[j].vis ? 1 : 0;
        System.out.print(" " + reach);
      }
      System.out.println();
    }
  }
}
