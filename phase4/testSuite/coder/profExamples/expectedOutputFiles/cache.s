    .data    
    .comm    u,4252
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $1,u+0
    movl    $2,u+4
    movl    $1,u+16
    movl    $1000,u+20
    movl    $1,u+4036
    movl    $10,u+4040
    movl    $1,u+4084
    movl    $10,u+4088
    jmp    f1
p54:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+4160
    movl    12(%ebp),%eax
    movl    %eax,u+4156
    movl    $41,n
    cmpl    $17,u+4032
    jne    f2
    incl    n
    movl    $19,u+4032
    jmp    f3
f2:    movl    $44,n
    movl    $17,u+4032
f3:    movl    $46,n
    movl    u+4028,%eax
    imull    u+4032,%eax
    movl    $10000,%esi
    movl    %eax,%edi
    pushl    %eax
    pushl    %edx
    movl    %edi,%edx
    movl    %edx,%eax
    sarl        $31,    %edx
    idivl    %esi
    movl    %edx,%esi
    popl    %edx
    popl    %eax
    movl    %esi,%eax
    movl    %eax,u+4028
    incl    n
    movl    u+4156,%eax
    movl    u+4160,%ebx
    movl    %ebx,%esi
    movl    u+4028,%ebx
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
    incl    %ebx
    movl    %ebx,(%eax)
    leave    
    ret    
p135:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $57,n
    movl    $1,u+4164
b4:    movl    $59,n
    movl    u+8,%eax
    cmpl    %eax,u+4164
    jg    f5
    incl    n
    lea    u+4168,%eax
    pushl    %eax
    pushl    $9000
    call    p54
    addl    $8,%esp
    movl    $61,n
    movl    $1000,%eax
    addl    %eax,u+4168
    incl    n
    movl    u+4164,%eax
    cmpl    $1000,%eax
    jle    f6
    cmpl    $1,%eax
    jge    f7
    pushl    n
    call    pttrap13
f7:f6:    decl    %eax
    shl    $2,%eax
    lea    u+24,%ebx
    addl    %ebx,%eax
    movl    u+4168,%ebx
    movl    %ebx,(%eax)
    incl    n
    incl    u+4164
    jmp    b4
f5:    leave    
    ret    
p221:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+4172
    movl    $74,n
    lea    u+4176,%eax
    pushl    %eax
    pushl    u+8
    call    p54
    addl    $8,%esp
    movl    $75,n
    movl    u+4172,%eax
    movl    u+4176,%ebx
    cmpl    $1000,%ebx
    jle    f8
    cmpl    $1,%ebx
    jge    f9
    pushl    n
    call    pttrap13
f9:f8:    decl    %ebx
    shl    $2,%ebx
    lea    u+24,%ecx
    addl    %ecx,%ebx
    movl    (%ebx),%ebx
    movl    %ebx,(%eax)
    leave    
    ret    
p262:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+4184
    movl    12(%ebp),%eax
    movl    %eax,u+4180
    movl    $83,n
    movl    $1,u+4188
    incl    n
    movl    u+4184,%eax
    movl    $0,(%eax)
b10:    movl    $86,n
    movl    u+8,%eax
    cmpl    %eax,u+4188
    jg    f11
    movl    u+4184,%eax
    cmpl    $0,(%eax)
    jne    f12
    incl    n
    incl    u+4024
    incl    n
    movl    u+4188,%eax
    cmpl    $1000,%eax
    jle    f13
    cmpl    $1,%eax
    jge    f14
    pushl    n
    call    pttrap13
f14:f13:    decl    %eax
    shl    $2,%eax
    lea    u+24,%ebx
    addl    %ebx,%eax
    movl    u+4180,%ebx
    cmpl    %ebx,(%eax)
    jne    f15
    incl    n
    movl    u+4184,%eax
    movl    u+4188,%ebx
    movl    %ebx,(%eax)
f15:    movl    $90,n
    incl    n
    incl    u+4188
    jmp    b10
f12:f11:    leave    
    ret    
p378:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+4196
    movl    12(%ebp),%eax
    movl    %eax,u+4192
    movl    $105,n
    movl    $1,u+4204
    incl    n
    movl    $0,u+4196
b16:    movl    $108,n
    cmpl    $10,u+4204
    jg    f17
    cmpl    $0,u+4196
    jne    f18
    incl    n
    incl    u+4024
    incl    n
    movl    u+4204,%eax
    cmpl    $10,%eax
    jle    f19
    cmpl    $1,%eax
    jge    f20
    pushl    n
    call    pttrap13
