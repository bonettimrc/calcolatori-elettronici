.data
str1: .asciiz "Inserisci un intero positivo:\n"
str2: .asciiz "La somma vale "
.text
li $v0, 4
la $a0, str1
syscall
li $v0, 5
syscall
la $t1, ($v0) 	# num
li $t2, 0	# sum
li $t3, 1	# count
for:
bgt $t3, $t1, esci
add $t2, $t2, $t3
addi $t3, $t3, 1
j for
esci:
li $v0, 4
la $a0, str2
syscall
li $v0, 1
la $a0, ($t2)
syscall