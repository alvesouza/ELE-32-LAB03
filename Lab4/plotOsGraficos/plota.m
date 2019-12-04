load('dadosParaGaussiano.mat')
hold on
title("Grafico de escala dBXlog");
plot(20*log(Ei_N0Hamming)/log(10),log(pncod)/log(10),'black');%"Não Decodificado"
plot(20*log(Ei_N0Hamming)/log(10),log(pbHamming4_7)/log(10),'blue');%"Hamming 4/7"
plot(20*log(Ei_N0Hamming)/log(10),log(pbHamming11_15)/log(10),'red');%"Hamming 11/15"
legend({"Não Decodificado","Hamming 4/7","Hamming 11/15"});
ylabel("Pb")
xlabel("Ei/N0(dB)")
%axis([xmin xmax ymin ymax])
hold off