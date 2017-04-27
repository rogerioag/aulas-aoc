# Exemplo de procedimento recursivo.
# exemplo-proc.rec.asm
# unsigned long int fatorial(unsigned long int n){
#  unsigned long int fat;
#  if(n == 0) fat = 1;
#  else
#   if(n > 0) fat = n * fatorial(n-1);
#  	printf(" fatorial(%d) = %d\n", n, fat);
#  return(fat);
#}
#
	.data
	
	.text
	j main			# salta para o prog. principal.
	
# função fatorial.
fat:    addi $sp, $sp, -8    	 # cria espaço para empilhar.
	    sw   $a0, 4($sp)     	 # store $a0
	    sw   $ra, 0($sp)     	 # store $ra
        addi $t0, $0, 2    
        slt  $t0, $a0, $t0  	# a <= 1 ?
        beq  $t0, $0, else  	# não: go to else  
        addi $v1, $0, 1     	# sim: retorna 1
        addi $sp, $sp, 8    	# restaura $sp
        jr   $ra              	# retorna
else:  	addi $a0, $a0, -1   	# n = n - 1
        jal  fat         	    # chamada recursiva de fat.
        lw   $ra, 0($sp)     	# restaura $ra
        lw   $a0, 4($sp)     	# restaura $a0
        addi $sp, $sp, 8     	# restaura $sp
        mul  $v1, $a0, $v1  	# n * fat(n-1), multiplica o valor atual pelo retorno da função.
        jr   $ra              	# retorno.
	
main:	nop			            # parametros para a função.
        addi $a0, $zero, 5	    # arg1
			
    	jal fat
    				            # impressão.
    	li $v0, 1		        # carrega o valor da syscall para imprimir um inteiro (1).
        add $a0, $v1, $zero  	# valor a ser impresso deve estar em $a0.
    	syscall
    	
    	