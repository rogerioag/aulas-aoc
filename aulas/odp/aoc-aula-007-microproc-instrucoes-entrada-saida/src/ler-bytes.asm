# hello_world.asm
#########################################################
# Programa exemplo do uso das instruções de load e store.
# autor: rag
# 23/08/2016
#########################################################
	.data			# dados.
word0:	.word   0xABCDEF78
word1:	.word   0xF2F1AC07
word2:	.word   0x01EE2842
word3:	.word   0x40F30788
word4:	.word   0x00000000
word5:	.word   0x00000000
word6:	.word   0x00000000
word7:	.word   0x00000000
word8:	.word   0x00000000
word9:	.word   0x00000000
word10:	.word   0x00000000
word11:	.word   0x00000000
word12:	.word   0x00000000
	.align  4
	
	.text			# Código.
	j main			# salta para o programa principal (main).
	
main:   nop			# programa principal.
	
	la $s2, word0		# Exemplo do slide, o endereço de word0 está representando o início da memória: 0x10010000
	lw $s3, 4($s2)		# read memory word 1 into $s3. De 4 em 4 bytes. 1 x 4 = 4.
	
	addi $t4, $s3, 3
		
	sw $t4, 0xC($s2)  	# write $t4 to memory word 3
	sw $t4, 48($s2)  	# write $t4 to memory word 12

	la $s2, word0   	# Exemplo do slide, o endereço de word0 está representando o início da memória: 0x10010000
	lh $t7, 6($s2)  	# read memory half word 3 into $t7
	
	addi $t4, $0, 0xBBBB
	
	sh $t4, 14($s2)  	# write $t4 to memory halfword 7 (7x2)

	la $s2, word0   	# Exemplo do slide, o endereço de word0 está representando o início da memória.
	lb $s3, 2($s2)  	# Ajustei para $s2, pois o $0 não deixar ler (área do SO, protegida).
	
	addi $t7,$0,0xFF	# Colocando o valor FF no $t7 
	sb $t7, 10($s2)		# word2:	.word   0x01EE2842 -> 0x01FF2842
	
	la $s2, word1		# Carrega o endereço da word1.
	lb $s3, 0($s2)		# Carrega cada um dos bytes para os registradores.
	lb $s4, 1($s2)
	lb $s5, 2($s2)
	lb $s6, 3($s2)
	
	addi $s5,$s5,1		# Modificar o byte 2 de word 1.
	sb $s5, 2($s2)
	
	addi $s6,$0,0xFF000000	# Necessidade shift, teste comentando a linha do srl.
	srl $s6,$s6,24
	sb $s6, 3($s2)		# Verifique o que aconteceu com o 3o. byte de word1.
	
	
			# Finalizar o programa.	
	li $v0, 10	# carrega o valor da syscall para finalizar o programa (10).
	syscall		# chama o sistema.
