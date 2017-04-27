# Exemplo de IF.
# exemplo-if-2.asm

# if(a < 10){  
#  b = 10;
#}
#else{
#  b = 15;
#}
# variáveis: a -> $s0 e b ->$s1 

	.data
	
	.text
	j main

main:	nop
    	addi $s0, $zero, 9	# coloca o valor 9 para $s0.
    	addi $t0, $s0, 10	# coloca o valor 10 em $t0.
    	bge  $t0, $s0, b_else	# Branch greater than or equal if(R[rs]>=R[rt]) PC=Label
b_if:	nop
	addi $s1, $zero, 10
       	j fim_if
b_else:	nop
	addi $s1, $zero, 15
fim_if:	nop
