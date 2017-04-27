	.file	"sumvecs-seq.c"
	.section	.rodata
.LC1:
	.string	"\nA: "
.LC2:
	.string	"\nB: "
.LC3:
	.string	"\nC: "
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$64, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	atof
	fldl	.LC0
	fxch	%st(1)
	fucom	%st(1)
	fnstsw	%ax
	fstp	%st(1)
	sahf
	jae	.L2
	fnstcw	18(%esp)
	movzwl	18(%esp), %eax
	movb	$12, %ah
	movw	%ax, 16(%esp)
	fldcw	16(%esp)
	fistpq	48(%esp)
	fldcw	18(%esp)
	jmp	.L3
.L2:
	fldl	.LC0
	fsubrp	%st, %st(1)
	fstpl	24(%esp)
	fldl	24(%esp)
	fnstcw	18(%esp)
	movzwl	18(%esp), %eax
	movb	$12, %ah
	movw	%ax, 16(%esp)
	fldcw	16(%esp)
	fistpq	48(%esp)
	fldcw	18(%esp)
	movl	48(%esp), %eax
	movl	%eax, %ebx
	xorb	$0, %bh
	movl	52(%esp), %eax
	movl	%eax, %esi
	xorl	$-2147483648, %esi
	movl	%ebx, 48(%esp)
	movl	%esi, 52(%esp)
.L3:
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%eax, 48(%esp)
	movl	%edx, 52(%esp)
	movl	48(%esp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, 44(%esp)
	movl	48(%esp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, 40(%esp)
	movl	48(%esp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, 36(%esp)
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	inicializar
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	inicializar
	movl	$0, 56(%esp)
	movl	$0, 60(%esp)
	jmp	.L4
.L5:
	movl	56(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	36(%esp), %eax
	addl	%edx, %eax
	movl	56(%esp), %edx
	leal	0(,%edx,4), %ecx
	movl	44(%esp), %edx
	addl	%ecx, %edx
	flds	(%edx)
	movl	56(%esp), %edx
	leal	0(,%edx,4), %ecx
	movl	40(%esp), %edx
	addl	%ecx, %edx
	flds	(%edx)
	faddp	%st, %st(1)
	fstps	20(%esp)
	flds	20(%esp)
	fstps	(%eax)
	addl	$1, 56(%esp)
	adcl	$0, 60(%esp)
.L4:
	movl	56(%esp), %eax
	movl	60(%esp), %edx
	cmpl	52(%esp), %edx
	jb	.L5
	cmpl	52(%esp), %edx
	ja	.L8
	cmpl	48(%esp), %eax
	jb	.L5
.L8:
	movl	$.LC1, (%esp)
	call	printf
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	imprimir
	movl	$.LC2, (%esp)
	call	printf
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	imprimir
	movl	$.LC3, (%esp)
	call	printf
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	imprimir
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	free
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	free
	movl	36(%esp), %eax
	movl	%eax, (%esp)
	call	free
	movl	$0, %eax
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	inicializar
	.type	inicializar, @function
inicializar:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	12(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L10
.L11:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	call	rand
	movl	%eax, -40(%ebp)
	fildl	-40(%ebp)
	fstps	-36(%ebp)
	flds	-36(%ebp)
	fldt	.LC5
	fdivrp	%st, %st(1)
	fstps	-36(%ebp)
	flds	-36(%ebp)
	fstps	(%ebx)
	addl	$1, -16(%ebp)
	adcl	$0, -12(%ebp)
.L10:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	cmpl	-28(%ebp), %edx
	jb	.L11
	cmpl	-28(%ebp), %edx
	ja	.L9
	cmpl	-32(%ebp), %eax
	jb	.L11
.L9:
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	inicializar, .-inicializar
	.section	.rodata
.LC6:
	.string	"%f "
	.text
	.globl	imprimir
	.type	imprimir, @function
imprimir:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	12(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L14
.L15:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	flds	(%eax)
	fstpl	4(%esp)
	movl	$.LC6, (%esp)
	call	printf
	addl	$1, -16(%ebp)
	adcl	$0, -12(%ebp)
.L14:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	cmpl	-28(%ebp), %edx
	jb	.L15
	cmpl	-28(%ebp), %edx
	ja	.L13
	cmpl	-32(%ebp), %eax
	jb	.L15
.L13:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	imprimir, .-imprimir
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1138753536
	.align 16
.LC5:
	.long	0
	.long	-2147483648
	.long	16414
	.ident	"GCC: (Debian 4.7.1-7) 4.7.1"
	.section	.note.GNU-stack,"",@progbits
