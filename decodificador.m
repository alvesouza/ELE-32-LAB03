function [custos,MatrixR] = decodificador(MatrixVlinha,transicoes, saidas,T)
%DECODIFICADOR Summary of this function goes here
%   Detailed explanation goes here
estadoAtual = 1;
MatrixR = zeros(size(MatrixVlinha,1),size(MatrixVlinha,2));
custos = zeros(size(MatrixVlinha,1),1);
colunas = size(MatrixVlinha,2);
estadosEncontrados = [1];
melhorVecLinha = [];

for j = 1:size(MatrixVlinha,1)
	i = 1;
    custof = 0;
    while i<colunas
        custo = Inf;
        for indexestadoEnconstrados = 1:size(estadosEncontrados,2)
            estadoAtual = estadosEncontrados(indexestadoEnconstrados);
            if i+T>colunas
                estadosCaminho = Inf(size(saidas,1),colunas-i+1);
                estadosCaminho(estadoAtual,1) = 0;
                [VecLinha,custoInter] = decodiLinha(estadoAtual,transicoes, saidas,MatrixVlinha(j,i:colunas),1,colunas-i+1);
            else
                estadosCaminho = Inf(size(saidas,1),T+1);
                estadosCaminho(estadoAtual,1) = 0;
                [VecLinha,custoInter] = decodiLinha(estadoAtual,transicoes, saidas,MatrixVlinha(j,i:(i+T)),1,T+1);
            end
            if custo>custoInter
                melhorVecLinha = VecLinha;
                custo = custoInter;
            end
        end
        if i+T>colunas
            MatrixR(j,i:colunas) = melhorVecLinha(1:(colunas-i+1));
        else
            MatrixR(j,i:(i+T)) = melhorVecLinha(1:(T+1));
        end
        
        custof = custof+custo;
        i = i+T+1;
        if i<=colunas
        	estadosEncontrados = [];
            for linhaEstado = 1:size(saidas,1)
                if (saidas(linhaEstado,1) == MatrixVlinha(j,i))||(saidas(linhaEstado,2) == MatrixVlinha(j,i))
                    estadosEncontrados = [estadosEncontrados linhaEstado];
                end
            end
        end
    end
	custos(j) = custof;
end
end
