//
// Created by root on 24/03/2020.
//

#include "../Matrix.cuh"

Matrix Matrix::softmax(){

    Matrix exp = this->exp();
    return exp.divideScalar(exp.sumAll());

}