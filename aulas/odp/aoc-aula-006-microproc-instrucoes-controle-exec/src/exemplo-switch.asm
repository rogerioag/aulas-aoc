# Exemplo de Switch.
# exemplo-switch.asm

# switch (k) {
#    case 0:  f = f + j; 
#             break;
#    case 1:  f = g + h; 
#             break;
#}
# Solução: supor que $t2 tenha 2 e f..k = $s0..$s5, respectivamente.
# $s0 -> f
# $s1 -> g 
# $s2 -> h
# $s3 -> i
# $s4 -> j
# $s5 -> k

	.data
tabela: .space 8	# aloca 8 bytes, duas palavras para os dois endereços.
	
	.text
	j main

main:	la $t0, L0
	la $t1, tabela
	sw $t0,0($t1)
	la $t0, L1
	sw $t0,4($t1)
	
	addi $t2, $zero, 2 # $t2 <- 2 (limite superior).

	addi $s5, $zero, 0 # valor de k.
	# Testa os limites 0 < k < 2.
	slt    $t3,$s5,$zero       # teste se k < 0
	bne    $t3,$zero,Exit      # se k < 0 vá para Exit

	slt    $t3,$s5,$t2         # teste se k < 2
	beq    $t3,$zero,Exit      # se k>=2 vá para Exit

	add    $t1,$s5,$s5         # $t1 = 2 * k
	add    $t1,$t1,$t1         # $t1 = 4 * k 

	# assumindo que 4 palavras na memória, começando no endereço contido em $t4, 
	# tem endereçamento correspondente a L0, L1, L2

	la $t4, tabela

	add    $t1,$t1,$t4         # $t1 = endereço de tabela[k]
	lw     $t0,0($t1)          # $t0 = tabela[k]
	jr     $t0                 # salto para endereço carregado em $t0

L0:	add   $s0,$s3,$s4   # k = 0 -> f = i + j
	j     Exit

L1:	add   $s0,$s1,$s2   # k = 1 -> f = g + h
	
Exit:  nop