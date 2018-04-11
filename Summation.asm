.data
	prompt: .asciiz "Enter in a number: "
	message: .asciiz "The sum is: "
	userInput: .word 0
.text
main:
	li $v0,4
	la $a0,prompt
	syscall
	
	li $v0,5
	syscall

	
	jal addNum
	
	li $v0,4
	la $a0,message
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
	
	li $v0,10
	syscall
	
addNum:
	beqz $v0,addNumEnd
	addi $sp,$sp,-8
	sw $ra,0($sp)
	sw $v0,4($sp)
	addi $v0,$v0,-1
	jal addNum
	lw $v0,4($sp)
	add $t0,$t0,$v0
	lw $ra,0($sp)
	addi $sp,$sp,8
	jr $ra
	
addNumEnd:
	addi $t0,$t0,0
	jr $ra
	
