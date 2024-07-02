import java.util.Scanner;
import java.util.Arrays;
import java.util.TreeSet;

class daa37{
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    int n = in.nextInt();
    int[][] nodes = new int[n][2];
    for(int i = 0; i<n; i++){
      nodes[i][0] = in.nextInt();
      nodes[i][1] = in.nextInt();
    }
    double[][] dist = new double[n][n];
    for(int i = 0; i<n; i++)
      for(int j = 0;j<n;j++)
        dist[i][j] = dist(nodes[i][0], nodes[i][1], nodes[j][0], nodes[j][1]);
    double sum=0;
    boolean[] vis = new boolean[n];
    double[] minDist = new double[n];
    TreeSet<Node> q = new TreeSet<>();
    vis[0] = true;
    for(int i = 0; i<n; i++)
      minDist[i] = Double.MAX_VALUE;
    minDist[0] = 0;
    q.add(new Node(0,0));
    while(!q.isEmpty()){
      Node parent = q.pollFirst();
      vis[parent.node] = true;
      sum += parent.dist;
      for(int i = 0; i<n; i++){
        if(!vis[i] && minDist[i] > dist[parent.node][i]){
          q.remove(new Node(i, minDist[i]));
          minDist[i] = dist[parent.node][i];
          q.add(new Node(i, minDist[i]));
        }
      }
    }
    System.out.println(sum);
  }
  public static double dist(double x1, double y1, double x2, double y2) {
    double ac = Math.abs(y2 - y1);
    double cb = Math.abs(x2 - x1);
    return Math.hypot(ac, cb);
  }
}

class Node implements Comparable<Node>{
  int node;
  double dist;

  Node(int node, double dist){
    this.node = node;
    this.dist = dist;
  }
  
  public int compareTo(Node b){
    if(dist > b.dist) return 1;
    if(dist < b.dist) return -1;
    if(node > b.node) return 1;
    if(node < b.node) return -1;
    return 0;
  }
}
