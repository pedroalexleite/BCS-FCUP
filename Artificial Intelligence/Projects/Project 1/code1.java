import java.util.Scanner;
import javax.print.event.PrintEvent;
import java.util.Random;
import java.lang.Math;

class Point{
    int n1, n2;
    Point(int a, int b){
      n1 = a;
      n2 = b;
    }
}

public class ex1{
    static int n_points;

    public static boolean repet_ver(int x, int y, Point[] point_array){
      for(int i = 0; i<n_points; i++){
          if(point_array[i].n1==x && point_array[i].n2==y)
            return false;
      }
      return true;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Random rand = new Random();
        n_points = in.nextInt();
        int m = in.nextInt();
        Point[] point_array = new Point[n_points];
        int random_x = 0;
        int random_y = 0;
        int contador = 0;
        int flag = 0;

        if(n_points>Math.pow((2*m+1),2)){
          System.out.println("erro");
          return;
        }

        for(int i=0;i<n_points;i++){
            point_array[i] = new Point(0,0);
        }

        while(contador<n_points){
            random_x = - m + rand.nextInt(m + m + 1);
            random_y = - m + rand.nextInt(m + m + 1);
            if(random_x == 0 && random_y == 0 && flag == 0){
              flag = 1;
              point_array[contador].n1 = random_x;
              point_array[contador].n2 = random_y;
              contador++;
            }
            if(repet_ver(random_x, random_y, point_array)){
              point_array[contador].n1 = random_x;
              point_array[contador].n2 = random_y;
              contador++;
            }
        }

        for(int i=0;i<n_points;i++){
            System.out.println("(" + point_array[i].n1 + "," + point_array[i].n2 + ")");
        }
    }
}
