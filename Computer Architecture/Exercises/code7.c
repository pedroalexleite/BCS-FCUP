#include <stdio.h>
#include <unistd.h> //adicionado ao programa
#define STRING_MAX_SIZE 100
#define PWD "MyPassword"

int main(){
  char s[STRING_MAX_SIZE];

#ifdef DEBUG
  printf("Write text to encrypt: ");
#endif
  scanf("%s", s);
  printf("crypt(%s) = %s\n", s, crypt(s, PWD));
#ifdef DEBUG
  printf("Done!\n");
#endif
  return 0;
}
