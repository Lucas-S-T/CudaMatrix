//
// Created by root on 24/03/2020.
//


#include "../Matrix.cuh"

double Matrix::sumAll(){

    double sum = 0.0;

    for(int i = 0; i<(Columns*Rows); i++ ){

        sum += Value[i];

    }

return sum;

}