function rotated = rotate(original)
    
    rotated = zeros(1, size(original, 2) + 1);
    
    rotated(1, 2:end) = original;
    
    rotated(1, 1) = rotated(1, end);
    
    rotated = rotated(1, 1:end-1);
end