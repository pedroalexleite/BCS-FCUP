import java.util.Scanner;
import java.util.Random;

class Point{
    int n1, n2;
    Point(int a, int b){
      n1 = a;
      n2 = b;
    }
}

public class ex2a {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n_points = in.nextInt();
        Random rand = new Random();
        int random_point;
        int counter=0;
        Point[] point_array = new Point[n_points];
        boolean [] visited = new boolean [n_points];

        for(int i=0;i<n_points;i++){
            point_array[i] = new Point(in.nextInt(), in.nextInt());
        }

        while(true){
            random_point = rand.nextInt(n_points);
            if(!visited[random_point]){
                visited[random_point] = true;
                System.out.println("(" + point_array[random_point].n1 + "," + point_array[random_point].n2 + ")");
            }

            for(int i = 0;i<n_points;i++){
                if(visited[i]==true) counter++;
                else counter = 0;

                if(counter==n_points) return;
            }
        }
    }
}
