.global _start
.text


_start: 
    call write
    call flip
    call write
    jmp exit
write:
    movq $1, %rax
    movq $1, %rdi
    movq $mystr, %rsi
    movq str_length, %rdx
    syscall
    retq
flip: 
    lea (mystr), %rdi
    call to_upper
to_upper:

convert_loop:
    mov (%rdi), %al
    cmp $0, %al
    je end

    cmp $97, %al
    jb to_lower
    cmp $122, %al
    ja to_lower

    sub $32, %al
    mov %al, (%rdi)
    jmp increment

increment:
    inc %rdi
    jmp convert_loop

to_lower:
    mov (%rdi), %al
    cmp $0, %al
    je end

    cmp $65, %al
    jb increment
    cmp $90, %al
    ja increment

    add $32, %al
    mov %al, (%rdi)
    jmp increment
end:
  ret
exit:
    movq $60, %rax
    xor %rdi, %rdi
    syscall

.data
mystr: .ascii "foo_BAR_works_FINE\n"
str_length: .quad 19
