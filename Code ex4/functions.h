#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include <stdbool.h>

typedef struct Vector
{
	int size;
	double* data;	
}Vector;//Struct with a  vector, named data, with length "size"

struct Vector* newVector(
	);//Allocate and return an empty struct of type vector

void allocVector(
	int size,	//Length of vector
	Vector* vectorS
	);//Allocates and returns a Vector with data size "size" 
void initVector(
	int size,	//in: Size of vector
	Vector* vectorS, //in: vectorstruct to be filled with values

	bool openMP	//in: is openpm
	);//Returns a filled Vector of length "size"

void freeVector(
	Vector* vectorS	//Vector to be freed
	);//Free the memory allocated by newVector


double vectorSum(
	struct Vector* vec,	//in:vector to be elementwise summed
	bool openMP		//in: is openpm
	);//Takes in a vector and sums all the elemnets, if openMP enabled it it performed in parallel
 
void splitVector(
	int globLen,	//in: global length of vector
	int commSize, 	//in: communicator size
 	int** len,	//out:local length of vector
 	int** displ	//out: start of each local vector
	);//Takes in length of vector and splits it between the processors, processor 0 gets least work

#endif
