#include <stdio.h>

int main(){
  int a, b, c, max, min, amp;

scanf("%d %d %d", &a, &b, &c);

// MÁXIMO!
if(((a > b) && (a > c)) || ((a > b) && (a == c)) || ((a == c) && (a > b)))
{
max = a;
}
else if(((b > a) && (b > c)) || ((b > a) && (b == c)) || ((b == c) && (b > a)))
{
max = b;
}
else if(((c > a) && (c > b)) || ((c > a) && (c == b)) || ((c == a) && (c > b)))
{
max = c;
}

// MÍNIMO!
if(((a < b) && (a < c)) || ((a < b) && (a == c)) || ((a == c) && (a < b)))
{
min = a;
}
else if(((b < a) && (b < c)) || ((b < a) && (b == c)) || ((b == c) && (b < a)))
{
min = b;
}
else if(((c < a) && (c < b)) || ((c < a) && (c == b)) || ((c == a) && (c < b)))
{
min = c;
}

amp = max - min;

printf("Máximo: %d \n", max);
printf("Mínimo: %d \n", min);
printf("Amplitudes: %d \n", amp);

  return 0;
}
