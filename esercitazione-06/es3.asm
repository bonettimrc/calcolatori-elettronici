.data
str1: .asciiz "Il cubo di "
str2: .asciiz " vale "
str3: .asciiz "\n"
.text

main:
	jal display
	j fine

display:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	for:
		bgt $s0, 10, done

		move $a0, $s0
		jal cube
		move $t0, $v0

		la $a0, str1
		li $v0, 4
		syscall

		move $a0, $s0
		li $v0, 1
		syscall

		la $a0, str2
		li $v0, 4
		syscall

		move $a0, $t0
		li $v0, 1
		syscall

		la $a0, str3
		li $v0, 4
		syscall

		addi $s0, $s0, 1
		j for
	done:

	lw $ra, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 8
	jr $ra

cube:
	mul $t0, $a0, $a0
	mul $v0, $t0, $a0
	jr $ra

fine:
