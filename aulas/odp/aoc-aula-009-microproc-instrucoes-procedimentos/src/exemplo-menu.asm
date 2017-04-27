# Teste de comentário.
	.data
result: .word 0
menu:	.asciiz	"--[menu]----------------\n| 0 - adição           |\n| 1 - subtração        |\n| 2 - multiplicação    |\n| 3 - divisão          |\n| 4 - sair             |\n------------------------\n"	
	
	.text
	j main	# salta para o programa principal.
	
# declaração do procedimento somar.
somar : nop
	
	jr $ra
# fim do procedimento somar.

# declaração do procedimento subtrair.
subtrair : nop
	
	jr $ra
# fim do procedimento subtrair.

# declaração do procedimento multiplicar.
multiplicar : nop
	
	jr $ra
# fim do procedimento multiplicar.

# declaração do procedimento dividir.
dividir : nop
	
	jr $ra
# fim do procedimento dividir.

# declaração do procedimento sair.
sair : nop
	
	jr $ra
# fim do procedimento sair.

# declaração do procedimento print_menu.
print_menu:	nop		# imprimir menu.
		li $v0, 4	# carrega o valor da syscall para imprimir uma string. 
		la $a0, menu	# carrega a posição inicial da string em $a0.
		syscall		# chama o sistema para impressão.
		
		li $v0, 5	# carrega o valor da syscall para ler um inteiro. opção do menu.
		syscall		# chama o sistema para impressão.
		add $v1, $zero, $v0	# a opção selecionada vai estar em $v1.
		jr $ra		# retorna.
# fim do procedimento print_menu.

main:   nop			# programa principal.
	jal print_menu
				# imprimir a opção escolhida.	
	li $v0, 1		# carrega o valor da syscall para imprimir um inteiro.	
	add $s5, $zero, $v1	# carrega o valor a ser impresso.
	syscall			# chama o sistema para impressão.
	
L0:	bne   $s5, $zero, L1    # se k != 0, verifica se é igual a 1.
	jal somar
	j     fim_switch

L1:	addi $t1, $zero, 1	# comparar com 1.
	bne  $s5, $t1, L2	# se k != 1, verifica se é igual a 2
	jal subtrair
	j    fim_switch
	
L2:	addi $t1, $zero, 2	# comparar com 2.
	bne  $s5, $t1, L3	# se k != 2, vai para o default ou verifica para um L3.
	jal multiplicar
	j fim_switch

L3:	addi $t1, $zero, 3	# comparar com 3.
	bne  $s5, $t1, L4	# se k != 2, vai para o default ou verifica para um L3.
	jal dividir
	j fim_switch

L4:	addi $t1, $zero, 4	# comparar com 2.
	bne  $s5, $t1, fim_switch	# se k != 2, vai para o default ou verifica para um L3.
	jal sair
	j fim_switch
fim_switch:  nop
	
	
	
	
	
	
	
	
	# Terminar o programa.
	li $v0, 10		# carrega o valor da syscall para finalizar o programa (10).
	syscall			# chama o sistema para impressão.
