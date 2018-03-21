.data
	prompt:	.asciiz "Which number in the Fibonnacci Sequence do you want ? "
	message:  .asciiz "The number you asked for is "
.text
	main:
		#Prompts the user to enter in a number
		li $v0,4
		la $a0,prompt
		syscall
		
		#The number that the user has entered will be stored in $v0
		li $v0,5
		syscall
	
		#The user input will be stored in the function parameter
		move $a0,$v0

		#Calling the Fibonacci Function
		jal Fibonacci
		move $s0,$v0
		
		#Displaying the answer
		li $v0,4
		la $a0,message
		syscall
		li $v0,1
		move $a0,$s0 
		syscall
		
		#End of program
		li $v0,10
		syscall
	
	Fibonacci:
		#Base Case for the recursive function
		
		#if(n<=1)
		beq $a0,1,FibonacciEnd1
		blt $a0,1,FibonacciEnd2
		
		
		#Fibonacci(n-1)
		addi $sp,$sp,-4
		sw $ra,0($sp)
		addi $a0,$a0,-1
		jal Fibonacci
		addi $a0,$a0,1
		lw $ra,0($sp)
		addi $sp,$sp,4
		addi $sp,$sp,-4
		sw $v0,0,($sp)
		
		#Fibonacci(n-2)
		addi $sp,$sp,-4
		sw $ra,0($sp)
		addi $a0,$a0,-2
		jal Fibonacci 
		addi $a0,$a0,2
		lw $ra,0($sp)
		addi $sp,$sp,4
		lw $t0,0($sp)
		
		#Fibonacci(n-2)+Fibonacci(n-1)
		addi $sp,$sp,4
		add $v0,$v0,$t0
		
		jr $ra
	
	FibonacciEnd1:
		li $v0,1
		jr $ra
	FibonacciEnd2:
	        move $v0,$a0
		jr $ra
	
	