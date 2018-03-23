    .data    
    .comm    u,1692
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $1,u+0
    movl    $2,u+4
    movl    $0,u+12
    movl    $100,u+16
    movl    $0,u+424
    movl    $100,u+428
    movl    $0,u+836
    movl    $100,u+840
    jmp    f1
p54:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1252
    movl    $23,n
    movl    u+1248,%eax
    cmpl    $100,%eax
    jle    f2
    cmpl    $0,%eax
    jge    f3
    pushl    n
    call    pttrap13
f3:f2:    shl    $2,%eax
    lea    u+844,%ebx
    addl    %ebx,%eax
    movl    u+1252,%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+1248,%eax
    cmpl    $100,%eax
    jle    f4
    cmpl    $0,%eax
    jge    f5
    pushl    n
    call    pttrap13
f5:f4:    shl    $2,%eax
    lea    u+432,%ebx
    addl    %ebx,%eax
    movl    $0,(%eax)
    incl    n
    movl    u+1248,%eax
    cmpl    $100,%eax
    jle    f6
    cmpl    $0,%eax
    jge    f7
    pushl    n
    call    pttrap13
f7:f6:    shl    $2,%eax
    lea    u+20,%ebx
    addl    %ebx,%eax
    movl    $0,(%eax)
    movl    $27,n
    cmpl    $0,u+8
    jne    f8
    incl    n
    movl    u+1248,%eax
    movl    %eax,u+8
    jmp    f9
f8:    movl    $30,n
    movl    u+8,%eax
    movl    %eax,u+1256
b10:    movl    $32,n
    movl    u+1256,%eax
    cmpl    $100,%eax
    jle    f11
    cmpl    $0,%eax
    jge    f12
    pushl    n
    call    pttrap13
f12:f11:    shl    $2,%eax
    lea    u+844,%ebx
    addl    %ebx,%eax
    movl    u+1252,%ebx
    cmpl    %ebx,(%eax)
    jle    f13
    incl    n
    movl    u+1256,%eax
    cmpl    $100,%eax
    jle    f14
    cmpl    $0,%eax
    jge    f15
    pushl    n
    call    pttrap13
f15:f14:    shl    $2,%eax
    lea    u+20,%ebx
    addl    %ebx,%eax
    cmpl    $0,(%eax)
    jne    f16
    incl    n
    movl    u+1256,%eax
    cmpl    $100,%eax
    jle    f17
    cmpl    $0,%eax
    jge    f18
    pushl    n
    call    pttrap13
f18:f17:    shl    $2,%eax
    lea    u+20,%ebx
    addl    %ebx,%eax
    movl    u+1248,%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+1248,%eax
    movl    %eax,u+1256
    jmp    f19
f16:    movl    $37,n
    movl    u+1256,%eax
    cmpl    $100,%eax
    jle    f20
    cmpl    $0,%eax
    jge    f21
    pushl    n
    call    pttrap13
f21:f20:    shl    $2,%eax
    lea    u+20,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    movl    %eax,u+1256
f19:    jmp    f22
f13:    movl    $40,n
    movl    u+1256,%eax
    cmpl    $100,%eax
    jle    f23
    cmpl    $0,%eax
    jge    f24
    pushl    n
    call    pttrap13
f24:f23:    shl    $2,%eax
    lea    u+844,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    cmpl    %eax,u+1252
    jle    f25
    incl    n
    movl    u+1256,%eax
    cmpl    $100,%eax
    jle    f26
    cmpl    $0,%eax
    jge    f27
    pushl    n
    call    pttrap13
f27:f26:    shl    $2,%eax
    lea    u+432,%ebx
    addl    %ebx,%eax
    cmpl    $0,(%eax)
    jne    f28
    incl    n
    movl    u+1256,%eax
    cmpl    $100,%eax
    jle    f29
    cmpl    $0,%eax
    jge    f30
    pushl    n
    call    pttrap13
f30:f29:    shl    $2,%eax
    lea    u+432,%ebx
    addl    %ebx,%eax
    movl    u+1248,%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+1248,%eax
    movl    %eax,u+1256
    jmp    f31
f28:    movl    $45,n
    movl    u+1256,%eax
    cmpl    $100,%eax
    jle    f32
    cmpl    $0,%eax
    jge    f33
    pushl    n
    call    pttrap13
f33:f32:    shl    $2,%eax
    lea    u+432,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    movl    %eax,u+1256
f31:f25:    movl    $47,n
f22:    movl    u+1256,%eax
    cmpl    $100,%eax
    jle    f34
    cmpl    $0,%eax
    jge    f35
    pushl    n
    call    pttrap13
