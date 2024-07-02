#include <stdio.h>

int main(){

int *p, i = 3, a = 4;

p = &a;

printf("%d %d %d\n", *p, a, i);

return 0;
}
