.data
prompt:     .asciiz "Enter an integer: "
result_msg: .asciiz "The average of the four numbers = "

.text
main:
    li $t0, 0 
    li $t1, 4   

read_loop:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    add $t0, $t0, $v0

    addi $t1, $t1, -1
    bgtz $t1, read_loop

    li $t2, 4
    div $t0, $t2
    mflo $t3               

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