f35:f34:    shl    $2,%eax
    lea    u+844,%ebx
    addl    %ebx,%eax
    movl    u+1252,%ebx
    cmpl    %ebx,(%eax)
    je    f36
    jmp    b10
f36:f9:    movl    $54,n
    incl    u+1248
    leave    
    ret    
p340:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $0,u+1260
    movl    $100,u+1264
    movl    $63,n
    movl    $0,u+1672
    incl    n
    movl    u+8,%eax
    movl    %eax,u+1676
    incl    n
    movb    $0,u+1680
b37:    movl    $67,n
    cmpl    $0,u+1676
    je    f38
    incl    n
    incl    u+1672
    incl    n
    movl    u+1672,%eax
    cmpl    $100,%eax
    jle    f39
    cmpl    $0,%eax
    jge    f40
    pushl    n
    call    pttrap13
f40:f39:    shl    $2,%eax
    lea    u+1268,%ebx
    addl    %ebx,%eax
    movl    u+1676,%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+1676,%eax
    cmpl    $100,%eax
    jle    f41
    cmpl    $0,%eax
    jge    f42
    pushl    n
    call    pttrap13
f42:f41:    shl    $2,%eax
    lea    u+20,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    movl    %eax,u+1676
    jmp    f43
f38:    movl    $72,n
    cmpl    $0,u+1672
    jle    f44
    incl    n
    movl    u+1672,%eax
    cmpl    $100,%eax
    jle    f45
    cmpl    $0,%eax
    jge    f46
    pushl    n
    call    pttrap13
f46:f45:    shl    $2,%eax
    lea    u+1268,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    movl    %eax,u+1676
    incl    n
    decl    u+1672
    incl    n
    pushl    u+4
    movl    u+1676,%eax
    cmpl    $100,%eax
    jle    f47
    cmpl    $0,%eax
    jge    f48
    pushl    n
    call    pttrap13
f48:f47:    shl    $2,%eax
    lea    u+844,%ebx
    addl    %ebx,%eax
    pushl    (%eax)
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s502:    .asciz  " "
    .text    
    lea    s502,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    movl    u+1676,%eax
    cmpl    $100,%eax
    jle    f49
    cmpl    $0,%eax
    jge    f50
    pushl    n
    call    pttrap13
f50:f49:    shl    $2,%eax
    lea    u+432,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    movl    %eax,u+1676
    jmp    f51
f44:    movl    $78,n
    movb    $1,u+1680
f51:f43:    cmpb    $0,u+1680
    jne    f52
    jmp    b37
f52:    movl    $85,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    leave    
    ret    
f1:    movl    $93,n
    movl    $1,u+1688
b53:    movl    $95,n
    cmpl    $100,u+1688
    jg    f54
    incl    n
    movl    u+1688,%eax
    cmpl    $100,%eax
    jle    f55
    cmpl    $0,%eax
    jge    f56
    pushl    n
    call    pttrap13
f56:f55:    shl    $2,%eax
    lea    u+844,%ebx
    addl    %ebx,%eax
    movl    $0,(%eax)
    incl    n
    movl    u+1688,%eax
    cmpl    $100,%eax
    jle    f57
    cmpl    $0,%eax
    jge    f58
    pushl    n
    call    pttrap13
f58:f57:    shl    $2,%eax
    lea    u+20,%ebx
    addl    %ebx,%eax
    movl    $0,(%eax)
    incl    n
    movl    u+1688,%eax
    cmpl    $100,%eax
    jle    f59
    cmpl    $0,%eax
    jge    f60
    pushl    n
    call    pttrap13
f60:f59:    shl    $2,%eax
    lea    u+432,%ebx
    addl    %ebx,%eax
    movl    $0,(%eax)
    incl    n
    incl    u+1688
    jmp    b53
f54:    movl    $102,n
    movl    $1,u+1248
    incl    n
    movl    $0,u+8
    movl    $106,n
    pushl    u+4
    .data    
s669:    .asciz  "Type in some integers, please, ending with 0"
    .text    
    lea    s669,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $109,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
b61:    movl    $110,n
    pushl    u+0
    lea    u+1684,%eax
    pushl    %eax
    call    pttrap10
    addl    $8,%esp
    incl    n
    cmpl    $0,u+1684
    je    f62
    incl    n
    pushl    u+1684
    call    p54
    addl    $4,%esp
    movl    $113,n
f62:    movl    $113,n
    cmpl    $0,u+1684
    je    f63
    jmp    b61
f63:    movl    $119,n
    call    p340
    addl    $0,%esp
    movl    $119,n
    call    pttrap0
    leave    
    ret    
