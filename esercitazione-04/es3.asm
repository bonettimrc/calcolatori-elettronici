.data
str1: .asciiz "Il valore della variabile j e' "
newline: .asciiz "\n"
.text
li $t0, 0	#j
label:
li $v0, 4
la $a0, str1
syscall
li $v0, 1
la $a0, ($t0)
syscall
li $v0, 4
la $a0, newline
syscall
addi $t0, $t0, 1
ble $t0, 3, label
