.data
	#Float needed
	half:		.float 0.5
	zero:		.float 0.0
	
	#String needed
	promptBase:	.asciiz "Enter in a base: "
	promptHeight:	 .asciiz "Enter in a height: "
	promptArea:   .asciiz "The area of this triangle is "
	line:			 .asciiz "\n"
	
.text
	main:
		#Asks the user to enter in a base	
		li $v0,4
		la $a0,promptBase
		syscall
		
		#Gets the value of the base and stores it in $s0
		jal getInt
		move $s0,$v0
		
		#Asks the user to enter in a height
		li $v0,4
		la $a0,promptHeight
		syscall
		
		#Stores the height in $ s1
		jal getInt
		move $s1,$v0
		
		#Mutliplies the base and the height and stores it into $s2
		mult $s0,$s1
		mflo $s2
		
		#Coverts the multipled integer into a floating point number and stores it in $f0 (can only store doubles and floats in $f)
		mtc1.d $s2,$f0
		cvt.s.w $f0,$f0
		
		#Loads the half value in $f1 and then it finishes the calculation of the area
		lwc1 $f1,half
		mul.s $f12,$f1,$f0
		
		#Prompts the user the area of the triangle
		li $v0,4
		la $a0,promptArea
		syscall
		
		li $v0,2
		syscall
		
		#Exits the program
		li $v0,10
		syscall
		
	#A function that displays a new line (wasn't needed in this case)
	newLine:
		li $v0,4
		la $a0,line
		syscall
		jr $ra
	
	#A function that gets the user input (Integers only)
	getInt:
		li $v0,5
		syscall
		jr $ra