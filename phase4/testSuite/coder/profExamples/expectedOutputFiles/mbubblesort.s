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
p21:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+120
    movl    12(%ebp),%eax
    movl    %eax,u+116
    movl    16(%ebp),%eax
    movl    %eax,u+112
    movl    $15,n
    movl    u+120,%eax
    movl    u+112,%ebx
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
    movl    u+116,%ecx
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
p62:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+128
    movl    12(%ebp),%eax
    movl    %eax,u+124
    movl    $20,n
    movl    u+124,%eax
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
    movl    %eax,u+132
    incl    n
    movl    u+124,%eax
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
    movl    u+128,%ebx
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
    movl    u+128,%eax
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
    movl    u+132,%ebx
    movl    %ebx,(%eax)
    leave    
    ret    
p125:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $28,n
    movl    $1,u+136
b16:    movl    $30,n
    pushl    u+0
    movl    u+136,%eax
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
    incl    u+136
    cmpl    $25,u+136
    jg    f19
    jmp    b16
f19:    movl    $35,n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    leave    
    ret    
f1:    movl    $42,n
    movl    $61,u+12
    movl    $44,n
    movl    $1,u+140
b20:    movl    $46,n
    incl    u+140
    incl    n
    movl    u+140,%eax
    decl    %eax
    cmpl    $25,%eax
    jle    f21
    cmpl    $1,%eax
    jge    f22
    pushl    n
    call    pttrap13
f22:f21:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    imull    $1271,%eax
    movl    %eax,u+144
    incl    n
    movl    u+140,%eax
    cmpl    $25,%eax
    jle    f23
    cmpl    $1,%eax
    jge    f24
    pushl    n
    call    pttrap13
f24:f23:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movl    $99,%esi
    movl    u+144,%ebx
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
    cmpl    $25,u+140
    je    f25
    jmp    b20
f25:    jmp    f26
p290:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $58,n
    movl    $24,u+148
b27:    movl    $60,n
    cmpl    $0,u+148
    je    f28
    incl    n
    movl    $1,u+152
b29:    movl    $63,n
    cmpl    $25,u+152
    je    f30
    incl    n
    pushl    u+152
    movl    u+152,%eax
    incl    %eax
    pushl    %eax
    lea    u+156,%eax
    pushl    %eax
    call    p21
    addl    $12,%esp
    movl    $65,n
    cmpb    $0,u+156
    jne    f31
    incl    n
    pushl    u+152
    movl    u+152,%eax
    incl    %eax
    pushl    %eax
    call    p62
    addl    $8,%esp
    movl    $67,n
f31:    movl    $67,n
    incl    n
    incl    u+152
    jmp    b29
f30:    movl    $70,n
    decl    u+148
    jmp    b27
f28:    leave    
    ret    
f26:    movl    $76,n
    call    p125
    addl    $0,%esp
    movl    $76,n
    incl    n
    call    p290
    addl    $0,%esp
    movl    $77,n
    incl    n
    call    p125
    addl    $0,%esp
    movl    $78,n
    call    pttrap0
    leave    
    ret    
