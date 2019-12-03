T = 20;
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
bits = 10000;
linhas = 1;
q = 0.5;
[G1,estados1,transicoes1, saidas1] = criaMaquinaCodificador(g(1,:));
[G2,estados2,transicoes2, saidas2] = criaMaquinaCodificador(g(2,:));
[G3,estados3,transicoes3, saidas3] = criaMaquinaCodificador(g(3,:));
lim = size(p,2);
i = 0;
while i<lim
    i = i + 1;
    h = i + 1
    if h > lim
        h = lim;
    end
    parfor j = i : h
        %i = j;
        pb1(j) = perro(linhas,bits,p(j),q,transicoes1, saidas1,4)
        pb2(j) = perro(linhas,bits,p(j),q,transicoes2, saidas2,4)
        pb3(j) = perro(linhas,bits,p(j),q,transicoes3, saidas3,4)
        %pb(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]));
    end
    i = h;
end

hold on
loglog(p,p);
loglog(p,pb1);
loglog(p,pb2);
loglog(p,pb3);
set(gca, 'XDir','reverse')
hold off