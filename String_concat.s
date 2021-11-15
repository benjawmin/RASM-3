	.data

ptrX:   .quad       0
ptrY:   .quad       0
ptrString:		.quad		0

	.global concat
	
	.text

concat:
    ldr     X2, =ptrX           // move pointer for X in X2
    str     X0, [X2]            // store address of X0 into pointer
    ldr     X3, =ptrY           // move pointer into X3
    str     X1, [X3]            // store address of X1 into pointer
    
	str		lr, [sp, #-16]!	    // push link register to the stack
    bl      strLength           // get length of string
    ldr		lr, [sp], #16	    // load link back again
    mov     X4, X2              // mov string length into X4
    
    ldr     X0, =ptrY           // move pointer to address inside X0
    ldr     X0, [X0]            // grab address at address
    str		lr, [sp, #-16]!	    // push link register to the stack
    bl      strLength           // get length of string
    ldr		lr, [sp], #16	    // load link back again
    add     X4, X4, X2          // add the two together
    

    mov     X0, X4              // allocate this much space for the two strings
    str		lr, [sp, #-16]!	    // push link register to the stack
    bl      malloc              // allocate function call
    ldr		lr, [sp], #16	    // load link back again

    ldr     X1, =ptrString      // get address for the pointer string
    str     X0, [X1]            // store the value in X0 into address of X1

    ldr     X0, =ptrX           // move pointer for X in X0
    ldr     X0, [X0]            // load address at that address
    ldr     X3, =ptrY           // move pointer into X3
    ldr     X3, [X3]            // store address of X1 into pointer
    ldr     X1, [X1]            // load into X1 the address pointed to by X1

next:
    ldrb    W2, [X0], #1        // load the value at that address 
    cmp     W2, #0              // compare to see if it is end of string
    beq     next_cont           // if it is move to the next one
    strb    W2, [X1], #1        // put the value from X2 into X1
    b       next                // go back to the top
    
next_cont:
    ldrb    W2, [X3], #1        // load the value at that address 
    cmp     W2, #0              // compare to see if it is end of string
    beq     exit_concat         // if it is move to the next one
    strb    W2, [X1], #1        // put the value from X2 into X1
    b       next_cont           // go back to the top  
    
exit_concat:
    ret     LR                  // go to link register
