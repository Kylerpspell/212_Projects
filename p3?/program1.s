#print a message to the console
.data
message: .asciiz "Enter a number\n"
message2: .asciiz "Enter a second number\n" 
newline: .asciiz "\n"
loopLen: .word 5
i: .word 0
.text
main:
	#load the loop length into a register
	lw $t4, loopLen
	#print the message
	li $v0, 4
	la $a0, message
	syscall
	#get the first number
	li $v0, 5
	syscall
	#store the first number in a register
	move $s1, $v0
	#print the second message
	li $v0, 4
	la $a0, message2
	syscall
	#get the second number
	li $v0, 5
	syscall
	#store the second number in a register
	move $s2, $v0
	#load i into $s0
	lw $s0, i
	#print a newline
	li $v0, 4
	la $a0, newline
	syscall

	#loop through i
	loop:
		#multiply i and the first number
		mul $t0, $s1, $s0
		#add the result to the second number
		add $t1, $t0, $s2
		#print the result
		li $v0, 1
		move $a0, $t1
		syscall
		#print newline
		li $v0, 4
		la $a0, newline
		syscall
		#increment i
		addi $s0, $s0, 1
		#check if i is less than 5
		blt $s0, $t4, loop
#exit
li $v0, 10
syscall
