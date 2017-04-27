# task_8.s
# MIPS equivalent of the following C program:
#    #include <stdio.h>
#    int x;
#    int y;
#    void main () {
#        printf ("enter two numbers and press return:  ");
#        scanf ("%d %d", &x, &y);
#        printf ("sum of entered arguments is %d\n", (x + y) );
#    }

	.globl main
	.data
# int x
x:	.word 1
# int y
y:	.word 2
instr:	.asciiz "enter two numbers and press return:  "
outstr:	.asciiz "sum of entered arguments is "

	.text
# entering main function
main:	
	# print the first string
	# print_string is system call 4
	li $v0, 4
	# load the address of the string to print
	la $a0, instr
	# now just print it already...
	syscall
	
	# read_int is system call 5
	li $v0, 5
	# notice no $a0 is needed
	syscall
	# read_int is one of the system calls that has
	# a return value.  the result of the system call
	# (i.e., the int you entered) is placed into
	# $v0 by the system call.  so let's store it
	# into our variable x
	sw $v0, x
	
	# now do the same thing for y
	li $v0, 5
	syscall
	sw $v0, y
	
	# picky comment here:  technically, the two system
	# calls above are not equivalent to the scanf.
	# with scanf, you would enter two numbers separated
	# by a space.  scanf actually reads the entire thing
	# as a string, then breaks it up into ints.  what we
	# have done is, literally, read two ints.  implementing
	# the exact behavior of scanf would be kind of tedious
	# and requires things you haven't seen yet...
	
	# now we will print out the "sum of ..." string
	# using our old familiar print_str system call 4
	li $v0, 4
	la $a0, outstr
	syscall
	
	# when we read in the ints, we immediately stored
	# them in our global variables x and y.  now, we need
	# to read them back into registers, because that's the
	# only way we can add them
	lw $t0, x
	lw $t1, y
	add $a0, $t0, $t1
	# $a0 now has x + y, so we can print it
	# observe that we can set the value of $a0 before
	# setting $v0, or vice versa (which we did above).
	# it doesn't matter because the result is the same
	li $v0, 1
	syscall
	
	# now print the '\n'
	# print_char is system call 11 and '\n' is ASCII 10
	li $v0, 11
	li $a0, 10
	syscall
	
	# exit system call...
	li $v0, 10
	syscall
