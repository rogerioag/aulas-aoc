# exemplo-entrada-saida.asm
#########################################################
# Programa exemplo de entrada e saída.
# autor: rag
# 23/08/2016
#########################################################
# Syscalls: http://courses.missouristate.edu/KenVollmar/mars/Help/SyscallHelp.html

# MIPS equivalent of the following C program:
#    #include <stdio.h>
#    int x;
#    int main (void) {
#        printf ("Digite um número : ");
#        scanf ("%d", &x);
#        printf ("Número digitado: %d\n", x);
#
#        return 0;
#    }
	.globl main	
	.data				# seção de dados.
	str_in:		.asciiz "Digite um número: "
	str_out:	.asciiz "Número digitado: "
	
	# int x
	numero:	.word 	0
	
	.text				# código.
	j main				# salta para o programa principal.
	
main:					# programa principal.
	
	addi $sp, $sp, -4   # stack frame
    sw   $ra, 0($sp)    # store $ra
						# Imprimir a string solicitacao numero.
	li $v0, 4			# print_string é system call 4
	la $a0, str_in		# load no endereço da string a ser impressa.
	syscall
						# Leitura de um inteiro.
	li $v0, 5			# read_int é system call 5
	syscall				# read_int retorna um valor, o resultado da syscall é colocado em $v0.
	sw $v0, numero		# copia o valor lido para x.
							
	li $v0, 11			# imprime a quebra de linha '\n'.
	li $a0, 10			# print_char é syscall 11 e '\n' is ASCII 10.
	syscall
						# imprimir a string do resultado.
						# print_str system call 4
	li $v0, 4
	la $a0, str_out
	syscall
	
	lw $t0, numero		# carrega o valor de z da memória para um registrador.
	add $a0, $0, $t0	# $a0 agora contem o valor de numero a ser impresso.
	li $v0, 1			# print integer syscall, $v0 = 1.			
	syscall	
	
	li $v0, 11			# now print the '\n'
	li $a0, 10			# print_char is syscall 11 and '\n' is ASCII 10
	syscall
	
	lw   $ra, 0($sp)    # restaura $ra.
	addi $sp, $sp, 4    # restaura $sp.
    # jr   $ra            # retorna para o SO.
	
	# exit system call...
	# li $v0, 10
	# syscall
				# Finalizar o programa.	
	li $v0, 10	# carrega o valor da syscall para finalizar o programa (10).
	syscall		
