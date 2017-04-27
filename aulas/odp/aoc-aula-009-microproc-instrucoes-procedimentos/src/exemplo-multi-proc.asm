# Exemplo de multiplos procedimentos.
# exemplo-multi-proc.asm
	.data
	
	.text
	j main			# salta para o prog. principal.
	
	# procedimetno p_exe2
p_exe2: nop
	jr  $ra			# retorna para o chamador.

	# procedimetno p_exe1
p_exe1: nop

	add $t0, $a0, $a1	# $t0 <- $a0 + $a1
	
	addi $sp, $sp, -4    	# empilhar o $ra.
       	sw   $ra, 0($sp)     	# store $ra.	
	jal p_exe2
	lw   $ra, 0($sp)     	# restaura $ra.
	add $v1, $t0, $zero	# move $t0 para o $v1
	jr  $ra			# retorna ao prog. principal.
	
main:	nop			# parametros para a função.
	addi $a0, $zero, 10	# arg1
	addi $a1, $zero, 5	# arg1
			
    	jal p_exe1
    	
    	li $v0, 1		# carrega o valor da syscall para imprimir um inteiro (1).
	add $a0, $v1, $zero  	# valor a ser impresso deve estar em $a0.
    	syscall
    	