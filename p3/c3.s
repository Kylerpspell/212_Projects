.data
numHW: .asciiz "Enter number of homeworks"
avgHWhrs: .asciiz "avg HW hrs"
numEX: .asciiz "Enter number of exersises"
avgEXhrs: .asciiz "avg HW hrs"
totalHours: .asciiz " Total Hours"
newline: .asciiz "\n"

.text
main:
    la $a0, numHW
    jal PrintAndRet
    move $s0, $v0

    la $a0, avgHWhrs
    jal PrintAndRet
    move $s1, $v0

    la $a0, numEX
    jal PrintAndRet
    move $s2, $v0

    la $a0, avgEXhrs
    jal PrintAndRet
    move $s3, $v0

    jal total
    
    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 4
    la $a0, totalHours
    syscall

    jal pNewline

    j end

PrintAndRet:
    li $v0, 4
    syscall
    move $t0, $ra
    jal pNewline

    li $v0, 5
	syscall
    jr $t0

pNewline:
    li $v0, 4
    la $a0, newline
    syscall
    jr $ra

getNum:
    mul $t2, $t0, $t1
    jr $ra

total:
    move $t4, $ra
    
    move $t0, $s0
    move $t1, $s1
    
    jal getNum
    move $t6, $t2
    
    move $t0, $s2
    move $t1, $s3

    jal getNum
    move $t7, $t2

    add $t5, $t6, $t7
    jr $t4


end:
    li $v0, 10
    syscall