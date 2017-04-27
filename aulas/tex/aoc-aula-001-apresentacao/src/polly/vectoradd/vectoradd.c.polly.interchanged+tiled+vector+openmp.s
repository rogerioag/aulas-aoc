	.file	"vectoradd.c.polly.interchanged+tiled+vector+openmp.ll"
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
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
.Ltmp6:
	.cfi_offset %rbx, -56
.Ltmp7:
	.cfi_offset %r12, -48
.Ltmp8:
	.cfi_offset %r13, -40
.Ltmp9:
	.cfi_offset %r14, -32
.Ltmp10:
	.cfi_offset %r15, -24
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	movq	%rax, %rbx
	movq	%rbx, -88(%rbp)         # 8-byte Spill
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	movq	%rax, %r14
	movq	%r14, -96(%rbp)         # 8-byte Spill
	movl	$4096, %edi             # imm = 0x1000
	callq	malloc
	movq	%rax, -104(%rbp)        # 8-byte Spill
	movq	%rbx, -72(%rbp)
	leaq	-72(%rbp), %rsi
	movq	%r14, -64(%rbp)
	movl	$main.omp_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1024, %r8d             # imm = 0x400
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	-48(%rbp), %rdi
	leaq	-56(%rbp), %rsi
	movq	-72(%rbp), %r12
	movq	-64(%rbp), %r15
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_4
# BB#1:
	leaq	-56(%rbp), %r14
	.align	16, 0x90
.LBB0_2:                                # %omp.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_12 Depth 2
	movq	-56(%rbp), %rbx
	leaq	-1(%rbx), %rax
	movq	-48(%rbp), %r13
	cmpq	%rax, %r13
	jg	.LBB0_3
# BB#11:                                # %polly.loop_header.preheader.i
                                        #   in Loop: Header=BB0_2 Depth=1
	addq	$-2, %rbx
	.align	16, 0x90
.LBB0_12:                               # %polly.loop_header.i
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%r13d, %xmm0
	movss	%xmm0, -76(%rbp)        # 4-byte Spill
	callq	sinf
	mulss	%xmm0, %xmm0
	movss	%xmm0, (%r12,%r13,4)
	movss	-76(%rbp), %xmm0        # 4-byte Reload
	callq	cosf
	mulss	%xmm0, %xmm0
	movss	%xmm0, (%r15,%r13,4)
	cmpq	%rbx, %r13
	leaq	1(%r13), %r13
	jle	.LBB0_12
.LBB0_3:                                # %omp.checkNext.backedge.i
                                        #   in Loop: Header=BB0_2 Depth=1
	leaq	-48(%rbp), %rdi
	movq	%r14, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_2
.LBB0_4:                                # %main.omp_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	xorl	%r14d, %r14d
	movq	%rsp, %r15
	leaq	-32(%r15), %rsi
	movq	%rsi, %rsp
	movq	-88(%rbp), %rax         # 8-byte Reload
	movq	%rax, -32(%r15)
	movq	-96(%rbp), %rax         # 8-byte Reload
	movq	%rax, -24(%r15)
	movq	-104(%rbp), %rax        # 8-byte Reload
	movq	%rax, -16(%r15)
	movl	$main.omp_subfn1, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1024, %r8d             # imm = 0x400
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	-48(%rbp), %rdi
	leaq	-56(%rbp), %rsi
	movq	-16(%r15), %rbx
	movq	-32(%r15), %r12
	movq	-24(%r15), %r13
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_8
# BB#5:
	leaq	-56(%rbp), %r15
	.align	16, 0x90
