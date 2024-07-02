class ED195{
  public static boolean balanced(String s){
     MyStack<Character> t = new LinkedListStack<Character>();
     for (int i = 0;i<s.length();i++) {
       Character aux= s.charAt(i);
       if (aux.equals('(') || aux.equals('['))
        t.push(aux);
       if (t.isEmpty() && (aux.equals(')') || aux.equals(']') ))
        return false;
       if (!t.isEmpty() && (t.top()).equals('(') && aux.equals(')'))
        t.pop();
       if (!t.isEmpty() && (t.top()).equals('[') && aux.equals(']'))
        t.pop();
     }
     if(t.isEmpty()) return true;
     return false;
   }
}
