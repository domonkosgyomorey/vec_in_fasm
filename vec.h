#ifndef VEC_H
#define VEC_H

typedef struct vec2f{
    float x;
    float y;
}vec2f;

extern void vec2f_add(vec2f a, vec2f b, vec2f* dest);
extern void vec2f_sub(vec2f a, vec2f b, vec2f* dest);

#endif // VEC_H