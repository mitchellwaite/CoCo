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
    jmp    f1
p42:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $47,n
    movl    $13277,u+1144
    incl    n
    movl    $17,u+1148
    leave    
    ret    
p64:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1156
    movl    12(%ebp),%eax
    movl    %eax,u+1152
    movl    $52,n
    cmpl    $17,u+1148
    jne    f2
    incl    n
    movl    $19,u+1148
    jmp    f3
f2:    movl    $55,n
    movl    $17,u+1148
f3:    movl    $57,n
    movl    u+1144,%eax
    imull    u+1148,%eax
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
    movl    %eax,u+1144
    incl    n
    movl    u+1152,%eax
    movl    u+1156,%ebx
    movl    %ebx,%esi
    movl    u+1144,%ebx
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
f1:    movl    $62,n
    call    p42
    addl    $0,%esp
    movl    $62,n
    movl    $1,u+1160
    movl    $52,u+1164
    jmp    f4
p162:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $1,u+1384
    movl    $13,u+1388
    movl    $80,n
    movl    $1,u+1444
b5:    movl    $82,n
    movl    u+1444,%eax
    cmpl    $13,%eax
    jle    f6
    cmpl    $1,%eax
    jge    f7
    pushl    n
    call    pttrap13
f7:f6:    decl    %eax
    shl    $2,%eax
    lea    u+1392,%ebx
    addl    %ebx,%eax
    movl    $0,(%eax)
    incl    n
    incl    u+1444
    cmpl    $13,u+1444
    jg    f8
    jmp    b5
f8:    movl    $87,n
    movl    $1,u+1448
b9:    movl    $89,n
    lea    u+1380,%eax
    pushl    %eax
    pushl    $13
    call    p64
    addl    $8,%esp
    movl    $90,n
b10:    movl    $91,n
    movl    u+1380,%eax
    cmpl    $13,%eax
    jle    f11
    cmpl    $1,%eax
    jge    f12
    pushl    n
    call    pttrap13
f12:f11:    decl    %eax
    shl    $2,%eax
    lea    u+1392,%ebx
    addl    %ebx,%eax
    cmpl    $4,(%eax)
    jne    f13
    incl    n
    lea    u+1380,%eax
    pushl    %eax
    pushl    $13
    call    p64
    addl    $8,%esp
    movl    $93,n
    jmp    b10
f13:    movl    $95,n
    movl    u+1448,%eax
    cmpl    $52,%eax
    jle    f14
    cmpl    $1,%eax
    jge    f15
    pushl    n
    call    pttrap13
f15:f14:    decl    %eax
    shl    $2,%eax
    lea    u+1168,%ebx
    addl    %ebx,%eax
    movl    u+1380,%ebx
    movl    %ebx,(%eax)
    incl    n
    movl    u+1380,%eax
    cmpl    $13,%eax
    jle    f16
    cmpl    $1,%eax
    jge    f17
    pushl    n
    call    pttrap13
f17:f16:    decl    %eax
    shl    $2,%eax
    lea    u+1392,%ebx
    addl    %ebx,%eax
    movl    u+1380,%ebx
    cmpl    $13,%ebx
    jle    f18
    cmpl    $1,%ebx
    jge    f19
    pushl    n
    call    pttrap13
f19:f18:    decl    %ebx
    shl    $2,%ebx
    lea    u+1392,%ecx
    addl    %ecx,%ebx
    movl    (%ebx),%ebx
    incl    %ebx
    movl    %ebx,(%eax)
    movl    $98,n
    incl    u+1448
    cmpl    $52,u+1448
    jg    f20
    jmp    b9
f20:    movl    $102,n
    movl    $0,u+1376
    leave    
    ret    
p365:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1452
    movl    $106,n
    incl    u+1376
    incl    n
    movl    u+1452,%eax
    movl    u+1376,%ebx
    cmpl    $52,%ebx
    jle    f21
    cmpl    $1,%ebx
    jge    f22
    pushl    n
    call    pttrap13
