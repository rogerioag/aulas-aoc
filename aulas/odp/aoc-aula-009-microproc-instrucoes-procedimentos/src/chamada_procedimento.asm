# Teste de comentário.
	.data
result: .word 0
msg:	.asciiz	"Resultado: \n"	
	
	.text
	j main	# salta para o programa principal.
	
# declaração do procedimento.	
add2 : 	nop
	add $6,$4,$5
	jr $31	#return
# fim do procedimento add2.
	

main:   nop		# programa principal.
	addi $4,$0,10 	# $4 = 10
	li $5,20	#$5 = 20
	jal add2	# call add2
	add $4,$0,$6		
	li $5,25
	jal add2
	sw $6, result	#stores result
	
			# imprimir o resultado.
	li $v0, 4	# carrega o valor da syscall para imprimir uma string. 
	la $a0, msg	# carrega a posição inicial da string em $a0.
	syscall		# chama o sistema para impressão.
			
	li $v0, 1	# carrega o valor da syscall para imprimir um inteiro.	
	move $a0, $6	# carrega o valor a ser impresso.
	syscall		# chama o sistema para impressão.
	
	li $v0, 10	# carrega o valor da syscall para finalizar o programa (10).
	syscall		# chama o sistema para impressão.