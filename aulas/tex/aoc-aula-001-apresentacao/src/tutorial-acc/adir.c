#include <stdio.h>
#include <stdlib.h> 

float scaled(float* v1, float* v2, float a, int n){
	int i;
	float sum;
	sum = 0.0;
	#pragma acc region for
	for( i=0; i<n; ++i){
		v1[i] += a*v2[i];
		sum += v1[i];
	}
	return sum;
}

int main(){
	float sum = 0.0;
	int n = 10;
	int i;
	
	float* v1;
	float* v2;
	
	v1 = (float*) malloc(n * sizeof(float));
	v2 = (float*) malloc(n * sizeof(float));
		
	for( i=0; i<n; ++i){
		v1[i] = 1.0;
		v2[i] = 1.0;
	}
	
	
	sum = scaled(v1, v2, 2, n);
	
	printf("Sum: %f", sum);
	
	return 0;
}
