//
// Created by root on 26/03/2020.
//

#ifndef HELLOCUDA_NEURALNETWORK_CUH
#define HELLOCUDA_NEURALNETWORK_CUH


#include "../matrix/Matrix.cuh"

class NeuralNetwork {

public:
    int InputLayers;
    int HiddenLayers;
    int OutputLayers;
    Matrix IHWeight = Matrix(0, 0, nullptr);
    Matrix HOWeight = Matrix(0, 0, nullptr);
    double LearningRate;
    NeuralNetwork(int il, int hl, int ol, double lr);
    Matrix FeedForward(Matrix inputs);
    double SupervisedTrain(Matrix inputs, Matrix outputs);

};


#endif //HELLOCUDA_NEURALNETWORK_CUH
