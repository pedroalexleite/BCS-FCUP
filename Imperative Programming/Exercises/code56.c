#include <stdio.h>

void decompor(int total_seg, int *horas, int *mins, int *segs){

*horas = total_seg/3600;
*mins = (total_seg%3600)/60;
*segs = total_seg%60;

}
int main(){
int segs;

scanf("%d\n", &segs);
decompor(segs);

printf("horas: %d\n", *horas);
printf("horas: %d\n", *mins);
printf("horas: %d\n", *segs);

return 0;
}
