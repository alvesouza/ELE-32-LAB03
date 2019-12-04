function e = erroMaisProvavel(s,Ht,r)
   E = eye(7);
   
   vec3Zeros = zeros(1,3);
   vec7Zeros = zeros(1,7);
   e = vec7Zeros;
   i = 1;
   
   while (i <= 7 && isequal(e, vec7Zeros))
       
       x = rem(E(i,:)*Ht,2);
       
       if(isequal(x,s) && isequal(rem(xor(E(i,:),r)*Ht,2),vec3Zeros))
           e = E(i,:);
       end
   i = i + 1;   
   end

end