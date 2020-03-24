//
// Created by root on 24/03/2020.
//

#include "../Matrix.cuh"

void Matrix::randomFill(){

    static double* c;
    c = (double*) calloc(Columns*Rows,sizeof(double));

    for(int i = 0; i<(Columns*Rows); i++ ){

        c[i] = (((double) rand() / (RAND_MAX)) + 1)*pow(10, -0.5);

    }

    Value = c;

}

void Matrix::zeros(){

    static double* c;
    c = (double*) calloc(Columns*Rows,sizeof(double));

    for(int i = 0; i<(Columns*Rows); i++ ){

        c[i] = 0;

    }

    Value = c;

}

void Matrix::randomFillSmall(){

    static double* c;
    c = (double*) calloc(Columns*Rows,sizeof(double));

    for(int i = 0; i<(Columns*Rows); i++ ){

        c[i] = (((double) rand() / (RAND_MAX)) + 1) /1000;

    }

    Value = c;

}