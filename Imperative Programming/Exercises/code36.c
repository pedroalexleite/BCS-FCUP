#include <stdio.h>
#include <string.h>
#include <ctype.h>

int calc(char str[]){

if(str[1] == '+')
return str[0]+str[2];
if(str[1] == '-')
return str[0]-str[2];
if(str[1] == '*')
return str[0]*str[2];
else
return 0;

}
int main(){
  char str[]="3*3";

  calc(str);

  return 0;
}
