// Programmer: Anthony Grippi
// RASM 3
// Purpose:
// String_length(string1:String):int    
// String_equals(string1:String,string2:String):boolean   (byte) 
// String_equalsIgnoreCase(string1:String,string2:String):boolean   (byte) 
// String_copy(string1:String):String => +String_copy(lpStringToCopy:dword):dword 
// String_substring_1(string1:String,beginIndex:int,endIndex:int):String 
// String_substring_2(string1:String,beginIndex:int):String 
// String_charAt(string1:String,position:int):char (byte)  
// String_startsWith_1(string1:String,strPrefix:String, pos:int):boolean 
// String_startsWith_2(string1:String, strPrefix:String):boolean  
// String_endsWith(string1:String, suffix:String):boolean  

	.data

szBuffer1:	.skip	512		// keyboard buffer
szBuffer_len1	= . - szBuffer1

szBuffer2:	.skip	512		// keyboard buffer
szBuffer_len2	= . - szBuffer2

szBuffer3:	.skip	512		// keyboard buffer
szBuffer_len3	= . - szBuffer3

szString4:	.skip	512

szMsg1:		.asciz	"Enter String 1: "
szMsg2:		.asciz	"Enter String 2: "
szMsg3:		.asciz	"Enter String 3: "

szLen1:		.asciz	"s1.length() = "
szLen2:		.asciz	"s2.length() = "
szLen3:		.asciz	"s3.length() = "

szEq1:		.asciz	"String_equals(s1, s3) = "
szEq2:		.asciz	"String_equals(s1, s1) = "
szICEq1:	.asciz	"String_equalsIgnoreCase(s1, s3) = "
szICEq2:	.asciz	"String_equalsIgnoreCase(s1, s2) = "

szCpyS1:	.asciz	"s4 = String_copy(s1)\n"

szSubStr1:	.asciz	"String_substring_1(s3, 4, 14) = "
szSubStr2:	.asciz	"String_substring_2(s3, 7) = "

szStrCharAt:	.asciz	"String_charAt(s2, 4) = "

szStart1:	.asciz	"String_startsWith_1(s1, 11, \"hat.\") = "
szStart2:	.asciz	"String_startsWith_2(s1, \"Cat\") = "

szEnd:		.asciz	"String_endsWith(s1, \"in the hat.\") = "

szTrue:		.asciz	"True\n"
szFalse:	.asciz	"False\n"

szhat:		.byte	68
szcat:		.asciz	"Cat"
szinthehat:	.asciz	"in the hat."
szN:		.asciz	"n"

szNL:		.asciz	"\n"
chChar:		.byte	0

	.global _start // provide program starting point
	.text

_start:

// GETTING INPUTS ----- S1, S2, AND S3 ----- S1 = X19, S2 = X20, S3 = X21

	ldr	X0,	=szMsg1		// print msg1
	bl	putString		// bl to pustring

	ldr	X1,	=szBuffer1	// prepare write to kbBuf
	ldr	X2,	=szBuffer_len1	// max size to write to kbBuf
	bl	getString		// branch and link to getString	
	mov	X19,	X1		// store the address of S1 into X19
	mov	X22,	X0		// moving size of S1 to X22
//	bl	malloc
//	mov	X19,	X0

	ldr	X0,	=szMsg2		// print msg2
	bl	putString		// bl to pustring

	ldr	X1,	=szBuffer2	// prepare to write to kbBuf
	ldr	X2,	=szBuffer_len2	// max size to write to kbBuf
	bl	getString		// branch and link to getString
	mov	X20,	X1		// store the address of S2 into X20
	mov	X23,	X0		// moving size of S2 to X23
//	bl	malloc
//	mov	X20,	X0

	ldr	X0,	=szMsg3		// print message 3
	bl	putString		// bl to pustring

	ldr	X1,	=szBuffer3	// prepare to write to kbBuf
	ldr	X2,	=szBuffer_len3	// max size to write to kbBuf
	bl	getString		// branch and link to getString
	mov	X21,	X1		// store the address of S3 into X21
	mov	X24,	X0		// moving size of S3 to X24
//	bl	malloc
//	mov	X21,	X0

	ldr	X0,	=szNL		// load the addres of new line
	bl	putString		// print new line character
// ----------------------------------------------------------------------

