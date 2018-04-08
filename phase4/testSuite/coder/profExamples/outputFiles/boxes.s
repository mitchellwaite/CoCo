    .data    
    .comm    u,3104
n:    .long    0
    .text    
    .globl    ptmain
ptmain:    pushl   %ebp
        movl    %esp, %ebp    
    movl    $1,u+0
    movl    $2,u+4
    movl    $19,n
    pushl    u+4
    .data    
s24:    .asciz  "enter box width and height: "
    .text    
