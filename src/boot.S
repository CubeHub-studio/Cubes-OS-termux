.section .text.boot, "ax"
.global _start
.type _start, %function

_start:
    adrp x0, __stack_top
    add  x0, x0, :lo12:__stack_top
    mov  sp, x0
    bl   rust_main

1:
    wfe
    b    1b

.size _start, . - _start

.section .bss.stack, "aw", %nobits
.balign 16
.global __stack_bottom
__stack_bottom:
    .skip 65536
.global __stack_top
__stack_top:
