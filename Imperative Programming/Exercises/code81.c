#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
int x;

srand((unsigned)time(NULL));

x = ((double)rand())/(((double)(RAND_MAX)+1)*21);

printf("%d\n", x);

return 0;
}
