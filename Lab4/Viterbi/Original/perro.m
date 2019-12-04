function pe = perro(linhas,bits,p,q,transicoes, saidas,amostras)
perros = zeros(1,amostras);
for i = 1:amostras
    MatrixU = criaMatrizU(linhas,bits,q);
    [MatrixV] = codificador(MatrixU,transicoes, saidas);

    [erros,MatrixVlinha] = BSCchannel(MatrixV, p);
    [custos,caminho,MatrixR] = decodificador(MatrixVlinha,transicoes, saidas);
    [MatrizErro,valor] = numeroDeErrosFinal(MatrixU, MatrixR);
    perros(i) = valor/(linhas*bits);
end
%perros = perros
%p = p
pe = sum(perros)/amostras;
end

