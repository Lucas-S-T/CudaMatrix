//
// Created by root on 23/03/2020.
//

#include <iostream>
#include "matrix/Matrix.cu"



int main(){

    // Cria uma nova matriz de 5 por 5 e inicializa ela com valores NULOS
    Matrix m = Matrix(5, 5, NULL);

    m.randomFillSmall(); // Escreve em todas as linhas e colunas valores aleatórios pequenos (< 0.01)

    // Multiplica cada valor individualmente por 2 e sobreescreve na memória da matriz anterior
    m = m.multiplyScalar(2);

    // Executa a função que imprime no console a matriz de forma humanamente legível
    m.print();

    // Imprime no console a soma de todos os valores da matriz
    std::cout << m.sumAll();




    return 0;
}