f22:f21:    decl    %ebx
    shl    $2,%ebx
    lea    u+1168,%ecx
    addl    %ecx,%ebx
    movl    (%ebx),%ebx
    movl    %ebx,(%eax)
    leave    
    ret    
p403:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1456
    movl    $111,n
    movl    u+1456,%eax
    movl    $52,%ebx
    subl    u+1376,%ebx
    incl    %ebx
    movl    %ebx,(%eax)
    leave    
    ret    
f4:    movl    $1,u+1460
    movl    $13,u+1464
    jmp    f23
p440:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1488
    movl    12(%ebp),%eax
    movl    %eax,u+1484
    movl    $123,n
    movl    $1,u+1492
b24:    movl    $125,n
    movl    u+1484,%eax
    cmpl    %eax,u+1492
    jg    f25
    incl    n
    pushl    u+4
    .data    
s483:    .asciz  " "
    .text    
    lea    s483,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    movl    u+1488,%eax
    movl    u+1492,%ebx
    cmpl    4(%eax),%ebx
    jle    f26
    cmpl    (%eax),%ebx
    jge    f27
    pushl    n
    call    pttrap13
f27:f26:    subl    (%eax),%ebx
    shl    $2,%ebx
    addl    $8,%eax
    addl    %eax,%ebx
    movl    (%ebx),%ebx
    cmpl    $13,%ebx
    jle    f28
    cmpl    $1,%ebx
    jge    f29
    pushl    n
    call    pttrap13
f29:f28:    decl    %ebx
    shl    $10,%ebx
    lea    u+1468,%eax
    addl    %eax,%ebx
    pushl    %ebx
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    incl    u+1492
    jmp    b24
f25:    leave    
    ret    
f23:    movl    $132,n
    .data    
s548:    .asciz  "A"
    .text    
    lea    s548,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+1468,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s561:    .asciz  "2"
    .text    
    lea    s561,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+2492,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s574:    .asciz  "3"
    .text    
    lea    s574,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+3516,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s587:    .asciz  "4"
    .text    
    lea    s587,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+4540,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s600:    .asciz  "5"
    .text    
    lea    s600,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+5564,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s613:    .asciz  "6"
    .text    
    lea    s613,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+6588,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s626:    .asciz  "7"
    .text    
    lea    s626,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+7612,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s639:    .asciz  "8"
    .text    
    lea    s639,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+8636,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s652:    .asciz  "9"
    .text    
    lea    s652,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+9660,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s665:    .asciz  "10"
    .text    
    lea    s665,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+10684,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s679:    .asciz  "J"
    .text    
    lea    s679,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+11708,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s692:    .asciz  "Q"
    .text    
    lea    s692,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+12732,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s705:    .asciz  "K"
    .text    
    lea    s705,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+13756,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    jmp    f30
p711:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $150,n
    .data    
s718:    .asciz  "e"
    .text    
    lea    s718,%eax
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
    je    f31
    incl    n
    pushl    u+4
    .data    
s732:    .asciz  "E.O. Thorp"
    .text    
    lea    s732,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    jmp    f32
f31:    movl    $152,n
    .data    
s759:    .asciz  "j"
    .text    
    lea    s759,%eax
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
    je    f33
    incl    n
    pushl    u+4
    .data    
s773:    .asciz  "Jim"
    .text    
    lea    s773,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    jmp    f34
f33:    movl    $155,n
    pushl    u+4
    .data    
s797:    .asciz  "Pooja"
    .text    
    lea    s797,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
f34:f32:    leave    
    ret    
p820:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1496
    movl    $164,n
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
s874:    .asciz  "New shuffle."
    .text    
    lea    s874,%eax
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
s919:    .asciz  "Choose a player (e for E.O.Thorp, j for Jim, p for Pooja, q to quit): "
    .text    
    lea    s919,%eax
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
    movl    $173,n
    pushl    u+0
    call    pttrap4
    addl    $4,%esp
    .data    
s1026:    .asciz  "q"
    .text    
    lea    s1026,%eax
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
    je    f35
    incl    n
    movl    u+1496,%eax
    movb    $0,(%eax)
    jmp    f36
