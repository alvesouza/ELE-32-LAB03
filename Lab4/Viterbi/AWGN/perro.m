function pe = perro(linhas,bits,Ei_N0,q,transicoes, saidas,amostras)
perros = zeros(1,amostras);
for i = 1:amostras
    MatrixU = criaMatrizU(linhas,bits,q);
    [MatrixV] = codificador(MatrixU,transicoes, saidas);
    N0 = 1/Ei_N0;
    [erros,MatrixVlinha] = AWGNchannel(MatrixV, N0);
    [custos,caminho,MatrixR] = decodificador(MatrixVlinha,transicoes, saidas);
    [MatrizErro,valor] = numeroDeErrosFinal(MatrixU, MatrixR);
    perros(i) = valor/(linhas*bits);
end
%perros = perros
%p = p
pe = sum(perros)/amostras;
end

