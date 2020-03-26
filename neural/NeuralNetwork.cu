//
// Created by root on 26/03/2020.
//

#include <iostream>
#include "NeuralNetwork.cuh"


NeuralNetwork::NeuralNetwork(int il, int hl, int ol, double lr){

    this->InputLayers = il;
    this->HiddenLayers = hl;
    this->OutputLayers = ol;
    this->LearningRate = lr;

    static Matrix ih = Matrix(il, hl, nullptr);
    ih.randomFill(il);
    this->IHWeight = ih;

    static Matrix ho = Matrix(hl, ol, nullptr);
    ho.randomFill(hl);
    this->HOWeight = ho;

}

Matrix NeuralNetwork::FeedForward(Matrix inputs) {

    Matrix ih = IHWeight.multiply(inputs);
    ih =  ih.sigmoid();

    Matrix ho = HOWeight.multiply(ih);
    ho = ho.sigmoid();

    return ho;

}

double NeuralNetwork::SupervisedTrain(Matrix inputs, Matrix outputs) {



    Matrix ih = IHWeight.multiply(inputs);
    ih =  ih.sigmoid();

    Matrix ho = HOWeight.multiply(ih);
    ho = ho.sigmoid();

    Matrix oe = outputs.sub(ho);
    Matrix he = HOWeight.transpose().multiply(oe);

   Matrix nhow = HOWeight.add(oe.hadamard(ho).hadamard(ho.subScalarInverse(1)).multiply(ih.transpose()).multiplyScalar(LearningRate));

   HOWeight = nhow;

   Matrix nhiw = IHWeight.add(he.hadamard(ih).hadamard(ih.subScalarInverse(1)).multiply(inputs.transpose()).multiplyScalar(LearningRate));
   IHWeight = nhiw;


    return abs(oe.sumAll())+abs(he.sumAll());

}




