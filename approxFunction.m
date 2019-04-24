function approx = approxFunction(xEval, xGrid, fGrid)
     N = length(xGrid)-1;
     p = zeros(N+1,1);
     p(1)=2;
     p(N+1)=2;
     for j=2:N
         p(j) = 1;
     end
     T= zeros(N+1); % INTERPOLATION MATRIX
     for i=1:N+1
         for k = 1:i
             T(i,k) = (2*cos((i-1)*pi*(k-1)/N))/(p(i)*p(k)*N);
             T(k,i) = T(i,k);
         end
     end
     
     A = zeros(N+1,1);% CALCULATING THE COEFFICIENTS
     for i = 1:N+1
         for j = 1:N+1
             A(i) = A(i) + T(i,j)*fGrid(j);
         end
     end
     a = xGrid(N+1);
    
     b = xGrid(1);
     
     leng= length(xEval);
     approx = zeros(1,leng);
     
     % COMPUTING THE APPROXIMATED VALUES
     for i = 1:leng
         x = xEval(i);
         for j= 1:N+1
             approx(i) = approx(i) + A(j)*cos((j-1)*acos( (2*x - (b+a))/(b-a) ) ); 
         end
     end
     
end
