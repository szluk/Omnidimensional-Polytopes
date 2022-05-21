function [num den res] = ballsfg(kind, n)
% Algebraic forms of radius and diameter recurrence relations for integer dimensions
% INPUT:
% kind - relation; can be 'f' or 'g'
% n    - dimension
% OUTPUT:
% num  - absolute f or g numerator
% den  - absolute f or g denominator
% res  - f or g
%% (c) Szymon £ukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1:0 21.05.2022

if nargin ~= 2
    error 'Wrong number of arguments';
end

if mod(n,1)
    error 'n is not an iteger';
end

floorn2     = floor(n/2);
floorabsn2  = floor(abs(n/2));
signfct     = -( (-1)^floorn2 );

num = 0;
den = 1;
res = 0;

switch kind
  case 'f'
    if ~mod(n,2)  % n is even
      if n>0
        num = 1;
        den = 1;
        for k=1:n/2
          den = den*k;
        end
      end
    else           % n is odd
      if n>0
        num = 2^((n+1)/2);
        den = 1;
        for k=1:floor(n/2)
          den = den*(2*k+1);
        end
      elseif n<-1
        den = 2^floorabsn2;
        num = 1;
        for k=1:floorabsn2-1
          num = num*(2*k+1);
        end        
      else % n=-1
        num = 1;
      end
    end
  case 'g'
    if n>=0
      num = 1;
      den = ballsgrec(n);
    elseif n<-1
      if mod(n,2)  % n is odd
        den = 1;
        num = ballsgrec(-(n+2))*4  
      end
    else % n=-1
      num = 2;
      den = 1;
    end
  otherwise
    error 'Unknown kind of relation';
end

if n<0
  res = signfct*num/den;
else  
  res = num/den;
end  

return
