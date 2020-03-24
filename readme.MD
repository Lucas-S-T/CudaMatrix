# CudaMatrix

Um simples código feito por um simples estudante de Ciência da Computação para utilizar os núcleos CUDA para operações matriciais.


## Instruções:

GPU? | Instrução | Detalhes | Exemplo | Local de execução

- [x] add() | Adição de duas matrizes de tamanhos iguais | c = a+b | GPU
- [x] addScalar() | Adição de um valor estático na matriz | c = a+x | GPU
- [x] clip() | Limita o máximo e o mínimo de um valor na matriz | max < x > min | GPU
- [x] divideScalar() | Divide a matriz por um valor estático | c = a/x | GPU
- [x] exp() | Constante de Euler elevado ao valor da matriz | x = e^a | GPU
- [x] logit() | Aplica a função logit na matriz | Derivada da sigmoid | GPU
- [x] multiply() | Multiplica 2 matrizes | C = A*B | GPU
- [x] multiplyHadamard() | Multiplica 2 matrizes com a regra de hadamard | c = a*b | GPU
- [x] multiplyScalar() | Multiplica a matriz por um valor estático | c = a*x | GPU
- [ ] randomFill() | Preenche a matriz com valores aleatórios | c = rand(0~1) | CPU
- [ ] randomFillSmall() | Preenche a matriz com valores aleatórios pequenos | c = rand(0~0.01) | CPU
- [x] sigmoid() | Aplica a função sigmoid na matriz | c = 1 / (1+e^-a) | GPU
- [x] softmax() | Aplica a função softmax na matriz | c = exp(a) / (sum(exp(a))) | GPU
- [x] subtraction() | Subtrai 2 matrizes | c = a-b | GPU
- [x] subtractScalar() | Subtrai os valores de uma matriz por uma constante | c = a-x | GPU
- [x] subtractScalarInverse() | Subtrai inversamente os valores de uma matriz por uma constante | c = x-a | GPU
- [ ] sumAll() | Soma todos os valores de uma matriz | sum(a) | CPU
- [x] tanh() | Aplica a função tanh na matriz | C = tanh(A) | GPU
- [x] transpose() | Faz a transposição da matriz | C(i,j) = A(j,i) | GPU


