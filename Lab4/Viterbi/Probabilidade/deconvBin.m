function [v,r] = deconvBin(pol,div)
%DECONVBIN Summary of this function goes here
%   Detailed explanation goes here

%i = 1;
%n = size(pol,2);
%N = n;
%while pol(i) == 0 
%    i = i + 1;
%    N = N - 1;
%    if
%end
[v,r] = deconv(pol,div);
v = rem(abs(v),2);
r = rem(abs(r),2);
r = r((size(r,2)-size(div,2)+2):size(r,2));
end

