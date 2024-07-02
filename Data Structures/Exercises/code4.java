public class Reverse{

    static boolean isImpar(int n){

    if(n%2==0)
    return false;
    else
    return true;

    }

   public static void main(String[] args) {

      Reverse<Integer> s = new LinkedListStack<Integer>();

      int size = s.size();
      int n; //número a dar reverse

      if(isImpar(n)){
      int half = size/2;
        for(int i = 0; i<size; i++){
          if(n == s(i)){
            for(int j = half - i +1; j <= size; j++){
              s.pop(j);
              s.push(s(i));
              i++;
            }
          }
        }
      }
     else{
     int half = size/2 +1;
      for(int i = 0; i<size; i++){
        if(n == s(i)){
         for(int j = half - i +1; j <= size; j++){
           s.pop(j);
           s.push(s(i));
           i++;
         }
       }
     }
   }
}
