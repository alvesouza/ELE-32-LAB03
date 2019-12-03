T = 400;
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
pb2 = zeros(1,size(p,2));
pb3 = zeros(1,size(p,2));
colunas = 10000;
linhas = 1;
q = 0.5;
[G1,estados1,transicoes1, saidas1] = criaMaquinaCodificador(g(1,:));
[G2,estados2,transicoes2, saidas2] = criaMaquinaCodificador(g(2,:));
[G3,estados3,transicoes3, saidas3] = criaMaquinaCodificador(g(3,:));
lim = size(p,2);
i = 0;
while i<lim
    i = i + 1;
    h = i + 4
    if h > lim
        h = lim;
    end
    parfor j = i : h
        %i = j;
        pb1(j) = perro(linhas,colunas,p(j),q, T,transicoes1, saidas1)
        %pb(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]));
    end
    i = h;
end

hold on
plot(p,pb1);
plot(p,pb2);
plot(p,pb3);
hold off