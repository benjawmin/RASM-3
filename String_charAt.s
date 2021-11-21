	.data

szBounds:		.asciz		"Index entered is out of bounds for string\n"
// X0 needs to be the starting addres to the string
// X1 needs to be the index for character to retrieve
	.global String_charAt
	
	.text

String_charAt:
	mov		X5, X0			// preserve the address
	mov		X4, X1			// preserver index
	str	        lr, [sp, #-16]!	// push link register to the stack
	bl		strLength		// get the length of the variable
	ldr	        lr, [sp], #16	// load link back again
	mov		X0, X5			// restore X0
	mov		X1, X4			// restore X1
	cmp		X1, X2			// compare the string length to the index entered
	bgt		exit_charAt		// if it is greater exit the function
	add		X0, X1, X0		// add the index position
	ldrb		W0, [X0]		// load the value at that address 
	mov		X1, X0			// move thatbyte into X1 to returnq

	ret		LR
	
exit_charAt:
	ldr		X0, =szBounds	// load address for bounds
	bl		putString		// print error message out
	ret		LR
	
	.end
	