// PRINTING LENGTH OF S1, S2, AND S3 ------------------------------------ 1

	ldr	X0,	=szLen1		// print len 1
	bl	putString		// pustring	

	mov	X0,	X22		// getting length of string 1
	bl	printUInt		// printing length of string 1
	ldr	X0,	=szNL		// address new line character
	bl	putString		// printing new line character

	ldr	X0,	=szLen2		// print len 2
	bl	putString		// bl putstring
	
	mov	X0,	X23		// getting lengt og string 2
	bl	printUInt		// printing length of string 2
	ldr	X0,	=szNL		// address of new line character
	bl	putString		// printing new line character
	
	ldr	X0,	=szLen3		// print len 3
	bl	putString		// bl pustring
	
	mov	X0,	X24		// getting length of string 2
	bl	printUInt		// printing length of strign 2
	ldr	X0,	=szNL		// address of new line character
	bl	putString		// printing new line character

	ldr	X0,	=szNL		// address of new line character
	bl	putString		// printing new line character
// ---------------------------------------------------------------------- 1

// COMPARING S1 TO S3 --------------------------------------------------- 2

	ldr	X0,	=szEq1		// print eq 1
	bl	putString		// bl putstring

	mov	X0,	X19		// moving address of S1 to X0
	mov	X1,	X21		// moving address of S3 to X1
	bl	String_equals		// comparing S1 and S3

	cmp	X0,	#0		// compare the output of strcmp to 0
	b.ne	printFalse		// if the strings are != branch to false

	ldr	X0,	=szTrue		// else print true
	bl	putString		// branch and link to putstring
	b	equals2			// branch to next question

printFalse:

	ldr	X0,	=szFalse	// print false
	bl	putString		// branch and link to false
// ---------------------------------------------------------------------- 2

// COMPARING S1 TO S1 --------------------------------------------------- 3
equals2:

	ldr	X0,	=szEq2		// print eq2
	bl	putString		// bl putstring
	
	mov	X0,	X19		// store addr of S1 to X0
	mov	X1,	X19		// store addr of S1 to X1
	bl	String_equals		// compare S1 to S1
	
	cmp	X0,	#0		// if S1 != to S1 print fasle
	b.ne	printFalse2		// branch if the output is not 0
	
	ldr	X0,	=szTrue		// else print true
	bl	putString		// branch and link to putstring
	b	eqIC			// branch to next problem

printFalse2:
	
	ldr	X0,	=szFalse	// print fasle
	bl	putString		// branch and link to putstring
// ---------------------------------------------------------------------- 3

// COMPARING S1 TO S3 (IGNORE CASE) ------------------------------------- 4

eqIC:

	ldr	X0,	=szNL		// print new line
	bl	putString		// branch and link to pustring

	ldr	X0,	=szICEq1	// print mesage
	bl	putString		// putStrg

	mov	X0,	X19		// store S1 to X0
	mov	X1,	X21		// store S3 to X1
	bl	String_equalsIgnoreCase	// compare ignore case S1 and S3

	cmp	X0,	#0		// outputs 0 if they are the same
	b.ne	printFalse3		// if !0 print false
	
	ldr	X0,	=szTrue		// else print true
	bl	putString		// branch and link to putstring
	b	eqIC2			// brach to next problem

printFalse3:
	
	ldr	X0,	=szFalse	// print false
	bl	putString		// branch and link to putstring
// ---------------------------------------------------------------------- 4

// COMPARING S1 TO S2 (IGNORE CASE) ------------------------------------- 5

eqIC2:

	ldr	X0,	=szICEq2	// print message
	bl	putString		// bl to pustring	

	mov	X0,	X19		// store S1 in X0
	mov	X1,	X20		// store S2 in X1
	bl	String_equalsIgnoreCase	// compare ignore case S1 and S2

	cmp	X0,	#0		// outputs 0 if they are equal
	b.ne	printFalse4		// if != print false
	
	ldr	X0,	=szTrue		// else print true
	bl	putString		// branch and link to putsting
	b	cpyString		// brach to copy string

printFalse4:
	
	ldr	X0,	=szFalse	// print false
	bl	putString		// branch and link to putstring
// ---------------------------------------------------------------------- 5

// COPY S1 INTO S4 AND PRINT IT OUT ------------------------------------- 6

cpyString:
	
	ldr	X0,	=szNL		// print new line
	bl	putString		// branch and link to putstring

	ldr	X0,	=szCpyS1	// print message
	bl	putString		// bl to pustring

	mov	X0,	X19		// print the first string to print
	bl	putString		// bl to putstring

	ldr	X0,	=szString4	// load addr of S4 to mem
	mov	X1,	X19		// argument for strcpy
	bl	String_copy		// strcopy copies X1 to dest X0
	bl	putString		// print copied string
	
	ldr	X0,	=szNL		// print new line
	bl	putString		// bl putString
