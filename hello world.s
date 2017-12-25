#Name: Tyler Griffith
#Date: 9/18/2017
#Class: CSC-3410
#Location: ~/csc3410/p2
#Infamous Hello World Program
.data
outfmt:	.string	"Hello World\n"
.globl	main
.type main,@function
main:
		pushq	%rbp
		movq	%rsp, %rbp
		movq	$outfmt, %rdi
		call	printf
		movq	$0, %rax
		leave
		ret
		
