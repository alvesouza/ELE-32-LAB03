function pe = perro(linhas,colunas,p,q, T,transicoes, saidas)
MatrixU = criaMatrizU(linhas,colunas,q);
[MatrixV] = codificador(MatrixU,transicoes, saidas);

[erros,MatrixVlinha] = BSCchannel(MatrixV, p);
[custos,MatrixR] = decodificador(MatrixVlinha,transicoes, saidas, T);
[MatrizErro,valor] = numeroDeErrosFinal(MatrixU, MatrixR);
pe = valor/(linhas*colunas);
end

