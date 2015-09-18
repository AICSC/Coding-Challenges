.code64
.global main

main:
    pushq   %rbp
    pushq   %rbx
    pushq   %r12
    pushq   %r13
    movq    %rsp, %rbp
    andq    $-16, %rsp
    movl    $99, %r12d
    leaq    lyrics(%rip), %rbx
    leaq    nullString-lyrics(%rbx), %r13

printVerse:
    movq    %rbx, %rdi
    movq    %r13, %r8
    movl    %r12d, %esi
    movl    %r12d, %edx
    addl    $-1,   %r12d
    movl    %r12d, %ecx
    movl    $115, %r9d
    cmpl    $1, %r12d
    jz      lastVerse
    callq   printf
    jmp     printVerse

lastVerse:
    xorl    %r9d, %r9d
    leaq    lyricsLastVerse-lyrics(%rbx), %r8
    callq   printf

    movq    %rbp, %rsp
    popq    %r13
    popq    %r12
    popq    %rbx
    popq    %rbp
    retq

lyrics:
    .ascii "%d bottles of beer on the wall\n"
    .ascii "%d bottles of beer\n"
    .ascii "Take one down, Pass it around\n"
    .ascii "%d %sbottle%c of beer on the wall\n\n"
nullString:
    .ascii "\0"
lyricsLastVerse:
    .ascii "last bottle of beer on the wall\n\n"
    .ascii "One last bottle of beer on the wall\n"
    .ascii "One last bottle of beer\n"
    .ascii "Take it down, Pass it around\n"
    .ascii "No more bottles of beer on the wall\n\n"
    .ascii "No more bottles of beer on the wall\n"
    .ascii "No more bottles of beer\n"
    .ascii "Go to the store, Buy a few more\n"
    .asciz "99 "
