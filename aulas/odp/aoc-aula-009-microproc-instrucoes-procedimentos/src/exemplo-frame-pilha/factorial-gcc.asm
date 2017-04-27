	.file	1 "fatorial.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.abicalls
	.text
	.align	2
	.globl	factorial
	.set	nomips16
	.ent	factorial
	.type	factorial, @function
factorial:
	.frame	$fp,32,$ra		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw		$ra,28($sp)
	sw		$fp,24($sp)
	move	$fp,$sp
	sw		$a0,32($fp)
	lw		$v0,32($fp)
	nop
	slt		$v0,$v0,2		# Set on less than.
	beq		$v0,$0,$L2
	nop

	li		$v0,1			# 0x1 return 1.
	.option	pic0
	j		$L3
	nop

	.option	pic2
$L2:						# n > 1
	lw		$v0,32($fp)
	nop
	addiu	$v0,$v0,-1
	move	$a0,$v0
	.option	pic0
	jal		factorial
	nop

	.option	pic2
	move	$v1,$v0
	lw		$v0,32($fp)
	nop
	mult	$v1,$v0
	mflo	$v0
$L3:
	move	$sp,$fp
	lw		$ra,28($sp)
	lw		$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$ra
	nop

	.set	macro
	.set	reorder
	.end	factorial
	.size	factorial, .-factorial
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$ra		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw		$ra,36($sp)
	sw		$fp,32($sp)
	move	$fp,$sp
	sw		$0,24($fp)
	li		$a0,5			# 0x5
	.option	pic0
	jal		factorial
	nop

	.option	pic2
	sw		$v0,24($fp)
	lw		$v0,24($fp)
	move	$sp,$fp
	lw		$ra,36($sp)
	lw		$fp,32($sp)
	addiu	$sp,$sp,40
	jr		$ra
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.2"
