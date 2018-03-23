    .data    
    .comm    u,1542
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $1,u+0
    movl    $2,u+4
    movl    $1,u+8
    movl    $7,u+12
    movl    $1,u+44
    movl    $7,u+48
    movl    $1,u+1144
    movl    $52,u+1148
    movl    $1,u+1364
    movl    $13,u+1368
    jmp    f1
p66:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1400
    movl    12(%ebp),%eax
    movl    %eax,u+1396
    movl    $52,n
    cmpl    $17,u+1392
    jne    f2
    incl    n
    movl    $19,u+1392
    jmp    f3
f2:    movl    $55,n
    movl    $17,u+1392
f3:    movl    $57,n
    movl    u+1388,%eax
    imull    u+1392,%eax
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
    movl    %eax,u+1388
    incl    n
    movl    u+1396,%eax
    movl    u+1400,%ebx
    movl    %ebx,%esi
    movl    u+1388,%ebx
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
p147:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $1,u+1408
    movl    $13,u+1412
    movl    $72,n
    movl    $1,u+1468
b4:    movl    $74,n
    movl    u+1468,%eax
    cmpl    $13,%eax
    jle    f5
    cmpl    $1,%eax
    jge    f6
    pushl    n
    call    pttrap13
f6:f5:    decl    %eax
    shl    $2,%eax
    lea    u+1416,%ebx
    addl    %ebx,%eax
    movl    $0,(%eax)
    incl    n
    incl    u+1468
    cmpl    $13,u+1468
    jg    f7
    jmp    b4
f7:    movl    $79,n
    movl    $1,u+1472
b8:    movl    $81,n
    lea    u+1404,%eax
    pushl    %eax
    pushl    $13
    call    p66
    addl    $8,%esp
    movl    $82,n
b9:    movl    $83,n
    movl    u+1404,%eax
    cmpl    $13,%eax
    jle    f10
    cmpl    $1,%eax
    jge    f11
    pushl    n
    call    pttrap13
f11:f10:    decl    %eax
    shl    $2,%eax
    lea    u+1416,%ebx
    addl    %ebx,%eax
    cmpl    $4,(%eax)
    jne    f12
    incl    n
    lea    u+1404,%eax
    pushl    %eax
    pushl    $13
    call    p66
    addl    $8,%esp
    movl    $85,n
    jmp    b9
f12:    movl    $87,n
    movl    u+1472,%eax
    cmpl    $52,%eax
    jle    f13
    cmpl    $1,%eax
    jge    f14
    pushl    n
    call    pttrap13
f14:f13:    decl    %eax
    shl    $2,%eax
    lea    u+1152,%ebx
    addl    %ebx,%eax
    movl    u+1404,%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+1404,%eax
    cmpl    $13,%eax
    jle    f15
    cmpl    $1,%eax
    jge    f16
    pushl    n
    call    pttrap13
f16:f15:    decl    %eax
    shl    $2,%eax
    lea    u+1416,%ebx
    addl    %ebx,%eax
    movl    u+1404,%ebx
    cmpl    $13,%ebx
    jle    f17
    cmpl    $1,%ebx
    jge    f18
    pushl    n
    call    pttrap13
f18:f17:    decl    %ebx
    shl    $2,%ebx
    lea    u+1416,%ecx
    addl    %ecx,%ebx
    movl    (%ebx),%ebx
    incl    %ebx
    movl    %ebx,(%eax)
    movl    $90,n
    incl    u+1472
    cmpl    $52,u+1472
    jg    f19
    jmp    b8
f19:    movl    $94,n
    movl    $0,u+1360
    leave    
    ret    
p350:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1476
    movl    $98,n
    incl    u+1360
    incl    n
    movl    u+1476,%eax
    movl    u+1360,%ebx
    cmpl    $52,%ebx
    jle    f20
    cmpl    $1,%ebx
    jge    f21
    pushl    n
    call    pttrap13
f21:f20:    decl    %ebx
    shl    $2,%ebx
    lea    u+1152,%ecx
    addl    %ecx,%ebx
    movl    (%ebx),%ebx
    movl    %ebx,(%eax)
    leave    
    ret    
