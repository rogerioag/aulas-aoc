	.file	"vectoradd.polly.interchanged.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.long	1056964608              # float 5.000000e-01
	.long	1056964608              # float 5.000000e-01
	.long	1056964608              # float 5.000000e-01
	.long	1056964608              # float 5.000000e-01
	.text
	.globl	init_array
	.align	16, 0x90
	.type	init_array,@function
init_array:                             # @init_array
	.cfi_startproc
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp2:
	.cfi_def_cfa_offset 16
.Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp4:
	.cfi_def_cfa_register %rbp
	movq	stdout(%rip), %rcx
	movl	$.L.str, %edi
	movl	$28, %esi
	movl	$1, %edx
	callq	fwrite
	movq	$-4096, %rax            # imm = 0xFFFFFFFFFFFFF000
	movaps	.LCPI0_0(%rip), %xmm0
	.align	16, 0x90
.LBB0_1:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movaps	%xmm0, h_a+4096(%rax)
	movaps	%xmm0, h_a+4112(%rax)
	movaps	%xmm0, h_b+4096(%rax)
	movaps	%xmm0, h_b+4112(%rax)
	addq	$32, %rax
	jne	.LBB0_1
# BB#2:                                 # %polly.loop_exit
	popq	%rbp
	ret
.Ltmp5:
	.size	init_array, .Ltmp5-init_array
	.cfi_endproc

	.globl	print_array
	.align	16, 0x90
	.type	print_array,@function
print_array:                            # @print_array
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp9:
	.cfi_def_cfa_offset 16
.Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp11:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp12:
	.cfi_offset %rbx, -24
	movq	stdout(%rip), %rcx
	movl	$.L.str1, %edi
	movl	$28, %esi
	movl	$1, %edx
	callq	fwrite
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movq	stdout(%rip), %rdi
	movss	h_c(,%rbx,4), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str2, %esi
	movb	$1, %al
	movl	%ebx, %edx
	callq	fprintf
	incq	%rbx
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB1_1
# BB#2:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp13:
	.size	print_array, .Ltmp13-print_array
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI2_0:
	.long	981467136               # float 9.765625E-4
	.text
	.globl	check_result
	.align	16, 0x90
	.type	check_result,@function
check_result:                           # @check_result
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp16:
	.cfi_def_cfa_offset 16
.Ltmp17:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp18:
	.cfi_def_cfa_register %rbp
	xorps	%xmm1, %xmm1
	movq	$-4096, %rax            # imm = 0xFFFFFFFFFFFFF000
	.align	16, 0x90
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	addss	h_c+4096(%rax), %xmm1
	addq	$4, %rax
	jne	.LBB2_1
# BB#2:
	movq	stdout(%rip), %rdi
	cvtss2sd	%xmm1, %xmm0
	mulss	.LCPI2_0(%rip), %xmm1
	cvtss2sd	%xmm1, %xmm1
	movl	$.L.str3, %esi
	movb	$2, %al
	popq	%rbp
	jmp	fprintf                 # TAILCALL
.Ltmp19:
	.size	check_result, .Ltmp19-check_result
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI3_0:
	.long	1056964608              # float 5.000000e-01
	.long	1056964608              # float 5.000000e-01
	.long	1056964608              # float 5.000000e-01
	.long	1056964608              # float 5.000000e-01
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI3_1:
	.long	981467136               # float 9.765625E-4
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp23:
	.cfi_def_cfa_offset 16
.Ltmp24:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp25:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp26:
	.cfi_offset %rbx, -24
	movq	stdout(%rip), %rcx
	movl	$.L.str, %edi
	movl	$28, %esi
	movl	$1, %edx
	callq	fwrite
	movq	$-4096, %rax            # imm = 0xFFFFFFFFFFFFF000
	movaps	.LCPI3_0(%rip), %xmm0
	movq	$-4096, %rcx            # imm = 0xFFFFFFFFFFFFF000
	.align	16, 0x90
.LBB3_1:                                # %vector.body11
                                        # =>This Inner Loop Header: Depth=1
	movaps	%xmm0, h_a+4096(%rcx)
	movaps	%xmm0, h_a+4112(%rcx)
	movaps	%xmm0, h_b+4096(%rcx)
	movaps	%xmm0, h_b+4112(%rcx)
	addq	$32, %rcx
	jne	.LBB3_1
	.align	16, 0x90
.LBB3_2:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	movaps	h_a+4096(%rax), %xmm0
	movaps	h_a+4112(%rax), %xmm1
	addps	h_b+4096(%rax), %xmm0
	addps	h_b+4112(%rax), %xmm1
	movaps	%xmm0, h_c+4096(%rax)
	movaps	%xmm1, h_c+4112(%rax)
	addq	$32, %rax
	jne	.LBB3_2
# BB#3:                                 # %polly.loop_exit
	movq	stdout(%rip), %rcx
	movl	$.L.str1, %edi
	movl	$28, %esi
	movl	$1, %edx
	callq	fwrite
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB3_4:                                # =>This Inner Loop Header: Depth=1
	movq	stdout(%rip), %rdi
	movss	h_c(,%rbx,4), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str2, %esi
	movb	$1, %al
	movl	%ebx, %edx
	callq	fprintf
	incq	%rbx
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB3_4
# BB#5:
	xorps	%xmm1, %xmm1
	movq	$-4096, %rax            # imm = 0xFFFFFFFFFFFFF000
	.align	16, 0x90
.LBB3_6:                                # %print_array.exit
                                        # =>This Inner Loop Header: Depth=1
	addss	h_c+4096(%rax), %xmm1
	addq	$4, %rax
	jne	.LBB3_6
# BB#7:                                 # %check_result.exit
	movq	stdout(%rip), %rdi
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	mulss	.LCPI3_1(%rip), %xmm1
	cvtss2sd	%xmm1, %xmm1
	movl	$.L.str3, %esi
	movb	$2, %al
	callq	fprintf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp27:
	.size	main, .Ltmp27-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Initialize vectors on host:\n"
	.size	.L.str, 29

	.type	h_a,@object             # @h_a
	.comm	h_a,4096,16
	.type	h_b,@object             # @h_b
	.comm	h_b,4096,16
	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	"Printing the vector result:\n"
	.size	.L.str1, 29

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	"h_c[%d]: %f\n"
	.size	.L.str2, 13

	.type	h_c,@object             # @h_c
	.comm	h_c,4096,16
	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"Final Result: (%f, %f)\n"
	.size	.L.str3, 24


	.ident	"clang version 3.4.2 "
	.section	".note.GNU-stack","",@progbits
