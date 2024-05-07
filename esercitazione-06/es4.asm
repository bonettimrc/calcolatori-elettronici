.data
str:	.asciiz "Valori calcolati:\n"
cnt_0:	.word 0

.text
coppie:
	addi $sp, $sp, -20	# Push
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $s3, 4($sp)
	sw $ra, 0($sp)

	move $s0, $a0		# V
	move $s1, $a1		# N

	lw $s2, cnt_0		# cnt=0

	la $a0, str		# printf("Valori calcolati:\n")
	li $v0, 4
	syscall

	li $s3, 0		# k=0

	for:
		bge $s3, $s1, done

		l~ $a0, $s3($s0)	# val = retta(V[k])
		jal retta

		move $a0, $v0		# printf("%d", val)
		li $v0, 1
		syscall

		addi $s2, $s2, 1

		j for
	done:
	move $v0, $s2		# return cnt

	lw $ra, 0($sp)		# Pop
	lw $s3, 4($sp)
	lw $s2, 8($sp)
	lw $s1, 12($sp)
	lw $s0, 16($sp)
	addi $sp, $sp, 20

