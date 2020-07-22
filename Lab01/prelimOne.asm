	.text
	#Adress of array
	la $t0, array

	#Print Hello Message
	addi $v0, $zero, 4
	la $a0, msg
	syscall
	
	#Take size of array
	addi $v0, $zero, 5
	syscall
	add $a0, $zero, $v0
	
	#Size of the array
	add $t1, $a0, $zero
	
	#Counter of the array
	li $t2,0
	
Input:	

	#Print give number message
	addi $v0, $zero, 4
	la $a0, num
	syscall
	
	#Take elements of the array
	addi $v0, $zero, 5
	syscall
	add $a0, $zero, $v0
	
	#Put number into array
	sw $a0, 0($t0)
	
	#Increment the adress of array
	add $t0, $t0, 4
	
	#Increment the counter of array
	addi $t2, $t2, 1

	bne $t1, $t2, Input
	
	#Counters of the array
	li $t2,0
	li $t3,0
	
	#Adress reloaded
	la $t0, array
	
	#Summation of elements
	li $t4,0

Print:	lw $t2, 0($t0)
	
	#Print message
	li $v0, 4 
	la $a0, el
	syscall
	
	#Print number
	li $v0,1
	add $a0, $t2, $zero
	syscall
	
	#Summation of elements
	add $t4, $t4, $a0
	
	#Increment the counter of array
	addi $t0, $t0, 4
	
	#Increment the counter of array
	addi $t3, $t3, 1
	
	bne $t1, $t3, Print
	
	#Print Message
	li $v0,4
	la $a0, sum
	syscall
	
	#Print Sum
	li $v0, 1
	add $a0, $t4, $zero
	syscall 


	.data
	array: .space 80 
	msg:   .asciiz "Please give a number to determine array size( maximum 20 - minimum 0 ): "
	num:   .asciiz "Please give number: "
	el:    .asciiz "\nNumber: "
	sum:   .asciiz "\nSummation of elements: "