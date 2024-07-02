#include <stdio.h>

int main(){
  int a, b, c, mediana;

scanf("%d %d %d", &a, &b, &c);

// A mediana é a
if((b<=a<=c)&&(c<=a<=b))
{
printf("A mediana é %d\n", a);
}

// A mediana é b
 else if((a<=b<=c)&&(c<=b<=a))
{
printf("A mediana é %d\n", b);
}

// A mediana é c
else if((a<=c<=b)&&(b<=c<=a))
{
printf("A mediana é %d\n", c);
}

return 0;
}
