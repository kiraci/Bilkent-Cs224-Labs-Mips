	.text
Main:
	
	jal 	createArray
	
	#Pass the Address and Size
	add 	$a0, $v0, $zero
	add 	$a1, $v1, $zero
	
	jal 	arrayOperations

	#Quit program
	addi	$v0, $zero, 10
	syscall
	
createArray:
	
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

		#Print give number message
		addi	$v0, $zero, 4
		la	$a0, num
		syscall
	
		#Take elements of the array
		addi	$v0, $zero, 5
		syscall
		add 	$a0, $zero, $v0
	
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
	
arrayOperations:
	
	#Stack For Sum Of the Elements
	subi	$sp, $sp, 16
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$ra, 12($sp)

	jal 	sum 
	
	#Protect the value
	or	$s0, $zero, $a0
	or	$s1, $zero, $v0
	
	#Print Message
	li	$v0, 4
	la	$a0, sumM
	syscall
	
	#Print Result
	add 	$a0, $zero, $s1
	li	$v0,1
	syscall
	or	$a0, $zero, $s0
	
	
	
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	lw	$s1, 8($sp)
	lw	$ra, 12($sp)
	addi	$sp, $sp, 16
	
	#Stack For Max Of the Elements
	subi	$sp, $sp, 24
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$s3, 12($sp)
	sw	$s4, 16($sp)
	sw	$ra, 20($sp)
	
	jal 	max
	
	#Protect the value
	or	$s0, $zero, $a0
	or	$s1, $zero, $v0
	
	#Print Message
	li	$v0, 4
	la	$a0, man
	syscall
	
	#Print Result
	add 	$a0, $zero, $s1
	li	$v0,1
	syscall
	or	$a0, $zero, $s0
	
	
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	lw	$s2, 8($sp)
	lw	$s3, 12($sp)
	lw	$s4, 16($sp)
	lw	$ra, 20($sp)
	addi	$sp, $sp, 24
	
	#Stack For Min Of the Elements
	subi	$sp, $sp, 24
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$s3, 12($sp)
	sw	$s4, 16($sp)
	sw	$ra, 20($sp)
	
	jal 	min
	
	#Protect the value
	or	$s0, $zero, $a0
	or	$s1, $zero, $v0
	
	#Print Message
	li	$v0, 4
	la	$a0, minN
	syscall
	
	#Print Result
	add 	$a0, $zero, $s1
	li	$v0,1
	syscall
	or	$a0, $zero, $s0
	
	
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	lw	$s2, 8($sp)
	lw	$s3, 12($sp)
	lw	$s4, 16($sp)
	lw	$ra, 20($sp)
	addi	$sp, $sp, 24
	
	#Stack For Plaindrome Of the Elements
	subi	$sp, $sp, 32
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$s3, 12($sp)
	sw	$s4, 16($sp)
	sw	$s5, 20($sp)
	sw	$s6, 24($sp)
	sw	$ra, 28($sp)
	
	jal 	palindrome
	
	#Protect the value
	or	$s0, $zero, $a0
	or	$s1, $zero, $v0
	
	#Print Message
	li	$v0, 4
	la	$a0, pal
	syscall
	
	#Print Result
	add 	$a0, $zero, $s1
	li	$v0,1
	syscall
	or	$a0, $zero, $s0
	
	
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	lw	$s2, 8($sp)
	lw	$s3, 12($sp)
	lw	$s4, 16($sp)
	lw	$s5, 20($sp)
	lw	$s6, 24($sp)
	lw	$ra, 28($sp)
	addi	$sp, $sp, 32

	jr 	$ra

max:
	#Variables
	or      $s0, $a0, $zero         
   	add     $s1,$zero,$a1           
    	lw      $s2,0($s0)              
    	
    	For:
    		beq     $zero, $s1, Done       
    		lw      $s3,0($s0)              
    		addi 	$s0, $s0, 4
		subi	$s1, $s1, 1
    		
    		slt 	$s4, $s3, $s2
    		bne     $s4,$zero, For    
    		

    		move    $s2,$s3                 
    		j       For

	Done:
    		add    $v0, $s2, $zero                

	jr	$ra
	
min:
	or      $s0, $a0, $zero         
   	add     $s1,$zero,$a1           
    	lw      $s2,0($s0)              
    	
    	Start:
    		beq     $zero, $s1, done       
    		lw      $s3,0($s0)            
    		addi 	$s0, $s0, 4
		subi	$s1, $s1, 1
    		
    		slt 	$s4, $s3, $s2
    		beq     $s4,$zero, Start   
    		

    		move    $s2,$s3              
    		j       Start

	done:
    		move    $v0,$s2              

	jr	$ra
	
	
sum:
	#Preparing Variables
	add 	$s0, $a1, $zero
	li	$v0, 0
	or	$s2, $a0, $zero
	
	Loop:	lw	$s1, 0($s2)
	
		#Sum
		add 	$v0, $v0, $s1
		
		#Increase the Address
		addi	$s2, $s2, 4
		
		#Decrease size
		subi 	$s0, $s0, 1
	
		bne 	$s0, $zero, Loop
	
	
	jr	$ra
	
palindrome:
	
	#Variables counter, size, address
	add	$s0, $zero, $zero
	add	$s1, $a1, $zero
	or	$s3, $a0, $zero
	
	#Last Element array[ Size - 1]
	addi	$s7, $zero, 4
	mul	$s5, $s1, $s7
	add	$s5, $s5, $s3
	subi 	$s5, $s5, 4
	
	#Half Of the Size
	addi	$s2, $zero, 2
	div	$s1, $s2
	mflo	$s1
		
	
	loop:
		beq	$s0, $s1, false
		
		lw 	$s4, 0($s3)
		lw	$s6, 0($s5)
		
		beq	$s4, $s6, correct
		
		subi	$s5, $s5, 4
		addi	$s3, $s3, 4
		addi	$s0, $s0, 1
		j	loop
	correct:
		addi	$v0, $zero, 1
		j 	end
	
	false:	
		add	$v0, $zero, $zero
		j	end
	
	end:

	jr 	$ra

	

	
	.data
arr:	.space 80
msg:    .asciiz "Please give a number to determine array size( maximum 20 - minimum 0 ): "
num:    .asciiz "Please give number: "
el:     .asciiz "\nNumber: "
sumM:   .asciiz "\nSummation of elements is "
pal:	.asciiz "\nPalindrom : "
man:	.asciiz "\nMaximum number is "
minN:	.asciiz "\nMinimum number is "
