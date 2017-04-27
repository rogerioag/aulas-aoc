	.file	"hello.c"
	.section	.rodata
.LC0:
	.string	"hello, world"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$.LC0, %edi
	call	puts
	popq	%rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.3-9) 4.7.3"
	.section	.note.GNU-stack,"",@progbits
