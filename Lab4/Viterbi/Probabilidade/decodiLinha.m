function [custo,custosCaminho,estadosAnteriores] = decodiLinha(estadoAtual,transicoes, saidas,linhaMatrix,i,fim,custosCaminho,estadosAnteriores)
if i<fim
    trocou1 = false;
    trocou2 = false;
    custo1 = - 1;
    custo2 = -1;
    if custosCaminho(estadoAtual,i) + sum(de2bi(bitxor(saidas(estadoAtual,1),linhaMatrix(i))))<custosCaminho(transicoes(estadoAtual,1),i+1)
        custosCaminho(transicoes(estadoAtual,1),i+1) = custosCaminho(estadoAtual,i) + sum(de2bi(bitxor(saidas(estadoAtual,1),linhaMatrix(i))));
        estadosAnteriores(transicoes(estadoAtual,1),i+1) = estadoAtual;
        trocou1 = true;
    else
        custo1 = Inf;
    end
    if custosCaminho(estadoAtual,i) + sum(de2bi(bitxor(saidas(estadoAtual,2),linhaMatrix(i))))<custosCaminho(transicoes(estadoAtual,2),i+1)
        custosCaminho(transicoes(estadoAtual,2),i+1) = custosCaminho(estadoAtual,i) + sum(de2bi(bitxor(saidas(estadoAtual,2),linhaMatrix(i))));
        estadosAnteriores(transicoes(estadoAtual,2),i+1) = estadoAtual;
        trocou2 = true;
    else
        custo2 = Inf;
    end
    if trocou1&&trocou2
        if  custosCaminho(transicoes(estadoAtual,1),i+1) <  custosCaminho(transicoes(estadoAtual,2),i+1)
            [custo1,custosCaminho,estadosAnteriores] = decodiLinha(transicoes(estadoAtual,1),transicoes, saidas,linhaMatrix,i+1,fim,custosCaminho,estadosAnteriores);
            if custo1>custosCaminho(transicoes(estadoAtual,2),i+1)
                [custo2,custosCaminho,estadosAnteriores] = decodiLinha(transicoes(estadoAtual,2),transicoes, saidas,linhaMatrix,i+1,fim,custosCaminho,estadosAnteriores);
            else
                custo2 = Inf;
            end
        else
            [custo2,custosCaminho,estadosAnteriores] = decodiLinha(transicoes(estadoAtual,2),transicoes, saidas,linhaMatrix,i+1,fim,custosCaminho,estadosAnteriores);
            if custo2>custosCaminho(transicoes(estadoAtual,1),i+1)
                [custo1,custosCaminho,estadosAnteriores] = decodiLinha(transicoes(estadoAtual,1),transicoes, saidas,linhaMatrix,i+1,fim,custosCaminho,estadosAnteriores);
            else
                custo1 = Inf;
            end
        end
    elseif trocou1
        [custo1,custosCaminho,estadosAnteriores] = decodiLinha(transicoes(estadoAtual,1),transicoes, saidas,linhaMatrix,i+1,fim,custosCaminho,estadosAnteriores);
    elseif trocou2
        [custo2,custosCaminho,estadosAnteriores] = decodiLinha(transicoes(estadoAtual,2),transicoes, saidas,linhaMatrix,i+1,fim,custosCaminho,estadosAnteriores);
    end
    if custo1<custo2
        custo = custo1;
    else
        custo = custo2;
    end
else
    custo = custosCaminho(estadoAtual,i);
end

end

