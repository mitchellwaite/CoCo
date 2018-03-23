    .data    
    .comm    u,158
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $1,u+4
    movl    $25,u+8
    jmp    f1
p23:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+128
    movl    12(%ebp),%eax
    movl    %eax,u+124
    movl    16(%ebp),%eax
    movl    %eax,u+120
    movl    $18,n
    movl    u+128,%eax
    movl    u+120,%ebx
    cmpl    $25,%ebx
    jle    f2
    cmpl    $1,%ebx
    jge    f3
    pushl    n
    call    pttrap13
f3:f2:    decl    %ebx
    shl    $2,%ebx
    lea    u+12,%ecx
    addl    %ecx,%ebx
    movl    u+124,%ecx
    cmpl    $25,%ecx
    jle    f4
    cmpl    $1,%ecx
    jge    f5
    pushl    n
    call    pttrap13
f5:f4:    decl    %ecx
    shl    $2,%ecx
    lea    u+12,%edx
    addl    %edx,%ecx
    movl    (%ebx),%ebx
    cmpl    %ebx,(%ecx)
    jle    f6
    movb    $1,%bl
    jmp    f7
f6:    movb    $0,%bl
f7:    movb    %bl,(%eax)
    leave    
    ret    
p64:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+136
    movl    12(%ebp),%eax
    movl    %eax,u+132
    movl    $23,n
    movl    u+132,%eax
    cmpl    $25,%eax
    jle    f8
    cmpl    $1,%eax
    jge    f9
    pushl    n
    call    pttrap13
f9:f8:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    movl    %eax,u+140
    incl    n
    movl    u+132,%eax
    cmpl    $25,%eax
    jle    f10
    cmpl    $1,%eax
    jge    f11
    pushl    n
    call    pttrap13
f11:f10:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movl    u+136,%ebx
    cmpl    $25,%ebx
    jle    f12
    cmpl    $1,%ebx
    jge    f13
    pushl    n
    call    pttrap13
f13:f12:    decl    %ebx
    shl    $2,%ebx
    lea    u+12,%ecx
    addl    %ecx,%ebx
    movl    (%ebx),%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+136,%eax
    cmpl    $25,%eax
    jle    f14
    cmpl    $1,%eax
    jge    f15
    pushl    n
    call    pttrap13
f15:f14:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movl    u+140,%ebx
    movl    %ebx,(%eax)
    leave    
    ret    
p127:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $31,n
    movl    $1,u+144
b16:    movl    $33,n
    pushl    u+0
    movl    u+144,%eax
    cmpl    $25,%eax
    jle    f17
    cmpl    $1,%eax
    jge    f18
    pushl    n
    call    pttrap13
f18:f17:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    pushl    (%eax)
    pushl    $4
    call    pttrap8
    addl    $12,%esp
    incl    n
    incl    u+144
    cmpl    $25,u+144
    jg    f19
    jmp    b16
f19:    movl    $38,n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    leave    
    ret    
p204:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $45,n
    movl    $24,u+148
b20:    movl    $47,n
    cmpl    $0,u+148
    je    f21
    incl    n
    movl    $1,u+152
b22:    movl    $50,n
    cmpl    $25,u+152
    je    f23
    incl    n
    pushl    u+152
    movl    u+152,%eax
    incl    %eax
    pushl    %eax
    lea    u+156,%eax
    pushl    %eax
    call    p23
    addl    $12,%esp
    movl    $52,n
    cmpb    $0,u+156
    jne    f24
    incl    n
    pushl    u+152
    movl    u+152,%eax
    incl    %eax
    pushl    %eax
    call    p64
    addl    $8,%esp
    movl    $54,n
f24:    movl    $54,n
    incl    n
    incl    u+152
    jmp    b22
f23:    movl    $57,n
    decl    u+148
    jmp    b20
f21:    leave    
    ret    
f1:    movl    $64,n
    movl    $61,u+12
    movl    $66,n
    movl    $1,u+112
b25:    movl    $68,n
    incl    u+112
    incl    n
    movl    u+112,%eax
    decl    %eax
    cmpl    $25,%eax
    jle    f26
    cmpl    $1,%eax
    jge    f27
    pushl    n
    call    pttrap13
f27:f26:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    imull    $1271,%eax
    movl    %eax,u+116
    incl    n
    movl    u+112,%eax
    cmpl    $25,%eax
    jle    f28
    cmpl    $1,%eax
    jge    f29
    pushl    n
    call    pttrap13
f29:f28:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movl    $99,%esi
    movl    u+116,%ebx
    movl    %ebx,%edi
    pushl    %eax
    pushl    %edx
    movl    %edi,%edx
    movl    %edx,%eax
    sarl        $31,    %edx
    idivl    %esi
    movl    %edx,%esi
    popl    %edx
    popl    %eax
    movl    %esi,%ebx
    movl    %ebx,(%eax)
    cmpl    $25,u+112
    je    f30
    jmp    b25
f30:    movl    $76,n
    call    p127
    addl    $0,%esp
    movl    $76,n
    incl    n
    call    p204
    addl    $0,%esp
    movl    $77,n
    incl    n
    call    p127
    addl    $0,%esp
    movl    $78,n
    call    pttrap0
    leave    
    ret    
