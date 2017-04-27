	.file	"gemm.normalopt.ll"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4562146422526312448     # double 9.765625E-4
.LCPI0_1:
	.quad	4607182418800017408     # double 1
.LCPI0_2:
	.quad	4656886941445259264     # double 2123
.LCPI0_3:
	.quad	4674638556675702784     # double 32412
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
# BB#0:                                 # %entry
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	pushl	%esi
	subl	$44, %esp
	movl	$8, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1048576, (%esp)        # imm = 0x100000
	calll	polybench_alloc_data
	movl	%eax, %edi
	movl	%edi, -20(%ebp)         # 4-byte Spill
	movl	$8, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1048576, (%esp)        # imm = 0x100000
	calll	polybench_alloc_data
	movl	%eax, %ebx
	movl	$8, 8(%esp)
	movl	$0, 4(%esp)
	movl	$1048576, (%esp)        # imm = 0x100000
	xorl	%esi, %esi
	calll	polybench_alloc_data
	movl	%eax, -28(%ebp)         # 4-byte Spill
	xorps	%xmm2, %xmm2
	movsd	.LCPI0_0, %xmm0
	movsd	.LCPI0_1, %xmm1
	movl	%edi, %eax
	.align	16, 0x90
.LBB0_1:                                # %for.cond1.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movl	$1024, %ecx             # imm = 0x400
	movl	%eax, %edx
	xorps	%xmm3, %xmm3
	.align	16, 0x90
.LBB0_2:                                # %for.body3.i
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm2, %xmm4
	mulsd	%xmm3, %xmm4
	mulsd	%xmm0, %xmm4
	movsd	%xmm4, (%edx)
	addl	$8, %edx
	addsd	%xmm1, %xmm3
	decl	%ecx
	jne	.LBB0_2
# BB#3:                                 # %for.inc7.i
                                        #   in Loop: Header=BB0_1 Depth=1
	addl	$8192, %eax             # imm = 0x2000
	addsd	%xmm1, %xmm2
	incl	%esi
	cmpl	$1024, %esi             # imm = 0x400
	jne	.LBB0_1
# BB#4:
	xorl	%edx, %edx
	xorps	%xmm2, %xmm2
	movl	%ebx, %eax
	.align	16, 0x90
.LBB0_5:                                # %for.cond14.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	xorps	%xmm3, %xmm3
	movl	$1024, %ecx             # imm = 0x400
	movl	%eax, %esi
	.align	16, 0x90
.LBB0_6:                                # %for.body17.i
                                        #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm2, %xmm4
	mulsd	%xmm3, %xmm4
	mulsd	%xmm0, %xmm4
	movsd	%xmm4, (%esi)
	addl	$8, %esi
	addsd	%xmm1, %xmm3
	decl	%ecx
	jne	.LBB0_6
# BB#7:                                 # %for.inc28.i
                                        #   in Loop: Header=BB0_5 Depth=1
	addl	$8192, %eax             # imm = 0x2000
	addsd	%xmm1, %xmm2
	incl	%edx
	cmpl	$1024, %edx             # imm = 0x400
	jne	.LBB0_5
# BB#8:
	xorl	%edx, %edx
	xorps	%xmm2, %xmm2
	movl	-28(%ebp), %eax         # 4-byte Reload
	.align	16, 0x90
.LBB0_9:                                # %for.cond35.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
	xorps	%xmm3, %xmm3
	movl	$1024, %ecx             # imm = 0x400
	movl	%eax, %esi
	.align	16, 0x90
.LBB0_10:                               # %for.body38.i
                                        #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movaps	%xmm2, %xmm4
	mulsd	%xmm3, %xmm4
	mulsd	%xmm0, %xmm4
	movsd	%xmm4, (%esi)
	addl	$8, %esi
	addsd	%xmm1, %xmm3
	decl	%ecx
	jne	.LBB0_10
# BB#11:                                # %for.inc49.i
                                        #   in Loop: Header=BB0_9 Depth=1
	addl	$8192, %eax             # imm = 0x2000
	addsd	%xmm1, %xmm2
	incl	%edx
	cmpl	$1024, %edx             # imm = 0x400
	jne	.LBB0_9
# BB#12:
	xorl	%eax, %eax
	movsd	.LCPI0_2, %xmm0
	movsd	.LCPI0_3, %xmm1
	movl	%ebx, -16(%ebp)         # 4-byte Spill
	movl	%ebx, -36(%ebp)         # 4-byte Spill
	movl	-28(%ebp), %esi         # 4-byte Reload
	.align	16, 0x90
.LBB0_13:                               # %for.cond1.preheader.i8
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_14 Depth 2
                                        #       Child Loop BB0_15 Depth 3
	movl	%eax, -32(%ebp)         # 4-byte Spill
	movl	%eax, %ecx
	shll	$13, %ecx
	movl	%ecx, -24(%ebp)         # 4-byte Spill
	movl	-20(%ebp), %eax         # 4-byte Reload
	leal	(%eax,%ecx), %eax
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB0_14:                               # %for.body3.i10
                                        #   Parent Loop BB0_13 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_15 Depth 3
	movsd	(%eax), %xmm2
	mulsd	%xmm0, %xmm2
	movsd	%xmm2, (%eax)
	movl	-16(%ebp), %edi         # 4-byte Reload
	xorl	%edx, %edx
	.align	16, 0x90
