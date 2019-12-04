function [recebida,a] = mostraSeed(seed)
s = rng(seed);
y = 1;
while y <= 3
    rand
    y = y+1;
end
recebida = rand;
a = logical(1);
end