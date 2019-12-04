 function [erros,Vlinha] = BSCchannel(V, p)
 
y = 1;
tamanho = size(V);
linhas = tamanho(1);
colunas = tamanho(2);
Vlinha = zeros(linhas,colunas);
erros = zeros(linhas,colunas);
while y <= linhas
    x = 1;
    while x <= colunas
        Vlinha(y, x) = V(y, x);
        pvec = [rand rand rand];
        i = 1;
        while i <= 3
            if pvec(i) <= p
                pvec(i) = 1;
            else
                pvec(i) = 0;
            end
            i = i + 1;
        end
        bitpvec = bi2de(pvec);
        Vlinha(y, x) = bitxor(Vlinha(y, x),bitpvec);
        erros(y, x) = bitpvec;
        x = x + 1;
    end
    
    y = y+1;
end
end