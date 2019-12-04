T = 20000;
amostras = 10;
g = [13 15 17;25 33 37;117 127 155];
%vecp = [0.5 0.2 0.1];
%p = zeros(1,18);
%for j = 1:6
%    p(3*(j-1)+1) = vecp(1);
%    p(3*(j-1)+2) = vecp(2);
%    p(3*(j-1)+3) = vecp(3);
%    vecp = vecp/10;
%end

%p = linspace(0.5,0,10001);
bits = 10000;
linhas = 1;
q = 0.5;
p = 0.00:0.5/20:0.5;
p1 = 0.00:0.5/20:0.5;
%p2 = 0.00:0.5/20:0.5;
%p3 = 0.00:0.5/20:0.5;
%Ei_N0Viterbi = 10.^(-4:1/(10):0);
p1 = zeros(1,size(Ei_N0,2));
for i = 1:size(Ei_N0,2)
    p1(i) = gerap(Ei_N0(i)/3);
end
pViterbiProb1 = zeros(1,size(p1,2));
%pb2 = zeros(1,size(p2,2));
%pb3 = zeros(1,size(p3,2));
[G1,estados1,transicoes1, saidas1] = criaMaquinaCodificador(g(1,:));
[G2,estados2,transicoes2, saidas2] = criaMaquinaCodificador(g(2,:));
[G3,estados3,transicoes3, saidas3] = criaMaquinaCodificador(g(3,:));

lim = size(p1,2);
i = 0;
while i<lim
    i = i + 1;
    h1 = i + 4
    if h1 > lim
        h1 = lim;
    end
    parfor j = i : h1
        %i = j;
        pViterbiProb1(j) = perro(linhas,bits,p1(j),q,transicoes1, saidas1,1);
        %pViterbiHamming2(j) = perro(linhas,bits,p2(j),q,transicoes2, saidas2,4)
        %pViterbiHamming3(j) = perro(linhas,bits,p3(j),q,transicoes3, saidas3,1)
    end
    i = h1;
end


hold on
%plot(20*log(p1)/log(10),20*log(p1)/log(10));
plot(20*log(Ei_N0)/log(10),log(pViterbiProb1)/log(10));
%plot(p2,pb2);
%plot(p3,pb3);
set(gca, 'XDir','reverse')
hold off