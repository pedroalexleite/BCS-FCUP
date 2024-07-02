import java.util.Scanner;
import java.util.Random;
import java.lang.Math;

class Point{
    int n1, n2;
    Point(int a, int b){
      n1 = a;
      n2 = b;
    }
}

public class ex2b {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Random rand = new Random();
        int n_points = in.nextInt();
        int counter = 0;
        double cur_dist=0,min_dist=Double.MAX_VALUE;
        int min_dist_pos=0;
        Point[] point_array = new Point[n_points];
        Point[] point_near = new Point[n_points];
        boolean [] visited = new boolean [n_points];
        boolean [] visited2 = new boolean [n_points];

        for(int i=0;i<n_points;i++){
            point_array[i] = new Point(in.nextInt(), in.nextInt());
        }

        int cur = rand.nextInt(n_points);
        int cur_inicial = cur;
        visited[cur] = true;
        visited2[cur] = true;
        point_near[0] = new Point (point_array[cur].n1, point_array[cur].n2);

        for(int j=0; j<n_points-1;j++){
          for(int i=0;i<n_points;i++){
            if(!visited[i] & !visited2[i]){
              cur_dist = Math.sqrt(Math.pow(point_array[cur].n1 - point_array[i].n1,2) + Math.pow(point_array[cur].n2 - point_array[i].n2,2));
              if(cur_dist<min_dist){
                min_dist = cur_dist;
                min_dist_pos = i;
              }
            }
              visited[min_dist_pos] = true;
          }
          cur = min_dist_pos;
          visited2[min_dist_pos] = true;
          counter++;
          point_near[counter] = new Point (point_array[min_dist_pos].n1, point_array[min_dist_pos].n2);
          for(int k=0; k<n_points; k++){
            visited[k] = false;
          }
          visited[min_dist_pos] = true;
          visited[cur_inicial] = true;
          min_dist = Double.MAX_VALUE;
    }
    for(int i = 0; i<n_points; i++){
        System.out.println("(" + point_near[i].n1 + "," + point_near[i].n2 + ")");
    }
  }
}
