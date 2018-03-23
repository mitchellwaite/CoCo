    .data    
    .comm    u,148
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $1,u+4
    movl    $100,u+8
    jmp    f1
p21:    pushl   %ebp
        movl    %esp, %ebp    
    movb    8(%ebp),%al
    movb    %al,u+116
    movl    12(%ebp),%eax
    movl    %eax,u+112
    movl    $15,n
    movl    u+112,%eax
    cmpl    $100,%eax
    jle    f2
    cmpl    $1,%eax
    jge    f3
    pushl    n
    call    pttrap13
f3:f2:    decl    %eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movb    u+116,%bl
    movb    %bl,(%eax)
    leave    
    ret    
p49:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+124
    movl    12(%ebp),%eax
    movl    %eax,u+120
    movl    $19,n
    movl    u+124,%eax
    movl    u+120,%ebx
    cmpl    $100,%ebx
    jle    f4
    cmpl    $1,%ebx
    jge    f5
    pushl    n
    call    pttrap13
f5:f4:    decl    %ebx
    lea    u+12,%ecx
    addl    %ecx,%ebx
    movb    (%ebx),%bl
    movb    %bl,(%eax)
    leave    
    ret    
f1:    movl    $28,n
    movl    $1,u+144
b6:    movl    $30,n
    cmpl    $100,u+144
    jg    f7
    incl    n
    movl    u+144,%eax
    cmpl    $100,%eax
    jle    f8
    cmpl    $1,%eax
    jge    f9
    pushl    n
    call    pttrap13
f9:f8:    decl    %eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movb    $1,(%eax)
    incl    n
    incl    u+144
    jmp    b6
f7:    movl    $36,n
    movl    $2,u+132
    incl    n
    movl    $2,u+136
b10:    movl    $40,n
    cmpl    $50,u+136
    jg    f11
    movl    $43,n
    movl    u+136,%eax
    addl    u+136,%eax
    movl    %eax,u+132
b12:    movl    $45,n
    cmpl    $100,u+132
    jg    f13
    incl    n
    pushl    u+132
    movb    $0,%al
    pushl    %eax
    call    p21
    addl    $8,%esp
    movl    $47,n
    movl    u+136,%eax
    addl    %eax,u+132
    jmp    b12
f13:    movl    $51,n
    movl    u+136,%eax
    incl    %eax
    movl    %eax,u+128
    incl    n
    pushl    u+128
    lea    u+140,%eax
    pushl    %eax
    call    p49
    addl    $8,%esp
    movl    $53,n
b14:    movl    $54,n
    cmpl    $100,u+128
    jg    f15
    cmpb    $0,u+140
    jne    f16
    incl    n
    incl    u+128
    incl    n
    pushl    u+128
    lea    u+140,%eax
    pushl    %eax
    call    p49
    addl    $8,%esp
    movl    $57,n
    jmp    b14
f16:f15:    incl    n
    movl    u+128,%eax
    movl    %eax,u+136
    jmp    b10
f11:    movl    $62,n
    pushl    u+0
    .data    
s311:    .asciz  "The primes up to "
    .text    
    lea    s311,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+0
    pushl    $100
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+0
    .data    
s354:    .asciz  " are:"
    .text    
    lea    s354,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    movl    $2,u+128
b17:    movl    $65,n
    cmpl    $100,u+128
    jg    f18
    incl    n
    pushl    u+128
    lea    u+140,%eax
    pushl    %eax
    call    p49
    addl    $8,%esp
    movl    $67,n
    cmpb    $0,u+140
    je    f19
    incl    n
    pushl    u+0
    pushl    u+128
    pushl    $4
    call    pttrap8
    addl    $12,%esp
f19:    movl    $69,n
    incl    n
    incl    u+128
    jmp    b17
f18:    movl    $73,n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    call    pttrap0
    leave    
    ret    