f20:f19:    decl    %eax
    shl    $2,%eax
    lea    u+4044,%ebx
    addl    %ebx,%eax
    movl    u+4192,%ebx
    cmpl    %ebx,(%eax)
    jne    f21
    incl    n
    movl    u+4204,%eax
    cmpl    $10,%eax
    jle    f22
    cmpl    $1,%eax
    jge    f23
    pushl    n
    call    pttrap13
f23:f22:    decl    %eax
    shl    $2,%eax
    lea    u+4092,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    movl    %eax,u+4196
f21:    movl    $112,n
    incl    n
    incl    u+4204
    jmp    b16
f18:f17:    movl    $115,n
    movl    $1,u+4200
b24:    movl    $117,n
    cmpl    $10,u+4204
    jg    f25
    cmpl    $0,u+4196
    jne    f26
    incl    n
    incl    u+4024
    incl    n
    movl    u+4200,%eax
    cmpl    $1000,%eax
    jle    f27
    cmpl    $1,%eax
    jge    f28
    pushl    n
    call    pttrap13
f28:f27:    decl    %eax
    shl    $2,%eax
    lea    u+24,%ebx
    addl    %ebx,%eax
    movl    u+4192,%ebx
    cmpl    %ebx,(%eax)
    jne    f29
    movl    $121,n
    incl    u+4132
    incl    n
    cmpl    $10,u+4132
    jle    f30
    incl    n
    movl    $1,u+4132
f30:    movl    $124,n
    incl    n
    movl    u+4132,%eax
    cmpl    $10,%eax
    jle    f31
    cmpl    $1,%eax
    jge    f32
    pushl    n
    call    pttrap13
f32:f31:    decl    %eax
    shl    $2,%eax
    lea    u+4044,%ebx
    addl    %ebx,%eax
    movl    u+4192,%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+4132,%eax
    cmpl    $10,%eax
    jle    f33
    cmpl    $1,%eax
    jge    f34
    pushl    n
    call    pttrap13
f34:f33:    decl    %eax
    shl    $2,%eax
    lea    u+4092,%ebx
    addl    %ebx,%eax
    movl    u+4200,%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+4200,%eax
    movl    %eax,u+4196
f29:    movl    $128,n
    incl    n
    incl    u+4200
    jmp    b24
f26:f25:    leave    
    ret    
p645:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+4212
    movl    12(%ebp),%eax
    movl    %eax,u+4208
    movl    $140,n
    movl    u+4208,%eax
    cmpl    $1000,%eax
    jle    f35
    cmpl    $1,%eax
    jge    f36
    pushl    n
    call    pttrap13
f36:f35:    decl    %eax
    shl    $2,%eax
    lea    u+24,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    movl    %eax,u+4216
    incl    n
    movl    u+4208,%eax
    cmpl    $1000,%eax
    jle    f37
    cmpl    $1,%eax
    jge    f38
    pushl    n
    call    pttrap13
f38:f37:    decl    %eax
    shl    $2,%eax
    lea    u+24,%ebx
    addl    %ebx,%eax
    movl    u+4212,%ebx
    cmpl    $1000,%ebx
    jle    f39
    cmpl    $1,%ebx
    jge    f40
    pushl    n
    call    pttrap13
f40:f39:    decl    %ebx
    shl    $2,%ebx
    lea    u+24,%ecx
    addl    %ecx,%ebx
    movl    (%ebx),%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+4212,%eax
    cmpl    $1000,%eax
    jle    f41
    cmpl    $1,%eax
    jge    f42
    pushl    n
    call    pttrap13
f42:f41:    decl    %eax
    shl    $2,%eax
    lea    u+24,%ebx
    addl    %ebx,%eax
    movl    u+4216,%ebx
    movl    %ebx,(%eax)
    leave    
    ret    
p708:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $149,n
    movl    u+8,%eax
    movl    %eax,u+4220
    incl    n
    movl    $1,u+4228
b43:    movl    $152,n
    cmpl    $1,u+4220
    jle    f44
    cmpl    $0,u+4228
    je    f45
    incl    n
    movl    $0,u+4228
    incl    n
    movl    $1,u+4224
b46:    movl    $156,n
    movl    u+4224,%eax
    cmpl    %eax,u+4220
    jle    f47
    incl    n
    incl    u+4024
    incl    n
    movl    u+4224,%eax
    cmpl    $1000,%eax
    jle    f48
    cmpl    $1,%eax
    jge    f49
    pushl    n
    call    pttrap13
