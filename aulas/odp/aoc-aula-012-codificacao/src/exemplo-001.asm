# task_7.s
# MIPS equivalent of the following C program:
#    #include <stdio.h>
#    int x = 5;
#    void main () {
#        printf ("x + 1 = %d\n", x++);
#    }

	.globl main
	.data
# int x = 5;
x:	.word 5
# notice we stop before the %d
str:	.asciiz "x + 1 = "

	.text
# now entering the main function
main:
	# issue system call for the string
	# print_string is system call 4
	li $v0, 4
	# load the address of str into $a0
	la $a0, str
	syscall
	
	# now we need to load x, so we can print it
	# we'll first load it into $t0 so we can
	# manipulate it later
	lw $t0, x
	
	# print_int is system call 1
	li $v0, 1
	# copy value of x from $t0 into $a0 for system call
	add $a0, $zero, $t0
	syscall
	
	# now print out the '\n'
	# print_char is system call 11
	li $v0, 11
	# '\n' is the number 10 (decimal) in ASCII
	li $a0, 10
	syscall
	
	# notice that we could have loaded x into $v0 initially
	# but if we did, we would have overwritten that value
	# when printing the '\n' (because that required storing
	# 11 in $v0)
	# but since we have a copy in $t0, we do not have to
	# read it in from memory again, so we can just increment
	# it there and store it back to memory
	addi $t0, $t0, 1
	sw $t0, x
	
	# exit system call...
	li $v0, 10
	# notice $a0 is not needed for exit...
	syscall