#include <stdio.h>

int main(){

 scanf("%d %d %d", &a &b, &c);

 if((b >= a && a >= c)||(c >= a && a >= b))
 {
 printf("%d", a);
 }
 else if((a >= b && b >= c)||(c >= b && b >= a))
 {
 printf("%d", bs);
 }
 else
 {
 printf("%d", c);
 }

 return 0;
}
