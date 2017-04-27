	.file	"vectoradd.polly.interchanged+tiled+vector+openmp.ll"
	.text
	.globl	init_array
	.align	16, 0x90
	.type	init_array,@function
init_array:                             # @init_array
	.cfi_startproc
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
.Ltmp6:
	.cfi_offset %rbx, -32
.Ltmp7:
	.cfi_offset %r14, -24
	movq	stdout(%rip), %rcx
	movl	$.L.str, %edi
	movl	$28, %esi
	movl	$1, %edx
	callq	fwrite
	leaq	-24(%rbp), %rsi
	movl	$init_array.omp_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1024, %r8d             # imm = 0x400
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	-32(%rbp), %rdi
	leaq	-40(%rbp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_4
# BB#1:
	leaq	-32(%rbp), %r14
	leaq	-40(%rbp), %rbx
	.align	16, 0x90
.LBB0_2:                                # %omp.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	movq	-32(%rbp), %rax
	movq	-40(%rbp), %rcx
	leaq	-1(%rcx), %rdx
	cmpq	%rdx, %rax
	jg	.LBB0_3
# BB#5:                                 # %polly.loop_header.preheader.i
                                        #   in Loop: Header=BB0_2 Depth=1
	addq	$-2, %rcx
	decq	%rax
	.align	16, 0x90
.LBB0_6:                                # %polly.loop_header.i
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$1056964608, h_a+4(,%rax,4) # imm = 0x3F000000
	movl	$1056964608, h_b+4(,%rax,4) # imm = 0x3F000000
	incq	%rax
	cmpq	%rcx, %rax
	jle	.LBB0_6
.LBB0_3:                                # %omp.checkNext.backedge.i
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_2
.LBB0_4:                                # %init_array.omp_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp8:
	.size	init_array, .Ltmp8-init_array
	.cfi_endproc

	.globl	print_array
	.align	16, 0x90
	.type	print_array,@function
print_array:                            # @print_array
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp14:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp15:
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
.Ltmp16:
	.size	print_array, .Ltmp16-print_array
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
.Ltmp19:
	.cfi_def_cfa_offset 16
.Ltmp20:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp21:
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
.Ltmp22:
	.size	check_result, .Ltmp22-check_result
	.cfi_endproc

	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI3_0:
	.long	981467136               # float 9.765625E-4
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp26:
	.cfi_def_cfa_offset 16
.Ltmp27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp28:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
.Ltmp29:
	.cfi_offset %rbx, -32
.Ltmp30:
	.cfi_offset %r14, -24
	callq	init_array
	leaq	-24(%rbp), %rsi
	movl	$main.omp_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1024, %r8d             # imm = 0x400
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	-32(%rbp), %rdi
	leaq	-40(%rbp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_4
# BB#1:
	leaq	-32(%rbp), %r14
	leaq	-40(%rbp), %rbx
	.align	16, 0x90
.LBB3_2:                                # %omp.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_10 Depth 2
	movq	-32(%rbp), %rax
	movq	-40(%rbp), %rcx
	leaq	-1(%rcx), %rdx
	cmpq	%rdx, %rax
	jg	.LBB3_3
# BB#9:                                 # %polly.loop_header.preheader.i
                                        #   in Loop: Header=BB3_2 Depth=1
	addq	$-2, %rcx
	decq	%rax
	.align	16, 0x90
.LBB3_10:                               # %polly.loop_header.i
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	h_a+4(,%rax,4), %xmm0
	addss	h_b+4(,%rax,4), %xmm0
	movss	%xmm0, h_c+4(,%rax,4)
	incq	%rax
	cmpq	%rcx, %rax
	jle	.LBB3_10
.LBB3_3:                                # %omp.checkNext.backedge.i
                                        #   in Loop: Header=BB3_2 Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_2
.LBB3_4:                                # %main.omp_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	movq	stdout(%rip), %rcx
	movl	$.L.str1, %edi
	movl	$28, %esi
	movl	$1, %edx
	callq	fwrite
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB3_5:                                # =>This Inner Loop Header: Depth=1
	movq	stdout(%rip), %rdi
	movss	h_c(,%rbx,4), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str2, %esi
	movb	$1, %al
	movl	%ebx, %edx
	callq	fprintf
	incq	%rbx
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB3_5
# BB#6:
	xorps	%xmm1, %xmm1
	movq	$-4096, %rax            # imm = 0xFFFFFFFFFFFFF000
	.align	16, 0x90
.LBB3_7:                                # %print_array.exit
                                        # =>This Inner Loop Header: Depth=1
	addss	h_c+4096(%rax), %xmm1
	addq	$4, %rax
	jne	.LBB3_7
# BB#8:                                 # %check_result.exit
	movq	stdout(%rip), %rdi
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm1, %xmm0
	mulss	.LCPI3_0(%rip), %xmm1
	cvtss2sd	%xmm1, %xmm1
	movl	$.L.str3, %esi
	movb	$2, %al
	callq	fprintf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp31:
	.size	main, .Ltmp31-main
	.cfi_endproc

	.align	16, 0x90
	.type	init_array.omp_subfn,@function
init_array.omp_subfn:                   # @init_array.omp_subfn
	.cfi_startproc
# BB#0:                                 # %omp.setup
	pushq	%rbp
.Ltmp35:
	.cfi_def_cfa_offset 16
.Ltmp36:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp37:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
.Ltmp38:
	.cfi_offset %rbx, -32
.Ltmp39:
	.cfi_offset %r14, -24
	leaq	-24(%rbp), %rdi
	leaq	-32(%rbp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_4
# BB#1:
	leaq	-24(%rbp), %r14
	leaq	-32(%rbp), %rbx
	.align	16, 0x90
.LBB4_2:                                # %omp.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	leaq	-1(%rcx), %rdx
	cmpq	%rdx, %rax
	jg	.LBB4_3
# BB#5:                                 # %polly.loop_header.preheader
                                        #   in Loop: Header=BB4_2 Depth=1
	addq	$-2, %rcx
	decq	%rax
	.align	16, 0x90
.LBB4_6:                                # %polly.loop_header
                                        #   Parent Loop BB4_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$1056964608, h_a+4(,%rax,4) # imm = 0x3F000000
	movl	$1056964608, h_b+4(,%rax,4) # imm = 0x3F000000
	incq	%rax
	cmpq	%rcx, %rax
	jle	.LBB4_6
.LBB4_3:                                # %omp.checkNext.backedge
                                        #   in Loop: Header=BB4_2 Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_2
.LBB4_4:                                # %omp.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp40:
	.size	init_array.omp_subfn, .Ltmp40-init_array.omp_subfn
	.cfi_endproc

	.align	16, 0x90
	.type	main.omp_subfn,@function
main.omp_subfn:                         # @main.omp_subfn
	.cfi_startproc
# BB#0:                                 # %omp.setup
	pushq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 16
.Ltmp45:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp46:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
.Ltmp47:
	.cfi_offset %rbx, -32
.Ltmp48:
	.cfi_offset %r14, -24
	leaq	-24(%rbp), %rdi
	leaq	-32(%rbp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB5_4
# BB#1:
	leaq	-24(%rbp), %r14
	leaq	-32(%rbp), %rbx
	.align	16, 0x90
.LBB5_2:                                # %omp.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_6 Depth 2
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	leaq	-1(%rcx), %rdx
	cmpq	%rdx, %rax
	jg	.LBB5_3
# BB#5:                                 # %polly.loop_header.preheader
                                        #   in Loop: Header=BB5_2 Depth=1
	addq	$-2, %rcx
	decq	%rax
	.align	16, 0x90
.LBB5_6:                                # %polly.loop_header
                                        #   Parent Loop BB5_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	h_a+4(,%rax,4), %xmm0
	addss	h_b+4(,%rax,4), %xmm0
	movss	%xmm0, h_c+4(,%rax,4)
	incq	%rax
	cmpq	%rcx, %rax
	jle	.LBB5_6
.LBB5_3:                                # %omp.checkNext.backedge
                                        #   in Loop: Header=BB5_2 Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB5_2
.LBB5_4:                                # %omp.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp49:
	.size	main.omp_subfn, .Ltmp49-main.omp_subfn
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
