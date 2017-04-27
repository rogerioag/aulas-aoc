float scaled(float* v1, float* v2, float a, int n){
	int i;
	float sum;
	sum = 0.0f;

	for( i=0; i<n; ++i){
		v1[i] += a*v2[i];
		sum += v1[i];
	}
	return sum;
}
