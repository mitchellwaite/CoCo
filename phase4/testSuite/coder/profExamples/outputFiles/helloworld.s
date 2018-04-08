    .data    
    .comm    u,4
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $2,u+0
    movl    $4,n
    pushl    u+0
    .data    
s15:    .asciz  "Hello world"
    .text    
