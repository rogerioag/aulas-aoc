	.file	"hello.c"

	.ident	"GCC: (Debian 4.7.3-4) 4.7.3 LLVM: 3.4svn"


	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:
	.cfi_startproc
	pushq	%rbp
.Ltmp2:
	.cfi_def_cfa_offset 16
.Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp4:
	.cfi_def_cfa_register %rbp
	subq	$384, %rsp
	testb	%al, %al
	movaps	%xmm7, -208(%rbp)
	movaps	%xmm6, -224(%rbp)
	movaps	%xmm5, -240(%rbp)
	movaps	%xmm4, -256(%rbp)
	movaps	%xmm3, -272(%rbp)
	movaps	%xmm2, -288(%rbp)
	movaps	%xmm1, -304(%rbp)
	movaps	%xmm0, -320(%rbp)
	movq	%rdi, -328(%rbp)
	movq	%r9, -336(%rbp)
	movq	%r8, -344(%rbp)
	movq	%rcx, -352(%rbp)
	movq	%rdx, -360(%rbp)
	movq	%rsi, -368(%rbp)
	je	.LBB0_4
	movaps	-320(%rbp), %xmm0
	movaps	%xmm0, -144(%rbp)
	movaps	-304(%rbp), %xmm1
	movaps	%xmm1, -128(%rbp)
	movaps	-288(%rbp), %xmm2
	movaps	%xmm2, -112(%rbp)
	movaps	-272(%rbp), %xmm3
	movaps	%xmm3, -96(%rbp)
	movaps	-256(%rbp), %xmm4
	movaps	%xmm4, -80(%rbp)
	movaps	-240(%rbp), %xmm5
	movaps	%xmm5, -64(%rbp)
	movaps	-224(%rbp), %xmm6
	movaps	%xmm6, -48(%rbp)
	movaps	-208(%rbp), %xmm7
	movaps	%xmm7, -32(%rbp)
.LBB0_4:
	movq	-336(%rbp), %rax
	movq	%rax, -152(%rbp)
	movq	-344(%rbp), %rcx
	movq	%rcx, -160(%rbp)
	movq	-352(%rbp), %rdx
	movq	%rdx, -168(%rbp)
	movq	-360(%rbp), %rsi
	movq	%rsi, -176(%rbp)
	movq	-368(%rbp), %rdi
	movq	%rdi, -184(%rbp)
	movq	-328(%rbp), %r8
	movq	%r8, -192(%rbp)
	leaq	.cst, %rdi
	callq	puts
	movl	%eax, -372(%rbp)
	movl	-4(%rbp), %eax
	addq	$384, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.cst,@object
	.section	.rodata,"a",@progbits
	.align	8
.cst:
	.asciz	"hello, world"
	.size	.cst, 13


	.section	".note.GNU-stack","",@progbits
