/**
 * @author:     Pat Hawks
 * Created on:  Mar 06, 2015
 * Source File: Challenge2.s
 *
 * To compile:
 *    gcc Challenge2.s -o Challenge2
 */

.code32
    .equ    _main, main
    .equ    printf, _printf
    .equ    scanf, _scanf
    .equ    STACK_SPACE, 28
    .equ    tempA,       16
    .equ    tempB,        4
    .equ    tempASys,    24
    .equ    tempBSys,    12
    .equ    ptr2,         8
    .equ    ptr1,         4
    .equ    format,       0
    .equ    UPPERCASE, 0xDF
    .equ    C,          'C'
    .equ    F,          'F'
    .global _main
.data
PROMPT_STRING:
    .asciz "Enter the temperature and scale (eg. 80.0F): "
FORMAT_STRING:
    #ifdef _WIN32
    .asciz "%.1lf\370%1c == %.1lf\370%1c\n"
    #else
    .asciz "%.1lf°%1c == %.1lf°%1c\n"
    #endif
INPUT_STRING:
    .asciz "%lf %1[CcFf] *[ \n\t]"
NINE_FIFTHS:
    .double +1.8
FIVE:
    .double +5  # These two could be combined into +0.5555556
NINTHS:         #   but that would be less precise
    .double +9  #   ... I guess
THIRTY_TWO:
    .double +32

.text
main:
    subl    $STACK_SPACE, %esp
    leal    tempASys(%esp), %eax
    movl    %eax, 8(%esp)
    leal    tempA(%esp), %eax
    movl    %eax, ptr1(%esp)
PromptForTemp:
    movl    $PROMPT_STRING, format(%esp)
    call    printf
    movl    $INPUT_STRING, format(%esp)
    call    scanf
    testl   $2, %eax
    jne     PromptForTemp
    movsd   tempA(%esp), %xmm0          # Copy tempA to X
    movsd   %xmm0, tempB(%esp)          # Copy X to tempB
    movl    tempASys(%esp), %eax
    andl    $UPPERCASE, %eax            # Force tempASys to uppercase
    movl    %eax, tempBSys(%esp)        # Copy tempASys to tempBSys
    cmpl    $F, %eax                    # If (tempASys == 'F')
    je      FtoC                        #   goto FtoC
CtoF:
    movl    $F, tempASys(%esp)
    mulsd   NINE_FIFTHS, %xmm0          # X *= 9/5
    addsd   THIRTY_TWO, %xmm0           # X += 32
    jmp     Finish
FtoC:
    movl    $C, tempASys(%esp)
    subsd   THIRTY_TWO, %xmm0           # X -= 32
    mulsd   FIVE, %xmm0                 # X *= 5
    divsd   NINTHS, %xmm0               # X /= 9
Finish:
    movsd   %xmm0, tempA(%esp)          # Copy X to tempA
    movl    $FORMAT_STRING, (%esp)
    call    printf
    addl    $STACK_SPACE, %esp
    ret
