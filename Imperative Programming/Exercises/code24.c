#include <stdio.h>
#include <ctype.h>

int main(){
  int ch, letras = 0;

    printf("Introduza a palavra:\n");

    while ((ch=getchar()) != EOF){
    switch (ch) {
    case 'A': case 'E': case 'I': case 'L': case 'N': case 'O':case 'R': case 'T': case 'S': case 'U':
    letras += 1;
    break;
    case 'D': case 'G':
    letras += 2;
    break;
    case 'B': case 'C': case 'M': case 'P':
    letras += 3;
    break;
    case 'F': case 'H': case 'V': case 'W': case 'Y':
    letras += 4;
    break;
    case 'K':
    letras += 5;
    break;
    case 'J': case 'X':
    letras += 8;
    break;
    case 'Q': case 'Z':
    letras += 10;
    break;
    }
    }

  printf("\n%d\n", letras);

  return 0;
}
