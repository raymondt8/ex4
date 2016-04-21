#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <stdbool.h>


#include "omp.h"

#include "functions.h"

struct Vector* newVector()
{
	struct Vector* vectorS = malloc(sizeof(Vector));
	return vectorS;
}
void allocVector(int size, Vector* vectorS)
{
	/*//Try to allocate vector structure 
	struct Vector* vectorP = malloc(sizeof(struct Vector));
	if(vectorP == NULL)
	{
 		printf("Error: Could not allocate memory for vector structure \n");
		return NULL; 
	}
	*/
	//Try to allocate data, free structure if fail	
	vectorS->data = malloc(size*sizeof(double));
	if(vectorS->data == NULL)
	{
		printf("Error: Could not allocate memory for data in vector structure \n");
		free(vectorS);
		//return NULL;
	}

	//Set size and return
	vectorS->size = size;

//	return(vectorP);
}


void initVector(int size, Vector* vectorS, bool openMP)
{
	//struct Vector* vec = newVector(size);
	allocVector(size, vectorS);
	if(openMP)
	{
		//use static, approximately equal amount of work for each iteration
		#pragma omp parallel for schedule(static)
		for(int i=1;i<=vectorS->size;++i)
		{
			vectorS->data[i-1] = 1.0/((double)i*i);
		}	
	}else
	{
	
		for(int i=1;i<=vectorS->size;i=i+1)
		{
			vectorS->data[i-1] = 1.0/((double)i*i);
		}	
	}
	//return vec;
}

void freeVector(Vector* vectorS)
{
	if(vectorS!=NULL)
	{
		free(vectorS->data);
		free(vectorS);
	}
}

double vectorSum(struct Vector* vec, bool openMP)
{
	double sum =0.0;

	if(openMP)
 	{
		//use static, approximately equal amount of work for each iteration
		#pragma omp parallel for schedule(static)
		for(int i=0; i<vec->size;++i)
		{
			sum = sum + vec->data[i];
		}
	}else
	{
		for(int i=0; i<vec->size;++i)
		{
			sum = sum + vec->data[i];
		}
	}
	return(sum);
}

void splitVector(int globLen, int mpiSize, int** len, int** displ)
{
  *len = calloc(mpiSize,sizeof(int));
  *displ = calloc(mpiSize,sizeof(int));
  for (int i=0;i<mpiSize;++i) {
    (*len)[i] = globLen/mpiSize;
    if (globLen % mpiSize && i <= (globLen % mpiSize - 1))
      (*len)[i]++;
    if (i < mpiSize-1)
      (*displ)[i+1] = (*displ)[i]+(*len)[i];
  }
}
