	.file	"matmul.polly.interchanged+tiled+vector+openmp.ll"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4602678819172646912     # double 0.5
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$40, %rsp
.Ltmp6:
	.cfi_offset %rbx, -40
.Ltmp7:
	.cfi_offset %r14, -32
.Ltmp8:
	.cfi_offset %r15, -24
	leaq	-32(%rbp), %rsi
	movl	$init_array.omp_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1536, %r8d             # imm = 0x600
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	-40(%rbp), %rdi
	leaq	-48(%rbp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB0_4
# BB#1:
	leaq	-40(%rbp), %r14
	leaq	-48(%rbp), %r15
	.align	16, 0x90
.LBB0_2:                                # %omp.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #       Child Loop BB0_5 Depth 3
	movq	-40(%rbp), %rax
	movq	-48(%rbp), %rcx
	leaq	-1(%rcx), %rdx
	cmpq	%rdx, %rax
	jg	.LBB0_3
# BB#7:                                 # %polly.loop_preheader4.preheader.i
                                        #   in Loop: Header=BB0_2 Depth=1
	addq	$-2, %rcx
	.align	16, 0x90
.LBB0_8:                                # %polly.loop_preheader4.i
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_5 Depth 3
	xorl	%edx, %edx
	movsd	.LCPI0_0(%rip), %xmm1
	.align	16, 0x90
.LBB0_5:                                # %polly.loop_header3.i
                                        #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%edx, %ebx
	imull	%eax, %ebx
	movq	%rax, %rdi
	shlq	$11, %rdi
	leaq	(%rdi,%rdi,2), %rdi
	movl	%ebx, %esi
	sarl	$31, %esi
	shrl	$22, %esi
	addl	%ebx, %esi
	andl	$-1024, %esi            # imm = 0xFFFFFFFFFFFFFC00
	negl	%esi
	leal	1(%rbx,%rsi), %esi
	cvtsi2sdl	%esi, %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, A(%rdi,%rdx,4)
	movss	%xmm0, B(%rdi,%rdx,4)
	incq	%rdx
	cmpq	$1536, %rdx             # imm = 0x600
	jne	.LBB0_5
# BB#6:                                 # %polly.loop_exit5.i
                                        #   in Loop: Header=BB0_8 Depth=2
	cmpq	%rcx, %rax
	leaq	1(%rax), %rax
	jle	.LBB0_8
.LBB0_3:                                # %omp.checkNext.backedge.i
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB0_2
.LBB0_4:                                # %init_array.omp_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp9:
	.size	init_array, .Ltmp9-init_array
	.cfi_endproc

	.globl	print_array
	.align	16, 0x90
	.type	print_array,@function
print_array:                            # @print_array
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp13:
	.cfi_def_cfa_offset 16
.Ltmp14:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp15:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp16:
	.cfi_offset %rbx, -48
.Ltmp17:
	.cfi_offset %r12, -40
.Ltmp18:
	.cfi_offset %r14, -32
.Ltmp19:
	.cfi_offset %r15, -24
	movl	$C, %r14d
	xorl	%r15d, %r15d
	.align	16, 0x90
.LBB1_1:                                # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	movq	stdout(%rip), %rcx
	movq	%r14, %r12
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_2:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movss	(%r12), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str, %esi
	movb	$1, %al
	movq	%rcx, %rdi
	callq	fprintf
	movslq	%ebx, %rax
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$80, %ecx, %ecx
	subl	%ecx, %eax
	cmpl	$79, %eax
	jne	.LBB1_4
# BB#3:                                 #   in Loop: Header=BB1_2 Depth=2
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	callq	fputc
.LBB1_4:                                #   in Loop: Header=BB1_2 Depth=2
	incq	%rbx
	addq	$4, %r12
	cmpq	$1536, %rbx             # imm = 0x600
	movq	stdout(%rip), %rcx
	jne	.LBB1_2
# BB#5:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	$10, %edi
	movq	%rcx, %rsi
	callq	fputc
	incq	%r15
	addq	$6144, %r14             # imm = 0x1800
	cmpq	$1536, %r15             # imm = 0x600
	jne	.LBB1_1
# BB#6:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp20:
	.size	print_array, .Ltmp20-print_array
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp24:
	.cfi_def_cfa_offset 16
.Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp26:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
.Ltmp27:
	.cfi_offset %rbx, -40
.Ltmp28:
	.cfi_offset %r14, -32
.Ltmp29:
	.cfi_offset %r15, -24
	callq	init_array
	leaq	-32(%rbp), %rsi
	movl	$main.omp_subfn, %edi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$1536, %r8d             # imm = 0x600
	movl	$1, %r9d
	callq	GOMP_parallel_loop_runtime_start
	leaq	-40(%rbp), %rdi
	leaq	-48(%rbp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB2_4
# BB#1:
	leaq	-40(%rbp), %r14
	leaq	-48(%rbp), %r15
	.align	16, 0x90
.LBB2_2:                                # %omp.loadIVBounds.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_8 Depth 2
                                        #       Child Loop BB2_9 Depth 3
                                        #         Child Loop BB2_10 Depth 4
	movq	-40(%rbp), %rax
	movq	-48(%rbp), %r8
	leaq	-1(%r8), %rcx
	cmpq	%rcx, %rax
	jg	.LBB2_3
# BB#7:                                 # %polly.loop_preheader4.preheader.i
                                        #   in Loop: Header=BB2_2 Depth=1
	addq	$-2, %r8
	leaq	(%rax,%rax,2), %rcx
	shlq	$11, %rcx
	leaq	A(%rcx), %rcx
	.align	16, 0x90
.LBB2_8:                                # %polly.loop_preheader4.i
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_9 Depth 3
                                        #         Child Loop BB2_10 Depth 4
	xorl	%esi, %esi
	.align	16, 0x90
.LBB2_9:                                # %polly.loop_header3.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB2_10 Depth 4
	leaq	(%rax,%rax,2), %rdx
	shlq	$11, %rdx
	leaq	C(%rdx,%rsi,4), %rdi
	movl	$0, C(%rdx,%rsi,4)
	xorps	%xmm0, %xmm0
	movq	$-9437184, %rbx         # imm = 0xFFFFFFFFFF700000
	movq	%rcx, %rdx
	.align	16, 0x90
.LBB2_10:                               # %polly.loop_header10.i
                                        #   Parent Loop BB2_2 Depth=1
                                        #     Parent Loop BB2_8 Depth=2
                                        #       Parent Loop BB2_9 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movaps	%xmm0, %xmm1
	movss	(%rdx), %xmm0
	mulss	B+9437184(%rbx,%rsi,4), %xmm0
	addss	%xmm1, %xmm0
	addq	$4, %rdx
	addq	$6144, %rbx             # imm = 0x1800
	jne	.LBB2_10
# BB#5:                                 # %polly.loop_exit12.i
                                        #   in Loop: Header=BB2_9 Depth=3
	movss	%xmm0, (%rdi)
	incq	%rsi
	cmpq	$1536, %rsi             # imm = 0x600
	jne	.LBB2_9
# BB#6:                                 # %polly.loop_exit5.i
                                        #   in Loop: Header=BB2_8 Depth=2
	addq	$6144, %rcx             # imm = 0x1800
	cmpq	%r8, %rax
	leaq	1(%rax), %rax
	jle	.LBB2_8
.LBB2_3:                                # %omp.checkNext.backedge.i
                                        #   in Loop: Header=BB2_2 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB2_2
.LBB2_4:                                # %main.omp_subfn.exit
	callq	GOMP_loop_end_nowait
	callq	GOMP_parallel_end
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp30:
	.size	main, .Ltmp30-main
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI3_0:
	.quad	4602678819172646912     # double 0.5
	.text
	.align	16, 0x90
	.type	init_array.omp_subfn,@function
init_array.omp_subfn:                   # @init_array.omp_subfn
	.cfi_startproc
# BB#0:                                 # %omp.setup
	pushq	%rbp
.Ltmp34:
	.cfi_def_cfa_offset 16
.Ltmp35:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp36:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
.Ltmp37:
	.cfi_offset %rbx, -40
.Ltmp38:
	.cfi_offset %r14, -32
.Ltmp39:
	.cfi_offset %r15, -24
	leaq	-32(%rbp), %rdi
	leaq	-40(%rbp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB3_4
# BB#1:
	leaq	-32(%rbp), %r14
	leaq	-40(%rbp), %r15
	.align	16, 0x90
.LBB3_2:                                # %omp.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_8 Depth 2
                                        #       Child Loop BB3_5 Depth 3
	movq	-32(%rbp), %rax
	movq	-40(%rbp), %rcx
	leaq	-1(%rcx), %rdx
	cmpq	%rdx, %rax
	jg	.LBB3_3
# BB#7:                                 # %polly.loop_preheader4.preheader
                                        #   in Loop: Header=BB3_2 Depth=1
	addq	$-2, %rcx
	.align	16, 0x90
.LBB3_8:                                # %polly.loop_preheader4
                                        #   Parent Loop BB3_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_5 Depth 3
	xorl	%edx, %edx
	movsd	.LCPI3_0(%rip), %xmm1
	.align	16, 0x90
.LBB3_5:                                # %polly.loop_header3
                                        #   Parent Loop BB3_2 Depth=1
                                        #     Parent Loop BB3_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	%edx, %ebx
	imull	%eax, %ebx
	movq	%rax, %rdi
	shlq	$11, %rdi
	leaq	(%rdi,%rdi,2), %rdi
	movl	%ebx, %esi
	sarl	$31, %esi
	shrl	$22, %esi
	addl	%ebx, %esi
	andl	$-1024, %esi            # imm = 0xFFFFFFFFFFFFFC00
	negl	%esi
	leal	1(%rbx,%rsi), %esi
	cvtsi2sdl	%esi, %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, A(%rdi,%rdx,4)
	movss	%xmm0, B(%rdi,%rdx,4)
	incq	%rdx
	cmpq	$1536, %rdx             # imm = 0x600
	jne	.LBB3_5
# BB#6:                                 # %polly.loop_exit5
                                        #   in Loop: Header=BB3_8 Depth=2
	cmpq	%rcx, %rax
	leaq	1(%rax), %rax
	jle	.LBB3_8
.LBB3_3:                                # %omp.checkNext.backedge
                                        #   in Loop: Header=BB3_2 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB3_2
.LBB3_4:                                # %omp.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
.Ltmp47:
	.cfi_offset %rbx, -40
.Ltmp48:
	.cfi_offset %r14, -32
.Ltmp49:
	.cfi_offset %r15, -24
	leaq	-32(%rbp), %rdi
	leaq	-40(%rbp), %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	je	.LBB4_4
# BB#1:
	leaq	-32(%rbp), %r14
	leaq	-40(%rbp), %r15
	.align	16, 0x90
.LBB4_2:                                # %omp.loadIVBounds
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_8 Depth 2
                                        #       Child Loop BB4_9 Depth 3
                                        #         Child Loop BB4_10 Depth 4
	movq	-32(%rbp), %rax
	movq	-40(%rbp), %r8
	leaq	-1(%r8), %rcx
	cmpq	%rcx, %rax
	jg	.LBB4_3
# BB#7:                                 # %polly.loop_preheader4.preheader
                                        #   in Loop: Header=BB4_2 Depth=1
	addq	$-2, %r8
	leaq	(%rax,%rax,2), %rcx
	shlq	$11, %rcx
	leaq	A(%rcx), %rcx
	.align	16, 0x90
.LBB4_8:                                # %polly.loop_preheader4
                                        #   Parent Loop BB4_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB4_9 Depth 3
                                        #         Child Loop BB4_10 Depth 4
	xorl	%esi, %esi
	.align	16, 0x90
.LBB4_9:                                # %polly.loop_header3
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_8 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB4_10 Depth 4
	leaq	(%rax,%rax,2), %rdx
	shlq	$11, %rdx
	leaq	C(%rdx,%rsi,4), %rdi
	movl	$0, C(%rdx,%rsi,4)
	xorps	%xmm0, %xmm0
	movq	$-9437184, %rbx         # imm = 0xFFFFFFFFFF700000
	movq	%rcx, %rdx
	.align	16, 0x90
.LBB4_10:                               # %polly.loop_header10
                                        #   Parent Loop BB4_2 Depth=1
                                        #     Parent Loop BB4_8 Depth=2
                                        #       Parent Loop BB4_9 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movaps	%xmm0, %xmm1
	movss	(%rdx), %xmm0
	mulss	B+9437184(%rbx,%rsi,4), %xmm0
	addss	%xmm1, %xmm0
	addq	$4, %rdx
	addq	$6144, %rbx             # imm = 0x1800
	jne	.LBB4_10
# BB#5:                                 # %polly.loop_exit12
                                        #   in Loop: Header=BB4_9 Depth=3
	movss	%xmm0, (%rdi)
	incq	%rsi
	cmpq	$1536, %rsi             # imm = 0x600
	jne	.LBB4_9
# BB#6:                                 # %polly.loop_exit5
                                        #   in Loop: Header=BB4_8 Depth=2
	addq	$6144, %rcx             # imm = 0x1800
	cmpq	%r8, %rax
	leaq	1(%rax), %rax
	jle	.LBB4_8
.LBB4_3:                                # %omp.checkNext.backedge
                                        #   in Loop: Header=BB4_2 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	GOMP_loop_runtime_next
	testb	%al, %al
	jne	.LBB4_2
.LBB4_4:                                # %omp.exit
	callq	GOMP_loop_end_nowait
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp50:
	.size	main.omp_subfn, .Ltmp50-main.omp_subfn
	.cfi_endproc

	.type	A,@object               # @A
	.comm	A,9437184,16
	.type	B,@object               # @B
	.comm	B,9437184,16
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%lf "
	.size	.L.str, 5

	.type	C,@object               # @C
	.comm	C,9437184,16

	.ident	"Debian clang version 3.4.2-4 (tags/RELEASE_34/dot2-final) (based on LLVM 3.4.2)"
	.section	".note.GNU-stack","",@progbits
