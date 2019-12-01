function [MatrizErro,valor] = numeroDeErrosFinal(Original, Resposta)
MatrizErro = bitxor(Resposta,Original);
aux = sum(MatrizErro,2);
cont = 0;
for i = 1:size(aux)
    cont = cont + aux(i);
end

valor = cont;

%isequal(R,Resp)
end