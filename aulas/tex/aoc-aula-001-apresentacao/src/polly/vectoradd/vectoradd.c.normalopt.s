	.file	"vectoradd.c.normalopt.ll"
                                        # Start of file scope inline assembly
	.ident	"GCC: (Debian 4.6.4-5) 4.6.4 LLVM: 3.3svn"

                                        # End of file scope inline assembly
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI0_0:
	.long	981467136               # float 9.765625E-4
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp6:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp7:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp8:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp9:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp10:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp11:
	.cfi_def_cfa_offset 64
.Ltmp12:
	.cfi_offset %rbx, -48
.Ltmp13:
	.cfi_offset %r12, -40
.Ltmp14:
	.cfi_offset %r13, -32
.Ltmp15:
	.cfi_offset %r14, -24
.Ltmp16:
	.cfi_offset %r15, -16
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	movq	%rax, %r14
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	movq	%rax, %r15
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	movq	%rax, %r12
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB0_1:                                # %3
                                        # =>This Inner Loop Header: Depth=1
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ebx, %xmm0
	movss	%xmm0, 12(%rsp)         # 4-byte Spill
	callq	sinf
	mulss	%xmm0, %xmm0
	movss	%xmm0, (%r14,%rbx,4)
	movss	12(%rsp), %xmm0         # 4-byte Reload
	callq	cosf
	mulss	%xmm0, %xmm0
	movss	%xmm0, (%r15,%rbx,4)
	incq	%rbx
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %6
                                        # =>This Inner Loop Header: Depth=1
	movss	(%r14,%r13,4), %xmm0
	addss	(%r15,%r13,4), %xmm0
	movss	%xmm0, (%r12,%r13,4)
	incq	%r13
	cmpq	$1024, %r13             # imm = 0x400
	jne	.LBB0_2
# BB#3:
	xorl	%eax, %eax
	xorps	%xmm0, %xmm0
	.align	16, 0x90
.LBB0_4:                                # %9
                                        # =>This Inner Loop Header: Depth=1
	addss	(%r12,%rax,4), %xmm0
	incq	%rax
	cmpq	$1024, %rax             # imm = 0x400
	jne	.LBB0_4
# BB#5:                                 # %11
	mulss	.LCPI0_0(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.cst, %edi
	movb	$1, %al
	callq	printf
	movq	%r14, %rdi
	callq	free
	movq	%r15, %rdi
	callq	free
	movq	%r12, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.Ltmp17:
	.size	main, .Ltmp17-main
	.cfi_endproc

	.type	.cst,@object            # @.cst
	.section	.rodata,"a",@progbits
	.align	8
.cst:
	.asciz	 "final result: %f\n"
	.size	.cst, 18


	.section	".note.GNU-stack","",@progbits
