   .text
main:
   teqi $t0, 0    	# dispara um trap porque $t0 contem 0.
   li   $v0, 10   	# Após o retorno do exception handler, sai do programa
   syscall		# término normal.

# Trap handler in the standard MIPS32 kernel text segment

   .ktext 0x80000180
   move $k0,$v0   	# Salva o valor de $v0
   move $k1,$a0   	# Salva o valor de $a0
   la   $a0, msg  	# endereço da string a ser impressa.
   li   $v0, 4    	# chamada de sistema para imprimir string.
   syscall
   move $v0,$k0   	# restaura $v0
   move $a0,$k1   	# restaura $a0
   mfc0 $k0,$14   	# Coprocessor 0 register $14 tem o endereço da instrução que fez o trap.
   addi $k0,$k0,4 	# Adiciona 4 para ir para o endereço da próxima instrução.
   mtc0 $k0,$14   	# Store o novo endereço de volta em $14
   eret           	# Error return; set PC para o valor de $14
   .kdata	
msg:   
   .asciiz "Trap generated"
