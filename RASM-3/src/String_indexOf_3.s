	.data
//	put the full string into X0
// 	place the substring into X1
ptrY:		.quad		0
ptrX:		.quad		0

	.global String_indexOf_3
	
	.text
	
String_indexOf_3:
	ldr		X3, =ptrX		// move pointer to large string
	str		X0, [X3]		// store the address for the large string
	ldr		X2, =ptrY		// move pointer to letter
	str		X1, [X2]		// store address inside
	
	ldr		X0, =ptrX		// load pointer to address
	ldr		X0, [X0]		// load address stored
	str	    lr, [sp, #-16]!	// push link register to the stack
	bl		strLength		// get the length of the variable
	ldr	    lr, [sp], #16	// load link back again
	str	    X2, [sp, #-16]!	// push X2 to the stack
	
	ldr		X0, =ptrY		// get pointer address
	ldr		X0, [X0]		// get address from ptrLet
	str	    lr, [sp, #-16]!	// push link register to the stack
	bl		strLength		// get the length of the variable
	ldr	    lr, [sp], #16	// load link back again
	str	    X2, [sp, #-16]!	// push X2 to the stack
	
	ldr	    X2, [sp], #16	// load X2 from fullsize string from the stack
	mov		X7, X2			// move string length into X4
	
	ldr	    X2, [sp], #16	// load X2 from substring from the stack
	mov		X4, X2			// move substring length into X7
	
	mov		X5, #-1			// reset the value of X5 to 0
	mov		X3, #0			// move the value zero into X3
	mov		X6, #0			// initialize accumulator to 0
	
loop:
	ldr		X0, =ptrX		// load pointer to address
	ldr		X0, [X0]		// load address stored
	add		X0, X0, X6		// add accumulator to address
	
	ldr		X1, =ptrY		// get pointer address
	ldr		X1, [X1]		// get address from ptrLet

	ldrb	W0, [X0]    	// load a byte from the address at X0 and move the address by 1
	ldrb	W1, [X1]    	// get value from the address
	cmp		X0, X1			// compare the value at the two 
	beq		indexOf_equal	// branch to the index return
	
continue:
	cmp		X4, X6			// compare string length to accumulator
	beq		index_end		// if equal move over to function
	add		X6, X6, #1		// accumulate X6
	b		loop			// go back to the top
	
indexOf_equal:
	ldr		X0, =ptrX		// load pointer to address
	ldr		X0, [X0]		// load address stored
	add		X0, X0, X6		// add accumulator to address
	mov		X2, X0			// move address of fullstring into X2
	add		X2, X2, #1		// accumulate by 1
	
	ldr		X1, =ptrY		// get pointer address
	ldr		X1, [X1]		// get address from ptrLet
	add		X1, X1, #1		// accumulate by 1

looping:
	
	str	    X2, [sp, #-16]!	// push X2 to the stack
	ldrb	W0, [X2]    	// get the value
	ldrb	W1, [X1]		// get the value
 	cmp		W1, W0			// compare the two values
	bne		wrong_loop		// get out of loop until the correct combo is reached
	add		X3, X3, #1		// add one to accumulator
	cmp		X7, X3			// compare the length of the substring to the accumulator
	beq		correct_loop	// go the correct condition
	
	ldr		X1, =ptrY		// get pointer address
	ldr		X1, [X1]		// get address from ptrLet
	
	ldr	    X2, [sp], #16	// load X2 from substring from the stack
	add		X2, X2, X3		// add the value of X3 to the initial pointer string
	sub		X2, X2, #1		// subtract by 1
	add		X1, X1, X3		// add the value of X3 to the pointer string
	b		looping			// go back to top of loop
	
index_end:
	ret		LR				// return link register

correct_loop:
	mov		X1, X6		    // subtract the initial loop index by the 
	ret		LR
	
wrong_loop:
	mov		X3, #0			// reset the accumulator for inside loop
	b		continue		// branch back to rest of loop
	
	.end