p388:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1480
    movl    $103,n
    movl    u+1480,%eax
    movl    $52,%ebx
    subl    u+1360,%ebx
    incl    %ebx
    movl    %ebx,(%eax)
    leave    
    ret    
p415:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1488
    movl    12(%ebp),%eax
    movl    %eax,u+1484
    movl    $110,n
    movl    $1,u+1492
b22:    movl    $112,n
    movl    u+1484,%eax
    cmpl    %eax,u+1492
    jg    f23
    incl    n
    pushl    u+4
    .data    
s458:    .asciz  " "
    .text    
    lea    s458,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    movl    u+1488,%eax
    movl    u+1492,%ebx
    cmpl    4(%eax),%ebx
    jle    f24
    cmpl    (%eax),%ebx
    jge    f25
    pushl    n
    call    pttrap13
f25:f24:    subl    (%eax),%ebx
    shl    $2,%ebx
    addl    $8,%eax
    addl    %eax,%ebx
    movl    (%ebx),%ebx
    cmpl    $13,%ebx
    jle    f26
    cmpl    $1,%ebx
    jge    f27
    pushl    n
    call    pttrap13
f27:f26:    decl    %ebx
    shl    $10,%ebx
    lea    u+1372,%eax
    addl    %eax,%ebx
    pushl    %ebx
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    incl    u+1492
    jmp    b22
f23:    leave    
    ret    
p514:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $121,n
    .data    
s521:    .asciz  "e"
    .text    
    lea    s521,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+110,%eax
    pushl    %eax
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f28
    incl    n
    pushl    u+4
    .data    
s535:    .asciz  "E.O. Thorp"
    .text    
    lea    s535,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    jmp    f29
f28:    movl    $123,n
    .data    
s562:    .asciz  "j"
    .text    
    lea    s562,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+110,%eax
    pushl    %eax
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f30
    incl    n
    pushl    u+4
    .data    
s576:    .asciz  "Jim"
    .text    
    lea    s576,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    jmp    f31
f30:    movl    $126,n
    pushl    u+4
    .data    
s600:    .asciz  "Pooja"
    .text    
    lea    s600,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
f31:f29:    leave    
    ret    
p623:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1496
    movl    $135,n
    movl    $0,u+88
    incl    n
    movl    $0,u+92
    incl    n
    movl    $0,u+96
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s677:    .asciz  "New shuffle."
    .text    
    lea    s677,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s722:    .asciz  "Choose a player (e for E.O.Thorp, j for Jim, p for Pooja, q to quit): "
    .text    
    lea    s722,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    lea    u+110,%eax
    pushl    %eax
    call    pttrap108
    addl    $8,%esp
    movl    $144,n
    pushl    u+0
    call    pttrap4
    addl    $4,%esp
    .data    
s829:    .asciz  "q"
    .text    
    lea    s829,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+110,%eax
    pushl    %eax
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f32
    incl    n
    movl    u+1496,%eax
    movb    $0,(%eax)
    jmp    f33
f32:    movl    $147,n
    .data    
s854:    .asciz  "e"
    .text    
    lea    s854,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+110,%eax
    pushl    %eax
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    jne    f34
    incl    n
    pushl    u+4
    .data    
s869:    .asciz  "What does s/he stand on? "
    .text    
    lea    s869,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    lea    u+1136,%eax
    pushl    %eax
    call    pttrap10
    addl    $8,%esp
    incl    n
    pushl    u+0
    call    pttrap4
    addl    $4,%esp
b35:    movl    $151,n
    cmpl    $0,u+1136
    jle    f36
    movl    $21,%eax
    cmpl    u+1136,%eax
    jg    f37
f36:    incl    n
    pushl    u+4
    .data    
s956:    .asciz  "(1..20): "
    .text    
    lea    s956,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    lea    u+1136,%eax
    pushl    %eax
    call    pttrap10
    addl    $8,%esp
    incl    n
    pushl    u+0
    call    pttrap4
    addl    $4,%esp
    jmp    b35
f37:f34:    movl    $155,n
    movl    $157,n
    .data    
s1009:    .asciz  "e"
    .text    
    lea    s1009,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+110,%eax
    pushl    %eax
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f38
    movl    $159,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1032:    .asciz  "E.O.Thorp plays this time."
    .text    
    lea    s1032,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f39
