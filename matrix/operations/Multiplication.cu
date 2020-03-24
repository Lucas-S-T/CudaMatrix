//
// Created by root on 23/03/2020.
//

#include "../Matrix.cuh"
#include <iostream>

__global__ void matrixMultiply(double *a, double *b, double *c, int cr, int cc, int ac, int bc){

    long x = blockIdx.x * blockDim.x + threadIdx.x; // col
    long y = blockIdx.y * blockDim.y + threadIdx.y; // row
    double sum = 0;

    if(x < cc && y < cr){

        for(int k = 0; k<ac; k++){
            sum+= a[y*ac+k] * b[k*bc+x];
        }
        c[y * cc + x] = sum;
    }

}



Matrix Matrix::multiply(Matrix m){

    if(this->Columns != m.Rows){
        std::cout << "Cannot multiply matrix. Invalid size";
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
    matrixMultiply<<<dimGrid, dimBlock>>>(d_a, d_b, d_c, this->Rows, m.Columns, this->Columns, m.Columns);
    //Copia o resultado de volta
    cudaMemcpy(c, d_c, cSize, cudaMemcpyDeviceToHost);

    //Limpa a memória de vídeo
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);

    //Salva

    return {m.Columns, this->Rows, c};

}


