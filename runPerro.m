prob = 0.02;
amostras = 4;
[G1,estados1,transicoes1, saidas1] = criaMaquinaCodificador(g(1,:));
[G2,estados2,transicoes2, saidas2] = criaMaquinaCodificador(g(2,:));
[G3,estados3,transicoes3, saidas3] = criaMaquinaCodificador(g(3,:));
pe = perro(1,10000,prob,0.5,transicoes1, saidas1,amostras)