f38:    movl    $161,n
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1093:    .asciz  "Next player is "
    .text    
    lea    s1093,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $164,n
    call    p514
    addl    $0,%esp
    movl    $164,n
    pushl    u+4
    .data    
s1130:    .asciz  "."
    .text    
    lea    s1130,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    .data    
s1155:    .asciz  "S/he stops at "
    .text    
    lea    s1155,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+1136
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s1196:    .asciz  "."
    .text    
    lea    s1196,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $167,n
    movl    $15,%eax
    cmpl    u+1136,%eax
    jle    f40
    incl    n
    pushl    u+4
    .data    
s1232:    .asciz  "(What a hamburger!)"
    .text    
    lea    s1232,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f41
f40:    movl    $170,n
    pushl    u+4
    .data    
s1277:    .asciz  "Good luck, "
    .text    
    lea    s1277,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $172,n
    call    p514
    addl    $0,%esp
    movl    $172,n
    pushl    u+4
    .data    
s1310:    .asciz  "."
    .text    
    lea    s1310,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f41:f39:    movl    $176,n
    movl    u+1496,%eax
    movb    $1,(%eax)
f33:    leave    
    ret    
p1350:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1500
    movl    $188,n
    lea    u+1504,%eax
    pushl    %eax
    call    p388
    addl    $4,%esp
    movl    $190,n
    cmpl    $10,u+1504
    jle    f42
    movl    $192,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1395:    .asciz  "New game."
    .text    
    lea    s1395,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    incl    u+88
    incl    n
    movl    u+1500,%eax
    movb    $1,(%eax)
    jmp    f43
f42:    movl    $196,n
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1462:    .asciz  "Too few cards left for another game."
    .text    
    lea    s1462,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    .data    
s1522:    .asciz  "Of "
    .text    
    lea    s1522,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+88
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s1552:    .asciz  " games, "
    .text    
    lea    s1552,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $200,n
    call    p514
    addl    $0,%esp
    movl    $200,n
    pushl    u+4
    .data    
s1582:    .asciz  " won "
    .text    
    lea    s1582,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+92
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s1614:    .asciz  ", dealer won "
    .text    
    lea    s1614,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+96
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s1654:    .asciz  "."
    .text    
    lea    s1654,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $202,n
    movl    u+92,%eax
    cmpl    %eax,u+96
    jle    f44
    incl    n
    pushl    u+4
    .data    
s1691:    .asciz  "House cleans up on "
    .text    
    lea    s1691,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $205,n
    call    p514
    addl    $0,%esp
    movl    $205,n
    pushl    u+4
    .data    
s1732:    .asciz  " this time."
    .text    
    lea    s1732,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f45
f44:    movl    $206,n
    movl    u+96,%eax
    cmpl    %eax,u+92
    jle    f46
    incl    n
    .data    
s1779:    .asciz  "e"
    .text    
    lea    s1779,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+110,%eax
    pushl    %eax
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f47
    incl    n
    pushl    u+4
    .data    
s1793:    .asciz  "E.O.Thorp does it again."
    .text    
    lea    s1793,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f48
f47:    movl    $210,n
    incl    n
    call    p514
    addl    $0,%esp
    movl    $211,n
    pushl    u+4
    .data    
s1848:    .asciz  " must have doctored the shuffle."
    .text    
    lea    s1848,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f48:    jmp    f49
f46:    movl    $214,n
    pushl    u+4
    .data    
s1909:    .asciz  "Even shuffle."
    .text    
    lea    s1909,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f49:f45:    movl    $217,n
    movl    u+1500,%eax
    movb    $0,(%eax)
f43:    leave    
    ret    
p1959:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $224,n
    incl    u+80
    incl    n
    movl    u+80,%eax
    cmpl    $7,%eax
    jle    f50
    cmpl    $1,%eax
    jge    f51
    pushl    n
    call    pttrap13
f51:f50:    decl    %eax
    shl    $2,%eax
    lea    u+16,%ebx
    addl    %ebx,%eax
    pushl    %eax
    call    p350
    addl    $4,%esp
    movl    $226,n
    leave    
    ret    
