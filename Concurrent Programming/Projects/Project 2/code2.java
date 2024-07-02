import java.util.LinkedList;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.ReadLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;


public class HSet2<E> implements IHSet<E>{
    private LinkedList<E>[] table;
    private int size;
    private final ReentrantReadWriteLock lock = new ReentrantReadWriteLock();
    private final ReadLock readLock = lock.readLock();
    private final WriteLock writeLock = lock.writeLock();
    private final Condition hashElem = writeLock.newCondition();

    /**
     * Constructor.
     * @param ht_size Initial size for internal hash table.
     */
    public HSet2(int ht_size) {
      table = createTable(ht_size);
      size = 0;
    }


  // Auxiliary method to return the list where
  // an element should be stored.
  private LinkedList<E> getEntry(E elem) {
    return table[Math.abs(elem.hashCode() % table.length)];
  }

  // Auxiliary method to create the hash table.
  private LinkedList<E>[] createTable(int ht_size) {
    @SuppressWarnings("unchecked")
    LinkedList<E>[] t = (LinkedList<E>[]) new LinkedList[ht_size];
    for (int i = 0; i < t.length; i++) {
      t[i] = new LinkedList<>();
    }
    return t;
  }

  @Override
  public int capacity() {
    return table.length;
  }

  @Override
  public int size() {
    readLock.lock();

    try{
      return size;
    }

    finally{
      readLock.unlock();
    }
  }

  @Override
  public boolean add(E elem){
    if (elem == null){
      throw new IllegalArgumentException();
    }

    writeLock.lock();

    try{
      LinkedList<E> list = getEntry(elem);
      boolean r = ! list.contains(elem);

      if(r){
        list.addFirst(elem);
        hashElem.signalAll();
        size++;
      }

      return r;

    }
    finally{
      if(writeLock.isHeldByCurrentThread())
        writeLock.unlock();
    }
  }

  @Override
  public boolean remove(E elem){
    if(elem == null){
      throw new IllegalArgumentException();
    }

    writeLock.lock();

    try{
      boolean r = getEntry(elem).remove(elem);

      if(r){
        size--;
      }

      return r;
    }
    finally{
      if(writeLock.isHeldByCurrentThread())
        writeLock.unlock();
    }
  }

  @Override
  public boolean contains(E elem){
    if(elem == null){
      throw new IllegalArgumentException();
    }

    readLock.lock();

    try {
      return getEntry(elem).contains(elem);
    }

    finally {
      readLock.unlock();
    }
  }

  @Override
  public void waitFor(E elem) {
    if (elem == null) {
      throw new IllegalArgumentException();
    }

    writeLock.lock();

    try{
      while(!getEntry(elem).contains(elem)){
        try{
          hashElem.await();
        }
        catch(InterruptedException e) { }
      }
    }
    finally{
      if(writeLock.isHeldByCurrentThread())
        writeLock.unlock();
    }
  }

  @Override
  public void rehash(){
    writeLock.lock();

    try{
      LinkedList<E>[] oldTable = table;
      table = createTable(2 * oldTable.length);

      for(LinkedList<E> list:oldTable) {
        for(E elem:list){
          getEntry(elem).add(elem);
        }
      }

    }
    finally{
      if(writeLock.isHeldByCurrentThread())
        writeLock.unlock();
    }
  }

}
