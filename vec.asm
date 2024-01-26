format ELF64

section '.text' executable

public vec2f_add
public vec2f_sub

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

ret_because_null_ptr:
    ret