.LBB0_6:                                # %omp.loadIVBounds.i7
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_14 Depth 2
	movq	-56(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-48(%rbp), %rcx
	cmpq	%rdx, %rcx
	jg	.LBB0_7
# BB#13:                                # %polly.loop_header.preheader.i10
                                        #   in Loop: Header=BB0_6 Depth=1
	decq	%rcx
	addq	$-2, %rax
	.align	16, 0x90
.LBB0_14:                               # %polly.loop_header.i15
                                        #   Parent Loop BB0_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	4(%r12,%rcx,4), %xmm0
	addss	4(%r13,%rcx,4), %xmm0
	movss	%xmm0, 4(%rbx,%rcx,4)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB0_14
.LBB0_7:                                # %omp.checkNext.backedge.i8
                                        #   in Loop: Header=BB0_6 Depth=1
	leaq	-48(%rbp), %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_6
.LBB0_8:                                # %main.omp_subfn1.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	xorps	%xmm0, %xmm0
	movq	-104(%rbp), %rbx        # 8-byte Reload
	.align	16, 0x90
.LBB0_9:                                # %9
                                        # =>This Inner Loop Header: Depth=1
	addss	(%rbx,%r14,4), %xmm0
	incq	%r14
	cmpq	$1024, %r14             # imm = 0x400
	jne	.LBB0_9
# BB#10:                                # %11
	mulss	.LCPI0_0(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.cst, %edi
	movb	$1, %al
	callq	printf
	movq	-88(%rbp), %rdi         # 8-byte Reload
	callq	free
	movq	-96(%rbp), %rdi         # 8-byte Reload
	callq	free
	movq	%rbx, %rdi
	callq	free
	xorl	%eax, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp11:
	.size	main, .Ltmp11-main
	.cfi_endproc

	.align	16, 0x90
	.type	main.omp_subfn,@function
main.omp_subfn:                         # @main.omp_subfn
	.cfi_startproc
# BB#0:                                 # %omp.setup
	pushq	%rbp
.Ltmp19:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp20:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp21:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp22:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp23:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp24:
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
.Ltmp25:
	.cfi_def_cfa_offset 80
.Ltmp26:
	.cfi_offset %rbx, -56
.Ltmp27:
	.cfi_offset %r12, -48
.Ltmp28:
	.cfi_offset %r13, -40
.Ltmp29:
	.cfi_offset %r14, -32
.Ltmp30:
	.cfi_offset %r15, -24
.Ltmp31:
	.cfi_offset %rbp, -16
	movq	(%rdi), %r12
	movq	8(%rdi), %r13
	leaq	16(%rsp), %rdi
	leaq	8(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB1_4
# BB#1:
	leaq	16(%rsp), %r14
	leaq	8(%rsp), %r15
	.align	16, 0x90
.LBB1_2:                                # %omp.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
	movq	8(%rsp), %rbx
	leaq	-1(%rbx), %rax
	movq	16(%rsp), %rbp
	cmpq	%rax, %rbp
	jg	.LBB1_3
# BB#5:                                 # %polly.loop_header.preheader
                                        #   in Loop: Header=BB1_2 Depth=1
	addq	$-2, %rbx
	.align	16, 0x90
.LBB1_6:                                # %polly.loop_header
                                        #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorps	%xmm0, %xmm0
	cvtsi2ssl	%ebp, %xmm0
	movss	%xmm0, 4(%rsp)          # 4-byte Spill
	callq	sinf
	mulss	%xmm0, %xmm0
	movss	%xmm0, (%r12,%rbp,4)
	movss	4(%rsp), %xmm0          # 4-byte Reload
	callq	cosf
	mulss	%xmm0, %xmm0
	movss	%xmm0, (%r13,%rbp,4)
	cmpq	%rbx, %rbp
	leaq	1(%rbp), %rbp
	jle	.LBB1_6
.LBB1_3:                                # %omp.checkNext.backedge
                                        #   in Loop: Header=BB1_2 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB1_2
.LBB1_4:                                # %omp.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp32:
	.size	main.omp_subfn, .Ltmp32-main.omp_subfn
	.cfi_endproc

	.align	16, 0x90
	.type	main.omp_subfn1,@function
main.omp_subfn1:                        # @main.omp_subfn1
	.cfi_startproc
# BB#0:                                 # %omp.setup
	pushq	%r15
.Ltmp39:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Ltmp40:
	.cfi_def_cfa_offset 24
	pushq	%r13
.Ltmp41:
	.cfi_def_cfa_offset 32
	pushq	%r12
.Ltmp42:
	.cfi_def_cfa_offset 40
	pushq	%rbx
.Ltmp43:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
.Ltmp44:
	.cfi_def_cfa_offset 64
.Ltmp45:
	.cfi_offset %rbx, -48
.Ltmp46:
	.cfi_offset %r12, -40
.Ltmp47:
	.cfi_offset %r13, -32
.Ltmp48:
	.cfi_offset %r14, -24
.Ltmp49:
	.cfi_offset %r15, -16
	movq	16(%rdi), %r12
	movq	(%rdi), %r13
	movq	8(%rdi), %rbx
	leaq	8(%rsp), %rdi
	leaq	(%rsp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_4
# BB#1:
	leaq	8(%rsp), %r14
	leaq	(%rsp), %r15
	.align	16, 0x90
.LBB2_2:                                # %omp.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_6 Depth 2
	movq	(%rsp), %rax
	leaq	-1(%rax), %rdx
	movq	8(%rsp), %rcx
	cmpq	%rdx, %rcx
	jg	.LBB2_3
# BB#5:                                 # %polly.loop_header.preheader
                                        #   in Loop: Header=BB2_2 Depth=1
	decq	%rcx
	addq	$-2, %rax
	.align	16, 0x90
.LBB2_6:                                # %polly.loop_header
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	4(%r13,%rcx,4), %xmm0
	addss	4(%rbx,%rcx,4), %xmm0
	movss	%xmm0, 4(%r12,%rcx,4)
	incq	%rcx
	cmpq	%rax, %rcx
	jle	.LBB2_6
.LBB2_3:                                # %omp.checkNext.backedge
                                        #   in Loop: Header=BB2_2 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB2_2
.LBB2_4:                                # %omp.exit
	callq	GOMP_loop_end_nowait
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.Ltmp50:
	.size	main.omp_subfn1, .Ltmp50-main.omp_subfn1
	.cfi_endproc

	.type	.cst,@object            # @.cst
	.section	.rodata,"a",@progbits
	.align	8
.cst:
	.asciz	 "final result: %f\n"
	.size	.cst, 18


	.section	".note.GNU-stack","",@progbits
