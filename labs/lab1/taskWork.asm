.data

name:    .asciiz "Name:   Mohammed ElShafey\n"
id:      .asciiz "ID:     20812022100229\n"
course:  .asciiz "Course: CSE321 - Computer Organization\n"

.text
main:

    # Print name
    li $v0, 4
    la $a0, name
    syscall

    # Print ID
    li $v0, 4
    la $a0, id
    syscall

    # Print course
    li $v0, 4
    la $a0, course
    syscall

    # Exit program
    li $v0, 10
    syscall
