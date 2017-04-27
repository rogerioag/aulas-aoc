	.file	"matmul.polly.interchanged+tiled+vector.ll"
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
.Ltmp2:
	.cfi_def_cfa_offset 16
.Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp4:
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	movsd	.LCPI0_0(%rip), %xmm0
	.align	16, 0x90
.LBB0_1:                                # %polly.loop_preheader4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	xorl	%ecx, %ecx
	.align	16, 0x90
.LBB0_2:                                # %polly.loop_header3
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ecx, %edx
	imull	%eax, %edx
	movq	%rax, %rsi
	shlq	$11, %rsi
	leaq	(%rsi,%rsi,2), %rsi
	movl	%edx, %edi
	sarl	$31, %edi
	shrl	$22, %edi
	addl	%edx, %edi
	andl	$-1024, %edi            # imm = 0xFFFFFFFFFFFFFC00
	negl	%edi
	leal	1(%rdx,%rdi), %edx
	cvtsi2sdl	%edx, %xmm1
	mulsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, A(%rsi,%rcx,4)
	movss	%xmm1, B(%rsi,%rcx,4)
	incq	%rcx
	cmpq	$1536, %rcx             # imm = 0x600
	jne	.LBB0_2
# BB#3:                                 # %polly.loop_exit5
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	%rax
	cmpq	$1536, %rax             # imm = 0x600
	jne	.LBB0_1
# BB#4:                                 # %polly.loop_exit
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
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
.Ltmp12:
	.cfi_offset %rbx, -48
.Ltmp13:
	.cfi_offset %r12, -40
.Ltmp14:
	.cfi_offset %r14, -32
.Ltmp15:
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
.Ltmp16:
	.size	print_array, .Ltmp16-print_array
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI2_0:
	.quad	4602678819172646912     # double 0.5
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %polly.split_new_and_old
	pushq	%rbp
.Ltmp19:
	.cfi_def_cfa_offset 16
.Ltmp20:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp21:
	.cfi_def_cfa_register %rbp
	xorl	%r8d, %r8d
	movsd	.LCPI2_0(%rip), %xmm0
	movl	$A, %r9d
	xorl	%edx, %edx
	.align	16, 0x90
.LBB2_2:                                # %polly.loop_preheader4.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	xorl	%esi, %esi
	.align	16, 0x90
.LBB2_3:                                # %polly.loop_header3.i
                                        #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%esi, %eax
	imull	%edx, %eax
	movq	%rdx, %rdi
	shlq	$11, %rdi
	leaq	(%rdi,%rdi,2), %rdi
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$22, %ecx
	addl	%eax, %ecx
	andl	$-1024, %ecx            # imm = 0xFFFFFFFFFFFFFC00
	negl	%ecx
	leal	1(%rax,%rcx), %eax
	cvtsi2sdl	%eax, %xmm1
	mulsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, A(%rdi,%rsi,4)
	movss	%xmm1, B(%rdi,%rsi,4)
	incq	%rsi
	cmpq	$1536, %rsi             # imm = 0x600
	jne	.LBB2_3
# BB#1:                                 # %polly.loop_exit5.i
                                        #   in Loop: Header=BB2_2 Depth=1
	incq	%rdx
	cmpq	$1536, %rdx             # imm = 0x600
	jne	.LBB2_2
	.align	16, 0x90
.LBB2_5:                                # %polly.loop_preheader4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_6 Depth 2
                                        #       Child Loop BB2_7 Depth 3
	xorl	%edx, %edx
	.align	16, 0x90
.LBB2_6:                                # %polly.loop_header3
                                        #   Parent Loop BB2_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_7 Depth 3
	leaq	(%r8,%r8,2), %rax
	shlq	$11, %rax
	leaq	C(%rax,%rdx,4), %rsi
	movl	$0, C(%rax,%rdx,4)
	xorps	%xmm0, %xmm0
	movq	$-9437184, %rdi         # imm = 0xFFFFFFFFFF700000
	movq	%r9, %rcx
	.align	16, 0x90
.LBB2_7:                                # %polly.loop_header10
                                        #   Parent Loop BB2_5 Depth=1
                                        #     Parent Loop BB2_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movaps	%xmm0, %xmm1
	movss	(%rcx), %xmm0
	mulss	B+9437184(%rdi,%rdx,4), %xmm0
	addss	%xmm1, %xmm0
	addq	$4, %rcx
	addq	$6144, %rdi             # imm = 0x1800
	jne	.LBB2_7
# BB#8:                                 # %polly.loop_exit12
                                        #   in Loop: Header=BB2_6 Depth=2
	movss	%xmm0, (%rsi)
	incq	%rdx
	cmpq	$1536, %rdx             # imm = 0x600
	jne	.LBB2_6
# BB#4:                                 # %polly.loop_exit5
                                        #   in Loop: Header=BB2_5 Depth=1
	incq	%r8
	addq	$6144, %r9              # imm = 0x1800
	cmpq	$1536, %r8              # imm = 0x600
	jne	.LBB2_5
# BB#9:                                 # %polly.loop_exit
	xorl	%eax, %eax
	popq	%rbp
	ret
.Ltmp22:
	.size	main, .Ltmp22-main
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
