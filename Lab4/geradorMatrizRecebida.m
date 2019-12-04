function recebida = geradorMatrizRecebida(palavras,p,seed)
s = rng(seed);
y = 1;
tamanho = size(palavras);
linhas = tamanho(1);
colunas = tamanho(2);
while y <= linhas
    x = 1;
    while x <= colunas
        if rand <= p
            palavras(y, x) = rem(palavras(y, x)+1,2); 
        end
        x = x + 1;
    end
    
    y = y+1;
end
recebida = palavras;
end