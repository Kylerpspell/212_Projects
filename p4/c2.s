.data
enter: .asciiz "Enter "
pro: .asciiz "Processor "
ic: .asciiz "Instruction Cout "
cpi: .asciiz "Clock Per Instruction "
cr: .asciiz "Clock Rate (In GHz)"

newline: .asciiz "\n"

.text
main:
    li $a1, 1
    jal getData

    #print out the data
    li $v0, 1
    move $a0, $t0
    syscall
    move $a0, $t1
    syscall
    move $a0, $t2
    syscall

    j exit

cpuTime: #calculate the cpu time (ic = $a0, cpi = $a1, cr = $a2)
    mul $t0, $a1, $a0
    div $t0, $a2
    mflo $t0
    jr $ra

getData: #obtains user input for ic, cpi and cr (processor num = $a1) (returns ic=$t0, cpi=$t1, cr=$t2)
    #Enter Processor 1 Instruction Count:
    li $v0, 4
    la $a0, enter
    syscall
    la $a0, pro
    move $a0, $a1
    syscall
    la $a0, ic
    syscall
    la $a0, newline
    syscall

    #Save to temp
    li $v0, 5
    syscall
    move $v0, $t0

    #Enter Processor 1 Clock per Instruction:
    li $v0, 4
    la $a0, enter
    syscall
    la $a0, pro
    move $a0, $a1
    syscall
    la $a0, cpi
    syscall
    la $a0, newline
    syscall

    #Save to temp
    li $v0, 5
    syscall
    move $v0, $t1

    #Enter Processor 1 Clock Rate:
    li $v0, 4
    la $a0, enter
    syscall
    la $a0, pro
    move $a0, $a1
    syscall
    la $a0, ic
    syscall
    la $a0, newline
    syscall

    #Save to temp
    li $v0, 5
    syscall
    move $v0, $t2

    jr $ra

exit:
    li $v0, 10
    syscall