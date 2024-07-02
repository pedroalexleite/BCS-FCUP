import java.util.Scanner;

public class daa2{

	public static int sum(int x){
	   int sum=0;

     while(x!=0){
		     sum += x%10;
		      x = x/10;
     }

		return sum;
	}

  public static void main(String[] args) {
	   Scanner in = new Scanner(System.in);
	   int cur, cur_sum,cur2;
	   int n = in.nextInt();

	   for(int i=0;i<n;i++){
		    cur = in.nextInt();
		    cur_sum = in.nextInt();
		    cur2 = cur + 1;
		    while(sum(cur2)!=cur_sum){
			       cur2++;
        }
		    System.out.println(cur2);
	    }
  }
}
