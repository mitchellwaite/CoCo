    .data    
    .comm    u,84
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $1,u+4
    movl    $15,u+8
    jmp    f1
p23:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+80
    movl    $10,n
    cmpl    $1,u+80
    jne    f2
    incl    n
    incl    u+12
    jmp    f3
f2:    movl    $13,n
    movl    u+80,%eax
    cmpl    $15,%eax
    jle    f4
    cmpl    $1,%eax
    jge    f5
    pushl    n
    call    pttrap13
f5:f4:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movl    u+80,%ebx
    cmpl    $15,%ebx
    jle    f6
    cmpl    $1,%ebx
    jge    f7
    pushl    n
    call    pttrap13
f7:f6:    decl    %ebx
    shl    $2,%ebx
    lea    u+12,%ecx
    addl    %ecx,%ebx
    movl    u+80,%ecx
    decl    %ecx
    cmpl    $15,%ecx
    jle    f8
    cmpl    $1,%ecx
    jge    f9
    pushl    n
    call    pttrap13
f9:f8:    decl    %ecx
    shl    $2,%ecx
    lea    u+12,%edx
    addl    %edx,%ecx
    movl    (%ecx),%ecx
    addl    (%ebx),%ecx
    movl    %ecx,(%eax)
f3:    leave    
    ret    
f1:    movl    $18,n
    movl    $1,u+12
    incl    n
    movl    $2,u+72
b10:    movl    $21,n
    movl    u+72,%eax
    cmpl    $15,%eax
    jle    f11
    cmpl    $1,%eax
    jge    f12
    pushl    n
    call    pttrap13
f12:f11:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    movl    $0,(%eax)
    incl    n
    incl    u+72
    cmpl    $15,u+72
    jg    f13
    jmp    b10
f13:    movl    $26,n
    pushl    u+0
    pushl    $1
    pushl    $5
    call    pttrap8
    addl    $12,%esp
    movl    $28,n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    movl    $2,u+76
b14:    movl    $31,n
    movl    u+76,%eax
    movl    %eax,u+72
b15:    movl    $33,n
    cmpl    $1,u+72
    je    f16
    incl    n
    pushl    u+72
    call    p23
    addl    $4,%esp
    movl    $35,n
    decl    u+72
    jmp    b15
f16:    movl    $39,n
    movl    $1,u+72
b17:    movl    $41,n
    movl    u+76,%eax
    cmpl    %eax,u+72
    jg    f18
    incl    n
    pushl    u+0
    movl    u+72,%eax
    cmpl    $15,%eax
    jle    f19
    cmpl    $1,%eax
    jge    f20
    pushl    n
    call    pttrap13
f20:f19:    decl    %eax
    shl    $2,%eax
    lea    u+12,%ebx
    addl    %ebx,%eax
    pushl    (%eax)
    pushl    $5
    call    pttrap8
    addl    $12,%esp
    incl    n
    incl    u+72
    jmp    b17
f18:    movl    $47,n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    incl    u+76
    cmpl    $15,u+76
    jg    f21
    jmp    b14
f21:    movl    $50,n
    call    pttrap0
    leave    
    ret    
