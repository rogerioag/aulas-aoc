	.data
	.text
	j main

main:
	li $t0, 1
	li $t1, 2
	add $t3, $t0, $t1 

	add $a0, $zero, $t3     # $a0 = 5
    li $v0, 17             # load 10(exit) for syscall
    syscall                # exit

	# jr $ra
	