# Exemplo de procedimento.
# exemplo-proc-1.asm
# int exemplo (int g, int h, int i, int j){
#	int f;	
#	f = (g + h) – (i + j);
#	return f;
#}

	.data
	
	.text
	j main
	
p_exe: 	addi $sp,$sp,-12   	# ajuste do sp para empilhar 3 palavras
	sw  $t1,8($sp)    	# salva $t1 na pilha para usar depois
	sw  $t0,4($sp)    	# salva $t0 na pilha para usar depois
	sw  $s0,0($sp)    	# salva $s0 na pilha para usar depois

	# No procedimento

	add $t0,$a0,$a1  	# reg. $t0 contém g + h
	add $t1,$a2,$a3	        # reg. $t1 contémi i + j
	sub $s0,$t0,$t1		# f = $t0 - $t1, que é (g + h) – ( i + j)

	# Para retornar o valor f

	add $v1,$s0,$zero 	# retorna f ($v1 = $s0 + 0)

	# Antes do retorno é necessário restaurar os valores dos registradores salvos na pilha

	lw $s0, 0($sp)		# restaura reg. $s0 para o chamador
	lw $t0, 4($sp)		# restaura reg. $t0 para o chamador
	lw $t1, 8($sp)		# restaura reg. $t1 para o chamador
	addi $sp,$sp,12		# ajusta pilha par excluir 3 itens

	# Retornar

	jr  $ra			# desvia de volta à rotina que chamou
	
main:	nop			# parametros para a função.
	
	# colocar valores em t0, t1 e s0, imprimi-los antes e depois da chamada.

	li $v0, 5		# carrega o valor da syscall para ler um inteiro (5), o valor lido estará em $v0.
	syscall			# chama o sistema.
	add $a0, $zero, $v0	# g
	
	li $v0, 5		# carrega o valor da syscall para ler um inteiro (5), o valor lido estará em $v0.
	syscall
	add $a1, $zero, $v0	# h
	
	li $v0, 5		# carrega o valor da syscall para ler um inteiro (5), o valor lido estará em $v0.
	syscall
	add $a2, $zero, $v0	# i
	
	li $v0, 5		# carrega o valor da syscall para ler um inteiro (5), o valor lido estará em $v0.
	syscall
	add $a3, $zero, $v0	# j
	
    	jal p_exe
    	
    	li $v0, 1		# carrega o valor da syscall para imprimir um inteiro (1).
	add $a0, $v1, $zero  	# valor a ser impresso deve estar em $a0.
    	syscall
    	
    	
    			# Finalizar o programa.	
	li $v0, 10	# carrega o valor da syscall para finalizar o programa (10).
	syscall		# chama o sistema.
    	
    	
    	