f35:    movl    $176,n
    .data    
s1051:    .asciz  "e"
    .text    
    lea    s1051,%eax
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
    jne    f37
    incl    n
    pushl    u+4
    .data    
s1066:    .asciz  "What does s/he stand on? "
    .text    
    lea    s1066,%eax
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
b38:    movl    $180,n
    cmpl    $0,u+1136
    jle    f39
    movl    $21,%eax
    cmpl    u+1136,%eax
    jg    f40
f39:    incl    n
    pushl    u+4
    .data    
s1153:    .asciz  "(1..20): "
    .text    
    lea    s1153,%eax
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
    jmp    b38
f40:f37:    movl    $184,n
    movl    $186,n
    .data    
s1206:    .asciz  "e"
    .text    
    lea    s1206,%eax
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
    je    f41
    movl    $188,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1229:    .asciz  "E.O.Thorp plays this time."
    .text    
    lea    s1229,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f42
f41:    movl    $190,n
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1292:    .asciz  "Next player is "
    .text    
    lea    s1292,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $193,n
    call    p711
    addl    $0,%esp
    movl    $193,n
    pushl    u+4
    .data    
s1329:    .asciz  "."
    .text    
    lea    s1329,%eax
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
s1354:    .asciz  "S/he stops at "
    .text    
    lea    s1354,%eax
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
s1395:    .asciz  "."
    .text    
    lea    s1395,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $196,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $15,%eax
    cmpl    u+1136,%eax
    jle    f43
    incl    n
    pushl    u+4
    .data    
s1431:    .asciz  "(What a hamburger!)"
    .text    
    lea    s1431,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f44
f43:    movl    $199,n
    pushl    u+4
    .data    
s1478:    .asciz  "Good luck, "
    .text    
    lea    s1478,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $201,n
    call    p711
    addl    $0,%esp
    movl    $201,n
    pushl    u+4
    .data    
s1511:    .asciz  "."
    .text    
    lea    s1511,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f44:f42:    movl    $205,n
    movl    u+1496,%eax
    movb    $1,(%eax)
f36:    leave    
    ret    
p1551:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1500
    movl    $217,n
    lea    u+1504,%eax
    pushl    %eax
    call    p403
    addl    $4,%esp
    movl    $219,n
    cmpl    $10,u+1504
    jle    f45
    movl    $221,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1596:    .asciz  "New game."
    .text    
    lea    s1596,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    u+88
    incl    n
    movl    u+1500,%eax
    movb    $1,(%eax)
    jmp    f46
f45:    movl    $225,n
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s1663:    .asciz  "Too few cards left for another game."
    .text    
    lea    s1663,%eax
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
s1723:    .asciz  "Of "
    .text    
    lea    s1723,%eax
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
s1753:    .asciz  " games, "
    .text    
    lea    s1753,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $229,n
    call    p711
    addl    $0,%esp
    movl    $229,n
    pushl    u+4
    .data    
s1783:    .asciz  " won "
    .text    
    lea    s1783,%eax
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
s1815:    .asciz  ", dealer won "
    .text    
    lea    s1815,%eax
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
s1855:    .asciz  "."
    .text    
    lea    s1855,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $231,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    u+92,%eax
    cmpl    %eax,u+96
    jle    f47
    incl    n
    pushl    u+4
    .data    
s1892:    .asciz  "House cleans up on "
    .text    
    lea    s1892,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $234,n
    call    p711
    addl    $0,%esp
    movl    $234,n
    pushl    u+4
    .data    
s1933:    .asciz  " this time."
    .text    
    lea    s1933,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f48
f47:    movl    $235,n
    movl    u+96,%eax
    cmpl    %eax,u+92
    jle    f49
    incl    n
    .data    
s1980:    .asciz  "e"
    .text    
    lea    s1980,%eax
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
    je    f50
    incl    n
    pushl    u+4
    .data    
s1994:    .asciz  "E.O.Thorp does it again."
    .text    
    lea    s1994,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f51
f50:    movl    $239,n
    incl    n
    call    p711
    addl    $0,%esp
    movl    $240,n
    pushl    u+4
    .data    
