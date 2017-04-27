	.file	1 "teste-002.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.abicalls
	.text
	.align	2
	.globl	magica
	.set	nomips16
	.ent	magica
	.type	magica, @function
magica:
	.frame	$fp,24,$ra		# vars= 8, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$5,28($fp)
	sw	$6,32($fp)
	sw	$7,36($fp)
	sw	$0,8($fp)
	lw	$3,24($fp)
	lw	$2,28($fp)
	nop
	addu	$3,$3,$2
	lw	$4,32($fp)
	lw	$2,36($fp)
	nop
	addu	$2,$4,$2
	subu	$3,$3,$2
	lw	$2,40($fp)
	nop
	addu	$2,$3,$2
	sw	$2,8($fp)
	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$ra
	nop

	.set	macro
	.set	reorder
	.end	magica
	.size	magica, .-magica
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,64,$ra		# vars= 24, regs= 2/0, args= 24, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64
	sw		$ra,60($sp)
	sw		$fp,56($sp)
	move	$fp,$sp
	li		$2,2			# 0x2
	sw		$2,32($fp)
	li		$2,3			# 0x3
	sw		$2,36($fp)
	li		$2,4			# 0x4
	sw		$2,40($fp)
	li		$2,5			# 0x5
	sw		$2,44($fp)
	li		$2,6			# 0x6
	sw		$2,48($fp)
	sw		$0,52($fp)
	lw		$3,32($fp)
	nop
	move	$2,$3
	sll		$2,$2,1
	addu	$2,$2,$3
	sw		$2,32($fp)
	lw		$2,32($fp)
	nop
	addiu	$2,$2,-2
	sw		$2,32($fp)
	lw		$2,48($fp)
	nop
	sw		$2,16($sp)
	lw		$4,32($fp)
	lw		$5,36($fp)
	lw		$6,40($fp)
	lw		$7,44($fp)
	.option	pic0
	jal	magica
	nop

	.option	pic2
	sw		$2,52($fp)
	lw		$2,52($fp)
	nop
	addiu	$2,$2,2
	sw		$2,52($fp)
	move	$2,$0
	move	$sp,$fp
	lw		$ra,60($sp)
	lw		$fp,56($sp)
	addiu	$sp,$sp,64
	j		$ra
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.2"
