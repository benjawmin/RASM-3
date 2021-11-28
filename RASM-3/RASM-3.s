	.data

s1:		.asciz		"Cat in the hat."
s2:		.asciz		"Green eggs and ham."
s3:		.asciz		"cat in the hat."
szParam:.asciz		"egg"
szIndexof1:	.asciz		"String_indexOf_1(s2, "
szIndexof2:	.asciz		"String_indexOf_2(s2, "
szIndexof3:	.asciz		"String_indexOf_3(s2, "
szLastIndexof1:	.asciz	"String_lastIndexOf_1(s2, "
szLastIndexof2:	.asciz	"String_lastIndexOf_2(s2, "
szLastIndexof3:	.asciz	"String_lastIndexOf_3(s2, "
szReplace:	.asciz		"String_replace(s1, "
sztoLower:	.asciz		"String_toLowerCase(s1 "
sztoUpper:	.asciz		"String_toUpperCase(s1 "
szConcat:	.asciz		"String_concat(s1, s2"
szEnd:		.asciz		") = "
szComma:	.asciz		", "
szResult:	.skip		21
chLet:		.skip		1
chLetter:	.byte		'g'
chA:		.byte		'a'
chO:		.byte		'o'
dResult:	.quad		0
dMiddle:	.quad		0
szMiddle:	.skip		21
chLine:		.byte		'\n'

	.global	_start
	.text
	
_start:

// Display results for String_indexOf_1//
	ldr		X0, =s2				// load the address for the string
	ldr		X1, =chLet			// load the address for a byte
	mov		X3, 'g'				// move the byte g into X3
	strb	W3, [X1]			// store the byte into 
	ldrb	W1, [X1]			// load the value at X1 into X1
	bl		String_indexOf_1	// get the index of a letter
	ldr		X0, =dResult		// load the address for result lplace
	str		X1, [X0]			// store result in X1 into dResult
	
	
	ldr		X0, =szIndexof1		// load message for String_indexOf_1
	bl		putString			// print message out
	
	ldr		X1, =chLetter		// move requested letter into x1
	bl		putch				// print byte out
	
	ldr		X0, =szEnd			// load the ending message address
	bl		putString			// print message out
	
	ldr		X0, =szResult		// load where the number will go
	ldr		X1, =dResult		// load the address for the result
	bl		hextodec			// change an ascii char into an int

	ldr		X0, =szResult		// load the string result
	bl		putString			// print it out
	
	ldr		X1, =chLine			// load the address for a newline
	bl		putch				// print a new character out
	
	ldr		X0, =szResult		// load address for resutl
	bl		clear_string		// reset string
	
// Display results for String_indexOf_2 //
	
	ldr		X0, =s2				// load the address for the string
	ldr		X1, =chLet			// load the address for a byte
	mov		X3, 'g'				// move the byte g into X3
	strb	W3, [X1]			// store the byte into 
	ldr		X3, = dMiddle		// load address to d middle
	mov		X2, #9				// move 3rd paraemeter into X2
	str		X2, [X3]			// store value at X2 into dMiddle
	bl		String_indexOf_2	// get the index of a letter
	ldr		X0, =dResult		// load the address for result lplace
	str		X1, [X0]			// store result in X1 into dResult
	
	ldr		X0, =szIndexof2		// load message for String_indexOf_1
	bl		putString			// print message out
	
	ldr		X1, =chLetter		// move requested letter into x1
	bl		putch				// print byte out
	
	ldr		X0, =szComma		// get address for the comma
	bl		putString			// print out comma
	
	ldr		X0, =szMiddle		// get address for indexed number
	ldr		X1, =dMiddle		// get address for address
	bl		hextodec			// chage an ascii char into an int
	
	ldr		X0, =szMiddle		// get address for number
	bl		putString			// print string
	
	ldr		X0, =szEnd			// load the ending message address
	bl		putString			// print message out
	
	ldr		X0, =szResult		// load where the number will go
	ldr		X1, =dResult		// load the address for the result
	bl		hextodec			// change an asci char into an int

	ldr		X0, =szResult		// load the string result
	bl		putString			// print it out
	
	ldr		X1, =chLine			// load the address for a newline
	bl		putch				// print a new character out
	
	ldr		X0, =szResult		// load address for resutl
	bl		clear_string		// reset string
	
	ldr		X0, =szMiddle		// load address for middle portion
	bl		clear_string		// reset string
	
