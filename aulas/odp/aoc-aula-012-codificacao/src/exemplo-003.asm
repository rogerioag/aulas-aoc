# exemplo-003.asm
# MIPS equivalent of the following C program:
#    #include <stdio.h>
#    int x;		// Variáveis Globais
#    int y;
#    int z;   
#    
#    int soma(int a, int b) {
#    	return (a + b);
#    }
#    
#    void main (void) {
#        printf ("Digite um número : ");
#        scanf ("%d", &x);
#        printf ("\nDigite um número : ");
#        scanf ("%d", &y);
#        z = soma (x,y);
#        printf ("Soma dos números: %d\n", z);
#
#        return 0;
#    }
	.globl main
	.data
# int x
x:	.word 1
# int y
y:	.word 2
# int z
z:	.word 3

str_in:		.asciiz "Digite um número: "
str_out:	.asciiz "Soma dos números: "

	.text
	j main

# função de soma.
soma:	nop
	add  $v0, $a0, $a1  # $v0 = a + b.
      	jr   $ra            # retorna.
	
# programa principal.
main:	addi $sp, $sp, -4   # stack frame
      	sw   $ra, 0($sp)    # store $ra
	# Imprimir a string solicitacao numero.
	# print_string é system call 4
	li $v0, 4
	# load no endereço da string a ser impressa.
	la $a0, str_in
	syscall
	
	# Leitura de um inteiro.
	# read_int é system call 5
	li $v0, 5
	syscall
	# read_int retorna um valor, o resultado da syscall é colocado em $v0.
	# copia o valor lido para x.
	sw $v0, x
	
	# imprime a quebra de linha '\n'.
	# print_char é syscall 11 e '\n' is ASCII 10.
	li $v0, 11
	li $a0, 10
	syscall
	
	# Imprime solicitação de outro número.
	li $v0, 4
	# load no endereço da string a ser impressa.
	la $a0, str_in
	syscall
	
	# leitura de y.
	li $v0, 5
	syscall
	sw $v0, y
	
	# imprime a quebra de linha '\n'.
	# print_char é syscall 11 e '\n' is ASCII 10.
	li $v0, 11
	li $a0, 10
	syscall
		
	lw   $a0, x         # carrega x como argumento.
	lw   $a1, y         # carrega y como argumento.
	jal  soma           # call soma
	sw   $v0, z         # y = soma(x,y)
	
	# imprimir a string do resultado.
	# print_str system call 4
	li $v0, 4
	la $a0, str_out
	syscall
	
	# carrega o valor de z da memória para um registrador.
	lw $t0, z
	add $a0, $0, $t0
	# $a0 agora contem o valor de z a ser impresso.
	li $v0, 1
	syscall
	
	# now print the '\n'
	# print_char is system call 11 and '\n' is ASCII 10
	li $v0, 11
	li $a0, 10
	syscall
	
	lw   $ra, 0($sp)    # restaura $ra.
	addi $sp, $sp, 4    # restaura $sp.
      	jr   $ra            # retorna para o SO.
	
	# exit system call...
	# li $v0, 10
	# syscall
	
