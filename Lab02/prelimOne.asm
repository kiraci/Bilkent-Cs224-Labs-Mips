	.text
Main:	
	
	#Print Welcome Message
	la 	$a0, msg
	li 	$v0, 4
	syscall
	
	#Get the Number
	la 	$a0, num
	syscall
	li	$v0, 5
	syscall
	add	$s0, $v0, $zero
	
	#Get the Shift Number
	la 	$a0, shf
	li	$v0, 4
	syscall
	li	$v0, 5
	syscall
	add	$a1, $v0, $zero
	
	#Load Original Value to $a0 
	add 	$a0, $s0, $zero
	
	#Print Number Left
	li	$v0, 34
	syscall
	la	$a0, rig
	li 	$v0, 4
	syscall
	add 	$a0, $s0, $zero
	jal	shiftLeftCircular
	add 	$a0, $v0, $zero
	li	$v0, 34
	syscall
	
	#New Line
	la 	$a0, nl
	li 	$v0, 4
	syscall
	
	#Load Original Value to $a0 
	add 	$a0, $s0, $zero
	
	#Print Number Right
	li	$v0, 34
	syscall
	la	$a0, rig
	li 	$v0, 4
	syscall
	add 	$a0, $s0, $zero
	jal	shiftRightCircular
	add 	$a0, $v0, $zero
	li	$v0, 34
	syscall
	
	#Exit Program
	li 	$v0, 10
	syscall
	
	
shiftLeftCircular:
	
	#Arranging Left Most Bits and Oring them
	sub	$s1, $zero, $a1
	srlv	$s1, $a0, $s1
	sllv	$v0, $a0, $a1
	or	$v0, $v0, $s1
	
	jr 	$ra

shiftRightCircular:

	#Arranging Left Most Bits and Oring them
	sub	$s1, $zero, $a1
	sllv	$s1, $a0, $s1
	srlv	$v0, $a0, $a1
	or	$v0, $v0, $s1
		
	jr 	$ra
	
	.data
msg:	.asciiz "Welcome to My Program!\n"
num:	.asciiz "\nPlease enter the number: "
shf:	.asciiz "\nPlease enter the shift number: "
rig:	.asciiz " ====> "
nl:	.asciiz "\n"
