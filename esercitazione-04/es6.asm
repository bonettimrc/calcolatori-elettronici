.data
str1: .asciiz "Inserire un numero intero positivo: "
str2: .asciiz "Il valore inserito non è valido."
str3: .asciiz "Il fattoriale del numero inserito vale "
.text
li $t0, 1	#fact
li $v0, 4
la $a0, str1
syscall
li $v0, 5
syscall
move $t1, $v0	#num

blt $t1, 0, then
bgt $t1, 12, then
li $t2, 2	#k
for:
bgt $t2, $t1, done
mult $t0, $t2
mflo $t0
addi $t2, $t2, 1
j for
done:
li $v0, 4
la $a0, str3
syscall
li $v0, 1
move $a0, $t0
syscall
j fi
then:
li $v0, 4
la $a0, str2
syscall
fi: