%%
%Seta variaveis de Hamming
%p = linspace(0.5,0,10001); 
Ei_N0Hamming = 10.^(0:1/(4*20):15/20);
%%
p = zeros(1,size(Ei_N0Hamming,2));
pbHamming4_7 = zeros(1,size(Ei_N0Hamming,2));
for i = 1:size(p,2)
    p(i) = gerap(Ei_N0Hamming(i)*7/4);
end
numeroBits = 4*250000;
bitInformacaoPalavra = 4;
q = 0.5;
for i = 1 : size(p,2)
    pbHamming4_7(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]))/numeroBits;
    %pb(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]));
end
%%
plot(20*log(Ei_N0Hamming)/log(10),log(pbHamming4_7)/log(10),'blue');
%%
p = zeros(1,size(Ei_N0Hamming,2));
pbHamming11_15 = zeros(1,size(Ei_N0Hamming,2));
for i = 1:size(p,2)
    p(i) = gerap(Ei_N0Hamming(i)*15/11);
end
%p = linspace(0.5,0,10001);
numeroBits = 11*125000;
bitInformacaoPalavra = 11;
q = 0.5;
for i = 1 : size(p,2)
    pbHamming11_15(i) = Erros11X15(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]))/numeroBits;
    %pb(i) = Erros(numeroBits,bitInformacaoPalavra,q,p(i),randi([0,2^31]));
end
%%
%plot hamming 11/15(projetado por mim e o avan)
plot(20*log(Ei_N0Hamming)/log(10),log(pbHamming11_15)/log(10),'red');
%%
%não codificado
pncod = zeros(1,size(Ei_N0Hamming,2));
pbHamming11_15 = zeros(1,size(Ei_N0Hamming,2));
for i = 1:size(pncod,2)
    pncod(i) = gerap(Ei_N0Hamming(i)*1/1);
end
%%
%plot não decodificado
plot(20*log(Ei_N0Hamming)/log(10),log(pncod)/log(10),'black');
%%
%plot hammings, com não decodificado
hold on
plot(20*log(Ei_N0Hamming)/log(10),log(pncod)/log(10),'black');
plot(20*log(Ei_N0Hamming)/log(10),log(pbHamming4_7)/log(10),'blue');
plot(20*log(Ei_N0Hamming)/log(10),log(pbHamming11_15)/log(10),'red');
hold off
%%
n = 20;
p = zeros(1,size(Ei_N0Hamming,2));
for i = 1:size(p,2)
    p(i) = gerap(Ei_N0Hamming(i)*7/4);
end
Pb=zeros(1,length(p));

for i = 1:length(p)
    erro = 0;
    %erro_nc = 0;
    N =3000;
    for j = 1:N
        %Cyclic
        [gs, k] = getGeneratorPolynomials(n);
        [g, minimumDistance] = maximumMinmumDistance(gs, k);
        input = transmissor(0.5, k);
        word = encoder(input, g);
        received = bsc(word, p(i));
        output = decoder(received, g, minimumDistance);
        erro = erro + sum(input ~= output);
        %erro_nc = erro_nc + sum(input ~= bsc(input, p(i)));
    end
    Pb(i) = erro/k/N;
    %Pb_nc(i) = erro_nc/k/N;
end