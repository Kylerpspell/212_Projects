.data 
message: .asciiz "Enter a number"
newline: .asciiz "\n"

.text
main:
	li $v0, 4
	la $a0, message
	syscall

	la $a0, newline
	syscall

	li $v0, 6
	syscall
	
	li $v0, 2
	syscall

exit:
	li $v0, 10
	syscall
