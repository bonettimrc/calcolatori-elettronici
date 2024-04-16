.data
x: .word 41
s: .asciiz "Hai vinto!\n"
.text
lw $t0, x
addi $t0, $t0, 1

bne $t0, 42, exit
li $v0, 4
la $a0, s
syscall
exit:
