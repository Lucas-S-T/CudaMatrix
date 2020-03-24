cmake_minimum_required(VERSION 3.16)
project(HelloCuda CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(HelloCuda main.cu test.cu matrix/operations/Multiplication.cu matrix/operations/MultiplicationScalar.cu matrix/operations/RandomFill.cu matrix/operations/Exp.cu matrix/operations/SumAll.cu matrix/operations/DivisionScalar.cu matrix/operations/Softmax.cu matrix/operations/Clip.cu matrix/operations/Transpose.cu matrix/operations/Addition.cu matrix/operations/Subtraction.cu matrix/operations/MultiplicationHadamard.cu matrix/operations/SubtractionScalar.cu matrix/operations/SubtractionScalarInverse.cu matrix/operations/AdditionScalar.cu matrix/operations/Sigmoid.cu matrix/operations/Logit.cu matrix/operations/Tanh.cu)

set_target_properties(
        HelloCuda
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)