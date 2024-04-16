.data
str1: .asciiz "Il risultato e' "
newline: .asciiz "\n"
a: .word 54
b_: .word 27
c: .word 148
.text
lw $t1, a
lw $t2, b_
lw $t3, c
mult $t1,$t2 
mflo $t4
add $t5, $t4, $t3
li $v0, 4
la $a0, str1
syscall
li $v0, 1
la $a0, ($t5)
syscall
li $v0, 4
la $a0, newline
syscall