s2051:    .asciz  " must have doctored the shuffle."
    .text    
    lea    s2051,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f51:    jmp    f52
f49:    movl    $243,n
    pushl    u+4
    .data    
s2112:    .asciz  "Even shuffle."
    .text    
    lea    s2112,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f52:f48:    movl    $246,n
    movl    u+1500,%eax
    movb    $0,(%eax)
f46:    leave    
    ret    
p2162:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $253,n
    incl    u+80
    incl    n
    movl    u+80,%eax
    cmpl    $7,%eax
    jle    f53
    cmpl    $1,%eax
    jge    f54
    pushl    n
    call    pttrap13
f54:f53:    decl    %eax
    shl    $2,%eax
    lea    u+16,%ebx
    addl    %ebx,%eax
    pushl    %eax
    call    p365
    addl    $4,%esp
    movl    $255,n
    leave    
    ret    
p2194:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $260,n
    incl    u+84
    incl    n
    movl    u+84,%eax
    cmpl    $7,%eax
    jle    f55
    cmpl    $1,%eax
    jge    f56
    pushl    n
    call    pttrap13
f56:f55:    decl    %eax
    shl    $2,%eax
    lea    u+52,%ebx
    addl    %ebx,%eax
    pushl    %eax
    call    p365
    addl    $4,%esp
    movl    $262,n
    leave    
    ret    
p2226:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $269,n
    movb    $0,u+109
    incl    n
    movb    $0,u+108
    incl    n
    movl    $0,u+80
    incl    n
    movl    $0,u+84
    movl    $275,n
    call    p2162
    addl    $0,%esp
    movl    $275,n
    incl    n
    call    p2194
    addl    $0,%esp
    movl    $276,n
    incl    n
    call    p2162
    addl    $0,%esp
    movl    $277,n
    movl    $279,n
    call    p2194
    addl    $0,%esp
    movl    $279,n
    pushl    u+4
    .data    
s2287:    .asciz  "The initial deal gives "
    .text    
    lea    s2287,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $281,n
    call    p711
    addl    $0,%esp
    movl    $281,n
    pushl    u+4
    .data    
s2332:    .asciz  " :"
    .text    
    lea    s2332,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+80
    lea    u+8,%eax
    pushl    %eax
    call    p440
    addl    $8,%esp
    movl    $282,n
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s2371:    .asciz  "  and the dealer :"
    .text    
    lea    s2371,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+84
    lea    u+44,%eax
    pushl    %eax
    call    p440
    addl    $8,%esp
    movl    $285,n
    pushl    u+4
    .data    
s2419:    .asciz  "."
    .text    
    lea    s2419,%eax
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
p2441:    pushl   %ebp
        movl    %esp, %ebp    
    movl    8(%ebp),%eax
    movl    %eax,u+1520
    movl    12(%ebp),%eax
    movl    %eax,u+1516
    movl    16(%ebp),%eax
    movl    %eax,u+1512
    movl    20(%ebp),%eax
    movl    %eax,u+1508
    movl    $297,n
    movl    u+1520,%eax
    movl    $0,(%eax)
    incl    n
    movl    $0,u+1524
    movl    $300,n
    movl    $1,u+1528
b57:    movl    $302,n
    movl    u+1508,%eax
    cmpl    %eax,u+1528
    jg    f58
    movl    $304,n
    movl    u+1512,%eax
    movl    u+1528,%ebx
    cmpl    4(%eax),%ebx
    jle    f59
    cmpl    (%eax),%ebx
    jge    f60
    pushl    n
    call    pttrap13
f60:f59:    subl    (%eax),%ebx
    shl    $2,%ebx
    addl    $8,%eax
    addl    %eax,%ebx
    jmp    f61
v2511:    movl    $304,n
    movl    $307,n
    movl    u+1520,%eax
    movl    u+1520,%ebx
    movl    u+1512,%ecx
    movl    u+1528,%edx
    cmpl    4(%ecx),%edx
    jle    f62
    cmpl    (%ecx),%edx
    jge    f63
    pushl    n
    call    pttrap13
