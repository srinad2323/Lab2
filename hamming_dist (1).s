.section .data
str1: .ascii "this is a test"
str2: .ascii "of the emergency broadcast"
str1len = . - str1

.section .text
.globl hamming_distance

hamming_distance:
    mov $0, %eax
    mov $str1, %rsi
    mov $str2, %rdi
    mov $str1len, %ecx
    
hamming_loop:
    mov $0, %edx
    movb (%rsi), %dl
    movb (%rdi), %bl
    xor  %bl, %dl

    mov $8, %ebx
    clc

hamming_bit_loop:
    shr $1, %dl
    adc $0, %edx
    dec %ebx
    jnz hamming_bit_loop

    add %edx, %eax

    add $1, %rsi
    add $1, %rdi

    dec %ecx
    jnz hamming_loop

    ret
    
.section .note.GNU-stack,"",@progbits