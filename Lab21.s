// Subroutine fileWrite:
// This method allows you write to a specialized a file and write to it.  
//
// ========================================================
// X8: is the syscall 

// File modes
// Note defined above .data
.equ	READONLY,	00
.equ	WRITEONLY,	01
.equ	READWRITE,	02
.equ	CREATEWO,	0101		// create file if it does not exist

// File Permissions
// OWNER - GROUP - OTHER
.equ	RW_RW__,	660

	.data

szMsg:	.asciz	"cat in the hat"
szFile:	.asciz	"/home/pi/cs3b/labs/lab21/output.txt"
szBuf:	.skip	50

	.global _start

	.text
_start:

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
	
// opens the file, or creates one at the location with the name in szFile
	mov	X8,	#56		// syscall for opening a file - openat
	ldr	X1,	=szFile		// pointer to the name and location of the file
	mov	X2,	#READONLY	// #CREATEWO equates to 0101 in octal
	//mov	X3,	#RW_RW__	// #RW_RW__ defines the permisions of the file
	svc	0			// linux call
	str	X0,	[SP, #-16]!	// push the file desciptor to the stack

	mov	X8,	#63
	ldr	X1,	=szBuf
	mov	X2,	#15
	svc	0

	ldr	X0,	=szBuf
	bl	putString

	ldr	X0,	[SP],	#16	// must pass the file descriptor into X0 to close file
	mov	X8,	#57		// syscall for closing a file - close
	svc	0

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
exit:
	mov	X0,	#0
	mov	X8,	#93
	svc	0
	

	//br LR				// return

.end
