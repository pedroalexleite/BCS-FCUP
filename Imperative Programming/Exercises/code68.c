#include <stdio.h>

int main(){
  int age, teenager;

age = 10;

if((age >= 13) && (age <= 19))

{
  teenager = 1;
}
else
  teenager = 0;

  printf("%d %d\n", age, teenager);

return 0;
}