// Display the String_indexOf_3 //
	
	ldr		X0, =s2				// load the address for the string
	ldr		X1, =szParam		// load the parameter
	
	bl		String_indexOf_3	// get the index of a letter
	ldr		X0, =dResult		// load the address for result lplace
	str		X1, [X0]			// store result in X1 into dResult
	
	
	ldr		X0, =szIndexof3		// load message for String_indexOf_1
	bl		putString			// print message out
	
	ldr		X0, =szParam		// load parameter into X0
	bl		putString			// print byte out
	
	ldr		X0, =szEnd			// load the ending message address
	bl		putString			// print message out
	
	ldr		X0, =szResult		// load where the number will go
	ldr		X1, =dResult		// load the address for the result
	bl		hextodec			// change an ascii char into an int

	ldr		X0, =szResult		// load the string result
	bl		putString			// print it out
	
	ldr		X1, =chLine			// load the address for a newline
	bl		putch	
	
	ldr		X0, =szResult		// load address for resutl
	bl		clear_string		// reset string
	
	
// Display results for String_lastIndexOf_1//
	
	ldr		X0, =s2				// load the address for the string
	ldr		X1, =chLet			// load the address for a byte
	mov		X3, 'g'				// move the byte g into X3
	strb	W3, [X1]			// store the byte into 
	bl		String_lastIndexOf_1// get the index of a letter
	ldr		X0, =dResult		// load the address for result lplace
	str		X1, [X0]			// store result in X1 into dResult
	
	
	ldr		X0, =szLastIndexof1		// load message for String_indexOf_1
	bl		putString			// print message out
	
	ldr		X1, =chLetter		// move requested letter into x1
	bl		putch				// print byte out
	
	ldr		X0, =szEnd			// load the ending message address
	bl		putString			// print message out
	
	ldr		X0, =szResult		// load where the number will go
	ldr		X1, =dResult		// load the address for the result
	bl		hextodec			// change an ascii char into an int

	ldr		X0, =szResult		// load the string result
	bl		putString			// print it out
	
	ldr		X1, =chLine			// load the address for a newline
	bl		putch				// print a new character out
	
	ldr		X0, =szResult		// load address for resutl
	bl		clear_string		// reset string
	
// Display results for String_lastIndexOf_2//
	
	ldr		X0, =s2				// load the address for the string
	ldr		X1, =chLet			// load the address for a byte
	mov		X3, 'g'				// move the byte g into X3
	strb	W3, [X1]			// store the byte into 
	ldr		X3, = dMiddle		// load address to d middle
	mov		X2, #6				// move 3rd paraemeter into X2
	str		X2, [X3]			// store value at X2 into dMiddle
	bl		String_lastIndexOf_2// get the index of a letter
	ldr		X0, =dResult		// load the address for result lplace
	str		X1, [X0]			// store result in X1 into dResult
	
	ldr		X0, =szLastIndexof2	// load message for String_indexOf_1
	bl		putString			// print message out
	
	ldr		X1, =chLetter		// move requested letter into x1
	bl		putch				// print byte out
	
	ldr		X0, =szComma		// get address for the comma
	bl		putString			// print out comma
	
	ldr		X0, =szMiddle		// get address for indexed number
	ldr		X1, =dMiddle		// get address for address
	bl		hextodec			// chage an ascii char into an int
	
	ldr		X0, =szMiddle		// get address for number
	bl		putString			// print string
	
	ldr		X0, =szEnd			// load the ending message address
	bl		putString			// print message out
	
	ldr		X0, =szResult		// load where the number will go
	ldr		X1, =dResult		// load the address for the result
	bl		hextodec			// change an asci char into an int

	ldr		X0, =szResult		// load the string result
	bl		putString			// print it out
	
	ldr		X1, =chLine			// load the address for a newline
	bl		putch				// print a new character out
	
	ldr		X0, =szResult		// load address for resutl
	bl		clear_string		// reset string
	
	ldr		X0, =szMiddle		// load address to middle parameter
	bl		clear_string		// clear the string
	
