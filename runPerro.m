p = 0.5;
[G,estados,transicoes, saidas] = criaMaquinaCodificador([13,15,17]);
MatrixU = criaMatrizU(4,16,0.5);
[MatrixV] = codificador(MatrixU,transicoes, saidas);

[erros,MatrixVlinha] = BSCchannel(MatrixV, p)
[custos,MatrixR] = decodificador(MatrixVlinha,transicoes, saidas, 10)
[MatrizErro,valor] = numeroDeErrosFinal(MatrixU, MatrixR)