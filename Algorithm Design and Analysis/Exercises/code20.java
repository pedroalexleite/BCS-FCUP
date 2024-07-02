import java.util.Scanner;
import java.util.Arrays;

class Coin{
  int n, coin;
  Coin prev;

  Coin(int n, Coin prev, int coin){
    this.n = n;
    this.prev = prev;
    this.coin = coin;
  }

  public String toString(){ return n + ""; }
}
class daa18{
  public static void main(String[] args) {
    Scanner stdin = new Scanner(System.in);
    int max=0, dif, best;
    int[] set, input, choices;
    Coin[] coins;

    set = new int[stdin.nextInt()];

    for(int i=0;i<set.length;i++)
      set[i] = stdin.nextInt();

    input = new int[stdin.nextInt()];
    choices = new int[set.length];

    for(int i = 0; i<input.length; i++){
      input[i] = stdin.nextInt();
      if(input[i]>max)
        max = input[i];
    }
    coins = new Coin[max+1];
    coins[0] = new Coin(0, null, 0);

    for(int i = 1; i<coins.length; i++){
      for(int j = 0; j<set.length; j++){
        dif = i - set[j];
        if(dif<0)
          choices[j] = -1;
        else
          choices[j] = dif;
      }
      best = choices[0];
      for(int j = 1;j <choices.length; j++){
        if(choices[j] == -1)
          continue;
        else
          if(coins[best].n > coins[choices[j]].n)
            best = choices[j];
      }
      coins[i] = new Coin(coins[best].n+1, coins[best], i-best);
    }

    for(int i = 0; i<input.length; i++) {
      Coin s = coins[input[i]];
      System.out.print(input[i]+": ");
      System.out.print("["+ coins[input[i]].n +"]");
      while(s.prev != null){
        System.out.print(" " + s.coin);
        s = s.prev;
      }
      System.out.println();
    }
  }
}
