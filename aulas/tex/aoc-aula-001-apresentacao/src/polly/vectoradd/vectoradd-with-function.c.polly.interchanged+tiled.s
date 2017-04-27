	.file	"vectoradd-with-function.c.polly.interchanged+tiled.ll"
                                        # Start of file scope inline assembly
	.ident	"GCC: (Debian 4.6.4-5) 4.6.4 LLVM: 3.3svn"

                                        # End of file scope inline assembly
	.text
	.globl	vectorAdd
	.align	16, 0x90
	.type	vectorAdd,@function
vectorAdd:                              # @vectorAdd
	.cfi_startproc
# BB#0:                                 # %entry
	subq	$56, %rsp
.Ltmp1:
	.cfi_def_cfa_offset 64
	testb	%al, %al
	je	.LBB0_2
# BB#1:                                 # %entry
	movaps	%xmm0, -80(%rsp)
	movaps	%xmm1, -64(%rsp)
	movaps	%xmm2, -48(%rsp)
	movaps	%xmm3, -32(%rsp)
	movaps	%xmm4, -16(%rsp)
	movaps	%xmm5, (%rsp)
	movaps	%xmm6, 16(%rsp)
	movaps	%xmm7, 32(%rsp)
.LBB0_2:                                # %entry
	movq	%r9, -88(%rsp)
	movq	%r8, -96(%rsp)
	movq	%rcx, -104(%rsp)
	movq	%rdx, -112(%rsp)
	movq	%rsi, -120(%rsp)
	movq	%rdi, -128(%rsp)
	xorl	%eax, %eax
	.align	16, 0x90
.LBB0_3:                                # %3
                                        # =>This Inner Loop Header: Depth=1
	movq	a(%rip), %rcx
	movss	(%rcx,%rax,4), %xmm0
	movq	b(%rip), %rcx
	addss	(%rcx,%rax,4), %xmm0
	movq	c(%rip), %rcx
	movss	%xmm0, (%rcx,%rax,4)
	incq	%rax
	cmpq	$1024, %rax             # imm = 0x400
	jne	.LBB0_3
# BB#4:                                 # %return
	addq	$56, %rsp
	ret
.Ltmp2:
	.size	vectorAdd, .Ltmp2-vectorAdd
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI1_0:
	.long	981467136               # float 9.765625E-4
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp6:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Ltmp7:
	.cfi_def_cfa_offset 24
	pushq	%rax
.Ltmp8:
	.cfi_def_cfa_offset 32
.Ltmp9:
	.cfi_offset %rbx, -24
.Ltmp10:
	.cfi_offset %r14, -16
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	movq	%rax, %r14
	movq	%r14, a(%rip)
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	movq	%rax, b(%rip)
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	xorl	%ebx, %ebx
	movq	%rax, c(%rip)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_2:                                # %3.3_crit_edge
                                        #   in Loop: Header=BB1_1 Depth=1
	incq	%rbx
	movq	a(%rip), %r14
.LBB1_1:                                # %3
                                        # =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ebx, %xmm0
	movss	%xmm0, 4(%rsp)          # 4-byte Spill
	callq	sinf
	mulss	%xmm0, %xmm0
	movss	%xmm0, (%r14,%rbx,4)
	movss	4(%rsp), %xmm0          # 4-byte Reload
	callq	cosf
	mulss	%xmm0, %xmm0
	movq	b(%rip), %rax
	movss	%xmm0, (%rax,%rbx,4)
	cmpq	$1023, %rbx             # imm = 0x3FF
	jne	.LBB1_2
# BB#3:                                 # %5
	xorb	%al, %al
	callq	vectorAdd
	xorl	%eax, %eax
	xorps	%xmm0, %xmm0
	movq	c(%rip), %rcx
	.align	16, 0x90
.LBB1_4:                                # %6
                                        # =>This Inner Loop Header: Depth=1
	addss	(%rcx,%rax,4), %xmm0
	incq	%rax
	cmpq	$1024, %rax             # imm = 0x400
	jne	.LBB1_4
# BB#5:                                 # %8
	mulss	.LCPI1_0(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.cst, %edi
	movb	$1, %al
	callq	printf
	movq	a(%rip), %rdi
	callq	free
	movq	b(%rip), %rdi
	callq	free
	movq	c(%rip), %rdi
	callq	free
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	ret
.Ltmp11:
	.size	main, .Ltmp11-main
	.cfi_endproc

	.type	c,@object               # @c
	.comm	c,8,8
	.type	b,@object               # @b
	.comm	b,8,8
	.type	a,@object               # @a
	.comm	a,8,8
	.type	.cst,@object            # @.cst
	.section	.rodata,"a",@progbits
	.align	8
.cst:
	.asciz	 "final result: %f\n"
	.size	.cst, 18


	.section	".note.GNU-stack","",@progbits
