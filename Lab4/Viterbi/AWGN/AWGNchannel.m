 function [erros,Vlinha] = AWGNchannel(V,N0)
 
y = 1;
V = de2bi(V)';
tamanho = size(V);
linhas = tamanho(1);
colunas = tamanho(2);
Vlinha = zeros(linhas,colunas);
erros = zeros(linhas,colunas);
while y <= linhas
    x = 1;
    while x <= colunas
        if V(y, x) == 0
           V(y, x) = -1; 
        end
        Vlinha(y, x) = V(y, x) + normrnd(0,sqrt(N0/2));
        x = x + 1;
    end
    
    y = y+1;
end
end