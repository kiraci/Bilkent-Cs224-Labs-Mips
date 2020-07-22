	.text
Main:	
	#Welcome message
	li $v0,4
	la $a0,msg
	syscall
	
	
	#Read number from user
	li $v0, 4 
	la $a0, num
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, $zero
	
	#Read number from user
	li $v0, 4 
	la $a0, num
	syscall
	li $v0, 5
	syscall
	add $a1, $v0, $zero
	
	#Read number from user
	li $v0, 4 
	la $a0, num
	syscall
	li $v0, 5
	syscall
	add $a2, $v0, $zero
	
	#Read number from user
	li $v0, 4 
	la $a0, num
	syscall
	li $v0, 5
	syscall
	add $a3, $v0, $zero
	
	#Reload a0
	add $a0, $s0, $zero
	
	jal Function
	
	add $a0, $v0, $zero
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

Function:
	sub $t0, $a1, $a2	
	mul $t1, $t0, $a0
	div $t1, $a3
	mfhi $t2
		
	add $v0, $t2, $zero
	
	jr $ra
	
	.data
	msg:	.asciiz "You will enter 4 numbers and the equation is x = a * ( b - c ) % d\n"
	num: 	.asciiz "\nGive us the number: "