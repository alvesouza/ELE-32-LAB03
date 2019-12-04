function [MatrixV] = codificador(MatrixU,transicoes, saidas)
%CODIFICADOR Summary of this function goes here
%   Detailed explanation goes here
estadoAtual = 1;

MatrixV = zeros(size(MatrixU,1),size(MatrixU,2));

for i = 1:size(MatrixU,1)
	estadoAtual = 1;
	for j = 1:size(MatrixU,2)
        MatrixV(i,j) = saidas(estadoAtual, MatrixU(i,j)+1);
        estadoAtual = transicoes(estadoAtual,MatrixU(i,j)+1);
	end
end

end

