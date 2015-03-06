/**
 * @author:     Pat Hawks
 * Created on:  Feb 02, 2015
 * Source File: Challenge1.s
 *
 * To compile:
 *    g++ Challenge1.s -Wall -o Challenge1
 */

.code32
    .equ   inNum, 8
    .equ   _main, main
    .equ   printf, _printf
    .equ   scanf, _scanf
    .globl _main
    .equ   MIN_NUMBER, 1000
    .equ   MAX_NUMBER, 999999
.data
PROMPT_STRING:
    .asciz "Enter a whole number between 1000 and 999999 without spaces or commas.\n"
FORMAT_STRING:
    .asciz "%d,%.3d\n"
INPUT_STRING:
    .asciz "%d"

.text
main:
    subl  $12, %esp
    leal  inNum(%esp), %eax
    movl  %eax, 4(%esp)
inputLoop:
    movl  $PROMPT_STRING, (%esp)
    call  printf
    movl  $INPUT_STRING, (%esp)
    call  scanf
    movl  inNum(%esp), %eax
    cmpl  $MIN_NUMBER, %eax
    jl    inputLoop
    cmpl  $MAX_NUMBER, %eax
    jg    inputLoop
    xorl  %edx, %edx
    movl  $MIN_NUMBER, %ecx
    divl  %ecx
    movl  %edx, 8(%esp)
    movl  %eax, 4(%esp)
    movl  $FORMAT_STRING, (%esp)
    call  printf
    addl  $12, %esp
    xorl  %eax, %eax              # Return 0
    ret
