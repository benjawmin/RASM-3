	.data
	
	.global strLength		// provide program starting address
	
	.text
	
strLength:
	mov	    X7, X0		// used to establish a base
	mov	    X2, #0		// counter to return length
	
lengthtopLoop:
	ldrb 	W1, [X7], #1	// grab one byte from address of X7
	cmp	    W1, #0		// compare to see if register is null
	beq	    lengthbotLoop		// jump to end of function
	add	    X2, X2, #1	// increment by 1
	b 	    lengthtopLoop		// jump to top

lengthbotLoop:
	mov	    X0, X2		// X0 = length of string
	ret	    LR		// branch and link
	
	.end
