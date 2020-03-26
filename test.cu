//
// Created by root on 23/03/2020.
//

#include <iostream>
#include "matrix/Matrix.cu"
#include "neural/NeuralNetwork.cuh"


int main(){


    NeuralNetwork nn = NeuralNetwork(2, 5, 1, 0.1);

    double inpt[] = {0.01,0.99};
    double inpt2[] = {0.99,0.99};
    double inpt3[] = {0.01,0.01};
    double inpt4[] = {0.99,0.01};

    double out1[] = {0.99};
    double out2[] = {0.01};

    Matrix i1 = Matrix(1,2, inpt);
    Matrix i2 = Matrix(1,2, inpt2);
    Matrix i3 = Matrix(1,2, inpt3);
    Matrix i4 = Matrix(1,2, inpt4);

    Matrix o1 = Matrix(1,1, out1);
    Matrix o2 = Matrix(1,1, out2);


    std::cout << "Iniciando treinamento, Neurônios: 2-->5-->1, LR = 0.1\n";

    //Treinano XOR
    long time = clock();
    double err = 0.0;
    while (true){
    err = 0.0;

    for(int x = 0; x<1000; x++) {
        err += nn.SupervisedTrain(i1, o1);
        err += nn.SupervisedTrain(i2, o2);
        err += nn.SupervisedTrain(i3, o2);
        err += nn.SupervisedTrain(i4, o1);

    }


       err = err/1000;
    std::cout<< err << "\n";

    if(err < 1){
        break;
    }

}

    std::cout << "Convergência encontrada, tempo decorrido: " << float((clock()-time))/CLOCKS_PER_SEC << "s\n";



    nn.FeedForward(i1).print();
    nn.FeedForward(i2).print();
    nn.FeedForward(i3).print();
    nn.FeedForward(i4).print();



    return 0;
}