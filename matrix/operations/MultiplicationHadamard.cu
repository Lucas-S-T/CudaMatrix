//
// Created by root on 23/03/2020.
//

#include "../Matrix.cuh"
#include <iostream>

__global__ void matrixHadamard(double *a, double *b, double *c, int cr, int cc){

    long x = blockIdx.x * blockDim.x + threadIdx.x; // col
    long y = blockIdx.y * blockDim.y + threadIdx.y; // row

    if(x < cc && y < cr){
        c[y * cc + x] = a[y * cc + x] * b[y * cc + x];
    }

}



Matrix Matrix::hadamard(Matrix m){

    if(this->Columns != m.Columns || this->Rows != m.Rows){
        std::cout << "Cannot multiply hadamard. Invalid size";
        exit(-1);
    }

    static double* c;
    c = (double*) calloc(this->Rows*m.Columns,sizeof(double));

    //Define os endereçoes da memória de vídeo
    double *d_a, *d_b, *d_c;

    //Define o tamanho de cada matriz na memória
    int aSize = this->Rows*this->Columns*sizeof(double);
    int bSize = m.Rows*m.Columns*sizeof(double);
    int cSize = this->Rows*m.Columns*sizeof(double);

    //Aloca espaço na memória de vídeo

    cudaMalloc((void**)&d_a, aSize);
    cudaMalloc((void**)&d_b, bSize);
    cudaMalloc((void**)&d_c, cSize);

    //Move as 2 matrizes para a memória de vídeo alocada

    cudaMemcpy(d_a, this->Value, aSize, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, m.Value, bSize, cudaMemcpyHostToDevice);

    //Define as dimensões
    dim3 dimBlock(32,32); // 32x32 -> 1024 Threads
    dim3 dimGrid(this->Rows,m.Columns);

    //Efetua a multiplicação
    matrixHadamard<<<dimGrid, dimBlock>>>(d_a, d_b, d_c, this->Rows, m.Columns);
    //Copia o resultado de volta
    cudaMemcpy(c, d_c, cSize, cudaMemcpyDeviceToHost);

    //Limpa a memória de vídeo
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);

    //Salva

    return {m.Columns, this->Rows, c};

}


