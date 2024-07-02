import java.util.Scanner;

public class Palindromos {
    static Boolean isPalindrome(String inputString) {
      int size = inputString.length();
      int i , j = size-1, half = size / 2;
      for(i = 0; i < half ; ++i, --j){
      if (inputString.charAt(i) != inputString.charAt(j)) return false;
      }
      return true;
    }

    public static void main(String[] args) {
      Scanner stdin = new Scanner(System.in);
      int n = stdin.nextInt();
      String[] simOuNao = new String[n];
      String s, parsed;

      stdin.nextLine();
      for(int i=0;i<n;i++){
        s = stdin.nextLine();
        parsed = s.replaceAll("[^a-zA-Z]", "");
        if (isPalindrome(parsed.toLowerCase())) simOuNao[i] = "sim";
        else simOuNao[i] = "nao";
      }
      System.out.println(n);
      for(i=0;i<n;i++) System.out.println(simOuNao[i]);
    }
}
  }

}
