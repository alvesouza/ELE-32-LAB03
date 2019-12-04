function X = geradorMatrizBits(numeroBits,bitInformacaoPalavra,q,seed)
s = rng(seed);
linhas = numeroBits/bitInformacaoPalavra;
colunas = bitInformacaoPalavra;
X = zeros(linhas,colunas);
y = 1;
while y <= linhas
    x = 1;
    vetor = [0 0 0 0];
    while x <= colunas
        if rand <= q
            vetor(x) = 1;
        else
            vetor(x) = 0;
        end
        x = x + 1;
    end
    X(y,:) = vetor;
    y = y+1;
end

end