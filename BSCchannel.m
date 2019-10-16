 function Vlinha = BSCchannel(V, p)
 
y = 1;
tamanho = size(V);
linhas = tamanho(1);
colunas = tamanho(2);
Vlinha = zeros(linhas,colunas);
while y <= linhas
    x = 1;
    while x <= colunas
        Vlinha(y, x) = V(y, x);
        if rand <= p
            Vlinha(y, x) = rem(Vlinha(y, x)+1,2); 
        end
        x = x + 1;
    end
    
    y = y+1;
end
end