f49:f48:    decl    %eax
    shl    $2,%eax
    lea    u+24,%ebx
    addl    %ebx,%eax
    movl    u+4224,%ebx
    incl    %ebx
    cmpl    $1000,%ebx
    jle    f50
    cmpl    $1,%ebx
    jge    f51
    pushl    n
    call    pttrap13
f51:f50:    decl    %ebx
    shl    $2,%ebx
    lea    u+24,%ecx
    addl    %ecx,%ebx
    movl    (%ebx),%ebx
    cmpl    %ebx,(%eax)
    jle    f52
    incl    n
    incl    u+4228
    incl    n
    pushl    u+4224
    movl    u+4224,%eax
    incl    %eax
    pushl    %eax
    call    p645
    addl    $8,%esp
    movl    $161,n
f52:    movl    $161,n
    incl    n
    incl    u+4224
    jmp    b46
f47:    movl    $164,n
    decl    u+4220
    jmp    b43
f45:f44:    leave    
    ret    
p888:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+4236
    movl    12(%ebp),%eax
    movl    %eax,u+4232
    movl    $174,n
    movl    $1,u+4240
    incl    n
    movl    u+8,%eax
    movl    %eax,u+4244
b53:    movl    $177,n
    movl    u+4244,%eax
    cmpl    %eax,u+4240
    je    f54
    incl    n
    movl    u+4244,%eax
    addl    u+4240,%eax
    movl    $2,%esi
    movl    %eax,%edi
    pushl    %eax
    pushl    %edx
    movl    %edi,%edx
    movl    %edx,%eax
    sarl        $31,    %edx
    idivl    %esi
    movl    %eax,%esi
    popl    %edx
    popl    %eax
    movl    %esi,%eax
    movl    %eax,u+4248
    incl    n
    incl    u+4024
    incl    n
    movl    u+4248,%eax
    cmpl    $1000,%eax
    jle    f55
    cmpl    $1,%eax
    jge    f56
    pushl    n
    call    pttrap13
f56:f55:    decl    %eax
    shl    $2,%eax
    lea    u+24,%ebx
    addl    %ebx,%eax
    movl    (%eax),%eax
    cmpl    %eax,u+4232
    jle    f57
    incl    n
    movl    u+4248,%eax
    incl    %eax
    movl    %eax,u+4240
    jmp    f58
f57:    movl    $183,n
    movl    u+4248,%eax
    movl    %eax,u+4244
f58:    jmp    b53
f54:    movl    $186,n
    incl    u+4024
    incl    n
    movl    u+4240,%eax
    cmpl    $1000,%eax
    jle    f59
    cmpl    $1,%eax
    jge    f60
    pushl    n
    call    pttrap13
f60:f59:    decl    %eax
    shl    $2,%eax
    lea    u+24,%ebx
    addl    %ebx,%eax
    movl    u+4232,%ebx
    cmpl    %ebx,(%eax)
    jne    f61
    incl    n
    movl    u+4240,%eax
    movl    %eax,u+4236
    jmp    f62
f61:    movl    $190,n
    movl    $0,u+4236
f62:    leave    
    ret    
f1:    movl    $199,n
    movl    $13277,u+4028
    incl    n
    movl    $17,u+4032
    movl    $203,n
    pushl    u+4
    .data    
s1089:    .asciz  "Enter N (number of elements, at most 1000, e.g. 100): "
    .text    
    lea    s1089,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    lea    u+8,%eax
    pushl    %eax
    call    pttrap10
    addl    $8,%esp
    incl    n
    pushl    u+4
    .data    
s1175:    .asciz  "Enter M (number of lookups, e.g. 1000): "
    .text    
    lea    s1175,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    lea    u+12,%eax
    pushl    %eax
    call    pttrap10
    addl    $8,%esp
    incl    n
    pushl    u+4
    .data    
s1247:    .asciz  "Enter a prime number (e.g. 13, 19, 51, ...): "
    .text    
    lea    s1247,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    lea    u+4032,%eax
    pushl    %eax
    call    pttrap10
    addl    $8,%esp
    movl    $213,n
    call    p135
    addl    $0,%esp
    movl    $213,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1336:    .asciz  "Linear lookup"
    .text    
    lea    s1336,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $0,u+4024
    movl    $216,n
    movl    $1,u+4136
