.section .data
str1: .ascii ""
str2: .ascii "test"
str1len = . - str1

.section .text
.globl hamming_distance

hamming_distance:
    mov $0, %eax               # Stores total distance
    mov $str1, %rsi            # Stores the first string
    mov $str2, %rdi            # Stores the second tree
    mov $str1len, %ecx         # Stores the length of the first string
    
hamming_loop:
    mov $0, %edx               # Stores the distance in a byte
    movb (%rsi), %dl           # Stores the current byte in a temporary variable
    movb (%rdi), %bl
    xor  %bl, %dl              # Compares the bytes

    mov $8, %ebx               # Bit counter
    clc

hamming_bit_loop:
    shr $1, %dl                # Shifts right within the byte
    adc $0, %edx               # Add-carry which increments in EDX
    dec %ebx                   # Decrements EBX
    jnz hamming_bit_loop       # Loop goes on until all bits in the byte are accounted for

    add %edx, %eax             # The bit counter in EDX is added to the total distance

    add $1, %rsi               # The program moves on to the next byte
    add $1, %rdi

    dec %ecx                   #Loop goes on until all of the necessary bytes are accounted for
    jnz hamming_loop

    ret
    
.section .note.GNU-stack,"",@progbits