p1991:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $231,n
    incl    u+84
    incl    n
    movl    u+84,%eax
    cmpl    $7,%eax
    jle    f52
    cmpl    $1,%eax
    jge    f53
    pushl    n
    call    pttrap13
f53:f52:    decl    %eax
    shl    $2,%eax
    lea    u+52,%ebx
    addl    %ebx,%eax
    pushl    %eax
    call    p350
    addl    $4,%esp
    movl    $233,n
    leave    
    ret    
p2023:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $240,n
    movb    $0,u+109
    incl    n
    movb    $0,u+108
    incl    n
    movl    $0,u+80
    incl    n
    movl    $0,u+84
    movl    $246,n
    call    p1959
    addl    $0,%esp
    movl    $246,n
    incl    n
    call    p1991
    addl    $0,%esp
    movl    $247,n
    incl    n
    call    p1959
    addl    $0,%esp
    movl    $248,n
    movl    $250,n
    call    p1991
    addl    $0,%esp
    movl    $250,n
    pushl    u+4
    .data    
s2084:    .asciz  "The initial deal gives "
    .text    
    lea    s2084,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $252,n
    call    p514
    addl    $0,%esp
    movl    $252,n
    pushl    u+4
    .data    
s2129:    .asciz  " :"
    .text    
    lea    s2129,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+80
    lea    u+8,%eax
    pushl    %eax
    call    p415
    addl    $8,%esp
    movl    $253,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    .data    
s2168:    .asciz  "  and the dealer :"
    .text    
    lea    s2168,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+84
    lea    u+44,%eax
    pushl    %eax
    call    p415
    addl    $8,%esp
    movl    $256,n
    pushl    u+4
    .data    
s2216:    .asciz  "."
    .text    
    lea    s2216,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    leave    
    ret    
p2238:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1520
    movl    12(%ebp),%eax
    movl    %eax,u+1516
    movl    16(%ebp),%eax
    movl    %eax,u+1512
    movl    20(%ebp),%eax
    movl    %eax,u+1508
    movl    $268,n
    movl    u+1520,%eax
    movl    $0,(%eax)
    incl    n
    movl    $0,u+1524
    movl    $271,n
    movl    $1,u+1528
b54:    movl    $273,n
    movl    u+1508,%eax
    cmpl    %eax,u+1528
    jg    f55
    movl    $275,n
    movl    u+1512,%eax
    movl    u+1528,%ebx
    cmpl    4(%eax),%ebx
    jle    f56
    cmpl    (%eax),%ebx
    jge    f57
    pushl    n
    call    pttrap13
f57:f56:    subl    (%eax),%ebx
    shl    $2,%ebx
    addl    $8,%eax
    addl    %eax,%ebx
    jmp    f58
v2308:    movl    $275,n
    movl    $278,n
    movl    u+1520,%eax
    movl    u+1520,%ebx
    movl    u+1512,%ecx
    movl    u+1528,%edx
    cmpl    4(%ecx),%edx
    jle    f59
    cmpl    (%ecx),%edx
    jge    f60
    pushl    n
    call    pttrap13
f60:f59:    subl    (%ecx),%edx
    shl    $2,%edx
    addl    $8,%ecx
    addl    %ecx,%edx
    movl    (%edx),%edx
    addl    (%ebx),%edx
    movl    %edx,(%eax)
    jmp    m2298
v2333:    movl    $279,n
    movl    $281,n
    movl    u+1520,%eax
    movl    u+1520,%ebx
    movl    $11,%ecx
    addl    (%ebx),%ecx
    movl    %ecx,(%eax)
    incl    n
    incl    u+1524
    jmp    m2298
a2298:b61:    movl    $283,n
    movl    $283,n
    movl    $285,n
    movl    u+1520,%eax
    movl    u+1520,%ebx
    movl    $10,%ecx
    addl    (%ebx),%ecx
    movl    %ecx,(%eax)
    jmp    m2298
f58:    movl    (%ebx),%ebx
    decl    %ebx
    cmpl    $9,%ebx
    ja    b61
    shl    $2,%ebx
    movl    c2298(%ebx),%ebx
    jmp    *%ebx
    .data    
