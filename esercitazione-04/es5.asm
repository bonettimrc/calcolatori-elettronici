.data
str1: .asciiz "Inserire un numero intero positivo: "
str2: .asciiz "Il fattoriale del numero inserito vale "
.text
li $t1, 1 	#fact
li $v0, 4
la $a0, str1
syscall
li $v0, 5
syscall
move $t2, $v0	#num
li $t3, 2	#k
for:
bgt $t3, $t2, esci
mult $t1, $t3
mflo $t1
addi $t3, $t3, 1
j for
esci:
li $v0, 4
la $a0, str2
syscall
li $v0, 1
move $a0, $t1
syscall
