# Tyler Griffith
# CSC3410
# 11/18/17
# ~/csc3410/p8/p8.s
# This program uses system calls to read in a character while the character is not the newline
# character and coverts that character to an integer equivalent and the char value with bit mask
# 0x0F. Then uses a system call to read in the next character and returns X in the rax register.
	.equ	STDIN, 0
	.equ	STDOUT, 1
	.equ	READ, 0
	.equ	WRITE, 1
	.equ	EXIT, 60

.section	.data
x:	.long	0
y:	.string	" \n"
.section	.text
		.globl	readInt
		.type	readInt,@function
readInt:
	pushq	%rbp
	movq	%rsp, %rbp
	
	movl	$READ, %eax
	movl	$STDIN, %edi
	movl	$y, %esi
	movl	$1, %edx
	syscall

while:	#while(x != 0x0A)
	cmpl	$10, y
	je	done

	#bit mask
	movl	$y, %eax
	andl	0x0F, %eax
	movl	%eax, x

	#x = x*10 + convertedCharacter
	movl	$y, %edx	
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	$x, %eax
	addl	%edx, %eax
	movl	%eax, %esi

	movl	$READ, %eax
	movl	$STDIN, %edi
	movl	$y, %esi
	movl	$1, %edx
	syscall
	
	jmp	while

done:
	movl	$y, %eax
	leave
	ret