c2298:    .long    v2333
    .long    v2308
    .long    v2308
    .long    v2308
    .long    v2308
    .long    v2308
    .long    v2308
    .long    v2308
    .long    v2308
    .long    v2308
    .text    
m2298:    movl    $286,n
    movl    $288,n
    incl    u+1528
    jmp    b54
f55:b62:    movl    $292,n
    movl    u+1520,%eax
    cmpl    $21,(%eax)
    jle    f63
    cmpl    $0,u+1524
    je    f64
    incl    n
    movl    u+1520,%eax
    movl    u+1520,%ebx
    movl    (%ebx),%ebx
    subl    $10,%ebx
    movl    %ebx,(%eax)
    incl    n
    decl    u+1524
    jmp    b62
f64:f63:    movl    $297,n
    movl    u+1516,%eax
    cmpl    $0,u+1524
    jle    f65
    movb    $1,%bl
    jmp    f66
f65:    movb    $0,%bl
f66:    movb    %bl,(%eax)
    leave    
    ret    
p2483:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $308,n
    pushl    u+84
    lea    u+44,%eax
    pushl    %eax
    lea    u+1532,%eax
    pushl    %eax
    lea    u+100,%eax
    pushl    %eax
    call    p2238
    addl    $16,%esp
    movl    $310,n
    cmpl    $21,u+100
    jle    f67
    incl    n
    pushl    u+4
    .data    
s2526:    .asciz  "Dealer goes bust."
    .text    
    lea    s2526,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movb    $1,u+108
    incl    n
    incl    u+92
    jmp    f68
f67:    movl    $314,n
    cmpl    $21,u+100
    jne    f69
    incl    n
    pushl    u+4
    .data    
s2600:    .asciz  "Dealer calls blackjack."
    .text    
    lea    s2600,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    movb    $1,u+108
    incl    n
    incl    u+96
    jmp    f70
f69:    movl    $319,n
    movl    $17,%eax
    cmpl    u+100,%eax
    jle    f71
    movl    $321,n
    call    p1991
    addl    $0,%esp
    movl    $321,n
    jmp    f72
f71:    movl    $322,n
    movb    $1,u+108
f72:f70:f68:    movl    $326,n
    cmpb    $0,u+108
    je    f73
    incl    n
    pushl    u+4
    .data    
s2714:    .asciz  "Dealer stands with "
    .text    
    lea    s2714,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+100
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s2760:    .asciz  "."
    .text    
    lea    s2760,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $329,n
    movl    u+104,%eax
    cmpl    %eax,u+100
    jle    f74
    incl    n
    pushl    u+4
    .data    
s2797:    .asciz  "House wins."
    .text    
    lea    s2797,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    incl    u+96
    jmp    f75
f74:    movl    $332,n
    movl    u+100,%eax
    cmpl    %eax,u+104
    jle    f76
    movl    $334,n
    call    p514
    addl    $0,%esp
    movl    $334,n
    pushl    u+4
    .data    
s2863:    .asciz  " wins."
    .text    
    lea    s2863,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    u+92
    jmp    f77
f76:    movl    $337,n
    pushl    u+4
    .data    
s2909:    .asciz  "Tie game."
    .text    
    lea    s2909,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f77:f75:    jmp    f78
f73:    movl    $341,n
    pushl    u+4
    .data    
s2948:    .asciz  "Dealer takes a card and now has "
    .text    
    lea    s2948,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+84
    lea    u+44,%eax
    pushl    %eax
    call    p415
    addl    $8,%esp
    movl    $342,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f78:    leave    
    ret    
p3017:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $350,n
    movl    u+104,%eax
    cmpl    %eax,u+1136
    jle    f79
    movl    $352,n
    call    p1959
    addl    $0,%esp
    movl    $352,n
    jmp    f80
f79:    movl    $353,n
    movb    $1,u+109
f80:    leave    
    ret    
p3055:    pushl   %ebp
        movl    %esp, %ebp    
    movb    8(%ebp),%al
    movb    %al,u+1533
    movl    $363,n
    movl    u+52,%eax
    movl    %eax,u+1536
    movl    $365,n
    cmpb    $0,u+1533
    je    f81
    movl    $367,n
    cmpl    $8,u+1536
    jle    f82
    movl    $369,n
    cmpl    $18,u+104
    jle    f83
    movb    $1,%al
    jmp    f84
