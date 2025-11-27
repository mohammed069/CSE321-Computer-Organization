.data
prompt_n:    .asciiz "Enter number of integers (n): "
prompt_num:  .asciiz "Enter integer: "
zero_msg:    .asciiz "Invalid n (must be > 0). Exiting.\n"
result_msg:  .asciiz "The average (integer) = "
newline:     .asciiz "\n"

.text
.globl main
main:
    li   $v0, 4
    la   $a0, prompt_n
    syscall

    li   $v0, 5
    syscall
    move $s0, $v0

    blez $s0, invalid_n

    li   $t0, 0
    li   $t1, 0

read_loop:
    li   $v0, 4
    la   $a0, prompt_num
    syscall

    li   $v0, 5
    syscall
    add  $t0, $t0, $v0

    addi $t1, $t1, 1
    blt  $t1, $s0, read_loop

    div  $t0, $s0
    mflo $t2

    li   $v0, 4
    la   $a0, result_msg
    syscall

    li   $v0, 1
    move $a0, $t2
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    li   $v0, 10
    syscall

invalid_n:
    li   $v0, 4
    la   $a0, zero_msg
    syscall

    li   $v0, 10
    syscall
