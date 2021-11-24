// Subroutine String_startsWith_2: 
// looks at the address of a string in X0 and X1 is the string to look for
// tldr: X1 is needle that you look for in haystack X0
// X0: address of haystack
// X1: address of needle
// 
// ============================================
//
// X0 contains result 0 if true

	.data

	.global String_startsWith_2

	.text
String_startsWith_2:

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

		

	mov W4, #1			// W0 is index
	mov X3, #0			// offset

forloop:

	b	ending	

	ldrb	W3,	[X4, X3]	// load W5 with X1 with offset X3
	
	cmp	W5,	0x41		// compare w5 to "A"
	b.eq	Error_atoi

	cmp	W5,	0x42		// ...B
	b.eq	Error_atoi

	cmp	W5,	0x43		// ...C
	b.eq	Error_atoi

	cmp	W5,	0x44		// ...D
	b.eq	Error_atoi

	cmp	W5,	0x45		// ...E
	b.eq	Error_atoi

	cmp	W5,	0x46		// ...F
	b.eq	Error_atoi		// Return error if any are true


	add X3, X3, #1			// offset += 1
	add W0, W0, #1			// i = i + 1
	cmp X0, X2
	b.le forloop

 mov X5, #1			// Multiplier
 mov X0, #0			// Result
 mov X3, #0			// Temp Storage
 mov X6, #10			// Decimal Multiplier

atoi_readchar:

 subs X2, X2, #1		// sub X2 X2 by 1
 ldrb W3, [X1, X2]		// load byte W3 by X1 with ofset X2
 sub X3, X3, #48		// sub by ascii ofset
 mul X3, X3, X5			// multiply
 add X0, X0, X3			// add by offset
 mul X5, X5, X6			// multiply
 cmp X2, #0			// check to see
 bne atoi_readchar

 ldp X1, X2, [SP], #16		// restore stack
 ldp X3, X4, [SP], #16		// restore stack
 ldp X5, X6, [SP], #16		// restore stack
 ldp X29, X30, [SP], #16	// restore stack
 ret				// return

Error_atoi:
	
	mov X0,	#1
	ret
ending:

	bl	strstr



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

 br LR				// return to main

.end


