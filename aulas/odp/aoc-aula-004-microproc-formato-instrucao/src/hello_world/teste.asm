# Hello World MIPS.
# hello_world.asm
			# dados.
	.data
word1:	.word   0xAABBCCDD
	.align  2
	
	.text		# código.
	j main		# salta para o programa principal.
	
main:   nop		# programa principal.

	la $s2, word1
	
	lb $s3, 0($s2)
	lb $s4, 1($s2)
	lb $s5, 2($s2)
	lb $s6, 3($s2)
	
	addi $s5,$s5,1
	sb $s5, 2($s2)
	
	addi $s6,$0,0xFF000000
	srl $s6,$s6,24
	sb $s6, 3($s2)
	
	
			# Finalizar o programa.	
	li $v0, 10	# carrega o valor da syscall para finalizar o programa (10).
	syscall		# chama o sistema.
