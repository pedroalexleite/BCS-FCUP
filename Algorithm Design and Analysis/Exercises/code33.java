import java.util.*;

class NodeQ{
    public int node;
    public int flow;
    NodeQ(int n, int f) {
	     node = n;
	     flow = f;
    }
}
class Graph{
    int n;
    Vector<Vector<Integer>> adj;
    int cap[][];

    Graph(int n){
	     this.n = n;
	     adj = new Vector<>();
	     for(int i = 0; i<=n; i++)
          adj.add(new Vector<Integer>());
	     cap = new int[n+1][n+1];
    }

    void addLink(int a, int b){
	     adj.get(a).add(b);
	     adj.get(b).add(a);
	     cap[a][b] = cap[b][a] = 1;
    }
    int bfs(int s, int t, int[] parent){
	  for(int i=1; i<=n; i++)
      parent[i] = -1;
    parent[s] = -2;
	  Queue<NodeQ> q = new LinkedList<>();
	  q.add(new NodeQ(s, Integer.MAX_VALUE));
	  while (!q.isEmpty()) {
	    int cur = q.peek().node;
	    int flow = q.peek().flow;
	    q.poll();
	  for(int next : adj.get(cur)){
		    if(parent[next] == -1 && cap[cur][next]>0) {
		        parent[next] = cur;
		    int new_flow = Math.min(flow, cap[cur][next]);
		    if (next == t)
          return new_flow;
		    q.add(new NodeQ(next, new_flow));
		}
	    }
	}
	return 0;
    }
    int maxFlow(int s, int t){
	  int flow = 0;
	  int[] parent = new int[n+1];

	  while(true){
	    int new_flow = bfs(s, t, parent);
	    if (new_flow == 0) break;
	    flow += new_flow;
	    int cur = t;
	    while(cur != s){
		      int prev = parent[cur];
		      cap[prev][cur] -= new_flow;
		      cap[cur][prev] += new_flow;
		      cur = prev;
	    }
	}
	return flow;
    }
}

class daa41{
    public static void main(String[] args){
	     Scanner in = new Scanner(System.in);
       int n = in.nextInt();
	     Graph g = new Graph(n);
	     int e = in.nextInt();
	     for(int i = 0; i<e; i++){
	        int a = in.nextInt();
	        int b = in.nextInt();
	        g.addLink(a, b);
          g.addLink(b, a);
	     }
	     int flow = g.maxFlow(1,n);
	     System.out.println(flow);
  }
}