b63:    movl    $218,n
    movl    u+12,%eax
    cmpl    %eax,u+4136
    jg    f64
    incl    n
    lea    u+4140,%eax
    pushl    %eax
    call    p221
    addl    $4,%esp
    movl    $220,n
    pushl    u+4140
    lea    u+4148,%eax
    pushl    %eax
    call    p262
    addl    $8,%esp
    movl    $221,n
    incl    u+4136
    jmp    b63
f64:    movl    $224,n
    movl    u+12,%eax
    movl    %eax,%esi
    movl    u+4024,%eax
    movl    %eax,%edi
    pushl    %eax
    pushl    %edx
    movl    %edi,%edx
    movl    %edx,%eax
    sarl        $31,    %edx
    idivl    %esi
    movl    %eax,%esi
    popl    %edx
    popl    %eax
    movl    %esi,%eax
    movl    %eax,u+4152
    incl    n
    pushl    u+4
    .data    
s1456:    .asciz  "N = "
    .text    
    lea    s1456,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+8
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s1487:    .asciz  "  Average compares per search (Cavg) == "
    .text    
    lea    s1487,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+4152
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    movl    $229,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1572:    .asciz  "Linear lookup with cache"
    .text    
    lea    s1572,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $0,u+4024
    movl    $233,n
    movl    $0,u+4132
    incl    n
    movl    $1,u+4144
b65:    movl    $236,n
    cmpl    $10,u+4144
    jg    f66
    incl    n
    movl    u+4144,%eax
    cmpl    $10,%eax
    jle    f67
    cmpl    $1,%eax
    jge    f68
    pushl    n
    call    pttrap13
f68:f67:    decl    %eax
    shl    $2,%eax
    lea    u+4044,%ebx
    addl    %ebx,%eax
    movl    $0,(%eax)
    incl    n
    incl    u+4144
    jmp    b65
f66:    movl    $241,n
    movl    $1,u+4136
b69:    movl    $243,n
    movl    u+12,%eax
    cmpl    %eax,u+4136
    jg    f70
    incl    n
    lea    u+4140,%eax
    pushl    %eax
    call    p221
    addl    $4,%esp
    movl    $245,n
    pushl    u+4140
    lea    u+4148,%eax
    pushl    %eax
    call    p262
    addl    $8,%esp
    movl    $246,n
    incl    u+4136
    jmp    b69
f70:    movl    $249,n
    movl    u+12,%eax
    movl    %eax,%esi
    movl    u+4024,%eax
    movl    %eax,%edi
    pushl    %eax
    pushl    %edx
    movl    %edi,%edx
    movl    %edx,%eax
    sarl        $31,    %edx
    idivl    %esi
    movl    %eax,%esi
    popl    %edx
    popl    %eax
    movl    %esi,%eax
    movl    %eax,u+4152
    incl    n
    pushl    u+4
    .data    
s1763:    .asciz  "N = "
    .text    
    lea    s1763,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+8
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s1794:    .asciz  "  Average compares per search (Cavg) == "
    .text    
    lea    s1794,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+4152
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    movl    $254,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1879:    .asciz  "Binary search"
    .text    
    lea    s1879,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $0,u+4024
    movl    $260,n
    call    p708
    addl    $0,%esp
    movl    $260,n
    movl    $1,u+4136
b71:    movl    $262,n
    movl    u+12,%eax
    cmpl    %eax,u+4136
    jg    f72
    incl    n
    lea    u+4140,%eax
    pushl    %eax
    call    p221
    addl    $4,%esp
    movl    $264,n
    pushl    u+4140
    pushl    u+4148
    call    p888
    addl    $8,%esp
    movl    $265,n
    incl    u+4136
    jmp    b71
f72:    movl    $268,n
    movl    u+12,%eax
    movl    %eax,%esi
    movl    u+4024,%eax
    movl    %eax,%edi
    pushl    %eax
    pushl    %edx
    movl    %edi,%edx
    movl    %edx,%eax
    sarl        $31,    %edx
    idivl    %esi
    movl    %eax,%esi
    popl    %edx
    popl    %eax
    movl    %esi,%eax
    movl    %eax,u+4152
    incl    n
    pushl    u+4
    .data    
s2004:    .asciz  "N = "
    .text    
    lea    s2004,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+8
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s2035:    .asciz  "  Average compares per search (Cavg) == "
    .text    
    lea    s2035,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+4152
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    movl    $271,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    call    pttrap0
    leave    
    ret    
