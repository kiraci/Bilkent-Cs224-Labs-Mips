	.text
	
main:
	#Print Hello Message
	la 	$a0, msg
	li 	$v0, 4
	syscall
	
	#Take The First Number
	la 	$a0, num1
	syscall
	li	$v0, 5
	syscall
	add	$s0, $v0, $zero
	
	#Take The First Number
	la 	$a0, num2
	li 	$v0, 4
	syscall
	li	$v0, 5
	syscall
	add	$a1, $v0, $zero
	
	#Pass the first number to a0
	add 	$a0, $s0, $zero
	
	li	$v0, 0
	
	jal	recursiveMul
	
	#Print Result
	add	$a0, $v0, $zero
	li	$v0, 1
	syscall
	
	#Print Hello Message
	la 	$a0, msg2
	li 	$v0, 4
	syscall
	
	#Take The First Number
	la 	$a0, num
	syscall
	li	$v0, 5
	syscall
	add	$a0, $v0, $zero
	
	li	$v0, 0
	
	jal 	recursiveAdd
	
	#Print Result
	add	$a0, $v0, $zero
	li	$v0, 1
	syscall
	
	#Exit
	li $v0, 10
    	syscall
    	
recursiveMul:
	
	subi	$sp, $sp, 4
	sw	$ra, 0($sp)
	
	beq 	$a1, 0, done
	add	$v0, $a0, $v0	
	subi 	$a1, $a1, 1
	jal	recursiveMul	
	
	done:	
		lw	$ra, 0($sp)
		addi	$sp, $sp, 4
		jr	$ra
		
recursiveAdd:
	
	subi	$sp, $sp, 4
	sw	$ra, 0($sp)

	
	beq 	$a0, 0, Done
	add	$v0, $v0, $a0
	subi	$a0, $a0, 1
	jal	recursiveAdd
	
	
	Done:
		lw	$ra, 0($sp)
		addi	$sp, $sp, 4
		jr	$ra
		

	
	
	
	  
	.data
msg:	.asciiz		"Please Enter Two Numbers To Multiply!"
num1:	.asciiz 	"\nFirst Number: "
num2:	.asciiz		"\nSecond Number: "
msg2:	.asciiz		"\nPlease Enter One Number To Take Sum Recursively!"
num:	.asciiz 	"\nNumber: "