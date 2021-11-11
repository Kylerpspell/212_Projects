.data
message: .asciiz "Enter a number"
newline: .asciiz "\n"
zeroDiv: .asciiz "Division by zero"
Result: .asciiz "Result: "
remainder: .asciiz "Remainder: "

.text 
main:
    #Get A
    jal printMess
    li $v0, 5
    syscall
    move $s0, $v0
    
    #Get B
    jal printMess
    li $v0, 5
    syscall
    move $s1, $v0

    #Get C
    jal printMess
    li $v0, 5
    syscall
    move $s2, $v0

    #S3 = a +  b^2
    mul $s3, $s1, $s1
    add $s3, $s3, $s0

    #S4 = c - a^2
    mul $s4, $s0, $s0
    sub $s4, $s2, $s4

    #check if s4 == 0
    beq $s4, $zero, divByZero

    
    div $s3, $s4
    mfhi $s6 #S6 = s3 % s4
    mflo $s5 #S5 = s3 / s4 

    #s7 = 3*B
    mul $s7, $s1, 3
    add $s7, $s5, $s7

    #print result
    li $v0, 4
    la $a0, Result
    syscall
    #print S7
    li $v0, 1
    move $a0, $s7
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    #print remainder
    li $v0, 4
    la $a0, remainder  
    syscall
    #print s6
    li $v0, 1
    move $a0, $s6
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    j exit

printMess:
    li $v0, 4
    la $a0, message
    syscall
    la $a0, newline
    syscall
    jr $ra

divByZero:
    li $v0, 4
    la $a0, zeroDiv
    syscall
    la $a0, newline
    syscall
    j exit


exit:
    li $v0, 10
    syscall
