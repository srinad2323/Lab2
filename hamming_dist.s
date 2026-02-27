.section .data
str1: .ascii "this is a test"
str1len = . - str1
str2: .ascii "of the emergency broadcast"

.section .text
.globl hamming_distance

hamming_distance:
    mov $0, %eax
    mov $str1, %rsi
    mov $str2, %rdi
    mov $str1len, %ecx
    
hamming_byte_loop:
    movb (%rsi), %dl
    movb (%rdi), %bl
    xor  %bl, %dl
    mov $8, %ebx

hamming_bit_loop:
    shr $1, %dl
    jnc main_hamming_loop
    add $1, %eax

main_hamming_loop:
    dec %ebx
    jnz hamming_bit_loop

    add $1, %rsi
    add $1, %rdi

    dec %ecx
    jnz hamming_byte_loop

    ret
    
.section .note.GNU-stack,"",@progbits