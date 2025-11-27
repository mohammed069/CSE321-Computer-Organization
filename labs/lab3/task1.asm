.data
prompt:     .asciiz "Enter n for Fibonacci: "
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

    move $t0, $v0

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall


    li $v0, 10
    syscall

fibo:
    beq $a0, $zero, fib_zero

    li $t1, 1
    beq $a0, $t1, fib_one

    li $t2, 0
    li $t3, 1

    li $t4, 2

fibo_loop:
    bgt $t4, $a0, fib_done

    add $t5, $t2, $t3

    move $t2, $t3
    move $t3, $t5

    addi $t4, $t4, 1

    j fibo_loop

fib_done:
    move $v0, $t3
    jr $ra

fib_zero:
    li $v0, 0
    jr $ra

fib_one:
    li $v0, 1
    jr $ra
