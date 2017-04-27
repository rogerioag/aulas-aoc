# Código do exercício 7 da lista.
# mips-exe-007.asm

	.text
	j main
push_t1_t2:	addi $sp, $sp, -8	# cria espaço para dois registradores na pilha.
		sw $t2, 4($sp)		# salva t2
		sw $t1, 0($sp)		# salva t1
		jr $ra

pop_t1_t2:	lw $t2, 4($sp)		# recupera t2
		lw $t1, 0($sp)		# recupera t1
		addi $sp, $sp, 8	# atualiza o sp.
		jr $ra
		
push_t3_t4:	addi $sp, $sp, -8	# cria espaço para dois registradores na pilha.
		sw $t4, 4($sp)		# salva t2
		sw $t3, 0($sp)		# salva t1
		jr $ra

pop_t3_t4:	lw $t4, 4($sp)		# recupera t4
		lw $t3, 0($sp)		# recupera t3
		addi $sp, $sp, 8	# atualiza o sp.
		jr $ra
	
main:		addi $t1, $zero, 2
		addi $t2, $zero, 3
		addi $t3, $zero, 2
		addi $t4, $zero, 1
volta:		jal push_t1_t2
		jal push_t3_t4
		jal pop_t1_t2
		jal pop_t3_t4
		addi $t1, $t1, -1		# decrementa t1.
		beq  $t1, $zero, fim
		j volta
fim:		nop
				# Finalizar o programa.	
		li $v0, 10	# carrega o valor da syscall para finalizar o programa (10).
		syscall		# chama o sistema.