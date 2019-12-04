% Creates a possibly wrong transmitted codeword via the bsc
function  received = bsc(input, p)
    n = size(input, 2);
    error = randsrc(1,n,[0,1;1-p,p]);
    received = input + error;
    received = mod(received, 2);
end