.data
str1: .asciiz "Inserire un valore intero: \n"
str2: .asciiz "Il numero " 
str3: .asciiz " e' divisibile per 6.\n"
str4: .asciiz " NON e' divisibile per 6.\n"

.text
la $a0, str1		# printf("Inserire un valore intero: \n")
li $v0, 4
syscall

li $v0, 5		# scanf("%d", &a)
syscall

move $a0, $v0		# div_6(a)
jal div_6

j esci			# return 0

div_6:
	addi $sp, $sp -4		# Push
	sw $ra, 0($sp)

	while:
		ble $a0, 0, done

		li $t1, 3
		div $a0, $t1
		mfhi $t0
		bnez $t0, non_divisibile
		jal div_2
		move $t2, $a0
		bne $v0, 1, non_divisibile
		la $a0, str2
		li $v0, 4
		syscall
		move $a0, $t2
	        li $v0, 1
		syscall
		la $a0, str3
		li $v0, 4
		syscall
		j fine
		non_divisibile:
		move $t2, $a0
		la $a0, str2
		li $v0, 4
		syscall
		move $a0, $t2
	        li $v0, 1
		syscall
		la $a0, str4
		li $v0, 4
		syscall
		fine:

		subi $a0, $t2, 1
		j while
	done:
	lw $ra, 0($sp)			# Pop
	addi $sp, $sp, 4

	jr $ra

div_2:
	li $t1, 2
	div $a0, $t1
	mfhi $t0
	bnez $t0, false
	li $v0, 1
	j fi
	false:
	li $v0, 0
	fi:
	jr $ra
esci:
