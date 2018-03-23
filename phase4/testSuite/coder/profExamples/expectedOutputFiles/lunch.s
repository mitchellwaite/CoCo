    .data    
    .comm    u,44
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $1,u+4
    movl    $8,u+8
    movl    $1,u+20
    movl    $8,u+24
    movl    $13,n
    .data    
s44:    .asciz  "fly"
    .text    
    lea    s44,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+12,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s59:    .asciz  "spider"
    .text    
    lea    s59,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+1036,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s77:    .asciz  "bird"
    .text    
    lea    s77,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+2060,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s93:    .asciz  "cat"
    .text    
    lea    s93,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+3084,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s108:    .asciz  "dog"
    .text    
    lea    s108,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+4108,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s123:    .asciz  "goat"
    .text    
    lea    s123,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+5132,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s139:    .asciz  "cow"
    .text    
    lea    s139,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+6156,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s154:    .asciz  "horse"
    .text    
    lea    s154,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+7180,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    $23,n
    .data    
s171:    .asciz  "I don't know why she swallowed a fly."
    .text    
    lea    s171,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+28,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s220:    .asciz  "That wiggled and jiggled and tickled inside her."
    .text    
    lea    s220,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+1052,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s280:    .asciz  "How absurd, to swallow a bird."
    .text    
    lea    s280,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+2076,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s322:    .asciz  "Imagine that, she swallowed a cat."
    .text    
    lea    s322,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+3100,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s368:    .asciz  "What a hog, to swallow a dog."
    .text    
    lea    s368,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+4124,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s409:    .asciz  "What a dope, to swallow a goat."
    .text    
    lea    s409,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+5148,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s452:    .asciz  "I don't know how she swallowed that cow."
    .text    
    lea    s452,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+6172,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    incl    n
    .data    
s504:    .asciz  "She died of course."
    .text    
    lea    s504,%eax
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
    movl    %eax,%ebx
    pushl    %ebx
    lea    u+7196,%eax
    pushl    %eax
    call    pttrap101
    addl    $8,%esp
    popl    %edx
    popl    %ecx
    popl    %ebx
    popl    %eax
    movl    $33,n
    pushl    u+0
    .data    
s532:    .asciz  "I Know an Old Lady"
    .text    
    lea    s532,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $36,n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    movl    $1,u+36
b1:    movl    $39,n
    movl    $8,%eax
    cmpl    u+36,%eax
    jle    f2
    movl    $41,n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    pushl    u+0
    .data    
s604:    .asciz  "I know an old lady"
    .text    
    lea    s604,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    pushl    u+0
    .data    
s646:    .asciz  "Who swallowed a "
    .text    
    lea    s646,%eax
    movl    u+36,%ebx
    cmpl    $8,%ebx
    jle    f3
    cmpl    $1,%ebx
    jge    f4
    pushl    n
    call    pttrap13
f4:f3:    decl    %ebx
    shl    $10,%ebx
    lea    u+12,%ecx
    addl    %ecx,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
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
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    pushl    u+0
    movl    u+36,%eax
    cmpl    $8,%eax
    jle    f5
    cmpl    $1,%eax
    jge    f6
    pushl    n
    call    pttrap13
f6:f5:    decl    %eax
    shl    $10,%eax
    lea    u+28,%ebx
    addl    %ebx,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    movl    $45,n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    movl    u+36,%eax
    movl    %eax,u+40
b7:    movl    $47,n
    movl    $2,%eax
    cmpl    u+40,%eax
    jg    f8
    incl    n
    pushl    u+0
    .data    
s749:    .asciz  "She swallowed the "
    .text    
    lea    s749,%eax
    movl    u+40,%ebx
    cmpl    $8,%ebx
    jle    f9
    cmpl    $1,%ebx
    jge    f10
    pushl    n
    call    pttrap13
f10:f9:    decl    %ebx
    shl    $10,%ebx
    lea    u+12,%ecx
    addl    %ecx,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
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
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    .data    
s793:    .asciz  " to catch the "
    .text    
    lea    s793,%eax
    movl    u+40,%ebx
    decl    %ebx
    cmpl    $8,%ebx
    jle    f11
    cmpl    $1,%ebx
    jge    f12
    pushl    n
    call    pttrap13
f12:f11:    decl    %ebx
    shl    $10,%ebx
    lea    u+12,%ecx
    addl    %ecx,%ebx
    pushl    %eax
    pushl    %ebx
    pushl    %ecx
    pushl    %edx
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
s821:    .asciz  ","
    .text    
    lea    s821,%ebx
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
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    decl    u+40
    jmp    b7
f8:    movl    $53,n
    cmpl    $1,u+36
    jle    f13
    incl    n
    pushl    u+0
    lea    u+28,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
f13:    movl    $55,n
    movl    $57,n
    movl    $8,%eax
    cmpl    u+36,%eax
    jle    f14
    incl    n
    pushl    u+0
    .data    
s917:    .asciz  "Perhaps she'll die."
    .text    
    lea    s917,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
f14:    movl    $59,n
    movl    $61,n
    incl    u+36
    jmp    b1
f2:    movl    $66,n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    pushl    u+0
    .data    
s986:    .asciz  "The end."
    .text    
    lea    s986,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    pushl    u+0
    .data    
s1027:    .asciz  "Thank you very much, you're too kind."
    .text    
    lea    s1027,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    pushl    u+0
    .data    
s1088:    .asciz  "I'll be here until Thursday - try the veal!"
    .text    
    lea    s1088,%eax
    pushl    %eax
    pushl    $1
    call    pttrap109
    addl    $12,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    incl    n
    pushl    u+0
    call    pttrap6
    addl    $4,%esp
    call    pttrap0
    leave    
    ret    
