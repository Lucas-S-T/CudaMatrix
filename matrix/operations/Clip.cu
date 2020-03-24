//
// Created by root on 23/03/2020.
//

#include "../Matrix.cuh"
#include <iostream>

__global__ void matrixClip(double *a, double min, double max, double *c, int cr, int cc){

    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row


    if(x < cc && y < cr){

        if(a[y * cc + x] > max){
            c[y * cc + x] = max;
        }else{
            if(a[y * cc + x] < min){
                c[y * cc + x] = min;
            }else{
                c[y * cc + x] = a[y * cc + x];
            }
        }

    }

}



Matrix Matrix::clip(double min, double max){

    static double* c;
    c = (double*) calloc(this->Rows*this->Columns,sizeof(double));

    //Define os endereçoes da memória de vídeo
    double *d_a, *d_c;

    //Define o tamanho de cada matriz e escalar na memória
    long aSize = this->Rows*this->Columns*sizeof(double);
    long cSize = this->Rows*this->Columns*sizeof(double);

    //Aloca espaço na memória de vídeo

    cudaMalloc((void**)&d_a, aSize);
    cudaMalloc((void**)&d_c, cSize);

    //Move a matriz e o escalar para a memória de vídeo alocada

    cudaMemcpy(d_a, this->Value, aSize, cudaMemcpyHostToDevice);

    //Define as dimensões
    dim3 dimBlock(32,32); // 32x32 -> 1024 Threads
    dim3 dimGrid(this->Rows,this->Columns);

    //Efetua a multiplicação
    matrixClip<<<dimGrid, dimBlock>>>(d_a, min, max, d_c, this->Rows, this->Columns);
    //Copia o resultado de volta
    cudaMemcpy(c, d_c, cSize, cudaMemcpyDeviceToHost);

    //Limpa a memória de vídeo
    cudaFree(d_a);
    cudaFree(d_c);

    //Salva

    return {this->Columns, this->Rows, c};

}


