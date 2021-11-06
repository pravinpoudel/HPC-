#include <stdlib.h>
#include <stdio.h>
#include <string.h>

__global__ void cuda_hello(){
    printf("Hello world from cuda device");
}

int main(){
    cuda_hello<<1,1>>()
    cudaDeviceSynchronize();
    return 0;
}