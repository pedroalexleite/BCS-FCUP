#include <stdio.h>
#include <string.h>
#include <ctype.h>

int scrabble(char str[]){
int pontos = 0;
char ch;

for(int i = 0; i<strlen(str); i++)
ch=str[i];
ch=toupper(ch);
switch(ch){
case 'A':case 'E':case 'I':case 'L':case 'N':case 'O':case 'R':case 'T':case 'S':case 'U':
pontos += 1;
break;
case 'D':case 'G':
pontos += 2;
break;
case 'B':case 'C':case 'M':case 'P':
pontos += 3;
break;
case 'F':case 'H':case 'V':case 'W':case 'Y':
pontos += 4;
break;
case 'K':
pontos += 5;
break;
case 'J':case 'X':
pontos += 8;
break;
case 'Q':case 'Z':
pontos += 10;
break;
}
}

return pontos;
}
int main(){
  char str[]= "PITFALL";

  printf("%d\n", scrabble(pontos));

}
