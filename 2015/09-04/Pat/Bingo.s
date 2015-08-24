#  Author:      Pat Hawks
#  Created on:  Sept 04, 2015
#  Source File: Bingo.s

#  To compile:
#    gcc Bingo.s -o Bingo

#  Three priorities when writing this program:
#    1. Given a true random number generator, generate truly random Bingo cards
#    2. Minimize memory usage (Do everything in registers)
#    3. Minimize number of instructions

# Potential optimization points:
#   Is there a better way to handle the FREE space,
#     rather than set it and forget it?
#   For the top row, we needn't "remember" the number we are using, since there
#     will be no more numbers in the current column
#   For "B" column, we are adding a column offset of `0` to each number

.code32

BingoTemplate:
  .ascii "  B  I  N  G  O\n"
  .ascii "%3d%3d%3d%3d%3d\n"
  .ascii "%3d%3d%3d%3d%3d\n"
  .ascii "%3d%3d %s%3d%3d\n"
  .ascii "%3d%3d%3d%3d%3d\n"
  .asciz "%3d%3d%3d%3d%3d\n"

FreeSpace:
  .asciz "--"

.globl _main
_main:

# Typical Prologue
  pushl %ebx
  pushl %esi
  pushl %edi
  subl  $108, %esp  # Grab some stack space

# Seed random number generator with current time
# Is this necessary? Let's talk about what `srand` does...
  movl  $0, (%esp)
  call  _time
  movl  %eax, (%esp)
  call  _srand

# We are going to generate the "O" column first, so we need to add 60 to our
#   random numbers (1-15)
  movl  $60,  %esi

# Because we would rather count down to zero than count up to something, we are
#   going to start with the bottom row, and work up to the top row. After we set
#   the top row, we will subtract again, giving us a negative number, which lets
#   us know it is time to loop to the next column
  movl  $100, %ebx

PrepareNewColumn:
# Zero out edi, which will be used to keep track of which numbers have already
#   been added to this column
# Using XOR to zero out a register is a Common Idiom You Need To Know
  xorl  %edi, %edi

FillColumn:
  call  _rand       # Set eax to a random number
  andl  $15, %eax   # Coerce eax into a number between 0-15
  jz    FillColumn  # If it is zero, try again

# Find 2 to the power of our random number
# For this trick to work, we MUST copy our number to ecx (cl)
  movl  %eax, %ecx
  movl  $1, %edx
  shrd  %cl, %edx, %edx # cl is the ONLY register that can be used this way

  testl %edx, %edi  # If our random number has already been added to this column
  jnz   FillColumn  #   pick a different one
                    # Else
  orl   %edx, %edi  #   Remember that we have now used this number

  addl  %esi, %eax  # Add our "column offset" to the picked number
                    #   ie: 60 for column "O"

  movl  %eax, (%esp, %ebx) # Copy the number into the two dimensional array that
                           #   represents our board
                           # I generally try to avoid complex mov instructions
                           #   like this, but I'm kind of running out of
                           #   registers, and we would have to do the add at
                           #   some point *anyway*. When we get down to it, this
                           #   is exactly what this mode of memory addressing
                           #   was designed for. :)

  subl  $20, %ebx   # Move up one row and
  jg    FillColumn  # IF we are still on the board, rinse and repeat
                    # Else
  addl  $96, %ebx   #   Move to the bottom row of the next column (from rtl)
  subl  $15, %esi   #   and adjust our column offset accordingly

  cmpl  $80, %ebx        # IF we are still on the board
  jne   PrepareNewColumn #   rinse and repeat

  movl  $BingoTemplate, (%esp) # Push pointer to our Bingo template for `printf`
  movl  $FreeSpace, 52(%esp)   # Get rid of the number at FREE space
  call  _printf     # Print Bingo card

# WHEW!

# Cleanup
  xorl  %eax, %eax  # Zero return
  addl  $108, %esp  # Release stack space
  popl  %edi
  popl  %esi
  popl  %ebx
  ret
