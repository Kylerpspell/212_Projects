.data
    weight: .float 10.0
    height: .float 73.0
    const: .float 703.0
    under: .float 18.5
    normal: .float 24.9
    newline: .asciiz "\n"
    uMessage: .asciiz "Underweight"
    nMessage: .asciiz "Normal weight"
    oMessage:  .asciiz "Overweight"

.text
main:
    #load the numbers
    l.s $f4, height
    l.s $f2, weight
    l.s $f10 const

    #do the math
    mul.s $f6, $f4, $f4
    div.s $f8, $f2, $f6
    mul.s $f8, $f8, $f10

    #underweight check
    l.s $f10, under
    c.le.s $f8, $f10
    bc1t pUnderweight

    #normalweight check
    l.s $f10, normal
    c.le.s $f8, $f10
    bc1t pNormalweight
    
    j pOverweight


pUnderweight:
    li $v0, 4
    la, $a0, uMessage
    syscall
    jal pNewline
    j end

pNormalweight:
    li $v0, 4
    la, $a0, nMessage
    syscall
    jal pNewline
    j end

pOverweight:
    li $v0, 4
    la, $a0, oMessage
    syscall
    jal pNewline
    j end

pNewline:
    li $v0, 4
    la $a0, newline
    syscall
    jr $ra

end:
    li $v0, 10
    syscall