f83:    movb    $0,%al
f84:    movb    %al,u+109
    jmp    f85
f82:    movl    $372,n
    cmpl    $17,u+104
    jle    f86
    movb    $1,%al
    jmp    f87
f86:    movb    $0,%al
f87:    movb    %al,u+109
f85:    jmp    f88
f81:    movl    $376,n
    cmpl    $1,u+1536
    jle    f89
    movl    $4,%eax
    cmpl    u+1536,%eax
    jle    f90
    movl    $378,n
    cmpl    $12,u+104
    jle    f91
    movb    $1,%al
    jmp    f92
f91:    movb    $0,%al
f92:    movb    %al,u+109
    jmp    f93
f90:f89:    movl    $379,n
    cmpl    $3,u+1536
    jle    f94
    movl    $7,%eax
    cmpl    u+1536,%eax
    jle    f95
    movl    $381,n
    cmpl    $11,u+104
    jle    f96
    movb    $1,%al
    jmp    f97
f96:    movb    $0,%al
f97:    movb    %al,u+109
    jmp    f98
f95:f94:    movl    $384,n
    cmpl    $16,u+104
    jle    f99
    movb    $1,%al
    jmp    f100
f99:    movb    $0,%al
f100:    movb    %al,u+109
f98:f93:f88:    movl    $388,n
    cmpb    $0,u+109
    jne    f101
    movl    $390,n
    call    p1959
    addl    $0,%esp
    movl    $390,n
f101:    movl    $390,n
    leave    
    ret    
p3237:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $402,n
    pushl    u+80
    lea    u+8,%eax
    pushl    %eax
    lea    u+1540,%eax
    pushl    %eax
    lea    u+104,%eax
    pushl    %eax
    call    p2238
    addl    $16,%esp
    movl    $404,n
    cmpl    $21,u+104
    jne    f102
    movl    $406,n
    call    p514
    addl    $0,%esp
    movl    $406,n
    pushl    u+4
    .data    
s3285:    .asciz  " calls blackjack."
    .text    
    lea    s3285,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movb    $1,u+109
    incl    n
    movb    $1,u+108
    incl    n
    incl    u+92
    jmp    f103
f102:    movl    $410,n
    cmpl    $21,u+104
    jle    f104
    movl    $412,n
    call    p514
    addl    $0,%esp
    movl    $412,n
    pushl    u+4
    .data    
s3372:    .asciz  " goes bust."
    .text    
    lea    s3372,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movb    $1,u+109
    incl    n
    movb    $1,u+108
    incl    n
    incl    u+96
    jmp    f105
f104:    movl    $417,n
    .data    
s3437:    .asciz  "e"
    .text    
    lea    s3437,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+110,%eax
    pushl    %eax
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f106
    incl    n
    movb    u+1540,%al
    pushl    %eax
    call    p3055
    addl    $4,%esp
    movl    $419,n
    jmp    f107
f106:    movl    $420,n
    incl    n
    call    p3017
    addl    $0,%esp
    movl    $421,n
f107:f105:f103:    movl    $424,n
    cmpb    $0,u+109
    je    f108
    movl    $426,n
    call    p514
    addl    $0,%esp
    movl    $426,n
    pushl    u+4
    .data    
s3489:    .asciz  " stands with "
    .text    
    lea    s3489,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    pushl    u+104
    pushl    $1
    call    pttrap8
    addl    $12,%esp
    pushl    u+4
    .data    
s3529:    .asciz  "."
    .text    
    lea    s3529,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f109
f108:    movl    $428,n
    incl    n
    call    p514
    addl    $0,%esp
    movl    $429,n
    pushl    u+4
    .data    
s3561:    .asciz  " takes a card and now has "
    .text    
    lea    s3561,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+80
    lea    u+8,%eax
    pushl    %eax
    call    p415
    addl    $8,%esp
    movl    $430,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f109:    leave    
    ret    
f1:    movl    $439,n
    pushl    u+4
    .data    
