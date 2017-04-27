#########################################################
# Programa exemplo do MIPS.
# autor: rag
# 21/03/2017
#########################################################
	.data		# Seção de dados.
a:  .word   0x00000000
x:  .word   0x00000000
	
	.text		# Seção de Código.
	j main		# Salta para o main.

main:			# Programa principal.
	la $t0, a
	la $t1, x
  	addi $s0, $0, 10
  	addi $s1, $0, 20
  	sw   $s0, 0($t0)
  	sw   $s1, 0($t1) 	
  	
 	#jr   $ra            	# return to OS
 	
 	# Finalizar o programa.	
	li $v0, 10	# carrega o valor da syscall para finalizar o programa (10).
	syscall		# chama o sistema.
