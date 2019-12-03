function [custos,MatrixR] = decodificadorRecursico(MatrixVlinha,transicoes, saidas,T)
%DECODIFICADOR Summary of this function goes here
%   Detailed explanation goes here
MatrixR = zeros(size(MatrixVlinha,1),size(MatrixVlinha,2));
custos = zeros(size(MatrixVlinha,1),1);
fim = size(MatrixVlinha,2);
estadosEncontrados = [1];

for j = 1:size(MatrixVlinha,1)
	i = 1;
    custof = 0;
    while i<fim
        custo = Inf;
        for indexestadoEnconstrados = 1:size(estadosEncontrados,2)
            estadoAtual = estadosEncontrados(indexestadoEnconstrados);
            if i+T>fim
                custosCaminho = Inf(size(saidas,1),fim-i+2);
                estadosAnteriores = Inf(size(saidas,1),fim-i+2);
                custosCaminho(estadoAtual,1) = 0;
                estadosAnteriores(estadoAtual,1) = 0;
                [custoInter,custosCaminho,estadosAnteriores] = decodiLinha(estadoAtual,transicoes, saidas,MatrixVlinha(j,i:fim),1,fim-i+2,custosCaminho,estadosAnteriores);
            else
                custosCaminho = Inf(size(saidas,1),T+1);
                estadosAnteriores = Inf(size(saidas,1),T+1);
                custosCaminho(estadoAtual,1) = 0;
                estadosAnteriores(estadoAtual,1) = 0;
                [custoInter,custosCaminho,estadosAnteriores] = decodiLinha(estadoAtual,transicoes, saidas,MatrixVlinha(j,i:(i+T-1)),1,T+1,custosCaminho,estadosAnteriores);
            end
            %estadosCaminho = estadosCaminho
            if custo>custoInter
                custo = custoInter;
            end
        end
        
        x = size(custosCaminho,2);
        menorCusto = Inf;
        melhorEstaFinal = 0;
        for k = 1:size(custosCaminho,1)
            if menorCusto > custosCaminho(k,x)
                menorCusto = custosCaminho(k,x);
                melhorEstaFinal = k;
            end
        end
        melhorVecLinha = zeros(1,x-1);
        estadoAtual = melhorEstaFinal;
        %custosCaminho = custosCaminho
        %estadosAnteriores = estadosAnteriores
        for k = (size(melhorVecLinha,2)+1):-1:2
            %valorK = k
            %estadoAnterio = estadosAnteriores(estadoAtual,k)
            if transicoes(estadosAnteriores(estadoAtual,k),2) == estadoAtual
               melhorVecLinha(k-1) = 1;
               %fprintf("Flag02")
            end
            estadoAtual = estadosAnteriores(estadoAtual,k);
        end
        %custosCaminho = custosCaminho
        %estadosAnteriores = estadosAnteriores
        %melhorVecLinha = melhorVecLinha
        if i+T>fim
            MatrixR(j,i:fim) = melhorVecLinha;
        else
            MatrixR(j,i:(i+T-1)) = melhorVecLinha;
        end
        
        custof = custof+custo;
        i = i+T;
        if i<fim
        	estadosEncontrados = [];
            for linhaEstado = 1:size(saidas,1)
                if (saidas(linhaEstado,1) == MatrixVlinha(j,i))||(saidas(linhaEstado,2) == MatrixVlinha(j,i))
                    estadosEncontrados = [estadosEncontrados linhaEstado];
                end
            end
            %estadosEncontrados = estadosEncontrados
        end
    end
	custos(j) = custof;
end
end

