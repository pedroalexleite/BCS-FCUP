import java.util.Scanner;
import java.util.Locale;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.TreeMap;
import java.util.TreeSet;

class Graph{
  static int size = 0;
  Node[] nodes;
  TreeMap<String,Integer> nameToNode;

  Graph(int n){
    nodes = new Node[n];
    nameToNode = new TreeMap<>();
  }

  public boolean addNode(String a){
    if(nameToNode.get(a) != null) return false;
    nodes[size] = new Node(a, -1, new LinkedList<>());
    nameToNode.put(a, size);
    size++;
    return true;
  }

  public void addEdge(String a, String b, float w, boolean twoWay){
    int p1 = nameToNode.get(a), p2 = nameToNode.get(b);
    nodes[p1].adj.add(new Edge(p2,w));
    if(twoWay) nodes[p2].adj.add(new Edge(p1,w));
  }

  public void dijkstra(String source){
    int s = nameToNode.get(source);
    for(int i = 0; i<size; i++){
      nodes[i].dist = Float.MAX_VALUE;
      nodes[i].visited = false;
    }
    nodes[s].dist = 0;
    TreeSet<Node> q = new TreeSet<>();
    q.add(nodes[s]);
    while(!q.isEmpty()){
      Node parent = q.pollFirst();
      parent.visited = true;
      for(Edge e : parent.adj){
        int son = e.to;
        if(!nodes[son].visited && parent.dist + e.w < nodes[son].dist){
          q.remove(nodes[son]);
          nodes[son].dist = parent.dist + e.w;
          q.add(nodes[son]);
        }
      }
    }
  }
}

class Node implements Comparable<Node>{
  boolean visited;
  float dist;
  String name;
  LinkedList<Edge> adj;

  Node(String n, float d, LinkedList<Edge> adj){
    name = n;
    dist = d;
    this.adj = adj;
  }

  public int compareTo(Node s){
    if(dist > s.dist)
      return 1;
    if(dist < s.dist)
      return -1;
    return name.compareTo(s.name);
  }
  public String toString(){ return name+" ("+dist+")";}
}

class Edge{
  int to;
  float w;

  Edge(int to, float w){
    this.to = to;
    this.w = w;
  }

  public String toString(){
    return to + "(" + w + ")";
  }
}

class daa33{
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    in.useLocale(Locale.US);
    int v = in.nextInt(), e=in.nextInt();
    float w;
    String source = in.next(), dest=in.next(), a,b;
    Graph g = new Graph(v);
    g.addNode(source);
    g.addNode(dest);
    for(int i = 0; i<e; i++){
      a = in.next();
      b = in.next();
      w = in.nextFloat();
      g.addNode(a);
      g.addNode(b);
      g.addEdge(a,b,w,true);
    }
    g.dijkstra(source);
    System.out.println(Math.round(g.nodes[g.nameToNode.get(dest)].dist * 10.0) / 10.0);
  }
}
