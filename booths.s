#; Name: Tyler Griffith
#; Date: 10-7-2017
#; Class: CSC-3410
#; Location: ~/csc3410/p4
#; Program to impliment Booth's Algorithm
.section .data
prompt:	.string	"Enter two integers: "
outfmt:	.string	"multiplicand=%ld multiplier=%ld\n"
outfmt2:	.string	"output=%ld\n"
infmt:	.string	"%ld%ld"

multiplicand:	.long	0
multiplier:	.long	0
a:	.long	0
b:	.long	0
output:	.quad	0
	.text
	.globl	main
	.type main,@function

main:
	pushq	%rbp
	movq	%rsp,%rbp
	movq	$0,%rax
	movq	$prompt,%rdi
	call	printf	#; PRINT "Enter two integers: "

	movl	$0,%eax
	movl	$infmt,%edi
	movl	$multiplicand,%esi
	movl	$multiplier,%edx
	call	scanf	#; GET the two integers

check1:
	movl	multiplier,%edx
	andl	$1,%edx		#; and 1 and edx to get the least significant bit of the multiplier
	cmpl	$0,%edx		#; compare the least significant bit to 0
	jg	subtraction	#; if greater than  0 then jump to subtraction
	jmp	shift

check2:
	movl	$0,%edx
	movl	multiplier,%edx
	andl	$0x11,%edx	#and with 3 to get the two least sig. bits
	cmpl	$0x11,%edx	#compare
	jg	shift		#if it's greater than 0 then shift	
	cmpl	$1,%edx		#compare 1 to get the least significant bit
	jg	subtraction	#if it's greater than 0 then jump to subtract
	jl	shift		#if it's less than 0 then do nothing and shift
	je	addition	#if it's equal to 0 then jump to addition

subtraction:			#; subtract the multiplicand from 0
	movl	multiplicand,%ecx
	movl	$0,%eax
	subl	%ecx,%eax
	jmp	shift

addition:
	movl	multiplicand,%ebp
	movl	movl,

shift:	
	movl	$0,%eax
	movl	a,%edi
	
	
	leave
	ret
