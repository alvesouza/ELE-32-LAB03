function [gs, k] = getGeneratorPolynomials(n)

k1 = ceil((4/7)*0.9*n);
k2 = floor((4/7)*1.1*n);

k = k1;
gs = cyclpoly(n,k1, 'all');
for(i = k1:k2)
    gsi = cyclpoly(n,i, 'all');
    if(size(gsi, 1) > size(gs, 1))
        k = i;
        gs = gsi;
    end
end

end
