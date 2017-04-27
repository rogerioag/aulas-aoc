# Hello World MIPS.
# hello_world.asm
			# dados.
	.data
msg:	.asciiz		"Olá Mundo!"
a:		.word		0, 0, 0
	
	.text		# código.
	j main		# salta para o programa principal.
	
main:   nop		# programa principal.
	
			# imprimir a mensagem.
	li $v0, 4	# carrega o valor da syscall para imprimir uma string. 
	la $a0, msg	# carrega a posição inicial da string em $a0.
	syscall		# chama o sistema para impressão.
	
			# Finalizar o programa.	
	li $v0, 10	# carrega o valor da syscall para finalizar o programa (10).
	syscall		# chama o sistema.
