#include <stdio.h>
#include "vec.h"

int main(){
    vec2f a = (vec2f){1.0, 2.0};
    vec2f b = (vec2f){2.0, 2.0};
    vec2f c;
    vec2f d;
    float dot_res;
    float cross_res;
    vec2f_add(a, b, &c);
    vec2f_sub(a, b, &d);
    vec2f_dot(a, b, &dot_res);
    vec2f_cross(a, b, &cross_res);
    printf("C data: %lf, %lf\n", c.x, c.y);
    printf("D data: %lf, %lf\n", d.x, d.y);
    printf("A dot B: %lf\n", dot_res);
    printf("A cross B: %lf\n", cross_res);
    return 0;
}