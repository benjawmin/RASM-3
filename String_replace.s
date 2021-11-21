	.data

//make sure that X0 is an address to one string
//make sure that X1 is an address to the other string
//ptrX:			.word		0
szX:			.asciz		"Hello world"
ptrString:		.quad		0

	.global _start
	.text	

_start:
	mov		X1, #0x6c
	mov		X2, #0x6e
	ldr		X0, =szX	
	
	str		X0, [sp, #-16]!	// push target String to the stack
	str		X1, [sp, #-16]!	// push byte to replace to the stack
	str		X2, [sp, #-16]!	// push replacement byte to the stack
	
	str		lr, [sp, #-16]!	// push link register to the stack
	bl		strLength		// run string length for X0
	ldr		lr, [sp], #16	// load link back again
	
	mov		X6, X2			// push string length into X6
	mov		X0, X6			// mov to malloc amount of bytes
	
	str		X6, [sp, #-16]!	// push the string length to X6
	
	str		lr, [sp, #-16]!	// push link register to the stack
	bl		malloc			// allocate enough bytes for dynamic string
	ldr		lr, [sp], #16	// load link back again
	
	ldr		X3, =ptrString	// mov pointer to address into X3
	str		X0, [X3]		// store the address allocated into the pointer
	
	ldr		X6, [sp], #16	// load X2 back again
	ldr		X2, [sp], #16	// load X2 back again
	ldr		X1, [sp], #16	// load X1 back again
	ldr		X0, [sp], #16	// load X0 back again

	ldr		X3, [X3]		// load the address stored in pointer
	
	bl 		iterate
	
	ldr		X0, =ptrString
	ldr		X0, [X0]
	
	bl		putString
	
	mov		X0, #0
	mov		X8, #93
	svc		0
	
iterate:
	ldrb	W4, [X0], #1	// load a byte from the address at X0 and move the address by 1
	cmp		X4, X1			// compare to the user inputed byte
	beq		change			// branch to change
	strb	W4, [X3], #1		// increment address stored in pointer by 1 if not equal
	
continue:
	cmp		X6, #0			// compare to see if loop is over
	beq		to_lower_exit	// branch to ending
	sub		X6, X6, #1		// subtract by 1 to move loop
	b		iterate			// loop back to top	


change:
	strb	W2, [X3], #1	// store the value of the replacement byte into pointer than progress address by 1
	b		continue				

to_lower_exit:
	mov		X1, X3			// place address of changed string here
	ret		LR				// return to Link Register
	
	.end
