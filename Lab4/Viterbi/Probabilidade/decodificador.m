function [menorCusto,caminho,MatrixR] = decodificador(MatrixVlinha,transicoes, saidas,p)
%DECODIFICADOR Summary of this function goes here
%   Detailed explanation goes here
MatrixR = zeros(size(MatrixVlinha,1),size(MatrixVlinha,2));
custos = zeros(size(MatrixVlinha,1),1);
fim = size(MatrixVlinha,2);
custosCaminho = Inf(size(saidas,1),fim+1);
estadosAnteriores = Inf(size(saidas,1),fim);
estadoInicial = 1;
custosCaminho(estadoInicial,1) = 0;
menorCusto = Inf;
melhorEstadoFinal = 1;
indexColuna = 1;
estadoAtual = estadoInicial;
custoAdcional1 = zeros(size(saidas,1),size(MatrixVlinha,2));
custoAdcional2 = zeros(size(saidas,1),size(MatrixVlinha,2));
MatrixVlinha = de2bi(MatrixVlinha)';
bitsSaida1 = zeros(size(saidas,1),3);
bitsSaida2 = zeros(size(saidas,1),3);
for i = 1:size(saidas,1)
    bitsSaida1(i,:) = de2bi(saidas(i,1),3);
    bitsSaida2(i,:) = de2bi(saidas(i,2),3);
end
for i = 1:size(custoAdcional1,2)
    for j = 1:size(custoAdcional1,1)
        a1 = sum(rem(bitsSaida1(j,:)+MatrixVlinha(:,i)',2));
        a2 = sum(rem(bitsSaida2(j,:)+MatrixVlinha(:,i)',2));
        custoAdcional1(j,i) = a1*log(1-p)+(3-a1)*log(p);
        custoAdcional2(j,i) = a2*log(1-p)+(3-a2)*log(p);
    end
end
while indexColuna > 0
    if indexColuna <= fim
        custo1 = custosCaminho(estadoAtual,indexColuna) + custoAdcional1(estadoAtual,indexColuna);
        custo2 = custosCaminho(estadoAtual,indexColuna) + custoAdcional2(estadoAtual,indexColuna);
        proximoEstado1 = transicoes(estadoAtual,1);
        proximoEstado2 = transicoes(estadoAtual,2);
        indexProximo = indexColuna+1;
    end
    if indexColuna == fim+1
        if menorCusto > custosCaminho(estadoAtual,indexColuna)
            menorCusto = custosCaminho(estadoAtual,indexColuna);
            melhorEstadoFinal = estadoAtual;
        end
        indexColuna = indexColuna-1;
        estadoAtual = estadosAnteriores(estadoAtual,indexColuna);
    elseif custo1 <= custo2
        if (custo1 <custosCaminho(proximoEstado1,indexProximo))&&(menorCusto>custo1)
            estadosAnteriores(proximoEstado1,indexColuna) = estadoAtual;
            custosCaminho(proximoEstado1,indexProximo) = custo1;
            indexColuna = indexProximo;
            estadoAtual = proximoEstado1;
        elseif (custo2<custosCaminho(proximoEstado2,indexProximo))&&(menorCusto>custo2)
            custosCaminho(proximoEstado2,indexProximo) = custo2;
            estadosAnteriores(proximoEstado2,indexColuna) = estadoAtual;
            indexColuna = indexProximo;
            estadoAtual = proximoEstado2;
        else
            indexColuna = indexColuna-1;
            if indexColuna > 0
                estadoAtual = estadosAnteriores(estadoAtual,indexColuna);
            end
        end 
    elseif custo1 > custo2
        if (custo2<custosCaminho(proximoEstado2,indexProximo))&&(menorCusto>custo2)
            custosCaminho(proximoEstado2,indexProximo) = custo2;
            estadosAnteriores(proximoEstado2,indexColuna) = estadoAtual;
            indexColuna = indexProximo;
            estadoAtual = proximoEstado2;
        elseif (custo1 <custosCaminho(proximoEstado1,indexProximo))&&(menorCusto>custo1)
            estadosAnteriores(proximoEstado1,indexColuna) = estadoAtual;
            custosCaminho(proximoEstado1,indexProximo) = custo1;
            indexColuna = indexProximo;
            estadoAtual = proximoEstado1;
        else
            indexColuna = indexColuna-1;
            if indexColuna > 0
                estadoAtual = estadosAnteriores(estadoAtual,indexColuna);
            end
        end   
    else
        indexColuna = indexColuna-1;
        if indexColuna > 0
            estadoAtual = estadosAnteriores(estadoAtual,indexColuna);
        end
    end
end

estadoAtual = melhorEstadoFinal;
melhorVecLinha = zeros(1,fim);
caminho = zeros(1,fim);
for k = (size(melhorVecLinha,2)):-1:1
    %valorK = k
    %restadoAnterior = estadosAnteriores(estadoAtual,k)
    if transicoes(estadosAnteriores(estadoAtual,k),2) == estadoAtual
       melhorVecLinha(k) = 1;
       %fprintf("Flag02")
    end
    caminho(k) = estadoAtual;
    estadoAtual = estadosAnteriores(estadoAtual,k);
end
MatrixR(1,:) = melhorVecLinha;
end

