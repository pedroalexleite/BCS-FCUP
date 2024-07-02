#include <stdio.h>

void vetor(char str[], char str2[], int n){

for(int i = 1; i<n; i++){
int aux = str[i];
int j = i -1;
	while(j>=0 && str[j]>aux){
	str[j+1] = str[j];
	j = j - 1;
	}
str[j+1] = aux;

for(int i = 1; i<n; i++){
aux = str2[i];
j = i -1;
	while(j>=0 && str2[j]>aux){
	str2[j+1] = str2[j];
	j = j - 1;
	}
str2[j+1] = aux;
}

}
}


int main(){
char str[]= "DEPOSIT";
char str2[]= "TOPSIDE";
int n = 7;

vetor(str, str2, n);

for(int i = 0; i<n; i++){
if(str[i] == str2[i])
return 1;
else
return 0;
}
}
