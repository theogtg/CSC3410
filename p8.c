// Tyler Griffith
// CSC3410
// 11-18-17
// ~/csc3410/p8/p8.c
// This program will prompt the user to enter an integer then call an assembly program

int readInt();

#include <stdio.h>
int main(){
	int z=0;

	printf("Input an integer: \n");
	z = readInt();
	printf("Return value: %d", z);

	return 0;
}
