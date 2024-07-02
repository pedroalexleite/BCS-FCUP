#include <stdio.h>
#include <ctype.h>

int contador_palavras (){
int ch, espaco=1, palavras=0;
do {
ch= getchar ();
if (ch == ' ' || ch == '\n' || ch == '\t')
espaco ++;
else if (espaco >= 1 && ch != EOF){
palavras ++;
espaco= 0;

}

} while (ch != EOF);

  return palavras;
}

int main(void) {
  int y = contador_palavras ();
printf ("%d\n", y);
return 0;
}
