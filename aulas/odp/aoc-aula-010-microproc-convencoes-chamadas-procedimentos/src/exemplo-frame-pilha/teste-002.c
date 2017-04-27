// #include <stdio.h>

int magica(int x, int y, int z, int w, int t){
	int res = 0;
	res = (x + y) - (z + w) + t;
	return res;
}

int main(){
	int a = 2;
	int b = 3;
	int c = 4;
	int d = 5;
	int e = 6;
	int f = 0;

	a = a * 3;
	a = a - 2;

	f = magica(a, b, c, d, e);

	f = f + 2;
	// printf("%d\n", f);
	return 0;
}
