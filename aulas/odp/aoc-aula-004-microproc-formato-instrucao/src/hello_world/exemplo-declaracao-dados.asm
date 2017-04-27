#########################################################
# Programa exemplo do MIPS.
# autor: rag
# 23/08/2016
#########################################################
	.data		# Seção de dados.
f:  .word   0x00000000
g:  .word   0x00000000
y:  .word   0x00000000
	
	.text		# Seção de Código.
	j main		# Salta para o main.

sum:	nop		# procedimento sum.
  	add  $v0, $a0, $a1  	# $v0 = a + b
  	jr   $ra            	# return

main:			# Programa principal.
  	addi $sp, $sp, -4   	# stack frame
  	sw   $ra, 0($sp)    	# store $ra
  	addi $a0, $0, 2     	# $a0 = 2
  	sw   $a0, f         	# f = 2
  	addi $a1, $0, 3     	# $a1 = 3
  	sw   $a1, g         	# g = 3
  	jal  sum            	# call sum
  	sw   $v0, y         	# y = sum()
  	lw   $ra, 0($sp)    	# restore $ra
  	addi $sp, $sp, 4    	# restore $sp
 	#jr   $ra            	# return to OS
 	
 			# Finalizar o programa.	
	li $v0, 10	# carrega o valor da syscall para finalizar o programa (10).
	syscall		# chama o sistema.
