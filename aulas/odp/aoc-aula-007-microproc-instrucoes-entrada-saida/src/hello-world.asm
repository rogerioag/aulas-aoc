	.data						# seção de dados.
	str_hello:	.asciiz "Hello World!!"
	
	.text						# código.
	j main						# salta para o programa principal.
main:							# programa principal.
	
	# Imprimir a string.
	li $v0, 4			 		# print_string é system call 4.
	la $a0, str_hello			# load no endereço da string a ser impressa.
    syscall
    
    # Finalizar o programa.	
    li $v0, 10	               # carrega o valor da syscall 
                               # para finalizar o programa (10).
    syscall	