s3630:    .asciz  "This program simulates the game of blackjack."
    .text    
    lea    s3630,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s3708:    .asciz  "The dealer plays the compulsory strategy of standing on 17 or better."
    .text    
    lea    s3708,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s3810:    .asciz  "The player plays either"
    .text    
    lea    s3810,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s3857:    .asciz  "  [1] The standard naive strategy of standing on n or better, or"
    .text    
    lea    s3857,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s3945:    .asciz  "  [2] A simplified version of the strategy described by  E.O.Thorp"
    .text    
    lea    s3945,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s4035:    .asciz  "      in his book \"Beat the Dealer\" (Vintage Books, 1966) pp. 20-21."
    .text    
    lea    s4035,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s4136:    .asciz  "Input :"
    .text    
    lea    s4136,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s4167:    .asciz  "  For each shuffle, a player name (character string of <= 20 characters),"
    .text    
    lea    s4167,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s4264:    .asciz  "  and if (the player name specified is not \"E.O.Thorp\", the count [n]"
    .text    
    lea    s4264,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s4357:    .asciz  "  on which the player stands."
    .text    
    lea    s4357,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s4419:    .asciz  "If the player name specified is \"E.O.Thorp\", the player strategy used"
    .text    
    lea    s4419,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    .data    
s4501:    .asciz  " will be Thorp's."
    .text    
    lea    s4501,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $455,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s4544:    .asciz  "Otherwise, the player will use the standard stop on count > n strategy."
    .text    
    lea    s4544,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s4648:    .asciz  "The program will simulate one complete shuffle of play for each player."
    .text    
    lea    s4648,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $460,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $13277,u+1388
    incl    n
    movl    $17,u+1392
    movl    $464,n
    .data    
s4762:    .asciz  "A"
    .text    
    lea    s4762,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+1372,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4775:    .asciz  "2"
    .text    
    lea    s4775,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+2396,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4788:    .asciz  "3"
    .text    
    lea    s4788,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+3420,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4801:    .asciz  "4"
    .text    
    lea    s4801,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+4444,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4814:    .asciz  "5"
    .text    
    lea    s4814,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+5468,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4827:    .asciz  "6"
    .text    
    lea    s4827,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+6492,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4840:    .asciz  "7"
    .text    
    lea    s4840,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+7516,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4853:    .asciz  "8"
    .text    
    lea    s4853,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+8540,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4866:    .asciz  "9"
    .text    
    lea    s4866,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+9564,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4879:    .asciz  "10"
    .text    
    lea    s4879,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+10588,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4893:    .asciz  "J"
    .text    
    lea    s4893,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+11612,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4906:    .asciz  "Q"
    .text    
    lea    s4906,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+12636,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s4919:    .asciz  "K"
    .text    
    lea    s4919,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+13660,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    $479,n
    lea    u+1140,%eax
    pushl    %eax
    call    p623
    addl    $4,%esp
    movl    $481,n
b110:    movl    $482,n
    cmpb    $0,u+1140
    je    f111
    movl    $484,n
    call    p147
    addl    $0,%esp
    movl    $484,n
    lea    u+1140,%eax
    pushl    %eax
    call    p1350
    addl    $4,%esp
    movl    $486,n
b112:    movl    $487,n
    cmpb    $0,u+1140
    je    f113
    movl    $490,n
    call    p2023
    addl    $0,%esp
    movl    $490,n
b114:    movl    $491,n
    cmpb    $0,u+109
    jne    f115
    movl    $493,n
    call    p3237
    addl    $0,%esp
    movl    $493,n
    jmp    b114
f115:b116:    movl    $496,n
    cmpb    $0,u+108
    jne    f117
    movl    $498,n
    call    p2483
    addl    $0,%esp
    movl    $498,n
    jmp    b116
f117:    movl    $500,n
    lea    u+1140,%eax
    pushl    %eax
    call    p1350
    addl    $4,%esp
    movl    $501,n
    jmp    b112
f113:    movl    $503,n
    lea    u+1140,%eax
    pushl    %eax
    call    p623
    addl    $4,%esp
    movl    $504,n
    jmp    b110
f111:    incl    n
    call    pttrap0
    leave    
    ret    
