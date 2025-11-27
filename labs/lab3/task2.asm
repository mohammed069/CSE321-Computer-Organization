.data
prompt:     .asciiz "Enter n for Fibonacci (recursive): "
result_msg: .asciiz "Fibonacci = "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    jal fibo

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $v0
    syscall


    li $v0, 10
    syscall


fibo:
    addi $sp, $sp, -12
    sw   $ra, 8($sp)
    sw   $a0, 4($sp)

    beq  $a0, $zero, fib_zero

    li   $t1, 1
    beq  $a0, $t1, fib_one

    addi $a0, $a0, -1
    jal  fibo
    sw   $v0, 0($sp)

    lw   $a0, 4($sp)
    addi $a0, $a0, -2

    jal  fibo

    lw   $t0, 0($sp)
    add  $v0, $v0, $t0

    lw   $ra, 8($sp)
    addi $sp, $sp, 12
    jr   $ra

fib_zero:
    li   $v0, 0
    lw   $ra, 8($sp)
    addi $sp, $sp, 12
    jr   $ra

fib_one:
    li   $v0, 1
    lw   $ra, 8($sp)
    addi $sp, $sp, 12
    jr   $ra
