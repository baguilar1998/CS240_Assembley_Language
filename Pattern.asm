.data
	prompt: .asciiz "Enter in a number: "
	star:	.asciiz "*"
	line:	.asciiz "\n"
.text
	main:
		li $v0,4
		la $a0,prompt
		syscall
	
		li $v0,5
		syscall

		move $t0,$v0
		add $t1,$zero,$t1
		
		loop1P1:
			beqz $t0,end
			 loop2:
			 	beq $t0,$t1,loop1P2
			 	jal starPrint
			 	addi $t1,$t1,1
			 	j loop2
		loop1P2:
			jal newLine
			addi $t0,$t0,-1
			move $t1,$zero
			j loop1P1
			
	end:
		li $v0,10
		syscall
		
		
	starPrint:
		li $v0,4
		la $a0,star
		syscall
		jr $ra
			
	newLine:
		li $v0,4
		la $a0,line
		syscall
		jr $ra
