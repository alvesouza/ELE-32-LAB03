n = 20;

%p = [0.49 0.2 0.1 0.05 0.02 0.01 0.005 0.002 0.001 0.0005 0.0002 0.0001];
p0 = [0.5 0.2 0.1];
p = p0;
Pb=zeros(1,length(p));
%Pb_nc = zeros(1, length(p));
for i = 1:5
    p = [p p0*10^-i]; 
end
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
%loglog(p, p, 'k--')
% plot(p, Pb)
hold on
loglog(p, Pb)
% plot(p, Pb_nc)