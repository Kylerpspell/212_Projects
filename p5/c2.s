.data
message: .asciiz "Enter a number"
newline: .asciiz "\n"
mh: .asciiz "made it here"

.text
main:
	li $v0, 4
	la $a0, message
	syscall
	la $a0, newline
	syscall

	li $v0, 5
	syscall

	move $a1, $v0
	j three_to_plus

three_to_plus:
	jal three_to
	mul $t1, $a1, 3
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j exit

three_to:
	#set i = 1
	li $t0, 1
	#set y = 3
	li $t1, 3
	while:
		li $v0, 1
		beq $a1, $t0, return
		mul $t1, $t1, 3
		addi $t0, $t0, 1
		j while
	
	return:
		move $a1, $t1
		jr $ra 


exit:
	li $v0, 10
	syscall