.LBB0_15:                               # %for.body7.i
                                        #   Parent Loop BB0_13 Depth=1
                                        #     Parent Loop BB0_14 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	leal	(%esi,%edx), %ecx
	movsd	(%edi), %xmm3
	mulsd	%xmm1, %xmm3
	mulsd	(%ecx,%ebx,8), %xmm3
	addsd	%xmm3, %xmm2
	movsd	%xmm2, (%eax)
	addl	$8, %edi
	addl	$8192, %edx             # imm = 0x2000
	cmpl	$8388608, %edx          # imm = 0x800000
	jne	.LBB0_15
# BB#16:                                # %for.inc16.i
                                        #   in Loop: Header=BB0_14 Depth=2
	movl	-20(%ebp), %eax         # 4-byte Reload
	movl	-24(%ebp), %ecx         # 4-byte Reload
	leal	(%eax,%ecx), %eax
	leal	8(%eax,%ebx,8), %eax
	incl	%ebx
	cmpl	$1024, %ebx             # imm = 0x400
	jne	.LBB0_14
# BB#17:                                # %for.inc19.i
                                        #   in Loop: Header=BB0_13 Depth=1
	addl	$8192, -16(%ebp)        # 4-byte Folded Spill
                                        # imm = 0x2000
	movl	-32(%ebp), %eax         # 4-byte Reload
	incl	%eax
	cmpl	$1024, %eax             # imm = 0x400
	jne	.LBB0_13
# BB#18:                                # %kernel_gemm.exit
	cmpl	$43, 8(%ebp)
	movl	-28(%ebp), %esi         # 4-byte Reload
	jl	.LBB0_27
# BB#19:                                # %land.lhs.true
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	cmpb	$0, (%eax)
	jne	.LBB0_27
# BB#20:
	movl	$0, -24(%ebp)           # 4-byte Folded Spill
	xorl	%eax, %eax
	.align	16, 0x90
.LBB0_21:                               # %for.cond1.preheader.i1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_22 Depth 2
	movl	%eax, -32(%ebp)         # 4-byte Spill
	xorl	%ebx, %ebx
	movl	-20(%ebp), %esi         # 4-byte Reload
	.align	16, 0x90
.LBB0_22:                               # %for.body3.i2
                                        #   Parent Loop BB0_21 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24(%ebp), %ecx         # 4-byte Reload
	movsd	(%esi,%ecx,8), %xmm0
	movl	stderr, %eax
	movsd	%xmm0, 8(%esp)
	movl	%eax, (%esp)
	movl	$.L.str1, 4(%esp)
	leal	(%ecx,%ebx), %edi
	movl	%edi, %eax
	movl	$1717986919, %ecx       # imm = 0x66666667
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$3, %edx
	addl	%eax, %edx
	imull	$20, %edx, %eax
	movl	%eax, -16(%ebp)         # 4-byte Spill
	calll	fprintf
	cmpl	-16(%ebp), %edi         # 4-byte Folded Reload
	jne	.LBB0_24
# BB#23:                                # %if.then.i
                                        #   in Loop: Header=BB0_22 Depth=2
	movl	stderr, %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	calll	fputc
.LBB0_24:                               # %for.inc.i
                                        #   in Loop: Header=BB0_22 Depth=2
	addl	$8, %esi
	incl	%ebx
	cmpl	$1024, %ebx             # imm = 0x400
	jne	.LBB0_22
# BB#25:                                # %for.inc7.i7
                                        #   in Loop: Header=BB0_21 Depth=1
	addl	$1024, -24(%ebp)        # 4-byte Folded Spill
                                        # imm = 0x400
	movl	-32(%ebp), %eax         # 4-byte Reload
	incl	%eax
	cmpl	$1024, %eax             # imm = 0x400
	jne	.LBB0_21
# BB#26:                                # %print_array.exit
	movl	stderr, %eax
	movl	%eax, 4(%esp)
	movl	$10, (%esp)
	calll	fputc
	movl	-28(%ebp), %esi         # 4-byte Reload
.LBB0_27:                               # %if.end
	movl	-20(%ebp), %eax         # 4-byte Reload
	movl	%eax, (%esp)
	calll	free
	movl	-36(%ebp), %eax         # 4-byte Reload
	movl	%eax, (%esp)
	calll	free
	movl	%esi, (%esp)
	calll	free
	xorl	%eax, %eax
	addl	$44, %esp
	popl	%esi
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
.Ltmp0:
	.size	main, .Ltmp0-main

	.type	.L.str1,@object         # @.str1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str1:
	.asciz	 "%0.2lf "
	.size	.L.str1, 8


	.section	".note.GNU-stack","",@progbits
