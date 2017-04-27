	.file	"vectoradd.c"

	.ident	"GCC: (Debian 4.7.3-8) 4.7.3 LLVM: 3.4svn"


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
	subq	$480, %rsp
	testb	%al, %al
	movaps	%xmm7, -256(%rbp)
	movaps	%xmm6, -272(%rbp)
	movaps	%xmm5, -288(%rbp)
	movaps	%xmm4, -304(%rbp)
	movaps	%xmm3, -320(%rbp)
	movaps	%xmm2, -336(%rbp)
	movaps	%xmm1, -352(%rbp)
	movaps	%xmm0, -368(%rbp)
	movq	%rdi, -376(%rbp)
	movq	%r9, -384(%rbp)
	movq	%r8, -392(%rbp)
	movq	%rcx, -400(%rbp)
	movq	%rdx, -408(%rbp)
	movq	%rsi, -416(%rbp)
	je	.LBB0_14
	movaps	-368(%rbp), %xmm0
	movaps	%xmm0, -192(%rbp)
	movaps	-352(%rbp), %xmm1
	movaps	%xmm1, -176(%rbp)
	movaps	-336(%rbp), %xmm2
	movaps	%xmm2, -160(%rbp)
	movaps	-320(%rbp), %xmm3
	movaps	%xmm3, -144(%rbp)
	movaps	-304(%rbp), %xmm4
	movaps	%xmm4, -128(%rbp)
	movaps	-288(%rbp), %xmm5
	movaps	%xmm5, -112(%rbp)
	movaps	-272(%rbp), %xmm6
	movaps	%xmm6, -96(%rbp)
	movaps	-256(%rbp), %xmm7
	movaps	%xmm7, -80(%rbp)
.LBB0_14:
	movq	-384(%rbp), %rax
	movq	%rax, -200(%rbp)
	movq	-392(%rbp), %rcx
	movq	%rcx, -208(%rbp)
	movq	-400(%rbp), %rdx
	movq	%rdx, -216(%rbp)
	movq	-408(%rbp), %rsi
	movq	%rsi, -224(%rbp)
	movq	-416(%rbp), %rdi
	movq	%rdi, -232(%rbp)
	movq	-376(%rbp), %r8
	movq	%r8, -240(%rbp)
	movabsq	$400000, %rdi
	callq	malloc
	movabsq	$400000, %rdi
	movq	%rax, -424(%rbp)
	callq	malloc
	movabsq	$400000, %rdi
	movq	%rax, -432(%rbp)
	callq	malloc
	movl	$0, %ecx
	movq	%rax, -440(%rbp)
	movl	%ecx, -444(%rbp)
	jmp	.LBB0_3
.LBB0_2:
	movl	-448(%rbp), %eax
	movslq	%eax, %rcx
	shlq	$2, %rcx
	movq	-424(%rbp), %rdx
	movl	%eax, (%rdx,%rcx)
	movslq	%eax, %rcx
	shlq	$2, %rcx
	shll	$1, %eax
	movq	-432(%rbp), %rsi
	movl	%eax, (%rsi,%rcx)
	movl	-448(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -444(%rbp)
.LBB0_3:
	movl	-444(%rbp), %eax
	cmpl	$100000, %eax
	movl	%eax, -448(%rbp)
	jl	.LBB0_2
	movl	$0, %eax
	movl	%eax, -452(%rbp)
	jmp	.LBB0_6
.LBB0_5:
	movl	-456(%rbp), %eax
	movslq	%eax, %rcx
	shlq	$2, %rcx
	movslq	%eax, %rdx
	shlq	$2, %rdx
	movq	-424(%rbp), %rsi
	movl	(%rsi,%rdx), %edi
	movslq	%eax, %rdx
	shlq	$2, %rdx
	movq	-432(%rbp), %r8
	addl	(%r8,%rdx), %edi
	movq	-440(%rbp), %rdx
	movl	%edi, (%rdx,%rcx)
	addl	$1, %eax
	movl	%eax, -452(%rbp)
.LBB0_6:
	movl	-452(%rbp), %eax
	cmpl	$100000, %eax
	movl	%eax, -456(%rbp)
	jl	.LBB0_5
	movl	$0, %eax
	movl	%eax, %ecx
	movl	%ecx, -460(%rbp)
	movl	%eax, -464(%rbp)
	jmp	.LBB0_9
.LBB0_8:
	movl	-468(%rbp), %eax
	movslq	%eax, %rcx
	shlq	$2, %rcx
	movq	-440(%rbp), %rdx
	movl	(%rdx,%rcx), %esi
	movl	-472(%rbp), %edi
	addl	%edi, %esi
	addl	$1, %eax
	movl	%eax, -460(%rbp)
	movl	%esi, -464(%rbp)
.LBB0_9:
	movl	-464(%rbp), %eax
	movl	-460(%rbp), %ecx
	cmpl	$100000, %ecx
	movl	%eax, -472(%rbp)
	movl	%ecx, -468(%rbp)
	jl	.LBB0_8
	leaq	.cst, %rdi
	movl	$100000, %eax
	movl	-472(%rbp), %ecx
	movl	%eax, -476(%rbp)
	movl	%ecx, %eax
	cltd
	movl	-476(%rbp), %esi
	idivl	%esi
	movl	%eax, %esi
	movb	$0, %al
	callq	printf
	movq	-424(%rbp), %rdi
	movl	%eax, -480(%rbp)
	callq	free
	movq	-432(%rbp), %rdi
	callq	free
	movq	-440(%rbp), %rdi
	callq	free
	movl	$0, -52(%rbp)
	movl	-52(%rbp), %eax
	addq	$480, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.cst,@object
	.section	.rodata,"a",@progbits
	.align	8
.cst:
	.asciz	"final result: %f\n"
	.size	.cst, 18


	.section	".note.GNU-stack","",@progbits
