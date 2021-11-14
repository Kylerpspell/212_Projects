.data
enter: .asciiz "Enter "
pro: .asciiz "Processor "
ic: .asciiz "Instruction Count "
cpi: .asciiz "Clock Per Instruction "
cr: .asciiz "Clock Rate (In GHz)"
one: .asciiz "1 "
two: .asciiz "2 "
newline: .asciiz "\n"
Eq: .asciiz "Processor A and Processor B have the same CPU time"
is: .asciiz "is "
faster: .asciiz " times faster than "


.text
main:
	la $a1, one
	jal	prompt
	jal CPUTime
	mov.s $f4, $f1

	la $a1, two
	jal prompt
	jal CPUTime
	mov.s $f5, $f1

	c.eq.s $f4, $f5
	bc1t equal

	c.lt.s $f4, $f5
	bc1t A
	j B
	
prompt: #num in a1
	move $t0, $ra
	jal enterpro

	#Instruction count
	li $v0, 4
	la $a0, ic
	syscall

	la $a0, newline
	syscall

	li $v0, 6
	syscall
	mov.s $f1, $f0

	jal enterpro

	#CPI
	li $v0, 4
	la $a0, cpi
	syscall

	la $a0, newline
	syscall

	li $v0, 6
	syscall
	mov.s $f2, $f0

	jal enterpro

	#Cr
	li $v0, 4
	la $a0, cr
	syscall

	la $a0, newline
	syscall

	li $v0, 6
	syscall
	mov.s $f3, $f0

	jr $t0

enterpro:
	#ENTER
	li $v0, 4
	la $a0, enter
	syscall

	#PROCESSOR
	la $a0, pro
	syscall

	#Num
	li $v0, 4
	move $a0, $a1
	syscall
	
	jr $ra

CPUTime:
	mul.s $f1, $f1, $f2
	div.s $f1, $f1, $f3
	jr $ra

equal:
	li $v0, 4
	la $a0, Eq
	syscall
	j exit

A:
	li $v0, 4
	la $a0, pro
	syscall

	la $a0, one
	syscall

	la $a0, is
	syscall

	li $v0,2
	div.s $f1, $f5, $f4
	mov.s $f12, $f1
	syscall

	li $v0, 4
	la $a0, faster
	syscall

	la $a0, pro
	syscall

	la $a0, two
	syscall

	la $a0, newline
	syscall
	
	j exit

B:
	li $v0, 4
	la $a0, pro
	syscall

	la $a0, two
	syscall

	la $a0, is
	syscall

	li $v0,2
	div.s $f1, $f4, $f5
	mov.s $f12, $f1
	syscall

	li $v0, 4
	la $a0, faster
	syscall


	la $a0, pro
	syscall

	la $a0, one
	syscall
	
	j exit


exit:
	li $v0, 10
	syscall