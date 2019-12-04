%p = 0.05;
%[G,estados,transicoes, saidas] = criaMaquinaCodificador([13,15,17])
%MatrixU = criaMatrizU(1,10000,0.5)
%[MatrixV] = codificador(MatrixU,transicoes, saidas)
MatrixVlinha = [0 5 3 0 0];
saidas = [0 7;2 5;4 3;6 1];
transicoes = [1 2;4 3;2 1;3 4];

%[erros,MatrixVlinha] = BSCchannel(MatrixV, p)
[custos,caminho,MatrixR] = decodificador(MatrixVlinha,transicoes, saidas)
%[MatrizErro,valor] = numeroDeErrosFinal(MatrixVlinha, MatrixR)