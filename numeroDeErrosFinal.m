function valor = numeroDeErrosFinal(Original, Resposta)

aux = sum(xor(Resposta,Original),2);
cont = 0;
for i = 1:size(aux)
    cont = cont + aux(i);
end

valor = cont;

%isequal(R,Resp)
end