f63:f62:    subl    (%ecx),%edx
    shl    $2,%edx
    addl    $8,%ecx
    addl    %ecx,%edx
    movl    (%edx),%edx
    addl    (%ebx),%edx
    movl    %edx,(%eax)
    jmp    m2501
v2536:    movl    $308,n
    movl    $310,n
    movl    u+1520,%eax
    movl    u+1520,%ebx
    movl    $11,%ecx
    addl    (%ebx),%ecx
    movl    %ecx,(%eax)
    incl    n
    incl    u+1524
    jmp    m2501
a2501:b64:    movl    $312,n
    movl    $312,n
    movl    $314,n
    movl    u+1520,%eax
    movl    u+1520,%ebx
    movl    $10,%ecx
    addl    (%ebx),%ecx
    movl    %ecx,(%eax)
    jmp    m2501
f61:    movl    (%ebx),%ebx
    decl    %ebx
    cmpl    $9,%ebx
    ja    b64
    shl    $2,%ebx
    movl    c2501(%ebx),%ebx
    jmp    *%ebx
    .data    
c2501:    .long    v2536
    .long    v2511
    .long    v2511
    .long    v2511
    .long    v2511
    .long    v2511
    .long    v2511
    .long    v2511
    .long    v2511
    .long    v2511
    .text    
m2501:    movl    $315,n
    movl    $317,n
    incl    u+1528
    jmp    b57
f58:b65:    movl    $321,n
    movl    u+1520,%eax
    cmpl    $21,(%eax)
    jle    f66
    cmpl    $0,u+1524
    je    f67
    incl    n
    movl    u+1520,%eax
    movl    u+1520,%ebx
    movl    (%ebx),%ebx
    subl    $10,%ebx
    movl    %ebx,(%eax)
    incl    n
    decl    u+1524
    jmp    b65
f67:f66:    movl    $326,n
    movl    u+1516,%eax
    cmpl    $0,u+1524
    jle    f68
    movb    $1,%bl
    jmp    f69
f68:    movb    $0,%bl
f69:    movb    %bl,(%eax)
    leave    
    ret    
p2686:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $337,n
    pushl    u+84
    lea    u+44,%eax
    pushl    %eax
    lea    u+1532,%eax
    pushl    %eax
    lea    u+100,%eax
    pushl    %eax
    call    p2441
    addl    $16,%esp
    movl    $339,n
    cmpl    $21,u+100
    jle    f70
    incl    n
    pushl    u+4
    .data    
s2729:    .asciz  "Dealer goes bust."
    .text    
    lea    s2729,%eax
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
    jmp    f71
f70:    movl    $343,n
    cmpl    $21,u+100
    jne    f72
    incl    n
    pushl    u+4
    .data    
s2803:    .asciz  "Dealer calls blackjack."
    .text    
    lea    s2803,%eax
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
    incl    u+96
    jmp    f73
f72:    movl    $348,n
    movl    $17,%eax
    cmpl    u+100,%eax
    jle    f74
    movl    $350,n
    call    p2194
    addl    $0,%esp
    movl    $350,n
    jmp    f75
f74:    movl    $351,n
    movb    $1,u+108
f75:f73:f71:    movl    $355,n
    cmpb    $0,u+108
    je    f76
    incl    n
    pushl    u+4
    .data    
s2917:    .asciz  "Dealer stands with "
    .text    
    lea    s2917,%eax
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
s2963:    .asciz  "."
    .text    
    lea    s2963,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $358,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    u+104,%eax
    cmpl    %eax,u+100
    jle    f77
    incl    n
    pushl    u+4
    .data    
s3000:    .asciz  "House wins."
    .text    
    lea    s3000,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    u+96
    jmp    f78
f77:    movl    $361,n
    movl    u+100,%eax
    cmpl    %eax,u+104
    jle    f79
    movl    $363,n
    call    p711
    addl    $0,%esp
    movl    $363,n
    pushl    u+4
    .data    
s3066:    .asciz  " wins."
    .text    
    lea    s3066,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    incl    u+92
    jmp    f80
