vecp = [0.5 0.2 0.1];
p = zeros(1,18);
for j = 1:6
    p(3*(j-1)+1) = vecp(1);
    p(3*(j-1)+2) = vecp(2);
    p(3*(j-1)+3) = vecp(3);
    vecp = vecp/10;
end
%p = linspace(0.5,0,10001); 
Ei_N0Hamming4_7 = 0:2/19:2;
p = zeros(1,size(Ei_N0Hamming4_7,2));
pbHamming4_7 = zeros(1,size(Ei_N0Hamming4_7,2));
for i = 1:size(p,2)
    p(i) = gerap(Ei_N0Hamming4_7*7/4);
end
seed = 10;
s = rng(seed);
numeroBits = 4*250000;
bitInformacaoPalavra = 4;
q = 0.5;
parfor i = 1 : size(p,2)
    pbHamming4_7(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]))/numeroBits;
    %pb(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]));
end
plot(Ei_N0Hamming4_7,pbHamming4_7);