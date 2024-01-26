.section .text
    .global selection_sort_asm


selection_sort_asm: 
# rsi = size, rdi = array
    

    xorq %rax, %rax # loop 1 i = 0
    xorq %rbx, %rbx # loop 2 i = 0

loop_one_outer:
    cmpq %rsi, %rax # size <= i1
    jge end_sort 

    movq %rax, %r8 # min = i
    movl (%rdi, %rax, 4), %r9d # val of arr[min/i]
    mov %rax, %rbx # loop 2 i = loop 1 i
    inc  %rbx # next element


loop_one_inner:
    cmp %rsi, %rbx # i >= size reset loop
    jge reset # end if 0

    cmpl %r9d, (%rdi, %rbx, 4) # check if loop 2 i >= arr[min]
    jge inc_inner # no swap if i > min

    movq %rbx, %r8 # swap min and i
    movl (%rdi, %rbx, 4), %r9d # move val to param
    jmp inc_inner

reset: 
    movl (%rdi, %rax, 4), %edx  # move to end of sorted
    movl %r9d, (%rdi, %rax, 4)
    movl %edx, (%rdi, %r8, 4)
    incq %rax # i ++ (loop 1)
    jmp loop_one_outer

inc_inner:
    incq %rbx # i++ (loop 2)
    jmp loop_one_inner


end_sort:
    retq