f79:    movl    $366,n
    pushl    u+4
    .data    
s3112:    .asciz  "Tie game."
    .text    
    lea    s3112,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f80:f78:    jmp    f81
f76:    movl    $370,n
    pushl    u+4
    .data    
s3151:    .asciz  "Dealer takes a card and now has "
    .text    
    lea    s3151,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+84
    lea    u+44,%eax
    pushl    %eax
    call    p440
    addl    $8,%esp
    movl    $371,n
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f81:    leave    
    ret    
p3220:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $381,n
    movl    u+104,%eax
    cmpl    %eax,u+1136
    jle    f82
    movl    $383,n
    call    p2162
    addl    $0,%esp
    movl    $383,n
    jmp    f83
f82:    movl    $384,n
    movb    $1,u+109
f83:    leave    
    ret    
p3258:    pushl   %ebp
        movl    %esp, %ebp    
    movb    8(%ebp),%al
    movb    %al,u+1533
    movl    $394,n
    movl    u+52,%eax
    movl    %eax,u+1536
    movl    $396,n
    cmpb    $0,u+1533
    je    f84
    movl    $398,n
    cmpl    $8,u+1536
    jle    f85
    movl    $400,n
    cmpl    $18,u+104
    jle    f86
    movb    $1,%al
    jmp    f87
f86:    movb    $0,%al
f87:    movb    %al,u+109
    jmp    f88
f85:    movl    $403,n
    cmpl    $17,u+104
    jle    f89
    movb    $1,%al
    jmp    f90
f89:    movb    $0,%al
f90:    movb    %al,u+109
f88:    jmp    f91
f84:    movl    $407,n
    cmpl    $1,u+1536
    jle    f92
    movl    $4,%eax
    cmpl    u+1536,%eax
    jle    f93
    movl    $409,n
    cmpl    $12,u+104
    jle    f94
    movb    $1,%al
    jmp    f95
f94:    movb    $0,%al
f95:    movb    %al,u+109
    jmp    f96
f93:f92:    movl    $410,n
    cmpl    $3,u+1536
    jle    f97
    movl    $7,%eax
    cmpl    u+1536,%eax
    jle    f98
    movl    $412,n
    cmpl    $11,u+104
    jle    f99
    movb    $1,%al
    jmp    f100
f99:    movb    $0,%al
f100:    movb    %al,u+109
    jmp    f101
f98:f97:    movl    $415,n
    cmpl    $16,u+104
    jle    f102
    movb    $1,%al
    jmp    f103
f102:    movb    $0,%al
f103:    movb    %al,u+109
f101:f96:f91:    movl    $419,n
    cmpb    $0,u+109
    jne    f104
    movl    $421,n
    call    p2162
    addl    $0,%esp
    movl    $421,n
f104:    movl    $421,n
    leave    
    ret    
p3440:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $432,n
    pushl    u+80
    lea    u+8,%eax
    pushl    %eax
    lea    u+1540,%eax
    pushl    %eax
    lea    u+104,%eax
    pushl    %eax
    call    p2441
    addl    $16,%esp
    movl    $434,n
    cmpl    $21,u+104
    jne    f105
    movl    $436,n
    call    p711
    addl    $0,%esp
    movl    $436,n
    pushl    u+4
    .data    
s3488:    .asciz  " calls blackjack."
    .text    
    lea    s3488,%eax
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
    jmp    f106
f105:    movl    $440,n
    cmpl    $21,u+104
    jle    f107
    movl    $442,n
    call    p711
    addl    $0,%esp
    movl    $442,n
    pushl    u+4
    .data    
s3575:    .asciz  " goes bust."
    .text    
    lea    s3575,%eax
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
    jmp    f108
f107:    movl    $447,n
    .data    
s3640:    .asciz  "e"
    .text    
    lea    s3640,%eax
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
    je    f109
    incl    n
    movb    u+1540,%al
    pushl    %eax
    call    p3258
    addl    $4,%esp
    movl    $449,n
    jmp    f110
