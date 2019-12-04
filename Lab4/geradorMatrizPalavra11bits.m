function X = geradorMatrizPalavra11bits(X,P)
y = 1;
tamanho = size(X);
linhas = tamanho(1);
colunas = tamanho(2);
colunasParidade = 4;
matrizParidade = zeros(linhas,colunas+colunasParidade);
G = [eye(colunas) P];
while y <= linhas
    %x = 1;
    vetorParidade = rem(X(y,:)*G,2);
    %while x <= colunasParidade
    %    if x == 1
    %        vetorParidade = [vetorParidade rem(X(y,1)+X(y,2)+X(y,3),2)];
    %    elseif x == 2
    %        vetorParidade = [vetorParidade rem(X(y,1)+X(y,3)+X(y,4),2)];
    %    elseif x == 3
    %        vetorParidade = [vetorParidade rem(X(y,1)+X(y,2)+X(y,4),2)];
        
    %   end
    %    x = x + 1;
    %end
    matrizParidade(y,:) = vetorParidade;
    
    %matrizParidade = [matrizParidade;vetorParidade]
    
    y = y+1;
end
X = matrizParidade;

end