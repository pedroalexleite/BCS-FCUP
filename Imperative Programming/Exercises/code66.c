#include <stdio.h>
#include <ctype.h>

int main(){
char ch[];
int total = 1;
int temp = 1;

for(int i = 0; (ch = getchar()) != EOF; i++){

if(ch[i] == ch[i+1])
temp++;

else if(ch[i] != ch[i+1]){
if(temp>total)
total = temp;
}

temp = 1;
}

printf("%d", total);
}
