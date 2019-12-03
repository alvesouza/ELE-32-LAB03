function [VecLinha,custo,estadosCaminho] = decodiLinha(estadoAtual,transicoes, saidas,linhaMatrix,i,colunas,estadosCaminho)
if i<colunas
    trocou1 = false;
    trocou2 = false;
    custo1 = - 1;
    custo2 = -1;
    if estadosCaminho(estadoAtual,i) + sum(de2bi(bitxor(saidas(estadoAtual,1),linhaMatrix(i))))<estadosCaminho(transicoes(estadoAtual,1),i+1)
        estadosCaminho(transicoes(estadoAtual,1),i+1) = estadosCaminho(estadoAtual,i) + sum(de2bi(bitxor(saidas(estadoAtual,1),linhaMatrix(i))));
        trocou1 = true;
    else
        custo1 = Inf;
    end
    if estadosCaminho(estadoAtual,i) + sum(de2bi(bitxor(saidas(estadoAtual,2),linhaMatrix(i))))<estadosCaminho(transicoes(estadoAtual,2),i+1)
        estadosCaminho(transicoes(estadoAtual,2),i+1) = estadosCaminho(estadoAtual,i) + sum(de2bi(bitxor(saidas(estadoAtual,2),linhaMatrix(i))));
        trocou2 = true;
    else
        custo2 = Inf;
    end
    if trocou1&&trocou2
        if  estadosCaminho(transicoes(estadoAtual,1),i+1) <  estadosCaminho(transicoes(estadoAtual,2),i+1)
            [VecLinha1,custo1,estadosCaminho] = decodiLinha(transicoes(estadoAtual,1),transicoes, saidas,linhaMatrix,i+1,colunas,estadosCaminho);
            if custo1>estadosCaminho(transicoes(estadoAtual,2),i+1)
                [VecLinha2,custo2,estadosCaminho] = decodiLinha(transicoes(estadoAtual,2),transicoes, saidas,linhaMatrix,i+1,colunas,estadosCaminho);
            else
                custo2 = Inf;
            end
        else
            [VecLinha2,custo2,estadosCaminho] = decodiLinha(transicoes(estadoAtual,2),transicoes, saidas,linhaMatrix,i+1,colunas,estadosCaminho);
            if custo2>estadosCaminho(transicoes(estadoAtual,1),i+1)
                [VecLinha1,custo1,estadosCaminho] = decodiLinha(transicoes(estadoAtual,1),transicoes, saidas,linhaMatrix,i+1,colunas,estadosCaminho);
            else
                custo1 = Inf;
            end
        end
    elseif trocou1
        [VecLinha1,custo1,estadosCaminho] = decodiLinha(transicoes(estadoAtual,1),transicoes, saidas,linhaMatrix,i+1,colunas,estadosCaminho);
    elseif trocou2
        [VecLinha2,custo2,estadosCaminho] = decodiLinha(transicoes(estadoAtual,2),transicoes, saidas,linhaMatrix,i+1,colunas,estadosCaminho);
    end
    if custo1<custo2
        custo = custo1;
        VecLinha = VecLinha1;
        VecLinha(i) = 0;
    elseif custo1>custo2
        custo = custo2;
        VecLinha = VecLinha2;
        VecLinha(i) = 1;
    else
        custo = custo1;
        if custo == Inf
            VecLinha = zeros(1,colunas);
        else
            VecLinha = VecLinha1;
            VecLinha(i) = 0;
        end
       
        
    end
   
else
    VecLinha = zeros(1,colunas);
    custo = estadosCaminho(estadoAtual,i);
end

end

