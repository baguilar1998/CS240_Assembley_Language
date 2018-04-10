.data
	prompt:		.asciiz "Enter in a number: "
	line:		.asciiz "\n"
	message1:	.asciiz	"2^"
	message2:	.asciiz " = "
.text
	main:
	
		li $v0,4
		la $a0,prompt
		syscall
		
		li $v0,5
		syscall
		
		jal exp
		move $s0,$v0
		
		li $v0,4
		la $a0,message1
		syscall
		
		li $v0,1
		move $a0,$s0
		syscall
		
		li $v0,4
		la $a0,message2
		syscall
		
		li $v0,1
		move $a0,$t0
		syscall
				
		li $v0,10
		syscall
		
	exp:
		beqz $v0,expEnd
		addi $sp,$sp,-8
		sw $ra,4($sp)
		sw $v0,0($sp)
		addi $v0,$v0,-1
		jal exp
		mult $t0,$t1
		mflo $t0
		lw $v0,0($sp)
		lw $ra,4($sp)
		addi $sp,$sp,8
		jr $ra
	
	expEnd:
		addi $t0,$t0,1
		addi $t1,$t1,2
		jr $ra
		
	newLine:
		la $v0,4
		la $a0,line
		syscall
		jr $ra
		
