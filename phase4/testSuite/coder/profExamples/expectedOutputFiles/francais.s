    .data    
    .comm    u,2056
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $1,u+0
    movl    $2,u+4
b1:    movl    $9,n
    pushl    u+4
    .data    
s25:    .asciz  "Please give me a regular French 'er' verb (end with 'arreter')"
    .text    
    lea    s25,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+0
    lea    u+8,%eax
    pushl    %eax
    call    pttrap108
    addl    $8,%esp
    movl    $13,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s135:    .asciz  "Thanks, here is the present conjugation"
    .text    
    lea    s135,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $15,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+8,%eax
    pushl    %eax
    call    pttrap105
    addl    $4,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    subl    $2,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    %eax
    pushl    $1
    lea    u+8,%eax
    pushl    %eax
    call    pttrap104
    addl    $12,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+1032,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    pushl    u+4
    .data    
s217:    .asciz  "The root of this verb is '"
    .text    
    lea    s217,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    lea    u+1032,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    pushl    u+4
    .data    
s270:    .asciz  "'"
    .text    
    lea    s270,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $19,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+8,%eax
    pushl    %eax
    call    pttrap105
    addl    $4,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    decl    %eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+8,%ebx
    pushl    %ebx
    call    pttrap105
    addl    $4,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    %ebx
    pushl    %eax
    lea    u+8,%eax
    pushl    %eax
    call    pttrap104
    addl    $12,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s314:    .asciz  "er"
    .text    
    lea    s314,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f2
    movl    $21,n
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    $1
    pushl    $1
    lea    u+1032,%eax
    pushl    %eax
    call    pttrap104
    addl    $12,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s332:    .asciz  "a"
    .text    
    lea    s332,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    jne    f3
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    $1
    pushl    $1
    lea    u+1032,%eax
    pushl    %eax
    call    pttrap104
    addl    $12,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s345:    .asciz  "e"
    .text    
    lea    s345,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    jne    f4
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    $1
    pushl    $1
    lea    u+1032,%eax
    pushl    %eax
    call    pttrap104
    addl    $12,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s361:    .asciz  "i"
    .text    
    lea    s361,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    jne    f5
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    $1
    pushl    $1
    lea    u+1032,%eax
    pushl    %eax
    call    pttrap104
    addl    $12,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s375:    .asciz  "o"
    .text    
    lea    s375,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    jne    f6
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    $1
    pushl    $1
    lea    u+1032,%eax
    pushl    %eax
    call    pttrap104
    addl    $12,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s391:    .asciz  "u"
    .text    
    lea    s391,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f7
f6:f5:f4:f3:    movl    $24,n
    pushl    u+4
    .data    
s406:    .asciz  "J'"
    .text    
    lea    s406,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%ebx
    pushl    %ebx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s414:    .asciz  "e"
    .text    
    lea    s414,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    jmp    f8
f7:    movl    $26,n
    pushl    u+4
    .data    
s437:    .asciz  "Je "
    .text    
    lea    s437,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%ebx
    pushl    %ebx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s446:    .asciz  "e"
    .text    
    lea    s446,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
f8:    movl    $31,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s475:    .asciz  "Tu "
    .text    
    lea    s475,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%ebx
    pushl    %ebx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s484:    .asciz  "es"
    .text    
    lea    s484,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
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
s511:    .asciz  "Il ou elle "
    .text    
    lea    s511,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%ebx
    pushl    %ebx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s528:    .asciz  "e"
    .text    
    lea    s528,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $35,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%eax
    pushl    %eax
    call    pttrap105
    addl    $4,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%ebx
    pushl    %ebx
    call    pttrap105
    addl    $4,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    %ebx
    pushl    %eax
    lea    u+1032,%eax
    pushl    %eax
    call    pttrap104
    addl    $12,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s570:    .asciz  "g"
    .text    
    lea    s570,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f9
    incl    n
    pushl    u+4
    .data    
s584:    .asciz  "Nous "
    .text    
    lea    s584,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%ebx
    pushl    %ebx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s595:    .asciz  "eons"
    .text    
    lea    s595,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    jmp    f10
f9:    movl    $38,n
    pushl    u+4
    .data    
s621:    .asciz  "Nous "
    .text    
    lea    s621,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%ebx
    pushl    %ebx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s632:    .asciz  "ons"
    .text    
    lea    s632,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
f10:    movl    $43,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    pushl    u+4
    .data    
s663:    .asciz  "Vous "
    .text    
    lea    s663,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%ebx
    pushl    %ebx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s674:    .asciz  "ez"
    .text    
    lea    s674,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
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
s701:    .asciz  "Ils ou elles "
    .text    
    lea    s701,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+1032,%ebx
    pushl    %ebx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s720:    .asciz  "ent"
    .text    
    lea    s720,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap103
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $47,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f11
f2:    movl    $47,n
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+8,%eax
    pushl    %eax
    call    pttrap105
    addl    $4,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    decl    %eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    lea    u+8,%ebx
    pushl    %ebx
    call    pttrap105
    addl    $4,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    pushl    %ebx
    pushl    %eax
    lea    u+8,%eax
    pushl    %eax
    call    pttrap104
    addl    $12,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    .data    
s769:    .asciz  "ir"
    .text    
    lea    s769,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %ebx,%ecx
    pushl    %ecx
    movl    %eax,%ebx
    pushl    %ebx
    call    pttrap107
    addl    $8,%esp
    movl    %eax,%esi
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    %esi,%eax
    cmpb    $0,%al
    je    f12
    incl    n
    pushl    u+4
    .data    
s784:    .asciz  "I'm too tired to do an 'ir' verb"
    .text    
    lea    s784,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    movl    $51,n
    pushl    u+4
    call    pttrap6
    addl    $4,%esp
    jmp    f13
f12:    movl    $52,n
    pushl    u+4
    .data    
s853:    .asciz  "I don't like the looks of this verb"
    .text    
    lea    s853,%eax
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
f13:f11:    .data    
s923:    .asciz  "arreter"
    .text    
    lea    s923,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+8,%eax
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
    jne    f14
    movl    $59,n
    pushl    u+0
    call    pttrap4
    addl    $4,%esp
    jmp    b1
f14:    incl    n
    call    pttrap0
    leave    
    ret    
