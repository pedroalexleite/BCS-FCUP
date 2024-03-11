import java.util.LinkedList;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.ReadLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;

public class HSet3<E> implements IHSet<E>{
    private LinkedList<E>[] table;
    private int tamanho;
    private ReentrantReadWriteLock []locks;
    private Condition []conds;

    /**
     * Costructor.
     * @param ht_size Initial size for internal hash table.
     */
    public HSet3(int ht_size) {
      table = createTable(ht_size);
      locks = new ReentrantReadWriteLock[ht_size];
      conds = new Condition[ht_size];

      for(int i=0; i<ht_size; i++){
        locks[i] = new ReentrantReadWriteLock();
        conds[i] = locks[i].writeLock().newCondition();
      }

      tamanho = locks.length;
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

    for(int i=0; i<t.length; i++) {
      t[i] = new LinkedList<>();
    }

    return t;
  }

  @Override
  public int capacity(){
    return table.length;
  }

  @Override
  public int size(){
    for(int i=0; i<tamanho; i++){
      locks[i].readLock().lock();
    }

    int size=0;

    try{
      for(int i=0; i<table.length; i++){
        size += table[i].size();
      }
      return size;
    }
    finally{
      for(int i=0; i<tamanho; i++){
        locks[i].readLock().unlock();
      }
    }
  }

  @Override
  public boolean add(E elem){
    if (elem == null) {
      throw new IllegalArgumentException();
    }

    locks[Math.abs(elem.hashCode() % tamanho)].writeLock().lock();

    try{
      LinkedList<E> list = getEntry(elem);
      boolean r = ! list.contains(elem);

      if(r){
        list.addFirst(elem);
        conds[Math.abs(elem.hashCode() % tamanho)].signalAll();
      }

      return r;
    }
    finally{
      if(locks[Math.abs(elem.hashCode() % tamanho)].writeLock().isHeldByCurrentThread())
        locks[Math.abs(elem.hashCode() % tamanho)].writeLock().unlock();
    }
  }

  @Override
  public boolean remove(E elem){
    if(elem == null){
      throw new IllegalArgumentException();
    }

    locks[Math.abs(elem.hashCode() % tamanho)].writeLock().lock();

    try{
      boolean r = getEntry(elem).remove(elem);

      return r;
    }
    finally{
      if(locks[Math.abs(elem.hashCode() % tamanho)].writeLock().isHeldByCurrentThread())
        locks[Math.abs(elem.hashCode() % tamanho)].writeLock().unlock();
    }
  }

  @Override
  public boolean contains(E elem){
    if(elem == null){
      throw new IllegalArgumentException();
    }
    locks[Math.abs(elem.hashCode() % tamanho)].readLock().lock();

    try{
      return getEntry(elem).contains(elem);
    }
    finally{
      locks[Math.abs(elem.hashCode() % tamanho)].readLock().unlock();
    }
  }

  @Override
  public void waitFor(E elem){
    if(elem == null){
      throw new IllegalArgumentException();
    }

    locks[Math.abs(elem.hashCode() % tamanho)].writeLock().lock();

    try{
      while(!getEntry(elem).contains(elem)){
        try{
          conds[Math.abs(elem.hashCode() % tamanho)].await();
        }
        catch(InterruptedException e){ }
      }
    }
    finally{
      if(locks[Math.abs(elem.hashCode() % tamanho)].writeLock().isHeldByCurrentThread())
        locks[Math.abs(elem.hashCode() % tamanho)].writeLock().unlock();
    }
  }

  @Override
  public void rehash() {
    for(int i=0; i<tamanho; i++){
      locks[i].writeLock().lock();
    }

    try{
      LinkedList<E>[] oldTable = table;
      table = createTable(2 * oldTable.length);

      for(LinkedList<E> list:oldTable){
        for (E elem:list ){
          getEntry(elem).add(elem);
        }
      }
    }
    finally{
      for(int i=0; i<tamanho; i++){
        if(locks[i].writeLock().isHeldByCurrentThread())
          locks[i].writeLock().unlock();
      }
    }
  }
}
