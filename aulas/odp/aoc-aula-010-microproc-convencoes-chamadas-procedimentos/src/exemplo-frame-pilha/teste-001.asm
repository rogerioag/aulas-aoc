	.text
	.abicalls
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"teste-001.ll"
	.text
	.globl	magica
	.align	2
	.type	magica,@function
	.set	nomicromips
	.set	nomips16
	.ent	magica
magica:                                 # @magica
	.cfi_startproc
	.frame	$fp,32,$ra
	.mask 	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# BB#0:
	addiu	$sp, $sp, -32
$tmp0:
	.cfi_def_cfa_offset 32
	sw	$fp, 28($sp)            # 4-byte Folded Spill
$tmp1:
	.cfi_offset 30, -4
	move	 $fp, $sp
$tmp2:
	.cfi_def_cfa_register 30
	lw	$1, 48($fp)
	sw	$4, 24($fp)
	sw	$5, 20($fp)
	sw	$6, 16($fp)
	sw	$7, 12($fp)
	sw	$1, 8($fp)
	sw	$zero, 4($fp)
	lw	$1, 12($fp)
	lw	$2, 16($fp)
	addu	$1, $2, $1
	lw	$2, 20($fp)
	lw	$3, 24($fp)
	addu	$2, $3, $2
	subu	$1, $2, $1
	lw	$2, 8($fp)
	addu	$2, $1, $2
	sw	$2, 4($fp)
	move	 $sp, $fp
	lw	$fp, 28($sp)            # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 32
	.set	at
	.set	macro
	.set	reorder
	.end	magica
$tmp3:
	.size	magica, ($tmp3)-magica
	.cfi_endproc

	.globl	main
	.align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.cfi_startproc
	.frame	$fp,64,$ra
	.mask 	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# BB#0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -64
$tmp4:
	.cfi_def_cfa_offset 64
	sw	$ra, 60($sp)            # 4-byte Folded Spill
	sw	$fp, 56($sp)            # 4-byte Folded Spill
	sw	$16, 52($sp)            # 4-byte Folded Spill
$tmp5:
	.cfi_offset 31, -4
$tmp6:
	.cfi_offset 30, -8
$tmp7:
	.cfi_offset 16, -12
	move	 $fp, $sp
$tmp8:
	.cfi_def_cfa_register 30
	addu	$16, $2, $25
	sw	$zero, 48($fp)
	addiu	$1, $zero, 2
	sw	$1, 44($fp)
	addiu	$1, $zero, 3
	sw	$1, 40($fp)
	addiu	$1, $zero, 4
	sw	$1, 36($fp)
	addiu	$1, $zero, 5
	sw	$1, 32($fp)
	addiu	$1, $zero, 6
	sw	$1, 28($fp)
	sw	$zero, 24($fp)
	lw	$7, 32($fp)
	lw	$6, 36($fp)
	lw	$5, 40($fp)
	lw	$4, 44($fp)
	lw	$1, 28($fp)
	sw	$1, 16($sp)
	lw	$25, %call16(magica)($16)
	jalr	$25
	move	 $gp, $16
	lw	$1, %got($.str)($16)
	addiu	$4, $1, %lo($.str)
	sw	$2, 24($fp)
	lw	$25, %call16(printf)($16)
	move	 $5, $2
	jalr	$25
	move	 $gp, $16
	addiu	$2, $zero, 0
	move	 $sp, $fp
	lw	$16, 52($sp)            # 4-byte Folded Reload
	lw	$fp, 56($sp)            # 4-byte Folded Reload
	lw	$ra, 60($sp)            # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 64
	.set	at
	.set	macro
	.set	reorder
	.end	main
$tmp9:
	.size	main, ($tmp9)-main
	.cfi_endproc

	.type	$.str,@object           # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
$.str:
	.asciz	"%d\n"
	.size	$.str, 4


	.ident	"Debian clang version 3.5.0-10 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"
	.text
