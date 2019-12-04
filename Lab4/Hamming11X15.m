vecp = [0.5 0.2 0.1];
p = zeros(1,18);
for j = 1:6
    p(3*(j-1)+1) = vecp(1);
    p(3*(j-1)+2) = vecp(2);
    p(3*(j-1)+3) = vecp(3);
    vecp = vecp/10;
end
%p = linspace(0.5,0,10001); 
Ei_N0Hamming11_15 = 10.^(0:1/(4*20):15/20);
p = zeros(1,size(Ei_N0Hamming11_15,2));
pbHamming11_15 = zeros(1,size(Ei_N0Hamming11_15,2));
for i = 1:size(p,2)
    p(i) = gerap(Ei_N0Hamming11_15(i)*15/11);
end
%p = linspace(0.5,0,10001);
numeroBits = 11*125000;
bitInformacaoPalavra = 11;
q = 0.5;
for i = 1 : size(p,2)
    pbHamming11_15(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]))/numeroBits;
    %pb(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]));
end
plot(Ei_N0Hamming11_15,pbHamming11_15);