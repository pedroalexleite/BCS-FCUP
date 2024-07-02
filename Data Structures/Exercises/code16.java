class ED197{

  public static MyQueue<Integer> merge(MyQueue<Integer> a, MyQueue<Integer> b){
     MyQueue<Integer> n = new LinkedListQueue<Integer>();

     while(!a.isEmpty() || !b.isEmpty()){
       if(a.isEmpty())
         n.enqueue(b.dequeue());
       else if(b.isEmpty())
         n.enqueue(a.dequeue());
       else if(a.first() <= b.first())
         n.enqueue(a.dequeue());
       else
         n.enqueue(b.dequeue());
     }

     return n;
  }

}
