.data
str1: .asciiz "i = "
str2: .asciiz ", j = "
newline: .asciiz "\n"
.text
li $t0, 0	#i
for1:
bge $t0, 2, done1
li $t1, 0	#j
for2:
bge $t1, 4, done2
li $v0, 4
la $a0, str1
syscall
li $v0, 1
move $a0, $t0
syscall
li $v0, 4
la $a0, str2
syscall
li $v0, 1
move $a0, $t1
syscall
li $v0, 4
la $a0, newline
syscall
addi $t1, $t1, 1
j for2
done2:
addi $t0, $t0, 1
j for1
done1: