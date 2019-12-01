T = 10;
g = [13 15 17;25 33 37;117 127 155];
vecp = [0.5 0.2 0.1];
p = zeros(1,18);
for j = 1:6
    p(3*(j-1)+1) = vecp(1);
    p(3*(j-1)+2) = vecp(2);
    p(3*(j-1)+3) = vecp(3);
    vecp = vecp/10;
end
%p = linspace(0.5,0,10001); 
pb1 = zeros(1,size(p,2));
colunas = 10000;
linhas = 1;
q = 0.5;
[G1,estados1,transicoes1, saidas1] = criaMaquinaCodificador(g(1,:));
[G2,estados2,transicoes2, saidas2] = criaMaquinaCodificador(g(2,:));
[G3,estados3,transicoes3, saidas3] = criaMaquinaCodificador(g(3,:));
parfor i = 1 : size(p,2)
    a = i
    pb1(i) = perro(linhas,colunas,p(i),q, T,transicoes1, saidas1)
    pb2(i) = perro(linhas,colunas,p(i),q, T,transicoes2, saidas2)
    pb3(i) = perro(linhas,colunas,p(i),q, T,transicoes3, saidas3)
    %pb(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]));
end
hold on
plot(p,pb1);
plot(p,pb2);
plot(p,pb3);
hold off