	.data

//make sure that X0 is an address to one string
//make sure that X1 is an address to the other string

	.global String_replace
	.text	

String_replace:
	
	str		X0, [sp, #-16]!	// push target String to the stack
	str		X1, [sp, #-16]!	// push byte to replace to the stack
	str		X2, [sp, #-16]!	// push replacement byte to the stack
	
	str		lr, [sp, #-16]!	// push link register to the stack
	bl		strLength		// run string length for X0
	ldr		lr, [sp], #16	// load link back again
	
	mov		X6, X2			// push string length into X6

	ldr		X2, [sp], #16	// load X2 back again
	ldr		X1, [sp], #16	// load X1 back again
	ldr		X0, [sp], #16	// load X0 back again
	
iterate:
	ldrb	W4, [X0]    	// load a byte from the address at X0 and move the address by 1
	cmp		X4, X1			// compare to the user inputed byte
	beq		change			// branch to change
	
continue:
	cmp		X6, #0			// compare to see if loop is over
	beq		to_lower_exit	// branch to ending
	sub		X6, X6, #1		// subtract by 1 to move loop
	add		X0, X0, #1		// add 1 to the address
	b		iterate			// loop back to top	

change:
	strb	W2, [X0], #1	// store the value of the replacement byte into pointer than progress address by 1
	b		continue				

to_lower_exit:
	ret		LR				// return to Link Register
	
	.end
