import java.util.Scanner;

public class daa3{

    public static int generation(String m){
      if((m.charAt(3)>='0' && m.charAt(3)<='9') && (m.charAt(6)>='0' && m.charAt(6)<='9'))
        return 1;
      if((m.charAt(0)>='0' && m.charAt(0)<='9') && (m.charAt(3)>='0' && m.charAt(3)<='9'))
        return 2;
      if(m.charAt(3)>='A' && m.charAt(3)<='Z')
        return 3;

      return 4;
    }

    public static int contas(char x){
      int val=0;
      if((int) x>=48 && (int) x<=57)
        val+= ((int) x) -48;
      if((int) x>=65 && (int) x<75)
        val+= ((int) x)- 65;
      if((int) x>75 && (int) x<=87)
        val+= ((int) x)- 66;
      if((int) x>87 && (int) x<=89)
        val+= ((int) x)- 67;
      if((int) x>89 && (int) x<=90)
        val+= ((int) x)- 68;

      return val;
    }

    public static int converter(String m, int ger){
      int value=0;
      int pos=10000;

      switch(ger){
        case 1:
        for(int i=0;i<8;i++){
          if (i==2 || i==5)
            continue;
          else if (i==0)
            value = contas(m.charAt(i))*10000*23;
          else{
            value +=contas(m.charAt(i))*pos;
            pos=pos/10;
          }
        }
        value++;
        break;

        case 2:
        for (int i=0;i<8;i++){
          if (i==2 || i==5)
            continue;
          if (i==0)
            value +=contas(m.charAt(i))*1000;
          if (i==1)
            value +=contas(m.charAt(i))*100;
          if (i==6)
            value +=contas(m.charAt(i))*10000*23;
          if (i==7)
            value +=contas(m.charAt(i))*10000;
          if (i==3)
            value +=contas(m.charAt(i))*10;
          if (i==4)
            value +=contas(m.charAt(i))*1;
        }
        value += 5290000;
        value++;
        break;

        case 3:
        for (int i=0;i<8;i++){
          if (i==2 || i==5) continue;
          if (i==0) value +=contas(m.charAt(i))*1000;
          if (i==1) value +=contas(m.charAt(i))*100;
          if (i==3) value +=contas(m.charAt(i))*10000*23;
          if (i==4) value +=contas(m.charAt(i))*10000;
          if (i==6) value +=contas(m.charAt(i))*10;
          if (i==7) value +=contas(m.charAt(i))*1;
        }
        value += 2*5290000;
        value++;
        break;

        case 4:
        for (int i=0;i<8;i++){
          if (i==2 || i==5) continue;
          if (i==0) value +=contas(m.charAt(i))*100*23*23*23;
          if (i==1) value +=contas(m.charAt(i))*100*23*23;
          if (i==3) value +=contas(m.charAt(i))*10;
          if (i==4) value +=contas(m.charAt(i))*1;
          if (i==6) value +=contas(m.charAt(i))*100*23;
          if (i==7) value +=contas(m.charAt(i))*100;
        }
        value+=3*5290000;
        value++;
        break;
      }

      return value;
    }

    public static void main(String[] args) {

       Scanner in = new Scanner(System.in);
       int T = in.nextInt();
       String mat_1;
       String mat_2;
       int dif;

       for (int i=0; i<T;i++){
         mat_1= in.next();
         mat_2= in.next();

         dif= converter(mat_1, generation(mat_1))- converter(mat_2, generation(mat_2));
         if (dif>=0)
            System.out.println(dif);
        else{
            dif= dif*(-1);
            System.out.println(dif);
      }
    }
  }
}
