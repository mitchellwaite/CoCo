    .data    
    .comm    u,1032
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $1,u+0
    movl    $2,u+4
    movl    $5,n
    pushl    u+4
    .data    
s24:    .asciz  "Anything you can say, I can say twice (end with 'bye'):"
    .text    
