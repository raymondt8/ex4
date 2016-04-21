#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <sys/time.h>
#include <stdbool.h>
//#include <time.h>

#include "omp.h"
#include <mpi.h>
#include "functions.h"

#define PI 3.14159265358979323846
int main(int argc,char** argv)
{
	/////////////////////////////
	//Changable settings for the program
	bool enableOpenMP = 0;
	bool enableMPI = 0;
	int vectorSize = 256;
	/////////////////////////////
	int k=atoi(argv[1]);
	//for(int k=3;k<=14;k++){
		vectorSize = 2^k;
	if(enableOpenMP) omp_set_num_threads(4);

	if(enableMPI)
	{
		int rank , mpiSize;
		MPI_Init (&argc , &argv);
		MPI_Comm_size(MPI_COMM_WORLD , &mpiSize);
		MPI_Comm_rank(MPI_COMM_WORLD , &rank);
		
		struct Vector* globalVector = newVector();
		struct Vector* localVector = newVector();
		double globalSum =0.0, localSum =0.0;	
		double endTime = 0.0, startTime = 0.0;
		int *localSize, *displ;
		
		splitVector(vectorSize,mpiSize,&localSize,&displ);	
		allocVector(localSize[rank], localVector);
		
		if(rank ==0)
		{
			startTime = MPI_Wtime();
			initVector(vectorSize,globalVector,enableOpenMP);
		}

		MPI_Scatterv(globalVector->data,localSize,displ,MPI_DOUBLE,localVector->data,localSize[rank],MPI_DOUBLE, 0,MPI_COMM_WORLD);

		localSum = vectorSum(localVector,enableOpenMP);
		
		MPI_Reduce(&localSum,&globalSum,1,MPI_DOUBLE,MPI_SUM,0,MPI_COMM_WORLD);
	
		if(rank==0)
		{
			double diff = fabs((PI*PI)/6-globalSum);
			endTime = MPI_Wtime();
			
			printf("Difference MPI |S-Sn| = %f \n",diff);
			printf("Walltime MPI = %f \n",endTime - startTime);
			
			freeVector(globalVector);
		}

		if(rank!=0) free(globalVector);

		freeVector(localVector);
		free(localSize);
		free(displ);

		MPI_Finalize();
	
	}else
	{
		struct timeval* startTime = malloc(sizeof(struct timeval));
		struct timeval* endTime = malloc(sizeof(struct timeval));
		struct Vector* globalVector = newVector();
		
		gettimeofday(startTime,0);

		initVector(vectorSize,globalVector,enableOpenMP);
	
		double sumSn = vectorSum(globalVector, enableOpenMP);
		double diff = fabs((PI*PI)/6-sumSn);
	
		gettimeofday(endTime,0);
	
		printf("Difference serial |S-Sn| = %f \n",diff);
		printf("Walltime serial = %f\n",(endTime->tv_sec+endTime->tv_usec)/1.0e6 -(startTime->tv_sec+startTime->tv_usec)/1.0e6);
		
		freeVector(globalVector);
		free(startTime); free(endTime);
	}
	//}
	return 0;
}
