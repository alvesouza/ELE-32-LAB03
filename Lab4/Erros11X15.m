function valor = Erros11X15(numeroBits,bitInformacaoPalavra,q,p,seed)
P = [1 1 1 1;1 1 1 0;1 1 0 1; 1 0 1 1; 0 1 1 1; 1 1 0 0;1 0 1 0;1 0 0 1;0 1 1 0; 0 1 0 1;0 0 1 1];
V = geradorMatrizBits11X15(numeroBits,bitInformacaoPalavra,q,seed);
V = geradorMatrizPalavra11bits(V,P);
R = geradorMatrizRecebida11X15(V,p,seed);
%fprintf("Para p = %f\n",p);
Resp = verificaRecepcao11X15(R,P);
%fprintf("FIM\n///////////////////////////\n");

aux = sum(xor(Resp(:,1:11),V(:,1:11)),2);
cont = 0;
for i = 1:size(aux)
    cont = cont + aux(i);
end

valor = cont;

%isequal(R,Resp)
end