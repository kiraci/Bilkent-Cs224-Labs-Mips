	.text 
	
	jal 	initializeArray
	
	#Getting address and size of the array
	add	$a0, $v0, $zero
	add	$a1, $v1, $zero
	
	jal 	bubbleSort
	
	jal 	processArray
	
	#Exit Code
	li 	$v0,10
	syscall 
	
	
initializeArray:
	#Take the address of the array
	la	$s0, arr
	la	$s3, arr

	#Print Hello Message
	addi	$v0, $zero, 4
	la	$a0, msg
	syscall
	
	#Take The Size of Array
	addi	$v0, $zero, 5
	syscall
	add	$s1, $zero, $v0
	
	#Counter of the array
	li	$s2,0
	
	Input:	
				
		#Print Message
		la 	$a0, num
		li	$v0, 4
		syscall
		
		#Random Number
		li $v0, 42  
 		li $a1, 100000 
 		syscall     
		li $v0, 1   
		syscall     
	
		#Put number into array
		sw 	$a0, 0($s0)
	
		#Increment the adress of array
		add 	$s0, $s0, 4
	
		#Increment the counter of array
		addi 	$s2, $s2, 1

		bne 	$s1, $s2, Input
		
		
	#Return Size of the Array
	add	$v1, $s1, $zero
	
	#Return Address of the Array
	or	$v0, $s3, $s3
	
	jr 	$ra
	

bubbleSort:
	#Address and Size
	or	$s0, $zero, $a0
	add	$s1, $zero, $a1
	
	#Last element of the array
	addi	$s2, $zero, 4
	mult	$s1, $s2
	mflo 	$s4
	add	$s4, $s4, $s0
	
	#Counter Of Two Loops
	add	$s2, $zero, $s1
	subi	$s2, $s2, 1
	subi	$s3, $zero, 1
	
	Outer:
		beq	$s2, $zero, Exit
		Inner:
			sub 	$s3, $s1, $s2
			beq	$s3, $s1, endInner
			beq	$s4, $s0, endInner
			add	$s1, $zero, $a1
			
			lw	$s5, 0($s0)
			lw	$s6, 4($s0)
			
			bgt	$s5, $s6, pass
			
			add 	$s7, $s5, $zero
			add	$s5, $s6, $zero
			add	$s6, $s7, $zero
			
			sw	$s5, 0($s0)
			sw	$s6, 4($s0)
			
			pass:
			
			add	$s0, $s0, 4
			addi	$s3, $s3, 1
			j	Inner
			endInner:
		add	$s3, $zero, $zero
		or	$s0, $zero, $a0
		subi	$s2, $s2, 1
		j	Outer
	
	Exit:
		
		#Address and Size
		or	$s0, $zero, $a0
		add	$s1, $zero, $a1
		or	$s3, $zero, $a0
		
		#Counter Of Loop
		add	$s2, $zero, $zero
		
		#Print Message
		la 	$a0, nL
		li	$v0, 4
		syscall
		
		Print:	
			
		#Print Message
		la 	$a0, el
		li	$v0, 4
		syscall
		
		#Print Element
		li	$v0,1
		lw	$a0, 0($s0)
		syscall
		
		#Increment the adress of array
		add 	$s0, $s0, 4
	
		#Increment the counter of array
		addi 	$s2, $s2, 1

		bne 	$s1, $s2, Print
		
		or	$a0, $zero, $s3

	jr	$ra
	
processArray:
	
	#Address and Size
	or	$s0, $zero, $a0
	add	$s1, $zero, $a1
	
	#Counter Of Loop
	add	$s2, $zero, $zero
	
			
	#Print Message
	la 	$a0, nL
	li	$v0, 4
	syscall
		
	
	Process:	
	
		#Print Index
		add 	$a0, $zero, $s2
		li	$v0, 1
		syscall
		
		#Print Message
		la 	$a0, el
		li	$v0, 4
		syscall
		
		#Print Element
		li	$v0,1
		lw	$a0, 0($s0)
		syscall
		
		#Print Message
		la 	$a0, el
		li	$v0, 4
		syscall
		
		#Print SumDigits
		subi	$sp, $sp, 24
		sw	$s0, 0($sp)
		sw	$s1, 4($sp)
		sw	$s2, 8($sp)
		sw	$s3, 12($sp)
		sw	$s4, 16($sp)
		sw	$ra, 20($sp)
		
		lw	$a0, 0($s0)
		
		jal	sumDigits
		
		add 	$a0, $v0, $zero
		li	$v0, 1
		syscall 

		lw	$s0, 0($sp)
		lw	$s1, 4($sp)
		lw	$s2, 8($sp)
		lw	$s3, 12($sp)
		lw	$s4, 16($sp)
		lw	$ra, 20($sp)
		addi	$sp, $sp, 24
		
		#Print Message
		la 	$a0, el
		li	$v0, 4
		syscall
		
		#Print Prime
		subi	$sp, $sp, 24
		sw	$s0, 0($sp)
		sw	$s1, 4($sp)
		sw	$s2, 8($sp)
		sw	$s3, 12($sp)
		sw	$s4, 16($sp)
		sw	$ra, 20($sp)
		
		lw	$a0, 0($s0)
		
		jal	checkPrime
		
		add 	$a0, $v0, $zero
		li	$v0, 4
		syscall 

		lw	$s0, 0($sp)
		lw	$s1, 4($sp)
		lw	$s2, 8($sp)
		lw	$s3, 12($sp)
		lw	$s4, 16($sp)
		lw	$ra, 20($sp)
		addi	$sp, $sp, 24	
		
		#Print Message
		la 	$a0, nL
		li	$v0, 4
		syscall	
				
		#Increment the adress of array
		add 	$s0, $s0, 4
	
		#Increment the counter of array
		addi 	$s2, $s2, 1

		bne 	$s1, $s2, Process
	
	
	jr	$ra
	
sumDigits:

	add	$s0, $a0, $zero
	addi 	$s1, $zero, 10
	add 	$s4, $zero, $zero     

	ifNotZero:
	div 	$s0,$s1    
	mfhi 	$s3           
	mflo 	$s0                            
	add 	$s4,$s3,$s4        
	bne 	$s0,$zero,ifNotZero  

	move	$v0, $s4
	
	jr	$ra
checkPrime:

	addi	$s0, $zero, 2		
	
	lessThanCounter:
	slt	$s1, $s0, $a0				
	bne	$s1, $zero, prime		
	la	$v0, yes			
	j	return				

	prime:					
	div	$a0, $s0					
	mfhi	$s3					
	slti	$s4, $s3, 1				
	beq	$s4, $zero, increase	
	la	$v0, no				
	j	return						

	increase:		
	addi $s0, $s0, 1
	j	lessThanCounter		
	
	return:
		jr	$ra
	
	.data
arr:	.space 80
msg:    .asciiz "Please give a number to determine array size( maximum 20 - minimum 0 ): "
num:    .asciiz "\nNumber: "
el:	.asciiz " ----- "
nL:	.asciiz "\n"
yes:	.asciiz "Yes"
no:	.asciiz "No"
