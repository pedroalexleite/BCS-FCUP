class ED196{
  public static void process(MyQueue<String> q, MyQueue<String> a, MyQueue<String> b){
    String aux_1;
    String aux_2;

    while (!q.isEmpty()){
      aux_1=q.dequeue();
      aux_2=q.dequeue();
      if (aux_2.equals("A"))
        a.enqueue(aux_1);
      else if (aux_2.equals("B"))
        b.enqueue(aux_1);
      else if (aux_2.equals("X")){
        if (a.size()>b.size()) b.enqueue(aux_1);
        if (a.size()<b.size()) a.enqueue(aux_1);
        if (a.size()==b.size()) continue;
      }
    }
 }
}
