.data 
message: .asciiz "Enter a number"
newline: .asciiz "\n"

.text
main:
	#get b
	li $v0, 4
	la $a0, message
	syscall

	la $a0, newline
	syscall

	li $v0, 5
	syscall

	move $s1, $v0
	#get a
	li $v0, 4
	la $a0, message
	syscall

	la $a0, newline
	syscall

	li $v0, 5
	syscall
	move $s2, $v0

	move $t0,$zero 
	jal bitcheck
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j exit

bitcheck:
    andi $t2,$s2,1
    beq $t2,$zero,shift
    addu $t0,$t0,$s1 
shift:
    sll $s1,$s1,1     
    srl $s2,$s2,1     
    bne $s2,$zero,bitcheck
jr $ra

exit:
	li $v0, 10
	syscall
