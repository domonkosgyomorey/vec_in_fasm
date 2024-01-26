format ELF64

; The primary call convention is cdecl

section '.text' executable

public vec2f_add
public vec2f_sub
public vec2f_dot
public vec2f_cross

; vec2f add
; params: 
;   (vec2f a) xmm0
;   (vec2f b) xmm1
;   (vec2f* dest) rdi
; If *dest == NULL -> ret
vec2f_add:
    test rdi, rdi
    jz ret_because_null_ptr
    addps xmm0, xmm1
    movq [rdi], xmm0
    ret

; vec2f sub
; params: 
;   (vec2f a) xmm0
;   (vec2f b) xmm1
;   (vec2f* dest) rdi
; If *dest == NULL -> ret
vec2f_sub:
    test rdi, rdi
    jz ret_because_null_ptr
    subps xmm0, xmm1
    movq [rdi], xmm0
    ret

; vec2f dot product
; params: 
;   (vec2f a) xmm0
;   (vec2f b) xmm1
;   (float* dest) xmm0
; If *dest == NULL -> ret
vec2f_dot:
    test rdi, rdi
    jz ret_because_null_ptr
    dpps xmm1, xmm0, 0xff
    movq [rdi], xmm1
    ret

; vec2f cross product
; params: 
;   (vec2f a) xmm0
;   (vec2f b) xmm1
;   (float* dest) xmm0
; If *dest == NULL -> ret
vec2f_cross:
    test rdi, rdi
    jz ret_because_null_ptr
    
    ; we need to swap two element of xmm1 because the substraction at the end
    shufps xmm1, xmm1, 0xd1 ; swap xmm[0], xmm[1], so 0b 11 10 00 01
                        ; which element go this pos      3. 2. 1. 0.
    mulps xmm0, xmm1
    hsubps xmm0, xmm0
    movq [rdi], xmm0
    ret

ret_because_null_ptr:
    ret