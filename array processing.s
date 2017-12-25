# Tyler Griffith
# Due: 11/3/17
# CSC-3410
# P5 - Array Processing
# This program will read in a set of  number grades from a data file and find the frequency
# of each of the letter grades

.section	.data
#output templating
infmt:		.string		"%d"
labels:		.string		"| Grade      |    Frequency    |\n"
divider:	.string		"| ========== | ==============  |\n"
outfmtA:	.string		"| A	     |		 %d     |\n"  
outfmtB:	.string		"| B	     |		 %d     |\n"
outfmtC:	.string		"| C	     |		 %d     |\n"
outfmtD:	.string		"| D 	     |		 %d     |\n"
outfmtF:	.string		"| F 	     |		 %d     |\n"
		.align		8
#variables
n:		.quad		0	
gradeA:		.quad		0
gradeB:		.quad		0
gradeC:		.quad		0
gradeD:		.quad		0
gradeF:		.quad		0
k:		.quad		0

.section	.bss		
		.lcomm		grades,240 #Reserve 240 bytes for 30 the 30  possible grades

.section	.text
		.globl		main
		.type		main,@function
main:
		#reading in the data
		pushq		%rbp
		movq		%rsp,%rbp
		movq		$0,%rax
		movq		$infmt,%rdi
		movq		$n,%rsi
		call		scanf
		movq		$0,k
array:
		#getting the data into array format
		movq		n,%rbx
		cmpq		%rbx,k 
		jge		start	#break the loop if all values have been read in
		movq		$0,%rax
		movq		$infmt,%rdi
		movq		$grades,%r15
		movq		k,%r14
		leaq		(%r15,%r14,8),%rsi
		call		scanf

		incq		k
		jmp		array
#to break the loop
start:
		movq		$0,k
counter: 
		#Increments all of the values of the respective grades by incrementing the
		#grade's respective variable depeding on the value read in
		movq		n,%rbx
		cmpq		%rbx,k 
		jge		done 

		movq		$0,%rax
		
		movq		$grades,%r15
		movq		k,%r14
		movq		(%r15,%r14,8),%rdx

		cmpq		$90,%rdx
		jge		A

		cmpq		$80,%rdx
		jge		B

		cmpq		$70,%rdx
		jg		C

		cmpq		$60,%rdx
		jge		D

		cmpq		$0,%rdx
		jg		F
		

		incq		k
		jmp		counter

#incrementing the respective values
A:
		incq		gradeA
		movq		$0,(%r15,%r14,8)
		incq		k	
		jmp		counter
B:
		incq		gradeB
		movq		$0,(%r15,%r14,8)
		incq		k	
		jmp		counter
C:		
		incq		gradeC
		movq		$0,(%r15,%r14,8)
		incq		k	
		jmp		counter
D:	
		incq		gradeD
		movq		$0,(%r15,%r14,8)
		incq		k	
		jmp		counter
F:		
		incq		gradeF		
		movq		$0,(%r15,%r14,8)
		incq		k	
		jmp		counter

#final output		
done:
		movq		$0,%rax
		movq		$labels,%rdi
		call		printf
		
		movq		$0,%rax
		movq		$divider,%rdi
		call		printf
		
		
		movq		$0,%rax
		movq		$outfmtA,%rdi
		movq		gradeA,%rsi
		call		printf
		
		movq		$0,%rax
		movq		$outfmtB,%rdi
		movq		gradeB,%rsi
		call		printf

		movq		$0,%rax
		movq		$outfmtC,%rdi
		movq		gradeC,%rsi
		call		printf

		movq		$0,%rax
		movq		$outfmtD,%rdi
		movq		gradeD,%rsi
		call		printf

		movq		$0,%rax
		movq		$outfmtF,%rdi
		movq		gradeF,%rsi
		call		printf
		
		movq		$0,%rax
		movq		$divider,%rdi
		call		printf

		movl		$2,%eax
		leave
		ret
