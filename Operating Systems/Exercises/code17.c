#include <stdio.h>
#include <stdlib.h>
#include "matrix.h"
int main(int argc, char** argv) {
matrix* z1 = matrix_new(5, 4);
matrix* z2 = matrix_new(5, 4);
matrix* z3 = matrix_new(4, 5);
matrix* z4 = matrix_add(z1, z2);
matrix* z5 = complex_sub(z1, z2);
matrix* z6 = matrix_mul(z1, z3);
matrix* z7 = matrix_trans(z1);

printf("z1 = %d + %d\n", z1->n, z1->m);
printf("z2 = %d + %d\n", z2->n, z2->m);
printf("z3 = %d + %d\n", z3->n, z3->m);
printf("z4 = %d + %d\n", z4->n, z4->m);
printf("z5 = %d + %d\n", z5->n, z5->m);
printf("z6 = %d + %d\n", z6->n, z6->m);
printf("z7 = %d + %d\n", z7->n, z7->m);

return 0;
}
