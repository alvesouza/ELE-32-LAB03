function e = erroMaisProvavel11X15(s,Ht,r)
   E = eye(15);
   
   vec4Zeros = zeros(1,4);
   vec15Zeros = zeros(1,15);
   e = vec15Zeros;
   i = 1;
   
   while (i <= 11 && isequal(e, vec15Zeros))
       
       x = rem(E(i,:)*Ht,2);
       
       if(isequal(x,s) && isequal(rem(xor(E(i,:),r)*Ht,2),vec4Zeros))
           e = E(i,:);
       end
   i = i + 1;   
   end

end