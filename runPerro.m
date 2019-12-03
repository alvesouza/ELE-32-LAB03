p = 0.1;
[G,estados,transicoes, saidas] = criaMaquinaCodificador([13,15,17])
MatrixU = criaMatrizU(1,10000,0.5)
[MatrixV] = codificador(MatrixU,transicoes, saidas)

[erros,MatrixVlinha] = BSCchannel(MatrixV, p)
[custos,MatrixR] = decodificador(MatrixVlinha,transicoes, saidas, 100)
[MatrizErro,valor] = numeroDeErrosFinal(MatrixU, MatrixR)