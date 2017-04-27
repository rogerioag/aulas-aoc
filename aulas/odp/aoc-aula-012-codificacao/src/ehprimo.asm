# ehprimo.asm
# #include<stdio.h>
#int ehprimo(int num){
#  int i, cont=0;
#  for(i = 1; i <= num; i++){
#	if(num % i == 0){
#         cont++;
#	}
#   }
#  return cont;
#}

#int main(){
#	int numero, aux = 0;

#	printf("Digite um número:");
#	scanf("%d",&numero);

#	aux  = ehprimo(numero);

#	if(aux == 2){
#		printf("É primo!\n");
#	}else{
#		printf("Não é primo!\n");
#	}
#	return 0;
#}

	.globl main
	.data
# int numero
numero:	.word 0
# int aux
aux:	.word 0

str_digite:	.asciiz "Digite um número:"
str_ehprimo:	.asciiz "É primo!"
str_nehprimo:	.asciiz "Não é primo!"

	.text
	j main

# função ehprimo.
#int ehprimo(int num){
# num= $a0
ehprimo: nop
#  int i, cont=0;
# i = $t0
# cont=$t1
addi $t1, $zero, 0
addi $t0, $zero, 1
#  for(i = 1; i <= num; i++){
loop_for: nop
	sgt $t2, $t0, $a0
	bne $t2, $zero, fim_for  
#	if(num % i == 0){
	rem $t3, $a0, $t0
	bne $t3, $zero, fim_if  
	# verdade
#         cont++;
	addi $t1, $t1, 1
#	}
	# fim if
fim_if: nop	
#   }
	addi $t0, $t0, 1
	j loop_for
fim_for:	
#  return cont;
   add $v0, $zero, $t1 
#}
      	jr   $ra            # retorna.
	
# programa principal.
main:	addi $sp, $sp, -4   # stack frame
      	sw   $ra, 0($sp)    # store $ra
      	
	# Imprimir a string solicitacao numero.
	# print_string é system call 4
	li $v0, 4
	# load no endereço da string a ser impressa.
	la $a0, str_digite
	syscall
	
	# Leitura de um inteiro.
	# read_int é system call 5
	li $v0, 5
	syscall
	# read_int retorna um valor, o resultado da syscall é colocado em $v0.
	# copia o valor lido para numero.
	sw $v0, numero
	
	lw   $a0, numero # carrega o numero para o argumento $a0.
	jal ehprimo
	sw   $v0, aux
	
	lw $t1, aux	# carrega o valor de aux para $t1.
	
	addi $t0, $0, 2	# carregando o valor 2 para comparar.
	
	bne $t1, $t0, else_nao_primo
	# é primo
	# print_string é system call 4
	li $v0, 4
	# load no endereço da string a ser impressa.
	la $a0, str_ehprimo
	syscall
	# print_char is system call 11 and '\n' is ASCII 10
	li $v0, 11
	li $a0, 10
	syscall
	j fim_if_primo
else_nao_primo:	nop
	# print_string é system call 4
	li $v0, 4
	# load no endereço da string a ser impressa.
	la $a0, str_nehprimo
	syscall
	# print_char is system call 11 and '\n' is ASCII 10
	li $v0, 11
	li $a0, 10
	syscall
fim_if_primo: nop

	lw   $ra, 0($sp)    # restaura $ra.
	addi $sp, $sp, 4    # restaura $sp.
      	# jr   $ra            # retorna para o SO.
	
	# exit system call...
	li $v0, 10
	syscall
