	.data

//make sure that X0 is an address to one string
//make sure that X1 is an address to the other string
//ptrString:		.word		0

	.global String_toLowerCase
	.text	

String_toLowerCase:
	mov		X5, X0			// preserve X1
	str		lr, [sp, #-16]!	// push link register to the stack
	bl		strLength		// run string length for X0
	ldr		lr, [sp], #16	// load link back again
	
	mov		X6, X2			// push string length into X6
	mov		X0, X5

iterate:
	ldrb	W2, [X0] 		// load a byte from the address at X0 and move the address by 1
	cmp		W2, #0x5A		// check to see if it is less than or equal to 'Z'
	ble		change			// branch to change
	add		X0, X0, #1		// increment by 1
	
continue:
	cmp		X6, #0			// compare to see if loop is over
	beq		to_lower_exit	// branch to ending
	sub		X6, X6, #1		// subtract by 1 to move loop
	b		iterate			// loop back to top

change:
	cmp		W2, #0x41		// compare to see if it is above 'A'
	bge		to_lower		// branch to lower
	add		X0, X0, #1		// increment by 1
	b		continue				
	
to_lower:
	add		X2, X2, #0x20	// add 0x20 to get the ascii value for a lower case
	strb    W2, [X0], #1    // put the value from X2 into X1
	b 		continue		// go to rest of function

to_lower_exit:
	mov		X1, X5			// return address to lowercase string to X1
	ret		LR				// return to Link Register
	
	.end
	
