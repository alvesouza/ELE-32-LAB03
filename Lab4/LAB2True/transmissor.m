% q is the probability to the bit be 1 --> Use 1/2 if dont want it biased
% k-1 is the size of the information word
% function T = transmissor(q, n)
function input = transmissor(q, k)
    input = randsrc(1, k, [1 0; q 1-q]);
end