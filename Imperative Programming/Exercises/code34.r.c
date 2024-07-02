#include <stdio.h>
#include <string.h>
#include <ctype.h>

int forte(char str[]){

int t = strlen(str);

if(t <= 6)
return 0;
else
continue;

for(int i = 0; i<t; i++){
if(str[i] == isupper())
continue;
else
return 0;
}

for(int i = 0; i<t; i++){
if(str[i] == islower())
continue;
else
return 0;
}

for(int i = 0; i<t; i++){
if(str[i] == isdigit())
continue;
else
return 0;
}

return 1;
}
int main(){
char str[] = "Anmnm4";

forte(str);

return 0;
}
