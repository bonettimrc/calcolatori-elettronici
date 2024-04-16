.data
x: .word 2
s: .asciiz "y = "
n: .asciiz "\n"

.text
lw $t0, x

bge $t0, 6, maggiore #if(x>=6) maggiore
j minore

maggiore:
addi $t1, $zero,6 #y=0+6
j exit

minore:
add $t1, $zero, $t0 #y=0+x

exit:
# printf("y = ")
li $v0, 4
la $a0, s
syscall
# printf("%d", y)
li $v0, 1
add $a0, $zero, $t1
syscall
# printf("\n")
li $v0, 4
la $a0, n
syscall