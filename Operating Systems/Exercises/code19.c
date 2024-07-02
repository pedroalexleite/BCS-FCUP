#include <stdlib.h>
#include <math.h>
#include "vector.h"
/*
* implementation of the Complex API
*/
vector* vector_new(double x, double y, double z) {
vector* a = (vector*)malloc(sizeof(vector));
a->x = x;
a->y = y;
a->z = z;
return a;
}
vector* vector_add(vector* a, vector* w){
return vector_new(a->x + w->x, a->y + w->y, a->z + w->z);
}
vector* vector_sub(vector* a, vector* w){
return vector_new(a->x - w->x, a->y - w->y, a->z - w->z);
}
vector* vector_scale(double b, vector* z){
return vector_new(vec->x*mult,vec->y*mult,vec->z*mult);
}
vector* vector_vprod(vector* a, vector* w){
/* to complete ... */
}

double vector_sprod(vector* vec1, vector* vec2){
double _vec1_ = sqrt(pow((vec1->x),2)+ pow((vec1->y),2) + pow((vec1->z),2));
//_vec1_ = Raíz(x1^2 + y1^2 + z1^2)
double _vec2_ = sqrt(pow((vec2->x),2)+ pow((vec2->y),2) +pow((vec2->z),2));
//_vec2_ = Raíz(x2^2 + y2^2 + z2^2)
double delta = acos((vec1->x*vec2->x+vec1->y*vec2->y+vec1->z*vec2->z)/(_vec1_*_vec2_));
//delta = Arco do Cosseno(x1*x2+y1*y2+z1*z2)/(_vec1_*_vec2_)
return _vec1_*_vec2_*cos(delta);
//_vec1_*_vec2_*cos(delta)
}

double complex_mod(vector* a){
/* to complete ... */
}
