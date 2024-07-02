class ED194{
  public static void reverse(MyStack<Integer> s, int n){
    int[] array = new int[n];
    int i;
    for(i=0;i<n;i++){
      array[i] = s.pop();
    }
    for(i=0;i<n;i++){
      s.push(array[i]);
    }
  }
}
