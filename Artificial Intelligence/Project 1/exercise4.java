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

public class ex4 {
    static int n_points;

    public static boolean in_box(Point A, Point B, Point C){
      return ((Math.min(A.n1, B.n1) <= C.n1 && C.n1 <= Math.max(A.n1, B.n1)) && (Math.min(A.n2, B.n2) <= C.n2 && C.n2 <= Math.max(A.n2, B.n2)));
    }

    public static boolean check_intersect(Point A, Point B, Point C, Point D){
        int calc1, calc2, calc3, calc4;

        calc1 = ((C.n1-A.n1)*(B.n2-A.n2))-((B.n1-A.n1)*(C.n2-A.n2));
        calc2 = ((D.n1-A.n1)*(B.n2-A.n2))-((B.n1-A.n1)*(D.n2-A.n2));
        calc3 = ((A.n1-C.n1)*(D.n2-C.n2))-((D.n1-C.n1)*(A.n2-C.n2));
        calc4 = ((B.n1-C.n1)*(D.n2-C.n2))-((D.n1-C.n1)*(B.n2-C.n2));

        if(calc1*calc2<0 && calc3*calc4<0)
          return true;
        else if(calc1 == 0 && in_box(A, B, C))
          return true;
        else if(calc2 == 0 && in_box(A, B, D))
          return true;
        else if(calc3 == 0 && in_box(C, D, A))
          return true;
        else if(calc4 == 0 && in_box(C, D, B))
          return true;
        return false;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Random rand = new Random();
        n_points = in.nextInt();
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
        System.out.println("Ordenação por nearest neighbour:");
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

    Point start_point1 = new Point(0,0);
    Point start_point2 = new Point(0,2);
    Point[] wo_intersect = new Point[n_points];

    for(int i=0;i<n_points;i++){
      wo_intersect[i] = new Point(0,0);
    }

    System.out.println("---------------------------------------------------------");

    int temp1=0;
    int temp2=0;
    int flag=0;

    for(int i=0;i<n_points-1;i++){
        start_point1 = point_near[i];
        start_point2 = point_near[i+1];
        for(int j=i+2;j<n_points-2;j++){
            if(check_intersect(start_point1,start_point2,point_near[j],point_near[j+1]) == true){
              flag =1;
              System.out.println("Há interseção dos segmentos "+ "(" + start_point1.n1 + "," + start_point1.n2 + ") " +  "(" + start_point2.n1 + "," + start_point2.n2 + ") interseta com " + "(" + point_near[j].n1 + "," + point_near[j].n2 + ") " + "(" + point_near[j+1].n1 + "," + point_near[j+1].n2 + ").");
              temp1 = point_near[i+1].n1;
              temp2 = point_near[i+1].n2;
              point_near[i+1].n1 = point_near[j].n1;
              point_near[i+1].n2 = point_near[j].n2;
              point_near[j].n1 = temp1;
              point_near[j].n2 = temp2;
            }
        }
    }

    System.out.println("---------------------------------------------------------");
    System.out.println("Nova ordenação sem interseções:");
    if(flag == 1){
      for(int i = 0; i<n_points; i++){
        System.out.println("(" + point_near[i].n1 + "," + point_near[i].n2 + ")");
      }
    }
  }
}
