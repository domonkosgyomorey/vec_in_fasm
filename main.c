#include <stdio.h>
#include "vec.h"

int main(){
    vec2f a = (vec2f){1.0, 1.0};
    vec2f b = (vec2f){2.0, 2.0};
    vec2f c;
    vec2f d;
    vec2f_add(a, b, &c);
    vec2f_sub(a, b, &d);
    printf("C data: %lf, %lf\n", c.x, c.y);
    printf("D data: %lf, %lf\n", d.x, d.y);
    return 0;
}