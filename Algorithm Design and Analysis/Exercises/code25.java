import java.util.Scanner;
import java.util.Arrays;

class Graph{
  int p = 0;
  boolean[] used = new boolean[26], visited;
  boolean[][] g = new boolean[26][26];
  char[] revOrder = new char[26];
  public void addEdge(char c1, char c2){
    int p1 = (int) c1-'A', p2 = (int) c2-'A';
    g[p1][p2] = true;
    used[p1] = true;
    used[p2] = true;
  }
  public void dfs(char c){
    int v = c - 'A';
    visited[v] = true;
    for(int i = 0; i<26; i++)
      if(g[v][i] && !visited[i])
        dfs((char)(i+'A'));
    revOrder[p] = c;
    ++p;
  }
  public void topSort(){
    visited = new boolean[26];
    for(int i = 0; i<26; i++){
      if(used[i] && !visited[i]) dfs((char)(i+'A'));
    }
  }
}
public class daa29{
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    Graph g = new Graph();
    String s1, s2;
    int k = in.nextInt()-1;
    s1 = in.next();
    for(int j = 0; j<k; j++){
      s2 = in.next();
      int l = Math.min(s1.length(),s2.length());
      for(int i=0;i<l;i++){
        if(s1.charAt(i) != s2.charAt(i)){
          g.addEdge(s1.charAt(i), s2.charAt(i));
          g.used[s1.charAt(i)-'A'] = true;
          g.used[s2.charAt(i)-'A'] = true;
          break;
        }
      }
      s1 = s2;
    }
    g.topSort();
    for(int i = 25; i>=0; i--){
      if(g.revOrder[i] == 0) continue;
      System.out.print(g.revOrder[i]);
    }
    System.out.println();
  }
}
