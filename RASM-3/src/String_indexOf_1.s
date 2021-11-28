	.data

	.global String_indexOf_1

	.text
	
String_indexOf_1:

	str		X1, [sp, #-16]!	// place X1 onto the stack
	mov		X3, #0			// reset X3
	mov		X5, X0			// preserve X0
	str	    lr, [sp, #-16]!	// push link register to the stack
	bl		strLength		// get the length of the variable
	ldr	    lr, [sp], #16	// load link back again
	mov		X6, #0			// initialize accumulator to 0
	mov		X0, X5			// restore X0
	mov		X4, X2			// move string length into X4
	ldr		X1, [sp], #16	// pop X1 off the stack		
	
loop:
	ldrb	W2, [X0], #1	// load a byte from the address at X0 and move the address by 1
	cmp		X2, X1			// compare the value at the two 
	beq		indexOf_equal	// branch to the index return
	cmp		X4, X6			// compare string length to accumulator
	beq		index_end				// if equal move over to function
	add		X6, X6, #1		// accumulate X6
	b		loop			// go back to the top
	
indexOf_equal:
	mov		X1, X6 			// move accumulator into X1 to return the index position
	ret		LR				// return to the link register
	
index_end:
	mov		X1, #-1			// move negative 1 into register
	ret		LR
	
	.end
