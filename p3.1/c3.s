.data
message: .asciiz "Enter a number\n"
newline: .asciiz "\n"
five: .word 5
four: .word 4
.text
main: 
    lw $t0, five
    lw $t1, four
    #get integer from user
    li $v0, 4
    la $a0, message
    syscall
    li $v0, 5
    syscall
    #save the first number to $s1
    move $s1, $v0
    #get second integer from the user
    li $v0, 4
    la $a0, message
    syscall
    li $v0, 5
    syscall
    #save the second number to $s2
    move $s2, $v0
    bgt $s1, $t1, aTrue	# if $s1 > four then target
    next:
        #branch if $s1 < five 
        blt $s2, $t0, bTrue
    compare:
        beq	$t3, $t4, case1
        j case2
        
aTrue:
    addi $t3, $zero, 1	#set "Truth value" to 1
    j next

bTrue:
    addi $t4, $zero, 1	#set "Truth value" to 1
    j compare
case1:
    sub $t5 , $s1, $s2
    #print int in t5
    li $v0, 1
    move $a0, $t5
    syscall
    #print newline
    li $v0, 4
    la $a0, newline
    syscall
    j end
case2:
    mul $t5, $s1, $s2
    #print int in t5
    li $v0, 1
    move $a0, $t5
    syscall
    #print newline
    li $v0, 4
    la $a0, newline
    syscall
    j end
end:
    #exit program
    li $v0, 10
    syscall