// ---------------------------------------------------------------------- 6

// PRINT THE SUBSTRING OF S3 FROM 4 TO 14 (NO CAT, NO PERIOD) ----------- 7
	
	ldr	X0,	=szSubStr1	// print message
	bl	putString		// branch and link to putstring

	ldr	X1,	=szString4	// output string
	mov	X0,	X19		// input string
	mov	X2,	#4		// start index
	mov	X3,	#10		// end index
	bl	substring		// branch and link to substring
	mov	X0,	X1		// move output string addr for pustring
	bl	putString		// brancha nd link to pustring
	
	ldr	X0,	=szNL		// print new line
	bl	putString		// branch and l to puString

// ---------------------------------------------------------------------- 7

// PRINT THE SUBSTRING OF S3 FROM 7 ONWARD (PRINT "the hat.") ----------- 8

	ldr	X0,	=szSubStr2	// print message
	bl	putString		// branch and link to putString

	mov	X0,	X21		// address of S3
	ldr	X1,	=szString4	// where we are outputting to
	mov	X2,	#7		// the index of the character
	bl	String_Substring_2	// branch and link to function
	mov	X0,	X1		// mov address of outputstring to X0
	bl	putString		// branch and link to pustring

// ---------------------------------------------------------------------- 8

// PRINT THE CHARACTER IN S2 AT LOCATION 4 (PRINT "n") ------------------ 9

	ldr	X0,	=szNL		// print new line
	bl	putString		// branch and link to putstrig	

	ldr	X0,	=szStrCharAt	// Print message
	bl	putString		// branch and link to pustring

	mov	X0,	X20		// address of s2
	mov	X1,	#4		// index of character
	bl	String_charAt		// get the character at location 4 in S2
	ldr	X0,	=szN		// load address of string 4
	bl	putString		// print the character at index 4

	ldr	X0, =szNL		// print new line character
	bl	putString		// branch and link to pustring
// ---------------------------------------------------------------------- 9

// DOES S1 AT LOCATION 11 START WITH "hat." ----------------------------- 10

	ldr	X0,	=szNL		// print new line
	bl	putString		// branch and link to pustring

	ldr	X0,	=szStart1	// print the message
	bl	putString		// branch and link to pustring

	mov	X0,	X19		// address of S1
	ldr	X1,	=szhat		// charater we are looking for
	bl	String_startsWith_1	// returns the first occurence of hat

	cmp	X0,	#0		// if hat is not inside of S1
	b.ne	Num10False		// print false

	ldr	X0,	=szTrue		// print true
	bl	putString		// branch and link to putstring
	b	Num11			// branch to Num 11

Num10False:
	
	ldr	X0,	=szFalse	// print false
	bl	putString		// branch and link to putstring
// ---------------------------------------------------------------------- 10

// DOES S1 START WITH "Cat" --------------------------------------------- 11

Num11:
	
	ldr	X0,	=szStart2	// print the opening message
	bl	putString		// branch and link to pustring

	ldr	X1,	=szcat		// the needle we are looking for in the haysytack
	mov	X0,	X19		// the haystack that we are searching for
	bl	String_startsWith_2	// strstr looks for a strin within a string

	cmp	X0,	#0		// see if strstr returned a null
	b.eq	Num11False		// if null print false
	
	ldr	X0,	=szTrue		// else print true
	bl	putString		// branch and link to putstring
	b	Num12			// go to next problem

Num11False:
	
	ldr	X0,	=szFalse	// print false
	bl	putString		// branch and link to putstring
// ---------------------------------------------------------------------- 11

// DOES S1 END WITH "in the hat" ---------------------------------------- 12
Num12:

	ldr	X0,	=szNL		// print new line
	bl	putString		// bl to puString

	ldr	X0,	=szEnd		// print the message
	bl	putString		// branch and link to pustring

	mov	X0,	X19		// the address of the string
	ldr	X1,	=szinthehat	// the address of the string within th estring we want
	bl	String_endsWith		// returns the last occuence of the string we are loocking for

	cmp	X0,	#0		// if the string is not present
	b.ne	Num12False		// print false

	ldr	X0,	=szTrue		// print true
	bl	putString		// branch and link to putstring
	b	exit			// branch to exit

Num12False:
	
	ldr	X0,	=szFalse	// print false
	bl	putString		// branch and link to putstring
// ---------------------------------------------------------------------- 12

exit:
					// setup parameters to end the program
					// and then call Linux to do it
	mov X0, #0			// use 0 as return code
	mov X8, #93			// service command code 93 terminates this program
 	svc 0				


