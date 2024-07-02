#include <stdio.h>
#include <ctype.h>

void letter_count(int wc[]){
  int position, ch;

  do{
   ch = toupper(getchar());
   if(ch >= 'A' && ch <= 'Z'){
   position = ch - 'A';
   wc[position] += 1;
   }
   }while(ch!=EOF);

return;
}
int main(){
 int wc[26] = {0}, i;

 letter_count(wc);

 for(i=0;i<26;++i){
 if(wc[i]!= 0){
 printf("%c:%d\n", (i+'A'), wc[i]);
 }
 }
}
