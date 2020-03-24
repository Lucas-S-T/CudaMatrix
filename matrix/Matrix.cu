//
// Created by root on 23/03/2020.
//

#include "Matrix.cuh"





Matrix::Matrix(int cols, int rows, double *v) {

    Columns = cols;
    Rows = rows;
    Value = v;


}





void Matrix::print(){

    printf("-------------\n");
    for(int i = 0; i<(this->Rows*this->Columns); i++){
        printf("%lf  ", Value[i]);
        if((i+1)%this->Columns == 0){
            std::cout << std::endl;
        }

    }
    printf("-------------\n");


}

