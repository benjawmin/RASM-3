/******************************************************************/

/*     sub strings  index start  number of characters             */ 

/******************************************************************/
/* x0 contains the address of the input string */
/* x1 contains the address of the output string */
/* x2 contains the start index                  */
/* x3 contains numbers of characters to extract */
/* x0 returns number of characters or -1 if error */

	.data

	.global substring
	
	.text
substring:

 str X19, [SP, #-16]!		// preserves X19 on the stack
 str X20, [SP, #-16]!		// preserves X20 on the stack
 str X21, [SP, #-16]!		// preserves X21 on the stack
 str X22, [SP, #-16]!		// preserves X22 on the stack
 str X23, [SP, #-16]!		// preserves X23 on the stack
 str X24, [SP, #-16]!		// preserves X24 on the stack
 str X25, [SP, #-16]!		// preserves X25 on the stack
 str X26, [SP, #-16]!		// preserves X26 on the stack
 str X27, [SP, #-16]!		// preserves X27 on the stack
 str X28, [SP, #-16]!		// preserves X28 on the stack
 str X29, [SP, #-16]!		// preserves X29 on the stack
 str X30, [SP, #-16]!		// preserves X30 on the stack

	stp	x1,	lr,	[sp,-16]!      // save  registers
   	mov	x14,	#0                     // counter byte output string 
1:

    	ldrb 	w15,	[x0,x2]               // load byte string input
   	cbz 	x15,	2f                     // zero final ?
    	strb 	w15,	[x1,x14]              // store byte output string
    	add 	x2,	x2,	1                    // increment counter
    	add 	x14,	x14,	1
    	cmp 	x14,	x3                     // end ?
   	blt 	1b                         // no -> loop

2:
   	strb	wzr,	[x1,x14]              // store final zero byte string 2
	mov	x0,	x14

100:

	ldp	x1,	lr,	[sp],16              // restaur  2 registers

 ldr X30, [SP], #16		// restore the stack
 ldr X29, [SP], #16		// restore the stack
 ldr X28, [SP], #16		// restore the stack
 ldr X27, [SP], #16		// restore the stack
 ldr X26, [SP], #16		// restore the stack
 ldr X25, [SP], #16		// restore the stack
 ldr X24, [SP], #16		// restore the stack
 ldr X23, [SP], #16		// restore the stack
 ldr X22, [SP], #16		// restore the stack
 ldr X21, [SP], #16		// restore the stack
 ldr X20, [SP], #16		// restore the stack
 ldr X19, [SP], #16		// restore the stack

 ret

.end

