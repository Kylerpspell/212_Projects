.data
	arr: .space 100
	startLoop: .asciiz "Loop Begins\n"
	endLoop: .asciiz "Loop Ends\n"
	newline: .asciiz "\n"
	index: .word 0
	length: .word 5
.text
main:
	lw $t0, index
	lw $t1, length
	#Print startLoop
	li $v0, 4
	la $a0, startLoop
	syscall

	#registers for math
	addi $t5 , $zero, 2
	addi $t6 , $zero, 4
	addi $t7 , $zero, 8
	la $s0 , arr
	loop:
		move $t2, $zero
		move $t3, $zero
		mul $t2, $t5, $t0
		sub $s3, $t6, $t0
		#offsetValue
		mul $t4, $t3, $t7
		sw $s3, arr($t4)
		#Increment index
		addi $t0, $t0, 2
		#branch if index equal to length
		blt $t0, $t1, loop
		#Print endLoop
		li $v0, 4
		la $a0, endLoop
		syscall
		#end program
		li $v0, 10
		syscall