// Display results for String_lastIndexOf_3/
	
	ldr		X0, =s2				// load the address for the string
	ldr		X1, =szParam		// load the parameter
	
	bl		String_lastIndexOf_3	// get the index of a letter
	ldr		X0, =dResult		// load the address for result lplace
	str		X1, [X0]			// store result in X1 into dResult
	
	ldr		X0, =szLastIndexof3	// load message for String_indexOf_1
	bl		putString			// print message out
	
	ldr		X0, =szParam		// load parameter into X0
	bl		putString			// print byte out
	
	ldr		X0, =szEnd			// load the ending message address
	bl		putString			// print message out
	
	ldr		X0, =szResult		// load where the number will go
	ldr		X1, =dResult		// load the address for the result
	bl		hextodec			// change an ascii char into an int

	ldr		X0, =szResult		// load the string result
	bl		putString			// print it out
	
	ldr		X1, =chLine			// load the address for a newline
	bl		putch	
	
	ldr		X0, =szResult		// load address for resutl
	bl		clear_string		// reset string
	
// Display the results of replacing a letter

	ldr		X0, =s1				// load the address into X0
	ldr		X1, =chA			// load the letter a
	ldrb	W1, [X1]			// load value at chA
	ldr		X2, =chO			// load the letter o
	ldrb	W2, [X2]			// load value at chO
	bl		String_replace		// replace the letters specified
	
	ldr		X0, =szReplace		// load address to replace string
	bl		putString			// print message
	
	ldr		X1, =chA			// load letter a
	bl		putch				// print byte
	
	ldr		X0, =szComma			// load address for comma
	bl		putString			// print message
	
	ldr		X1, =chO			// load letter o
	bl		putch				// print byte
	
	ldr		X0,	=szEnd			// load addrses to end message
	bl		putString			// print message
	
	ldr		X0, =s1				// load address of s1
	bl		putString			// print string
	
	ldr		X1, =chLine			// load newline
	bl		putch				// print newline
	
	
// Display the results of lowercasing letters

	ldr		X0, =s1				// load the address into X0
	bl		String_toLowerCase	// lowercase the whole string
	
	ldr		X0, =sztoLower		// load address for lowercase
	bl		putString			// print the message
	
	ldr		X0, =szEnd			// load address for End messgae
	bl		putString			// print the message
	
	ldr		X0, =s1				// load the address into X0
	bl		putString			// print string
	
	ldr		X1, =chLine			// load the newline
	bl		putch				// print newline
	
// Display the results of lowercasing letters

	ldr		X0, =s1				// load the address into X0
	bl		String_toUpperCase	// lowercase the whole string
	
	ldr		X0, =sztoUpper		// load address for lowercase
	bl		putString			// print the message
	
	ldr		X0, =szEnd			// load address for End messgae
	bl		putString			// print the message
	
	ldr		X0, =s1				// load the address into X0
	bl		putString			// print string
	
	ldr		X1, =chLine			// load the newline
	bl		putch				// print newline
	
// Display a concatenated string

	ldr		X0, =s1				// load the address for s1
	ldr		X1, =s2				// load the addres for s2
	bl		String_concat		// add the two strings together
	
	ldr		X0, =szResult		// load the result address
	str		X1, [X0]			// store the address of the concatenated string into szResult
	
	ldr		X0, =szConcat		// load address for concat message
	bl		putString			// print message
	
	ldr		X0, =szEnd			// load ending message
	bl		putString			// print message
	
	ldr		X0, =szResult		// load the result address
	ldr		X0, [X0]			// load the address inside pointers
	bl		putString			// print message	
	
	ldr		X1, =chLine			// load newline char
	bl		putch				// print a newlineb 
		
exit:
	mov		X0, #0
	mov		X8, #93
	svc		0
	
	
clear_string:
	mov		X2, #0
	
loop_clear:
	mov		X1, #0			// move 0 into X1
	strb	W1, [X0], #1	// store 0 to reset string
	cmp		X2, #20			// comapre to exit loop
	beq		exit_clear
	add		X2, X2, #1		// increment X2
	b 		loop_clear		// branch back to loop clear

exit_clear:
	ret		LR				// return Link Register
