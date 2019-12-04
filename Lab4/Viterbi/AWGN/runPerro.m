prob = 0.02;
amostras = 4;
[G1,estados1,transicoes1, saidas1] = criaMaquinaCodificador(g(1,:));
[G2,estados2,transicoes2, saidas2] = criaMaquinaCodificador(g(2,:));
[G3,estados3,transicoes3, saidas3] = criaMaquinaCodificador(g(3,:));
transicao = transicoes3;
saida = saidas3;
MatrixU = criaMatrizU(1,1000,q);
tic
    [MatrixV] = codificador(MatrixU,transicao, saida)
timeElapsed = toc;
tempoCO = timeElapsed/1000
[erros,MatrixVlinha] = BSCchannel(MatrixV, 0.2);
tic
    [custos,caminho,MatrixR1] = decodificador(MatrixVlinha,transicao, saida);
timeElapsed = toc
tempoDec = timeElapsed/10000