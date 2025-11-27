.data
prompt:      .asciiz "Enter a number (1-3): "
msg1:        .asciiz "Case 1 selected\n"
msg2:        .asciiz "Case 2 selected\n"
msg3:        .asciiz "Case 3 selected\n"
msg_default: .asciiz "Invalid choice\n"

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0


    li $t1, 1
    beq $t0, $t1, case1

    li $t1, 2
    beq $t0, $t1, case2

    li $t1, 3
    beq $t0, $t1, case3

    j default_case


case1:
    li $v0, 4
    la $a0, msg1
    syscall
    j end_program

case2:
    li $v0, 4
    la $a0, msg2
    syscall
    j end_program

case3:
    li $v0, 4
    la $a0, msg3
    syscall
    j end_program

default_case:
    li $v0, 4
    la $a0, msg_default
    syscall

end_program:
    li $v0, 10
    syscall
