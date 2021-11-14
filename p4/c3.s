.data
array: .space 12
size: .word 3
newline: .asciiz "\n"

.text
main:
	lw $t1, size
	li $t0, 0
	while:
		beq $t0, $t1, end
		addi $t0, $t0, 1

		li $v0, 1
		move $a0, $t0
		syscall

		li $v0, 4
		la $a0, newline
		syscall

		j while
	end:

	j exit 	
exit:
	li $v0, 10
	syscall