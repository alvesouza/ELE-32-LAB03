function recebida = logicalMatrix(seed)
s = rng(seed);
y = logical([1 0 0]);
if y == logical(zeros(1,3))
    fprintf("passou\n")
end
recebida = rand;
end