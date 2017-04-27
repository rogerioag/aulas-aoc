
int factorial (int n){
	if (n < 2)
		return 1;
	else
		return (n * factorial(n-1));
}

int main(){
	int res = 0;
	res = factorial(5);
	return res;
}
