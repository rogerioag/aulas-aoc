	.file	"main.c.ll"
	.text
	.globl	funcA
	.align	16, 0x90
	.type	funcA,@function
funcA:                                  # @funcA
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp2:
	.cfi_def_cfa_offset 16
.Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp4:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	imull	-4(%rbp), %esi
	movl	%esi, -12(%rbp)
	movl	%esi, %eax
	popq	%rbp
	ret
.Ltmp5:
	.size	funcA, .Ltmp5-funcA
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp8:
	.cfi_def_cfa_offset 16
.Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp10:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$5, -8(%rbp)
	movl	$2, -12(%rbp)
	movl	-8(%rbp), %edi
	movl	$2, %esi
	callq	funcA
	movl	%eax, -16(%rbp)
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp11:
	.size	main, .Ltmp11-main
	.cfi_endproc


	.section	".note.GNU-stack","",@progbits
