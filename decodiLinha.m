function [VecLinha,custo] = decodiLinha(estadoAtual,transicoes, saidas,linhaMatrix,i,colunas)

if i<=colunas
    [VecLinha1,custo1] = decodiLinha(transicoes(estadoAtual,1),transicoes, saidas,linhaMatrix,i+1,colunas);
    [VecLinha2,custo2] = decodiLinha(transicoes(estadoAtual,2),transicoes, saidas,linhaMatrix,i+1,colunas);
    %i
    %linhaMatrix(i)
    %estadoAtual
    custo1 = custo1 + sum(de2bi(bitxor(saidas(estadoAtual,1),linhaMatrix(i))));
    custo2 = custo2 + sum(de2bi(bitxor(saidas(estadoAtual,2),linhaMatrix(i))));
    if custo1 <= custo2
        VecLinha = VecLinha1;
        VecLinha(i) = 0;
        custo = custo1;
    else
        VecLinha = VecLinha2;
        VecLinha(i) = 1;
        custo = custo2;
    end
else
    VecLinha = zeros(1,colunas);
    custo = 0;
end

end

