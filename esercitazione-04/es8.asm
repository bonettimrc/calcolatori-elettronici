.data
str1: .asciiz "Inserire il valore di x: "
str2: .asciiz "y = "
newline: .asciiz "\n"
coeff: .word 5, -2, 3
.text
li $v0, 4
la $a0, str1
syscall
li $v0, 5
syscall
move $t0, $v0	#x
la $t1, coeff
mult $t0, 2($t1)
mflo $t2 	#coeff[2]*x
mult $t0, $t2
mflo $t2 	#coeff[2]*x*x
mult $t0, 1($t1)
mflo $t3	#coeff[1]*x
add $t2, $t2, $t3	#coeff[1]*x + coeff[2]*x*x
add $t2, 0($t1)	#y
li $v0, 4
la $a0, str1
syscall
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newline
syscall
