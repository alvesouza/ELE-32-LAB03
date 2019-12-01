function [G,estados,transicoes,saidas] = criaMaquinaCodificador(g)
% os estados são todos os possiveis estados armazenados do codificador em
% ordem crescente 

%Os G estão implicitos

%transicoes[i, entrada+1] = j, se o estado i receber
% entrada o proximo estado será j

%saidas[i, entrada+1] = j, se o estado i receber entrada o valor da saida
%será o decimal de v0v1v2...vn
% representação 
n = length(g);
a = oct2poly(g(1));
colunas = length(a)-1;
G = zeros(n,colunas);
G(1,1:(colunas+1)) = a(1:(colunas+1));
%gera os valores de G
for i =  2:n
    a = oct2poly(g(i));
    G(i,1:(colunas+1)) = a(1:(colunas+1));
end

%gera os valores envolvendo a maquina de estados
estados = zeros(2^colunas,colunas);
transicoes = zeros(2^colunas,2);
saidas = zeros(2^colunas,2);
vecAux = zeros(1,colunas);

for i =  1:2^colunas
    estados(i,1:colunas) = de2bi(i-1,colunas);
    vecAux(2:colunas) = estados(i,1:(colunas-1));
    vecAux(1) = 0;
    transicoes(i,1) = bi2de(vecAux)+1;
    transicoes(i,2) = transicoes(i,1)+1;
    saidas(i,1) = bi2de([rem(sum(estados(i,1:colunas).*G(1,2:(colunas+1))),2), rem(sum(estados(i,1:colunas).*G(2,2:(colunas+1))),2), rem(sum(estados(i,1:colunas).*G(3,2:(colunas+1))),2)]);
    saidas(i,2) = bi2de([rem(1*G(1,1)+sum(estados(i,1:colunas).*G(1,2:(colunas+1))),2), rem(1*G(2,1)+sum(estados(i,1:colunas).*G(2,2:(colunas+1))),2), rem(1*G(3,1)+sum(estados(i,1:colunas).*G(3,2:(colunas+1))),2)]);    
end

end

