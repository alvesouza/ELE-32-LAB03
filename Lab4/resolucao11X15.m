seed = 10;
numeroBits = 1000000;
bitInformacaoPalavra = 4;
q = 0.5;
p = 0.1;
V = geradorMatrizBits(numeroBits,bitInformacaoPalavra,q,seed);
V = geradorMatrizPalavra4bits(V);
R = geradorMatrizRecebida(V,p,seed);

Resp = verificaRecepcao(R);

aux = sum(xor(Resp,V),2);
cont = 0 ;
for i = 1:size(aux)
    if(aux(i) == 0)
        cont = cont+1;
    end
end


cont