f109:    movl    $450,n
    incl    n
    call    p3220
    addl    $0,%esp
    movl    $451,n
f110:f108:f106:    movl    $454,n
    cmpb    $0,u+109
    je    f111
    movl    $456,n
    call    p711
    addl    $0,%esp
    movl    $456,n
    pushl    u+4
    .data    
s3692:    .asciz  " stands with "
    .text    
    lea    s3692,%eax
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
s3732:    .asciz  "."
    .text    
    lea    s3732,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f112
f111:    movl    $458,n
    incl    n
    call    p711
    addl    $0,%esp
    movl    $459,n
    pushl    u+4
    .data    
s3766:    .asciz  " takes a card and now has "
    .text    
    lea    s3766,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+80
    lea    u+8,%eax
    pushl    %eax
    call    p440
    addl    $8,%esp
    movl    $460,n
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
f112:    leave    
    ret    
f30:    movl    $469,n
    pushl    u+4
    .data    
s3835:    .asciz  "This program simulates the game of blackjack."
    .text    
    lea    s3835,%eax
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
s3913:    .asciz  "The dealer plays the compulsory strategy of standing on 17 or better."
    .text    
    lea    s3913,%eax
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
s4015:    .asciz  "The player plays either"
    .text    
    lea    s4015,%eax
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
s4062:    .asciz  "  [1] The standard naive strategy of standing on n or better, or"
    .text    
    lea    s4062,%eax
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
s4150:    .asciz  "  [2] A simplified version of the strategy described by  E.O.Thorp"
    .text    
    lea    s4150,%eax
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
s4240:    .asciz  "      in his book \"Beat the Dealer\" (Vintage Books, 1966) pp. 20-21."
    .text    
    lea    s4240,%eax
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
s4341:    .asciz  "Input :"
    .text    
    lea    s4341,%eax
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
s4372:    .asciz  "  For each shuffle, a player name (character string of <= 20 characters),"
    .text    
    lea    s4372,%eax
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
s4469:    .asciz  "  and if (the player name specified is not \"E.O.Thorp\", the count [n]"
    .text    
    lea    s4469,%eax
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
s4562:    .asciz  "  on which the player stands."
    .text    
    lea    s4562,%eax
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
s4624:    .asciz  "If the player name specified is \"E.O.Thorp\", the player strategy used"
    .text    
    lea    s4624,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    .data    
s4706:    .asciz  " will be Thorp's."
    .text    
    lea    s4706,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $485,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s4749:    .asciz  "Otherwise, the player will use the standard stop on count > n strategy."
    .text    
    lea    s4749,%eax
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
s4853:    .asciz  "The program will simulate one complete shuffle of play for each player."
    .text    
    lea    s4853,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $490,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    lea    u+1140,%eax
    pushl    %eax
    call    p820
    addl    $4,%esp
    movl    $492,n
b113:    movl    $493,n
    cmpb    $0,u+1140
    je    f114
    movl    $495,n
    call    p162
    addl    $0,%esp
    movl    $495,n
    lea    u+1140,%eax
    pushl    %eax
    call    p1551
    addl    $4,%esp
    movl    $497,n
b115:    movl    $498,n
    cmpb    $0,u+1140
    je    f116
    movl    $501,n
    call    p2226
    addl    $0,%esp
    movl    $501,n
b117:    movl    $502,n
    cmpb    $0,u+109
    jne    f118
    movl    $504,n
    call    p3440
    addl    $0,%esp
    movl    $504,n
    jmp    b117
f118:b119:    movl    $507,n
    cmpb    $0,u+108
    jne    f120
    movl    $509,n
    call    p2686
    addl    $0,%esp
    movl    $509,n
    jmp    b119
f120:    movl    $511,n
    lea    u+1140,%eax
    pushl    %eax
    call    p1551
    addl    $4,%esp
    movl    $512,n
    jmp    b115
f116:    movl    $514,n
    lea    u+1140,%eax
    pushl    %eax
    call    p820
    addl    $4,%esp
    movl    $515,n
    jmp    b113
f114:    incl    n
    call    pttrap0
    leave    
    ret    
