function U = criaMatrizU(numeroPalavras,bitInformacaoPalavra,q)
linhas = numeroPalavras;
colunas = bitInformacaoPalavra;
U = zeros(linhas,colunas);
y = 1;
while y <= linhas
    x = 1;
    vetor = zeros(1,colunas);
    while x <= colunas
        if rand <= q
            vetor(x) = 1;
        else
            vetor(x) = 0;
        end
        x = x + 1;
    end
    U(y,:) = vetor;
    y = y+1;
end

end

