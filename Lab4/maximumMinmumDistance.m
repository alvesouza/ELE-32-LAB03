function [g, maximumMinimunDistance] = maximumMinmumDistance(gs, k)
    
    infoWords = zeros(2^k, k);
    for column = 1:k
       for line = 1:2^k
           if(mod(line, 2^(column)) > 2^(column-1) || mod(line, 2^column) == 0)
               infoWords(line, column) = 1;
           end
       end
    end
    
   
    
    % Multiplies for each polynomial
    % iNITIALIZES THE FINAL VARIABLES
    maximumMinimunDistance = 0;
    g = [];
    % percurrs all polynomials
    for polycounter = 1:size(gs,1)
        % Sets partial minmum distance of this polynomial as Inf
        minimunDistance = Inf;
        % Calculates the codeWord for each possible INfoword
        for line = 2:2^k
           codeword = mod(fliplr(conv(infoWords(line, :), fliplr(gs(polycounter, :)))), 2);
           %Calculates the hamming..
           if(sum(codeword) < minimunDistance)
               minimunDistance = sum(codeword);
           end
        end
        
        % Now compares with the ...
        if(minimunDistance > maximumMinimunDistance)
            maximumMinimunDistance = minimunDistance;
            g = gs(polycounter, :);
        end
    end
end