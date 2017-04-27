#include <stdlib.h>
#include <stdio.h>

int somar(int x, int y){
	return x + y;
}

int main(){
    int a = 10;
    int b = 20;
    int c = somar(a, b);
    printf("elment:  %d\n", c);
}
