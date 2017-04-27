	.file	"hello.c"

	.ident	"GCC: (Debian 4.7.3-9) 4.7.3 LLVM: 3.3.1"


	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:
	subq	$184, %rsp
	testb	%al, %al
	je	.LBB0_2
	movaps	%xmm0, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
	movaps	%xmm2, 80(%rsp)
	movaps	%xmm3, 96(%rsp)
	movaps	%xmm4, 112(%rsp)
	movaps	%xmm5, 128(%rsp)
	movaps	%xmm6, 144(%rsp)
	movaps	%xmm7, 160(%rsp)
.LBB0_2:
	movq	%r9, 40(%rsp)
	movq	%r8, 32(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rdi, (%rsp)
	movl	$.cst, %edi
	callq	puts
	addq	$184, %rsp
	ret
.Ltmp0:
	.size	main, .Ltmp0-main

	.type	.cst,@object
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	8
.cst:
	.asciz	 "hello, world"
	.size	.cst, 13


	.section	".note.GNU-stack","",@progbits
