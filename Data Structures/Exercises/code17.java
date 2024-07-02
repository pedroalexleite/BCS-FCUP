public class ED209{

    public int countBetween(T a, T b){
    BTNode<Integer> n = t.getRoot();

    if(t.getRoot() >= a && t.getRoot() <= b)
      return 1;
    if(n.getLeft()>= a && t.getRight() <= b)
      return 1 + countBetween(a, b) + countBetween(a, b);
    else
      return countBetween(a, b) + countBetween(a, b);
  }
}
