li $t1, 0
label:
bge $t1, 10, esci
la $a0, ($t1)
li $v0, 1
syscall
addi $t1, $t1, 1
j label
esci: