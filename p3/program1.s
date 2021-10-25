.data
message: .asciiz "Enter a number"
newline: .asciiz "\n"

.text
main:
	jal Print

	li $v0, 5
	syscall
	#store the first number in a register
	move $s0, $v0
	#a=s0

	jal Print

	li $v0, 5
	syscall
	#store the second number in a register
	move $s1, $v0
	#b=s1

	jal Print

	li $v0, 5
	syscall
	#store the third number in a register
	move $s2, $v0
	#c=s2

	#check a is the biggest
	move $t1, $s0
	move $t2, $s1
	move $t3, $s2
	jal isGreaterThree
	beq $t0, 1, printA

	#check b is the biggest
	move $t1, $s1
	move $t2, $s0
	move $t3, $s2
	jal isGreaterThree
	beq $t0, 1, printB

	j printC
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall

	j end


Print: li $v0, 4
	la $a0, message
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra

isGreaterThree: li $t0, 0
	bgt $t1, $t2, next
	jr $ra

next: bgt $t1, $t3, Greater
	li $t0, 0
	jr $ra

Greater: li $t0, 1
	jr $ra


printA: li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j end

printB: li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j end

printC: li $v0, 1
	move $a0, $s2
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j end

end: li $v0, 10
	syscall