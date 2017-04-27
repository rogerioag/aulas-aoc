# Exemplo de Switch.
# exemplo-switch-2.asm

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
	
	.text
	j main

main:	addi $s5, $zero, 1  	# carrega um valor de k para testar.
	
L0:	bne   $s5, $zero, L1    # se k != 0, verifica se é igual a 1.
	add   $s0, $s3, $s4   	# k = 0 -> f = i + j
	j     fim_switch

L1:	addi $t1, $zero, 1	# comparar com 1.
	bne  $s5, $t1, L2	# se k != 1, verifica se é igual a 2
	add  $s0,$s1,$s2    	# k = 1 -> f = g + h
	j    fim_switch
	
L2:	addi $t1, $zero, 2	# comparar com 2.
	bne  $s5, $t1, default	# se k != 2, vai para o default ou verifica para um L3.
	nop
	j fim_switch

default: nop			# default.
	j fim_switch
fim_switch:  nop
